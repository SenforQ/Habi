import 'package:shared_preferences/shared_preferences.dart';

class CoinService {
  static const String _coinsKey = 'user_coins';

  static Future<void> initializeNewUser() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(_coinsKey)) {
      await prefs.setInt(_coinsKey, 0);
    }
  }

  static Future<int> getCurrentCoins() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_coinsKey) ?? 0;
  }

  static Future<bool> addCoins(int coins) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final currentCoins = await getCurrentCoins();
      final newCoins = currentCoins + coins;
      await prefs.setInt(_coinsKey, newCoins);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> deductCoins(int coins) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final currentCoins = await getCurrentCoins();
      if (currentCoins < coins) {
        return false;
      }
      final newCoins = currentCoins - coins;
      await prefs.setInt(_coinsKey, newCoins);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> hasEnoughCoins(int coins) async {
    final currentCoins = await getCurrentCoins();
    return currentCoins >= coins;
  }
}

