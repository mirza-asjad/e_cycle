List<String> setSearchParam(String caseNumber) {
  // Trim the input string to remove leading and trailing spaces
  caseNumber = caseNumber.trim().toLowerCase(); // Convert to lowercase

  List<String> caseSearchList = [];

  // Generate all substrings
  for (int i = 0; i < caseNumber.length; i++) {
    for (int j = i + 1; j <= caseNumber.length; j++) {
      String substring = caseNumber.substring(i, j);
      // Only add substrings that do not contain spaces in the middle
      if (!substring.contains(' ') || substring.trim().isEmpty) {
        // Add the lowercase and uppercase versions of the substring
        caseSearchList.add(substring);
        caseSearchList.add(substring.toUpperCase());
      }
    }
  }

  return caseSearchList;
}


String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }



  // Helper function to get the language code from the current user's language
  String getLanguageCode(String language) {
    // Map of supported user languages to their corresponding language codes
    final languageCodeMap = {
      'arabic': 'ar',
      'german': 'de',
      'english': 'en',
      'french': 'fr',
      'urdu': 'ur',
      'chinese': 'zh',
      // Add more mappings as needed
    };

    return languageCodeMap[language.toLowerCase()] ??
        'en'; // Default to English if the language is not mapped
  }