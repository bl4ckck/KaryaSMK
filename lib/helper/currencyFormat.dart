import 'package:intl/intl.dart';

String currencyFormat(price) {
  return NumberFormat.currency(name: 'Rp').format(price);
}
