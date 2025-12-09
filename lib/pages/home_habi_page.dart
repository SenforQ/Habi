import 'package:flutter/material.dart';
import 'person_center_page.dart';
import 'rob_bot_chat_page.dart';
import 'rob_chat_page.dart';
import 'dynamic_page.dart';

class HomeHabiPage extends StatefulWidget {
  const HomeHabiPage({super.key});

  @override
  State<HomeHabiPage> createState() => _HomeHabiPageState();
}

class _HomeHabiPageState extends State<HomeHabiPage> {
  final TextEditingController _workoutController = TextEditingController();
  int _selectedImageIndex = 0;

  @override
  void dispose() {
    _workoutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Container(
              key: ValueKey<int>(_selectedImageIndex),
              width: screenSize.width,
              height: screenSize.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/home_bg_${_selectedImageIndex + 1}.webp'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Image.asset(
              'assets/bg_home_woman.webp',
              width: 312,
              height: 468,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 66,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(33),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextField(
                              controller: _workoutController,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                hintText: "Today's Workout?",
                                hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () {
                              final message = _workoutController.text.trim();
                              if (message.isNotEmpty) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => RobChatPage(
                                      initialMessage: message,
                                    ),
                                  ),
                                );
                                _workoutController.clear();
                              }
                            },
                            child: Image.asset(
                              'assets/btn_home_send.webp',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _QuickQuestionButton(
                        text: 'How long to wordk out daily？',
                        onTap: () {
                          _workoutController.text = 'How long to wordk out daily？';
                        },
                      ),
                      const SizedBox(height: 8),
                      _QuickQuestionButton(
                        text: 'How to jog？',
                        onTap: () {
                          _workoutController.text = 'How to jog？';
                        },
                      ),
                      const SizedBox(height: 8),
                      _QuickQuestionButton(
                        text: 'How to exercise effectively？',
                        onTap: () {
                          _workoutController.text = 'How to exercise effectively？';
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        for (int i = 0; i < 5; i++) ...[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedImageIndex = i;
                              });
                            },
                            child: Container(
                              width: 100,
                              height: 125,
                              margin: EdgeInsets.only(
                                right: i < 4 ? 12 : 0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: _selectedImageIndex == i
                                      ? Colors.black
                                      : Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  _selectedImageIndex == i
                                      ? 'assets/home_bg_${i + 1}.webp'
                                      : 'assets/home_bg_${i + 1}_small.webp',
                                  width: 100,
                                  height: 125,
                                  fit: BoxFit.cover,
                                  cacheWidth: 100,
                                  cacheHeight: 125,
                                  filterQuality: FilterQuality.low,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const RobBotChatPage(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/btn_home_robot.webp',
                        width: 80,
                        height: 80,
                      ),
                    ),
                    const SizedBox(width: 28),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const DynamicPage(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/btn_home_dynamic.webp',
                        width: 80,
                        height: 80,
                      ),
                    ),
                    const SizedBox(width: 28),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const PersonCenterPage(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/btn_home_skin.webp',
                        width: 80,
                        height: 80,
                      ),
                    ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickQuestionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _QuickQuestionButton({
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

