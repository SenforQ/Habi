import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'privacy_policy_page.dart';
import 'terms_of_service_page.dart';
import 'about_us_page.dart';
import 'my_profile_page.dart';
import 'wallet_habi_page.dart';

class PersonCenterPage extends StatelessWidget {
  const PersonCenterPage({super.key});

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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const SizedBox(height: 16),
                  _ProfileCard(),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const WalletHabiPage(),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/wallet_mark_cell.webp',
                      width: screenSize.width - 40,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _SettingsCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileCard extends StatefulWidget {
  @override
  State<_ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<_ProfileCard> {
  String _userName = 'Totoa';
  String _userSignature = 'No personal signature yet';
  File? _avatarFile;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final name = prefs.getString('user_name') ?? 'Totoa';
      final signature = prefs.getString('user_signature') ?? 'No personal signature yet';
      final avatarRelativePath = prefs.getString('user_avatar_path');

      File? avatarFile;
      if (avatarRelativePath != null && avatarRelativePath.isNotEmpty) {
        try {
          final appDocDir = await getApplicationDocumentsDirectory();
          final fullPath = '${appDocDir.path}/$avatarRelativePath';
          final file = File(fullPath);
          if (await file.exists()) {
            avatarFile = file;
          }
        } catch (e) {
          // Ignore error
        }
      }

      setState(() {
        _userName = name;
        _userSignature = signature;
        _avatarFile = avatarFile;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _userName = 'Totoa';
        _userSignature = 'No personal signature yet';
        _avatarFile = null;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: _avatarFile != null
                ? Image.file(
                    _avatarFile!,
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
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _userName,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  _userSignature,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.4,
                    color: Color(0xFFE8F5FF),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () async {
                      final result = await Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const MyProfilePage()),
                      );
                      if (result == true) {
                        _loadUserInfo();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B2B39),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                    ),
                    child: const Text(
                      'My profile',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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



class _VipButton extends StatelessWidget {
  const _VipButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFA5F2FF), Color(0xFF3CC8E7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.verified, color: Colors.white, size: 34),
          SizedBox(width: 12),
          Text(
            'VIP',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1B1B1B),
            ),
          ),
        ],
      ),
    );
  }
}

class _WalletButton extends StatelessWidget {
  const _WalletButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFB2FB69), Color(0xFF62D10C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.account_balance_wallet_rounded, color: Color(0xFF3B2B39), size: 34),
          SizedBox(width: 12),
          Text(
            'Wallet',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1B1B1B),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const items = [
      _SettingItemData(
        iconPath: 'assets/icon_me_edit.webp',
        title: 'Edit information',
      ),
      _SettingItemData(
        iconPath: 'assets/icon_me_policy.webp',
        title: 'Privacy Policy',
      ),
      _SettingItemData(
        iconPath: 'assets/icon_me_list.webp',
        title: 'Terms of Service',
      ),
      _SettingItemData(
        iconPath: 'assets/icon_me_us.webp',
        title: 'About us',
      ),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF3F7AE1), Color(0xFF3C47DA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            _SettingRow(data: items[i]),
            if (i != items.length - 1)
              Divider(
                color: Colors.white.withOpacity(0.18),
                height: 12,
              ),
          ],
        ],
      ),
    );
  }
}

class _SettingItemData {
  final String iconPath;
  final String title;
  const _SettingItemData({
    required this.iconPath,
    required this.title,
  });
}

class _SettingRow extends StatelessWidget {
  final _SettingItemData data;
  const _SettingRow({required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (data.title == 'Edit information') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const MyProfilePage()),
          );
        } else if (data.title == 'Privacy Policy') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const PrivacyPolicyPage()),
          );
        } else if (data.title == 'Terms of Service') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const TermsOfServicePage()),
          );
        } else if (data.title == 'About us') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const AboutUsPage()),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Image.asset(
              data.iconPath,
              width: 22,
              height: 22,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                data.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.white,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}

