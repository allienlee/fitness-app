import 'package:flutter/material.dart';
import 'package:cell_calendar/cell_calendar.dart';

class ExerciseCalendar extends StatefulWidget {
  @override
  _ExerciseCalendarState createState() => _ExerciseCalendarState();
}

class _ExerciseCalendarState extends State<ExerciseCalendar> {
  // List to store calendar events
  final List<CalendarEvent> _events = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Calendar'),
      ),
      body: CellCalendar(
        events: _events,
        onCellTapped: (DateTime date) {
          _showExerciseForm(context, date);
        },
      ),
    );
  }

  // Function to show the exercise form
  void _showExerciseForm(BuildContext context, DateTime selectedDate) async {
    final newEvent = await showDialog<CalendarEvent>(
      context: context,
      builder: (context) {
        return ExerciseFormDialog(selectedDate: selectedDate);
      },
    );

    if (newEvent != null) {
      setState(() {
        _events.add(newEvent);
      });
    }
  }
}

class ExerciseFormDialog extends StatefulWidget {
  final DateTime selectedDate;

  const ExerciseFormDialog({Key? key, required this.selectedDate})
      : super(key: key);

  @override
  _ExerciseFormDialogState createState() => _ExerciseFormDialogState();
}

class _ExerciseFormDialogState extends State<ExerciseFormDialog> {
  final _formKey = GlobalKey<FormState>();
  String? _exerciseName;
  String? _duration;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Exercise for ${widget.selectedDate.toLocal()}'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Exercise Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an exercise name';
                }
                return null;
              },
              onSaved: (value) {
                _exerciseName = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Duration (minutes)'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a duration';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
              onSaved: (value) {
                _duration = value;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close dialog
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              final newEvent = CalendarEvent(
                eventName: '$_exerciseName (${_duration}min)',
                eventTextStyle: TextStyle(color: Colors.black, fontSize: 12), 
                eventDate: widget.selectedDate,
              );
              Navigator.of(context).pop(newEvent); // Pass event back
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
