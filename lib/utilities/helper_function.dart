
import 'package:intl/intl.dart';

String getFormatedDate(DateTime dateTime,String format)
{
return DateFormat(format).format(dateTime);
}