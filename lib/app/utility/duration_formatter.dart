// App Duration Formatter
// v.0.0.2
// by Elriz Wiraswara

class DurationFormatter {
  // This class is not meant to be instatiated or extended; this constructor
  // prevents instantiation and extension.
  // ignore: unused_element
  DurationFormatter._();

  static String format(DateTime from, DateTime time) {
    return from.difference(time).inSeconds < 60
        ? 'Just now'
        : from.difference(time).inMinutes < 60
            ? '${time.minute}min'
            : from.difference(time).inHours < 24
                ? '${time.hour}h'
                : from.difference(time).inDays < 365
                    ? '${time.day}d'
                    : '${time.year}y';
  }

  static String formatDetailed(DateTime from, DateTime time) {
    return from.difference(time).inSeconds < 60
        ? '${from.difference(time).inSeconds} detik'
        : from.difference(time).inMinutes < 60
            ? '${from.difference(time).inMinutes} menit'
            : from.difference(time).inHours < 24
                ? '${from.difference(time).inHours} jam'
                : from.difference(time).inDays < 365
                    ? '${from.difference(time).inDays} hari'
                    : '${(from.difference(time).inDays / 365.25).floor()} tahun';
  }
}
