import 'package:flutter/material.dart';
import 'rob_chat_page.dart';

class RobBotChatPage extends StatelessWidget {
  const RobBotChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: const Color(0xFF491EFE),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/bg_ai_content_bg.webp',
              width: screenSize.width,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: 153,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/rob_sayhi.webp',
              width: screenSize.width,
              fit: BoxFit.fitWidth,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: IconButton(
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
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      top: 153 + 200,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 49),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const RobChatPage(
                                    initialMessage: 'Training proficiency',
                                  ),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/question_1.webp',
                              width: double.infinity,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const RobChatPage(
                                    initialMessage: 'Training direction',
                                  ),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/question_2.webp',
                              width: double.infinity,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const RobChatPage(
                                    initialMessage: 'Training time',
                                  ),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/question_3.webp',
                              width: double.infinity,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const RobChatPage(),
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/btn_ai_go.webp',
                                width: 220,
                                height: 52,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
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


