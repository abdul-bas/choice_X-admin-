
String formatId(String? id) {
  return (id ?? '').trim().replaceAll(' ', '_').toUpperCase();
}