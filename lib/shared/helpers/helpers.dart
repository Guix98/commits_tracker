String formatNewLines(String text) {
  return text.replaceAll('\n', ' ');
}

String formatDateTime(DateTime dateTime) {
  return '${dateTime.year}/${dateTime.month.toString().padLeft(2, "0")}/${dateTime.day.toString().padLeft(2, "0")} ${dateTime.hour.toString().padLeft(2, "0")}:${dateTime.minute.toString().padLeft(2, "0")}:${dateTime.second.toString().padLeft(2, "0")}';
}
