import 'package:intl/intl.dart';

String getDateFormat(DateTime date) => DateFormat.yMMMd().format(date);
String getDayTitle(DateTime dateTime) => DateFormat.E().format(dateTime);
