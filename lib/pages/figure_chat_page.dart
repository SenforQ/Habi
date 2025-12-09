import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FigureChatPage extends StatefulWidget {
  final Map<String, dynamic> characterData;

  const FigureChatPage({super.key, required this.characterData});

  @override
  State<FigureChatPage> createState() => _FigureChatPageState();
}

class _FigureChatPageState extends State<FigureChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<_ChatMessage> _messages = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  File? _userAvatarFile;

  @override
  void initState() {
    super.initState();
    _loadUserAvatar();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final nickname = widget.characterData['HabiNickName'] ?? 'Figure';
      final motto = widget.characterData['HabiShowMotto'] ??
          'I create stories and share them with passion.';
      setState(() {
        _messages.add(
          _ChatMessage(
            text:
                'Hi, I am $nickname. $motto\nAsk me anything in English and I will share insights from my perspective.',
            isUser: false,
          ),
        );
      });
      _scrollToBottom();
    });
  }

  Future<void> _loadUserAvatar() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final avatarRelativePath = prefs.getString('user_avatar_path');
      if (avatarRelativePath != null && avatarRelativePath.isNotEmpty) {
        final appDocDir = await getApplicationDocumentsDirectory();
        final fullPath = '${appDocDir.path}/$avatarRelativePath';
        final file = File(fullPath);
        if (await file.exists()) {
          if (mounted) {
            setState(() {
              _userAvatarFile = file;
            });
          }
        }
      }
    } catch (_) {
      // ignore errors
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage(String userMessage) async {
    if (userMessage.trim().isEmpty) return;
    if (!mounted) return;

    setState(() {
      _messages.add(_ChatMessage(text: userMessage, isUser: true));
      _isLoading = true;
    });

    _messageController.clear();
    _scrollToBottom();

    final nickname = widget.characterData['HabiNickName'] ?? 'Figure';
    final motto = widget.characterData['HabiShowMotto'] ??
        'I create stories and share them with passion.';

    try {
      final response = await http.post(
        Uri.parse('https://open.bigmodel.cn/api/paas/v4/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer 656655b7e3e74c40a8da147ba8eba5e9.biHaSHn0bPo21nV3',
        },
        body: jsonEncode({
          'model': 'GLM-4-Flash',
          'messages': [
            {
              'role': 'system',
              'content':
                  '$nickname is a storytelling enthusiast. Bio: $motto. Respond concisely in English, friendly and supportive.',
            },
            {
              'role': 'user',
              'content': userMessage,
            }
          ],
          'temperature': 0.7,
        }),
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final aiMessage = data['choices'][0]['message']['content'] as String;

        if (mounted) {
          setState(() {
            _messages.add(_ChatMessage(text: aiMessage, isUser: false));
            _isLoading = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _messages.add(_ChatMessage(
              text: 'Error: ${response.statusCode}',
              isUser: false,
            ));
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _messages.add(_ChatMessage(
            text: 'Error: $e',
            isUser: false,
          ));
          _isLoading = false;
        });
      }
    }

    if (mounted) {
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    if (!mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final avatar = widget.characterData['HabiUserIcon'] as String? ??
        'assets/ai_header.webp';
    final photoArray = widget.characterData['HabiShowPhotoArray'] as List<dynamic>? ?? [];
    final backgroundImage = photoArray.length > 1 
        ? photoArray[1] as String 
        : 'assets/bg_ai_content_bg.webp';

    return Scaffold(
      backgroundColor: const Color(0xFF491EFE),
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
        title: Text(
          widget.characterData['HabiNickName'] ?? 'Figure',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              backgroundImage,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/bg_ai_content_bg.webp',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                );
              },
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                    itemCount: _messages.length + (_isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == _messages.length) {
                        return const _LoadingIndicator();
                      }
                      return _ChatBubble(
                        message: _messages[index],
                        userAvatarFile: _userAvatarFile,
                        aiAvatar: avatar,
                      );
                    },
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    border: Border(
                      top: BorderSide(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Ask something in English...',
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          onSubmitted: (value) {
                            _sendMessage(value);
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: _isLoading
                            ? () {}
                            : () {
                                _sendMessage(_messageController.text);
                              },
                        child: Opacity(
                          opacity: _isLoading ? 0.5 : 1.0,
                          child: Image.asset(
                            'assets/btn_home_send.webp',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatMessage {
  final String text;
  final bool isUser;

  _ChatMessage({required this.text, required this.isUser});
}

class _ChatBubble extends StatelessWidget {
  final _ChatMessage message;
  final File? userAvatarFile;
  final String aiAvatar;

  const _ChatBubble({
    required this.message,
    required this.aiAvatar,
    this.userAvatarFile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isUser) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                aiAvatar,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
          ],
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: message.isUser
                        ? const Color(0xFF0FD7FB).withOpacity(0.8)
                        : Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    message.text,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (message.isUser) ...[
            const SizedBox(width: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: userAvatarFile != null
                  ? Image.file(
                      userAvatarFile!,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/user_default_habi.webp',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
            ),
          ],
        ],
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/ai_header.webp',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
                child: const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

