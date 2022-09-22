class DateTimeFormat {
  DateTimeFormat(this.dateTime);
  final DateTime dateTime;
  String getTime() {
    return '${(dateTime.hour % 12).toString().padLeft(
          2,
          '0',
        )}:${(dateTime.minute).toString().padLeft(
          2,
          '0',
        )}${dateTime.hour > 12 ? " PM" : " AM"}';
  }

  String getDate() {
    return '${dateTime.day}-${dateTime.month}-${dateTime.year}';
  }

  String getAPIDate() {
    return '${dateTime.year}-${dateTime.month}-${dateTime.day}';
  }
}
