import 'package:intl/intl.dart';

String formatDateFromDateTime(DateTime time) {
  return DateFormat('dd-MM-yyyy  HH:mm').format(time);
}
