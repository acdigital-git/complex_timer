import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _tickDuration = Duration(seconds: 1);

enum TimerStatus { initial, running, paused }

final complexTimerProvider =
    ChangeNotifierProvider((ref) => ComplexTimerChangeNotifier());

final timerValueProvider =
    Provider<String>((ref) => ref.watch(complexTimerProvider).currentDuration);
final timerStatusProvider = Provider<TimerStatus>(
    (ref) => ref.watch(complexTimerProvider).currentStatus);

class ComplexTimerChangeNotifier extends ChangeNotifier {
  final Stopwatch _sWatch = Stopwatch();
  Timer? _timer;
  Duration _currentDuration = Duration.zero;
  TimerStatus _currentStatus = TimerStatus.initial;
  TimerStatus get currentStatus => _currentStatus;
  String get currentDuration => _formatDuration(_currentDuration.inSeconds);

  set currentStatus(TimerStatus value) {
    _currentStatus = value;
    notifyListeners();
  }

  String _formatDuration(int currentTotal) {
    final minutes = (currentTotal / 60).floor().toString().padLeft(2, '0');
    final seconds = (currentTotal % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  _setDuration(Duration value) {
    _currentDuration = value;
    notifyListeners();
  }

  void startTimer() {
    currentStatus = TimerStatus.running;
    _sWatch.start();
    _timer = Timer.periodic(_tickDuration, (timer) {
      _currentDuration = _sWatch.elapsed;
      notifyListeners();
    });
  }

  void stopTimer() {
    currentStatus = TimerStatus.paused;
    _timer?.cancel();
    _sWatch.stop();
    _setDuration(_sWatch.elapsed);
  }

  void resetTimer() {
    if (!_sWatch.isRunning) {
      currentStatus = TimerStatus.initial;
    }
    _sWatch.reset();
    _setDuration(Duration.zero);
  }
}
