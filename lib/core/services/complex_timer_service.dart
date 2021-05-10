import 'dart:async';
import 'package:complex_timer/core/models/timer_status_enum.dart';
import 'package:complex_timer/core/providers/stopwatch_provider.dart';
import 'package:flutter/material.dart';

const _tickDuration = Duration(milliseconds: 1);

class ComplexTimerService extends ChangeNotifier {
  ComplexTimerService({required SplitsNotifier results})
      : _resultsProvider = results;
  final SplitsNotifier _resultsProvider;
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
    if (_status == TimerStatus.initial) _resultsProvider.clear();
    _sWatch.start();
    _timer = Timer.periodic(_tickDuration, (_) {
      _setDuration();
    });
    status = TimerStatus.running;
  }

  void pauseTimer() {
    _timer?.cancel();
    _sWatch.stop();
    _setDuration();
    status = TimerStatus.paused;
  }

  void createSplit() {
    _resultsProvider.add(timerValue: duration);
    _sWatch.reset();
    _setDuration();
  }

  void resetTimer() {
    _timer?.cancel();
    _sWatch.stop();
    _sWatch.reset();
    _setDuration();
    status = TimerStatus.initial;
  }
}
