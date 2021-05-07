import 'dart:async';

import 'package:complex_timer/core/models/timer_status_enum.dart';
import 'package:flutter/material.dart';

const _tickDuration = Duration(seconds: 1);

class ComplexTimerChangeNotifier extends ChangeNotifier {
  final Stopwatch _sWatch = Stopwatch();
  Timer? _timer;
  Duration _currentDuration = Duration.zero;
  TimerStatus _currentStatus = TimerStatus.initial;
  TimerStatus get currentStatus => _currentStatus;
  String get currentDuration => _durationToStr(_currentDuration.inSeconds);

  set currentStatus(TimerStatus value) {
    _currentStatus = value;
    notifyListeners();
  }

  String _durationToStr(int currentTotal) {
    final minutes = (currentTotal / 60).floor().toString().padLeft(2, '0');
    final seconds = (currentTotal % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  _setDuration() {
    _currentDuration = _sWatch.elapsed;
    notifyListeners();
  }

  void startTimer() {
    _sWatch.start();
    _timer = Timer.periodic(_tickDuration, (_) {
      _setDuration();
    });
    currentStatus = TimerStatus.running;
  }

  void stopTimer() {
    _timer?.cancel();
    _sWatch.stop();
    _setDuration();
    currentStatus = TimerStatus.paused;
  }

  void resetTimer() {
    _sWatch.reset();
    _setDuration();
    if (!_sWatch.isRunning) {
      currentStatus = TimerStatus.initial;
    }
  }
}