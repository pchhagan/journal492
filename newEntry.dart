import 'package:flutter/material.dart';
import 'package:journal/db/database_manager.dart';
import 'package:journal/dropdown_rating_form_field.dart';
import '../db/journal_entry_DTO.dart';

class JournalEntry extends StatefulWidget {
  static const routeName = 'journalEntry';

  JournalEntry({Key? key}) : super(key: key);
  @override
  _JournalEntryState createState() => _JournalEntryState();
}

class _JournalEntryState extends State<JournalEntry> {
  final formKey = GlobalKey<FormState>();

  final journalEntryFields = JournalEntryDTO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('New Journal Entry')),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                            labelText: 'Title', border: OutlineInputBorder()),
                        onSaved: (String? value) {
                          journalEntryFields.title = value;
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter a title';
                          }
                        },
                      ),
                      TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                            labelText: 'Body', border: OutlineInputBorder()),
                        onSaved: (String? value) {
                          journalEntryFields.body = value;
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter a body';
                          }
                        },
                      ),
                      // DropdownRatingFormField(
                      //     maxRating: 4,
                      //     validator: (value) {
                      //       if (value) {
                      //         return 'Please enter a number';
                      //       }
                      //     },
                      //     onSaved: (value) {
                      //       journalEntryFields.rating = value;
                      //     }),
                      SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              journalEntryFields.dateTime = DateTime.now();
                              formKey.currentState?.save();
                              print("help");
                              // final databaseManager = DatabaseManager.getInstance();
                              // databaseManager.saveJournalEntry(dto: journalEntryFields );
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text('Save Entry'))
                    ]))));
  }
}
