import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? file;

  _selectFile() async {
    final _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      file = image == null ? null : File(image.path);
    });

    if (image == null) return;

    final bytes = await image.readAsBytes();
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://dev.easydev.group/upload/'),
    );

    request.files.add(
      http.MultipartFile.fromBytes(
        'file',
        bytes.toList(),
        filename: image.name,
      ),
    );

    final response = await request.send();

    if (response.statusCode == 200) {
      showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    } else {
      showDialog<void>(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Error'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              OutlinedButton(
                onPressed: _selectFile,
                child: const Text('Choose file'),
              ),
              if (file != null) Image.file(file!, width: 200)
            ],
          ),
        ),
      ],
    );
  }
}
