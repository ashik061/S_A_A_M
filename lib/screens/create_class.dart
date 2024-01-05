import 'package:flutter/material.dart';

class CreateClassDialog extends StatefulWidget {
  const CreateClassDialog({super.key});

  @override
  State<CreateClassDialog> createState() => _CreateClassDialogState();
}

class _CreateClassDialogState extends State<CreateClassDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  final TextEditingController _controllerClassName = TextEditingController();
  final TextEditingController _controllerSubject = TextEditingController();
  final TextEditingController _controllerRoom = TextEditingController();

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget contentBox(BuildContext context) {
    return Container(
      //width: double.maxFinite,
      //height: double.maxFinite,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          const Text(
            'Create Class',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 50.0),
          _entryField('Class name (required)', _controllerClassName),
          const SizedBox(height: 10.0),
          _entryField('Subject', _controllerSubject),
          const SizedBox(height: 10.0),
          _entryField('Room', _controllerRoom),
          const SizedBox(height: 10.0),
          const SizedBox(height: 50.0),
          ElevatedButton(
            onPressed: () {
              // Handle the join class option
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[900],
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 30.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const Text(
              'Create',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
