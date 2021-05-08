import 'dart:async';

import 'package:complex_timer/core/models/timer_status_enum.dart';
import 'package:flutter/material.dart';

const _tickDuration = Duration(milliseconds: 1);

class ComplexTimerService extends ChangeNotifier {
  final Stopwatch _sWatch = Stopwatch();
  Timer? _timer;
  Duration _duration = Duration.zero;
  TimerStatus _status = TimerStatus.initial;

  // Timer Status
  TimerStatus get status => _status;

  set status(TimerStatus value) {
    _status = value;
    notifyListeners();
  }

  // Timer Duration
  String get duration => _durationToStr(_duration);

  _setDuration() {
    _duration = _sWatch.elapsed;
    notifyListeners();
  }

  String _durationToStr(Duration currentValue) {
    final minutes =
        (currentValue.inSeconds / 60).floor().toString().padLeft(2, '0');
    final seconds = (currentValue.inSeconds % 60).toString().padLeft(2, '0');
    final milliseconds =
        (currentValue.inMilliseconds % 1000).toString().padLeft(3, '0');

    return '$minutes:$seconds:$milliseconds';
  }

  void startTimer() {
    _sWatch.start();
    _timer = Timer.periodic(_tickDuration, (_) {
      _setDuration();
    });
    status = TimerStatus.running;
  }

  void stopTimer() {
    _timer?.cancel();
    _sWatch.stop();
    _setDuration();
    status = TimerStatus.paused;
  }

  void resetTimer() {
    _sWatch.reset();
    _setDuration();
    if (!_sWatch.isRunning) {
      status = TimerStatus.initial;
    }
  }
}
