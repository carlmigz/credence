import 'package:intl/intl.dart';

class CurrencyUtils {
  static String formatCurrency(double price) {
    return NumberFormat.currency(locale: 'en_PH', symbol: '₱ ').format(price);
  }
}
