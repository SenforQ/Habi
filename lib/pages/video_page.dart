import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VideoPage extends StatefulWidget {
  final String nickname;
  final String avatar;
  final String audioAsset;
  final String backgroundImage;

  const VideoPage({
    super.key,
    required this.nickname,
    required this.avatar,
    required this.audioAsset,
    required this.backgroundImage,
  });

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  final AudioPlayer _player = AudioPlayer();
  Timer? _timer;
  int _secondsLeft = 30;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _startCall();
  }

  Future<void> _startCall() async {
    try {
      await _player.play(AssetSource(widget.audioAsset.replaceFirst('assets/', '')));
      setState(() {
        _isPlaying = true;
      });
    } catch (_) {
      // ignore play error
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        _secondsLeft--;
      });
      if (_secondsLeft <= 0) {
        _hangup();
      }
    });
  }

  Future<void> _hangup() async {
    _timer?.cancel();
    await _player.stop();
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _player.stop();
    _player.dispose();
    super.dispose();
  }

  String _format(int s) {
    final m = s ~/ 60;
    final ss = s % 60;
    return '${m.toString().padLeft(2, '0')}:${ss.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: IconButton(
          onPressed: _hangup,
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
          Positioned.fill(
            child: Image.asset(
              widget.backgroundImage,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              errorBuilder: (_, __, ___) => Image.asset(
                'assets/base_content_bg.webp',
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          widget.avatar,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: 60,
                            height: 60,
                            color: Colors.grey.withOpacity(0.3),
                            child: const Icon(Icons.person, color: Colors.white, size: 30),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.nickname,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _isPlaying ? 'Calling...' : 'Connecting...',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Auto hang up in ${_format(_secondsLeft)}',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 48),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _hangup,
                        child: Container(
                          width: 72,
                          height: 72,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.call_end,
                            color: Colors.white,
                            size: 32,
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

