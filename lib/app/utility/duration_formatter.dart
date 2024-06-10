// App Duration Formatter
// v.0.0.2
// by Elriz Wiraswara

class DurationFormatter {
  // This class is not meant to be instatiated or extended; this constructor
  // prevents instantiation and extension.
  // ignore: unused_element
  DurationFormatter._();

  static String format(DateTime from, DateTime time) {
    final difference = from.difference(time);
    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}s';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}min';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h';
    } else if (difference.inDays < 365) {
      return '${difference.inDays}d';
    } else {
      return '${difference.inDays ~/ 365}y';
    }
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

  static String formatDurationFromMilliSec(int milliseconds) {
    Duration duration = Duration(milliseconds: milliseconds);

    // Extract hours, minutes, and seconds from the duration
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);

    // Construct the formatted string
    String formattedDuration = '';
    if (hours > 0) {
      formattedDuration += '${hours}h ';
    }
    if (minutes > 0) {
      formattedDuration += '${minutes}m ';
    }
    if (seconds > 0) {
      formattedDuration += '${seconds}s';
    }

    return formattedDuration;
  }

  static String formatDurationFromDays(int days) {
    // Convert days to milliseconds
    int milliseconds = days * 24 * 60 * 60 * 1000;

    Duration duration = Duration(milliseconds: milliseconds);

    // Extract years, months, days, hours, minutes, and seconds from the duration
    int years = duration.inDays ~/ 365;
    int months = (duration.inDays % 365) ~/ 30;
    int extractedDays = (duration.inDays % 365) % 30;
    int hours = duration.inHours.remainder(24);
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);

    // Construct the formatted string
    String formattedDuration = '';
    if (years > 0) {
      formattedDuration += '${years} years ';
    }
    if (months > 0) {
      formattedDuration += '${months} months ';
    }
    if (extractedDays > 0) {
      formattedDuration += '${extractedDays} days ';
    }
    if (hours > 0) {
      formattedDuration += '${hours} hours ';
    }
    if (minutes > 0) {
      formattedDuration += '${minutes} minutes ';
    }

    return formattedDuration.trim();
  }
}
