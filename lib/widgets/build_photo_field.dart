// lib/widgets/build_photo_field.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BuildPhotoField extends StatelessWidget {
  final File? imageFile;
  final Function(File?) onImageSelected;
  final bool isRequired;

  const BuildPhotoField({
    super.key,
    this.imageFile,
    required this.onImageSelected,
    this.isRequired = false,
  });

  Future<void> _pickImage(ImageSource source, BuildContext context) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        onImageSelected(File(pickedFile.path));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to pick image')),
      );
    }
  }

  void _showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery, context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera, context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSelectedImage(BuildContext context) {
    if (imageFile != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.file(imageFile!),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: imageFile == null
          ? () => _showImagePickerOptions(context)
          : () => _showSelectedImage(context),
      child: Container(
        padding: const EdgeInsets.only(bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Photo',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (isRequired)
                  const Text(
                    ' *',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black45),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.photo),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      imageFile != null
                          ? imageFile!.path.split('/').last
                          : 'Pilih foto',
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            imageFile != null ? Colors.black : Colors.grey[400],
                      ),
                    ),
                  ),
                  if (imageFile != null)
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => onImageSelected(null),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
