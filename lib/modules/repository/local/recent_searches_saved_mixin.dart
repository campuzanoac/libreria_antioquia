import 'package:shared_preferences/shared_preferences.dart';

const recentSearchesKey = 'recent_searches';

mixin RecentSearchesSavedMixin {
  Future<void> saveRecentSearches(List<String> recentSearches) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setStringList(recentSearchesKey, recentSearches);
  }

  Future<List<String>> getRecentSearches() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final recentSearches = sharedPreferences.getStringList(recentSearchesKey);

    return recentSearches ?? [];
  }
}
