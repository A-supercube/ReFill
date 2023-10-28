import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResumeUploadScreen(),
    );
  }
}

class ResumeUploadScreen extends StatefulWidget {
  @override
  _ResumeUploadScreenState createState() => _ResumeUploadScreenState();
}

class _ResumeUploadScreenState extends State<ResumeUploadScreen> {
  String name = '';
  String resumeFileName = '';
  String resumeFilePath = '';

  Future<void> uploadResume() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        resumeFileName = result.files.single.name;
        resumeFilePath = result.files.single.path!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume Upload App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Name: $name'),
            TextField(
              decoration: InputDecoration(labelText: 'Enter Your Name'),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: uploadResume,
              child: Text('Upload Resume'),
            ),
            SizedBox(height: 20),
            Text('Resume: $resumeFileName'),
            if (resumeFilePath.isNotEmpty)
              ElevatedButton(
                onPressed: () {
                  // You can implement file upload logic here using the 'resumeFilePath'.
                  // For simplicity, it's just displaying the file path in this example.
                  print('File Path: $resumeFilePath');
                },
                child: Text('Submit Resume'),
              ),
          ],
        ),
      ),
    );
  }
}
