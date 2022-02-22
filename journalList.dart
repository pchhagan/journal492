// import 'package:flutter/material.dart';
// import 'package:journal/db/database_manager.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:flutter/semantics.dart';
// import '../db/database_manager.dart';
// import '../screens/newEntry.dart';
// import '../widgets/welcome.dart';
// import '../models/journal.dart';

// class JournalEntryListScreen extends StatefulWidget {
//   @override
//     _JournalEntryListScreeenState createState() => _JournalEntryListScreeenState();
// }

// class _JournalEntryListScreeenState extends State<JournalEntryListScreen> {
//   late Journal journal;


//   @override
//   void initState() {
//     super.initState();
//     loadJournal();
//   }

//   void loadJournal() async {
//     final databaseManager = DatabaseManager.getInstance();
//     List<Map<String, dynamic>> journalEntries = await databaseManager.journalEntries();
//     print(journalEntries);
//     setState(() {
//       journal = Journal(entries: journalEntries);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//     )
  
//   }
//   }
// }
