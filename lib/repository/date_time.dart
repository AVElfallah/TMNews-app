class DateTimeFormat {
  DateTimeFormat(this.dateTime);
  final String dateTime;
  String getTime() {
    DateTime date = DateTime.parse(dateTime);
    return '${(date.hour % 12).toString().padLeft(
          2,
          '0',
        )}:${(date.minute).toString().padLeft(
          2,
          '0',
        )}${date.hour > 12 ? " PM" : " AM"}';
  }

  String getDate() {
    DateTime date = DateTime.parse(dateTime);

    return '${date.day}-${date.month}-${date.year}';
  }

  String getAPIDate() {
    DateTime date = DateTime.parse(dateTime);

    return '${date.year}-${date.month}-${date.day}';
  }
}
