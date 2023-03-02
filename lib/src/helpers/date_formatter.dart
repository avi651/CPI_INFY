import 'package:intl/intl.dart';

String timeAgoCustom(int timeStamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
  final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm:ss');
  final String formatted = formatter.format(date);
  DateTime d = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(formatted);
  Duration diff = DateTime.now().difference(d);
  if (diff.inDays > 365)
    return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
  if (diff.inDays > 30)
    return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
  if (diff.inDays > 7)
    return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
  if (diff.inDays > 0)
    return "${DateFormat.E().add_jm().format(d)}";
  if (diff.inHours > 0)
    return "Today ${DateFormat('jm').format(d)}";
  if (diff.inMinutes > 0)
    return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
  if (diff.inSeconds > 0)
    return "${diff.inSeconds} ${diff.inSeconds == 1 ? "seconds" : "seconds"} ago";
  return "just now";
}