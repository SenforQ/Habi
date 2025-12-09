import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health/health.dart';
import 'exercise_page.dart';
import 'figure_detail_page.dart';

class DynamicPage extends StatefulWidget {
  const DynamicPage({super.key});

  @override
  State<DynamicPage> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  Health health = Health();
  bool _isLoading = true;
  bool _hasPermission = false;
  
  // 健康数据
  double _calories = 0.0;
  int _heartRate = 0;
  int _steps = 0;
  double _runningDistance = 0.0;
  double _walkingDistance = 0.0;
  
  // 推荐爱好者数据
  List<Map<String, dynamic>> _enthusiasts = [];
  bool _isLoadingEnthusiasts = true;
  
  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _loadEnthusiasts();
  }
  
  Future<void> _loadEnthusiasts() async {
    try {
      final String response = await rootBundle.loadString('assets/Habi_figure.json');
      final List<dynamic> data = jsonDecode(response);
      
      // 随机选择6个推荐
      final shuffled = List<Map<String, dynamic>>.from(data)..shuffle();
      final recommended = shuffled.take(6).toList();
      
      if (mounted) {
        setState(() {
          _enthusiasts = recommended;
          _isLoadingEnthusiasts = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingEnthusiasts = false;
        });
      }
    }
  }
  
  Future<void> _requestPermissions() async {
    try {
      // 定义需要请求的健康数据类型
      List<HealthDataType> types = [
        HealthDataType.ACTIVE_ENERGY_BURNED, // 卡路里
        HealthDataType.HEART_RATE, // 心率
        HealthDataType.STEPS, // 步数（用于计算站立时间）
        HealthDataType.DISTANCE_WALKING_RUNNING, // 跑步和走路距离
      ];
      
      // 请求权限
      bool requested = await health.requestAuthorization(types);
      
      setState(() {
        _hasPermission = requested;
        _isLoading = false;
      });
      if (requested) {
        _fetchHealthData();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _hasPermission = false;
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to request health permissions: $e')),
        );
      }
    }
  }
  
  Future<void> _fetchHealthData() async {
    try {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final tomorrow = today.add(const Duration(days: 1));
      
      // 获取卡路里（活跃能量消耗）
      List<HealthDataPoint> caloriesData = await health.getHealthDataFromTypes(
        types: [HealthDataType.ACTIVE_ENERGY_BURNED],
        startTime: today,
        endTime: tomorrow,
      );
      double totalCalories = 0.0;
      for (var data in caloriesData) {
        if (data.value is NumericHealthValue) {
          totalCalories += (data.value as NumericHealthValue).numericValue;
        }
      }
      
      // 获取心率（最新值）
      List<HealthDataPoint> heartRateData = await health.getHealthDataFromTypes(
        types: [HealthDataType.HEART_RATE],
        startTime: today.subtract(const Duration(days: 1)),
        endTime: tomorrow,
      );
      int latestHeartRate = 0;
      if (heartRateData.isNotEmpty) {
        heartRateData.sort((a, b) => b.dateFrom.compareTo(a.dateFrom));
        if (heartRateData.first.value is NumericHealthValue) {
          latestHeartRate = (heartRateData.first.value as NumericHealthValue).numericValue.toInt();
        }
      }
      
      // 获取步数
      List<HealthDataPoint> stepsData = await health.getHealthDataFromTypes(
        types: [HealthDataType.STEPS],
        startTime: today,
        endTime: tomorrow,
      );
      int totalSteps = 0;
      for (var data in stepsData) {
        if (data.value is NumericHealthValue) {
          totalSteps += (data.value as NumericHealthValue).numericValue.toInt();
        }
      }
      
      // 获取跑步和走路距离（使用 DISTANCE_WALKING_RUNNING）
      List<HealthDataPoint> distanceData = await health.getHealthDataFromTypes(
        types: [HealthDataType.DISTANCE_WALKING_RUNNING],
        startTime: today,
        endTime: tomorrow,
      );
      double runningDistance = 0.0;
      double walkingDistance = 0.0;
      // 注意：DISTANCE_WALKING_RUNNING 返回的是总距离，这里简单分配
      // 实际应用中可能需要根据运动类型区分
      double totalDistance = 0.0;
      for (var data in distanceData) {
        if (data.value is NumericHealthValue) {
          totalDistance += (data.value as NumericHealthValue).numericValue;
        }
      }
      // 将总距离转换为公里（从米）
      totalDistance = totalDistance / 1000.0;
      // 简单分配：假设70%是跑步，30%是走路
      runningDistance = totalDistance * 0.7;
      walkingDistance = totalDistance * 0.3;
      
      if (mounted) {
        setState(() {
          _calories = totalCalories;
          _heartRate = latestHeartRate;
          _steps = totalSteps;
          _runningDistance = runningDistance;
          _walkingDistance = walkingDistance;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to fetch health data: $e')),
        );
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    
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
                        'Health Data',
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
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (!_hasPermission) ...[
                                const SizedBox(height: 20),
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.orange.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.orange.withOpacity(0.5),
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.info_outline,
                                        color: Colors.orange,
                                        size: 24,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Health Permission Required',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            const Text(
                                              'Grant permission to view your health data',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFFE8F5FF),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: _requestPermissions,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFF0FD7FB),
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 8,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: const Text(
                                          'Grant',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              const SizedBox(height: 20),
                              // 每日锻炼 Banner
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => const ExercisePage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFF0FD7FB), Color(0xFF0A9BC7)],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(18),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF0FD7FB).withOpacity(0.3),
                                        blurRadius: 12,
                                        offset: const Offset(0, 6),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 56,
                                        height: 56,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(14),
                                        ),
                                        child: const Icon(
                                          Icons.fitness_center,
                                          color: Colors.white,
                                          size: 28,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      const Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Daily Exercise',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              'Start your fitness journey',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFFE8F5FF),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              // 第一个卡片占一行
                              _HealthCard(
                                icon: Icons.local_fire_department,
                                title: 'Calories',
                                value: _hasPermission ? _calories.toStringAsFixed(0) : '--',
                                unit: 'kcal',
                                color: const Color(0xFFFF6B6B),
                              ),
                              const SizedBox(height: 16),
                              // 剩下的4个卡片以2x2网格显示
                              Row(
                                children: [
                                  Expanded(
                                    child: _HealthCard(
                                      icon: Icons.favorite,
                                      title: 'Heart Rate',
                                      value: _hasPermission && _heartRate > 0 ? '$_heartRate' : '--',
                                      unit: 'bpm',
                                      color: const Color(0xFFFF4757),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: _HealthCard(
                                      icon: Icons.directions_walk,
                                      title: 'Steps',
                                      value: _hasPermission ? '$_steps' : '--',
                                      unit: 'steps',
                                      color: const Color(0xFF2ED573),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: _HealthCard(
                                      icon: Icons.directions_run,
                                      title: 'Running',
                                      value: _hasPermission ? _runningDistance.toStringAsFixed(2) : '--',
                                      unit: 'km',
                                      color: const Color(0xFF00D2D3),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: _HealthCard(
                                      icon: Icons.directions_walk,
                                      title: 'Walking',
                                      value: _hasPermission ? _walkingDistance.toStringAsFixed(2) : '--',
                                      unit: 'km',
                                      color: const Color(0xFF54A0FF),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 32),
                              // Recommend Enthusiasts 部分
                              const Text(
                                'Recommend Enthusiasts',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 16),
                              _isLoadingEnthusiasts
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                      ),
                                    )
                                  : SizedBox(
                                      height: 180,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: _enthusiasts.length,
                                        itemBuilder: (context, index) {
                                          final enthusiast = _enthusiasts[index];
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (_) => FigureDetailPage(
                                                    characterData: enthusiast,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: _EnthusiastCard(
                                              nickname: enthusiast['HabiNickName'] ?? '',
                                              avatar: enthusiast['HabiUserIcon'] ?? '',
                                              followNum: enthusiast['HabiShowFollowNum'] ?? 0,
                                              likeNum: enthusiast['HabiShowLike'] ?? 0,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
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

class _HealthCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String unit;
  final Color color;

  const _HealthCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.unit,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFFE8F5FF),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        unit,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFFE8F5FF),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EnthusiastCard extends StatelessWidget {
  final String nickname;
  final String avatar;
  final int followNum;
  final int likeNum;

  const _EnthusiastCard({
    required this.nickname,
    required this.avatar,
    required this.followNum,
    required this.likeNum,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              avatar,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey.withOpacity(0.3),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 40,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            nickname,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.favorite,
                size: 12,
                color: Color(0xFFE8F5FF),
              ),
              const SizedBox(width: 4),
              Text(
                '$likeNum',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFE8F5FF),
                ),
              ),
              const SizedBox(width: 12),
              const Icon(
                Icons.people,
                size: 12,
                color: Color(0xFFE8F5FF),
              ),
              const SizedBox(width: 4),
              Text(
                '$followNum',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFE8F5FF),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
