import 'package:get/get.dart';
import 'package:intl/intl.dart';

 

String regularDate(String date) {
  return DateFormat.yMMMMd()
      .add_yMd()
      .format(DateFormat('hh:mm:ss').parse(date));
}

String formatDay(DateTime date) {
  final DateFormat formatter = DateFormat.d('es_ES');
  final String formatted = formatter.format(date);
  return formatted;
}

String formatWeekDay(DateTime date) {
  final DateFormat formatter = DateFormat.EEEE('es_ES');
  final String formatted = formatter.format(date);
  return GetUtils.capitalizeFirst(formatted)!;
}

String formatDDmmYYYY(DateTime date) {
  final String day = formatDay(date);
  final String month = formatMonth(date);
  final String year = formatYear(date);
  return '$day $month $year';
}

String formatMonth(DateTime date) {
  final DateFormat formatter = DateFormat.MMMM('es_ES');
  final String formatted = formatter.format(date);
  return toBeginningOfSentenceCase(formatted)!;
}

String formatYear(DateTime date) {
  final DateFormat formatter = DateFormat.y('es_ES');
  final String formatted = formatter.format(date);
  return formatted;
}

String formatEEEEddMMMMYYYY(DateTime date) {
  return DateFormat('dd/MM/yyyy hh:mm:ss', 'es_ES').format(date);
}
