import 'package:intl/intl.dart';

 
String formatEEEEddMMMMYYYY(DateTime date) {
 
  return DateFormat('dd/MM/yyyy hh:mm:ss', 'es_MX').format(date.toLocal());
}
