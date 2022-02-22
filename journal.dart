
import '../models/journal_entry.dart';

class Journal {

  List<JournalEntry> entries = [];
  
  Journal({required this.entries});


  void addEntry(entry) {
    entries == null ? entries = [entry] : entries.add(entry);
  }

}