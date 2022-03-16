main() {
  List<String> weekdays = ["Pazartesi", "Salı", "Çarşamba", "Perşembe", "Cuma", "Cumartesi", "Pazar"];

  DateTime localTime = DateTime.parse('1994-11-23');

  print(weekdays[localTime.weekday-1]);
}