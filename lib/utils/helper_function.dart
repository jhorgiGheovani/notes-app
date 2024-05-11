import 'package:intl/intl.dart';

String readTimestamp(int timestamp) {
  var now = DateTime.now();
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var diff = now.difference(date);
  String time = '';

  if (diff.inSeconds <= 60) {
    time = 'Just now';
  } else if (diff.inMinutes < 60) {
    time = '${diff.inMinutes} minutes ago';
  } else if (diff.inHours < 24) {
    time = '${diff.inHours} hours ago';
  } else if (diff.inDays <= 7) {
    time = '${diff.inDays} days ago';
  } else {
    time = '${(diff.inDays / 7).floor()} weeks ago';
  }

  return time;
}

String getCurrentTimeStamp() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-ddTHH:mm:ss').format(now);
  return formattedDate;
}
