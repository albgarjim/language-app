class Global {
  static final shared = Global();

  static List<List<dynamic>> wordList = [
    ["", "", ""]
  ];
  static bool loadedCSV = false;
  static int wait = 2000;
  static int mainLanguage = 0;
  static int secLanguage = 1;
  static int index = 0;
}
