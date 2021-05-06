import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _tickDuration = Duration(seconds: 1);

enum TimerStatus { initial, running, paused }

final countdownTimerProvider =
    ChangeNotifierProvider((ref) => CountdownChangeNotifier());

final countdownValueProvider = Provider<String>(
    (ref) => ref.watch(countdownTimerProvider).currentDuration);

final countdownStatusProvider = Provider<TimerStatus>(
    (ref) => ref.watch(countdownTimerProvider).currentStatus);

class CountdownChangeNotifier extends ChangeNotifier {
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

  void setDuration(Duration value) {
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
    setDuration(_sWatch.elapsed);
  }

  void resetTimer() {
    if (!_sWatch.isRunning) {
      currentStatus = TimerStatus.initial;
    }
    _sWatch.reset();
    setDuration(Duration.zero);
  }
}
