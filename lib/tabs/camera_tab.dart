import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../screens/form_screen.dart';

class CameraTab extends StatefulWidget {
  @override
  State<CameraTab> createState() => _CameraTabState();
}

class _CameraTabState extends State<CameraTab> {
  late File _image;
  bool init = false;

  Future<void> _takePicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        _image = File(image.path);
        init = true;
        // trabajar con la imagen
      }
    });
  }

  @override
  void initState() {
    init = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _takePicture();
                      });
                      // Código a ejecutar cuando se presione el botón
                    },
                    child: Text('Botón'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormScreen(),
                        ),
                      );
                    },
                    child: Text('Aceptar'),
                  ),
                ],
              ),
            ),
            init ? Image.file(_image) : Container(),
          ],
        ),
      ),
    );
  }
}
