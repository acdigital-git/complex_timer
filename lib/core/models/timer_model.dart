class TimerModel {
  final int hours;
  final int minutes;
  final int seconds;

  TimerModel({
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  String _format(int value) => value < 10 ? '0$value' : value.toString();

  @override
  String toString() {
    return '${_format(hours)}:${_format(minutes)}:${_format(seconds)}';
  }
}
