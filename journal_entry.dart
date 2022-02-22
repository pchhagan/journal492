class JournalEntry {
  int? id;
  String?title;
  String? body;
  int? rating;
  DateTime? dateTime;

  JournalEntry({this.id, this.title, this.body, this.rating, this.dateTime});

String toString() {
    return 'Title: $title, Body: $body, Rating: $rating, Date: $dateTime';
  }
}