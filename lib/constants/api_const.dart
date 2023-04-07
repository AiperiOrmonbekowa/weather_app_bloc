class ApiConst {
  static String weatherByCityName(String name) =>
      'https://api.openweathermap.org/data/2.5/weather?q=$name,&appid=41aa18abb8974c0ea27098038f6feb1b';
}
