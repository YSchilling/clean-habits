List<DateTime> getWeekDays(DateTime date) {
  return [
    date.subtract(Duration(days: date.weekday - 1)),
    date.subtract(Duration(days: date.weekday - 2)),
    date.subtract(Duration(days: date.weekday - 3)),
    date.subtract(Duration(days: date.weekday - 4)),
    date.subtract(Duration(days: date.weekday - 5)),
    date.subtract(Duration(days: date.weekday - 6)),
    date.subtract(Duration(days: date.weekday - 7))
  ];
}
