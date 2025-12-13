import 'dart:async';
import 'package:flutter/material.dart';
import '../services/coin_service.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  String? _selectedExercise;
  bool _isRunning = false;
  int _seconds = 0;
  Timer? _timer;

  final List<Map<String, dynamic>> _exercises = [
    {
      'name': 'Running',
      'icon': Icons.directions_run,
      'color': const Color(0xFF00D2D3),
      'chinese': '跑步',
    },
    {
      'name': 'Stretching',
      'icon': Icons.accessibility_new,
      'color': const Color(0xFF5F27CD),
      'chinese': '拉伸',
    },
    {
      'name': 'Climbing',
      'icon': Icons.stairs,
      'color': const Color(0xFFFF6B6B),
      'chinese': '爬楼',
    },
    {
      'name': 'Cycling',
      'icon': Icons.directions_bike,
      'color': const Color(0xFF2ED573),
      'chinese': '骑行',
    },
    {
      'name': 'Yoga',
      'icon': Icons.self_improvement,
      'color': const Color(0xFFFF4757),
      'chinese': '瑜伽',
    },
    {
      'name': 'Swimming',
      'icon': Icons.pool,
      'color': const Color(0xFF54A0FF),
      'chinese': '游泳',
    },
  ];

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _startTimer() async {
    if (_selectedExercise == null) return;
    
    final hasEnoughCoins = await CoinService.hasEnoughCoins(10);
    if (!hasEnoughCoins) {
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Insufficient Coins',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          content: const Text(
            'You need 10 Coins to use Daily Exercise. Please purchase more coins.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      );
      return;
    }
    
    final success = await CoinService.deductCoins(10);
    if (!success) {
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Error',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          content: const Text(
            'Failed to deduct coins. Please try again.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      );
      return;
    }
    
    if (!mounted) return;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _seconds++;
        });
      }
    });
    setState(() {
      _isRunning = true;
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _seconds = 0;
    });
  }

  String _formatTime(int seconds) {
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final secs = seconds % 60;
    
    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
    }
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final selectedExerciseData = _exercises.firstWhere(
      (e) => e['name'] == _selectedExercise,
      orElse: () => {},
    );

    return Scaffold(
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        padding: EdgeInsets.zero,
                        iconSize: 32,
                        icon: Image.asset(
                          'assets/btn_dynamic_back.webp',
                          width: 32,
                          height: 32,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Daily Exercise',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Select Exercise Type',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 1.0,
                          ),
                          itemCount: _exercises.length,
                          itemBuilder: (context, index) {
                            final exercise = _exercises[index];
                            final isSelected = _selectedExercise == exercise['name'];
                            
                            return GestureDetector(
                              onTap: () {
                                if (_isRunning) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Please stop current exercise first'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                  return;
                                }
                                setState(() {
                                  _selectedExercise = exercise['name'];
                                  _seconds = 0;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? (exercise['color'] as Color).withOpacity(0.3)
                                      : Colors.white.withOpacity(0.14),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: isSelected
                                        ? exercise['color'] as Color
                                        : Colors.white.withOpacity(0.2),
                                    width: isSelected ? 2 : 1,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      exercise['icon'] as IconData,
                                      color: isSelected
                                          ? exercise['color'] as Color
                                          : Colors.white,
                                      size: 32,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      exercise['name'] as String,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: isSelected
                                            ? exercise['color'] as Color
                                            : Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 32),
                        if (_selectedExercise != null) ...[
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.14),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  selectedExerciseData['icon'] as IconData,
                                  color: selectedExerciseData['color'] as Color,
                                  size: 48,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  selectedExerciseData['name'] as String,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  _formatTime(_seconds),
                                  style: const TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFeatures: [FontFeature.tabularFigures()],
                                  ),
                                ),
                                const SizedBox(height: 32),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (!_isRunning) ...[
                                      ElevatedButton.icon(
                                        onPressed: _startTimer,
                                        icon: const Icon(Icons.play_arrow),
                                        label: const Text('Start'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFF0FD7FB),
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 32,
                                            vertical: 16,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(28),
                                          ),
                                        ),
                                      ),
                                    ] else ...[
                                      ElevatedButton.icon(
                                        onPressed: _pauseTimer,
                                        icon: const Icon(Icons.pause),
                                        label: const Text('Pause'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.orange,
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 32,
                                            vertical: 16,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(28),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      ElevatedButton.icon(
                                        onPressed: _resetTimer,
                                        icon: const Icon(Icons.stop),
                                        label: const Text('Stop'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 32,
                                            vertical: 16,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(28),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                        const SizedBox(height: 32),
                      ],
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

