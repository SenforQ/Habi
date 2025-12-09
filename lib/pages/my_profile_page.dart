import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _signatureController = TextEditingController();
  String? _avatarPath;
  File? _selectedImage;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final name = prefs.getString('user_name') ?? 'Habi-';
      final signature = prefs.getString('user_signature') ?? 'No personal signature yet';
      final avatarRelativePath = prefs.getString('user_avatar_path');

      setState(() {
        _nameController.text = name;
        _signatureController.text = signature;
        if (avatarRelativePath != null && avatarRelativePath.isNotEmpty) {
          _loadAvatarFromPath(avatarRelativePath);
        } else {
          _avatarPath = null;
        }
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _nameController.text = 'Habi-';
        _signatureController.text = 'No personal signature yet';
        _avatarPath = null;
        _isLoading = false;
      });
    }
  }

  Future<void> _loadAvatarFromPath(String relativePath) async {
    try {
      final appDocDir = await getApplicationDocumentsDirectory();
      final fullPath = '${appDocDir.path}/$relativePath';
      final file = File(fullPath);
      if (await file.exists()) {
        setState(() {
          _avatarPath = relativePath;
          _selectedImage = file;
        });
      } else {
        setState(() {
          _avatarPath = null;
          _selectedImage = null;
        });
      }
    } catch (e) {
      setState(() {
        _avatarPath = null;
        _selectedImage = null;
      });
    }
  }

  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (image != null) {
        final appDocDir = await getApplicationDocumentsDirectory();
        final fileName = 'avatar_${DateTime.now().millisecondsSinceEpoch}.jpg';
        final relativePath = 'user_avatars/$fileName';
        final fullPath = '${appDocDir.path}/$relativePath';
        
        final directory = Directory('${appDocDir.path}/user_avatars');
        if (!await directory.exists()) {
          await directory.create(recursive: true);
        }

        final savedFile = await File(image.path).copy(fullPath);
        
        setState(() {
          _selectedImage = savedFile;
          _avatarPath = relativePath;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to pick image: $e')),
        );
      }
    }
  }

  Future<void> _saveProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_name', _nameController.text.trim());
      await prefs.setString('user_signature', _signatureController.text.trim());
      if (_avatarPath != null) {
        await prefs.setString('user_avatar_path', _avatarPath!);
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile saved successfully')),
        );
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save profile: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          padding: EdgeInsets.zero,
          iconSize: 32,
          icon: Image.asset(
            'assets/btn_dynamic_back.webp',
            width: 32,
            height: 32,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            width: screenSize.width,
            height: screenSize.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/base_content_bg.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: _pickImage,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: _selectedImage != null
                                    ? Image.file(
                                        _selectedImage!,
                                        width: 160,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        'assets/user_default_habi.webp',
                                        width: 160,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              Positioned(
                                bottom: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        TextField(
                          controller: _nameController,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFFE8F5FF),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.3),
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextField(
                          controller: _signatureController,
                          maxLines: 3,
                          style: const TextStyle(
                            fontSize: 18,
                            height: 1.4,
                            color: Color(0xFFE8F5FF),
                          ),
                          decoration: InputDecoration(
                            labelText: 'Signature',
                            labelStyle: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFFE8F5FF),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.3),
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 48),
                        Container(
                          width: double.infinity,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            gradient: const LinearGradient(
                              colors: [Color(0xFF0FD7FB), Color(0xFF0FD7FB)],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF0FD7FB).withOpacity(0.4),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: _saveProfile,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                            child: const Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

