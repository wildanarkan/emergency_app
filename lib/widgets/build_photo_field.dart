import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BuildPhotoField extends StatelessWidget {
  final File? imageFile;
  final Function(File?) onImageSelected;
  final bool isRequired;
  final String? errorText;  // Add error text property
  final bool showError;     // Add show error property

  const BuildPhotoField({
    super.key,
    this.imageFile,
    required this.onImageSelected,
    this.isRequired = false,
    this.errorText,
    this.showError = false,
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
              ],
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        InkWell(
          onTap: imageFile == null
              ? () => _showImagePickerOptions(context)
              : () => _showSelectedImage(context),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: showError ? Colors.red : Colors.black45,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.photo,
                  color: showError ? Colors.red : null,
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    imageFile != null
                        ? imageFile!.path.split('/').last
                        : 'Pilih foto',
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: imageFile != null 
                          ? Colors.black 
                          : (showError ? Colors.red : Colors.grey[400]),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  height: 24,
                  width: 24,
                  child: imageFile != null
                      ? IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.close),
                          iconSize: 16,
                          onPressed: () => onImageSelected(null),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
        if (showError)
          Padding(
            padding: const EdgeInsets.only(top: 3.0, left: 15),
            child: Text(
              errorText ?? 'Photo harus diisi',
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}