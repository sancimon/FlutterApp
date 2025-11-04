import 'package:flutter/material.dart';
import 'package:parkshare/utils/app_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Notification settings
  bool _pushNotifications = true;
  bool _emailNotifications = true;
  bool _smsNotifications = false;
  bool _bookingReminders = true;
  bool _promotionalEmails = false;

  // App settings
  bool _darkMode = false;
  String _language = 'English';
  String _currency = 'USD';
  bool _locationServices = true;

  // Privacy settings
  bool _showProfile = true;
  bool _shareData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: AppTheme.primaryBlue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          // Notifications Section
          _buildSectionHeader('Notifications'),
          _buildSettingsCard([
            _buildSwitchTile(
              title: 'Push Notifications',
              subtitle: 'Receive push notifications',
              value: _pushNotifications,
              onChanged: (value) {
                setState(() {
                  _pushNotifications = value;
                });
              },
              icon: Icons.notifications_outlined,
            ),
            const Divider(height: 1),
            _buildSwitchTile(
              title: 'Email Notifications',
              subtitle: 'Receive email updates',
              value: _emailNotifications,
              onChanged: (value) {
                setState(() {
                  _emailNotifications = value;
                });
              },
              icon: Icons.email_outlined,
            ),
            const Divider(height: 1),
            _buildSwitchTile(
              title: 'SMS Notifications',
              subtitle: 'Receive text messages',
              value: _smsNotifications,
              onChanged: (value) {
                setState(() {
                  _smsNotifications = value;
                });
              },
              icon: Icons.sms_outlined,
            ),
            const Divider(height: 1),
            _buildSwitchTile(
              title: 'Booking Reminders',
              subtitle: 'Reminders for upcoming bookings',
              value: _bookingReminders,
              onChanged: (value) {
                setState(() {
                  _bookingReminders = value;
                });
              },
              icon: Icons.event_outlined,
            ),
            const Divider(height: 1),
            _buildSwitchTile(
              title: 'Promotional Emails',
              subtitle: 'Special offers and promotions',
              value: _promotionalEmails,
              onChanged: (value) {
                setState(() {
                  _promotionalEmails = value;
                });
              },
              icon: Icons.local_offer_outlined,
            ),
          ]),

          const SizedBox(height: 24),

          // App Preferences Section
          _buildSectionHeader('App Preferences'),
          _buildSettingsCard([
            _buildSwitchTile(
              title: 'Dark Mode',
              subtitle: 'Switch to dark theme',
              value: _darkMode,
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Dark mode - Coming soon!'),
                  ),
                );
              },
              icon: Icons.dark_mode_outlined,
            ),
            const Divider(height: 1),
            _buildListTile(
              title: 'Language',
              subtitle: _language,
              icon: Icons.language,
              onTap: () {
                _showLanguageDialog();
              },
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppTheme.textSecondary,
              ),
            ),
            const Divider(height: 1),
            _buildListTile(
              title: 'Currency',
              subtitle: _currency,
              icon: Icons.attach_money,
              onTap: () {
                _showCurrencyDialog();
              },
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppTheme.textSecondary,
              ),
            ),
            const Divider(height: 1),
            _buildSwitchTile(
              title: 'Location Services',
              subtitle: 'Allow location access',
              value: _locationServices,
              onChanged: (value) {
                setState(() {
                  _locationServices = value;
                });
              },
              icon: Icons.location_on_outlined,
            ),
          ]),

          const SizedBox(height: 24),

          // Privacy & Security Section
          _buildSectionHeader('Privacy & Security'),
          _buildSettingsCard([
            _buildSwitchTile(
              title: 'Show Profile',
              subtitle: 'Make profile visible to others',
              value: _showProfile,
              onChanged: (value) {
                setState(() {
                  _showProfile = value;
                });
              },
              icon: Icons.visibility_outlined,
            ),
            const Divider(height: 1),
            _buildSwitchTile(
              title: 'Share Usage Data',
              subtitle: 'Help improve our service',
              value: _shareData,
              onChanged: (value) {
                setState(() {
                  _shareData = value;
                });
              },
              icon: Icons.analytics_outlined,
            ),
            const Divider(height: 1),
            _buildListTile(
              title: 'Change Password',
              subtitle: 'Update your password',
              icon: Icons.lock_outline,
              onTap: () {
                _showChangePasswordDialog();
              },
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppTheme.textSecondary,
              ),
            ),
            const Divider(height: 1),
            _buildListTile(
              title: 'Two-Factor Authentication',
              subtitle: 'Add extra security',
              icon: Icons.security,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('2FA setup - Coming soon!'),
                  ),
                );
              },
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppTheme.textSecondary,
              ),
            ),
          ]),

          const SizedBox(height: 24),

          // Data Management Section
          _buildSectionHeader('Data Management'),
          _buildSettingsCard([
            _buildListTile(
              title: 'Clear Cache',
              subtitle: 'Free up storage space',
              icon: Icons.cleaning_services_outlined,
              onTap: () {
                _showClearCacheDialog();
              },
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppTheme.textSecondary,
              ),
            ),
            const Divider(height: 1),
            _buildListTile(
              title: 'Download My Data',
              subtitle: 'Export your data',
              icon: Icons.download_outlined,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Data export - Coming soon!'),
                  ),
                );
              },
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppTheme.textSecondary,
              ),
            ),
            const Divider(height: 1),
            _buildListTile(
              title: 'Delete Account',
              subtitle: 'Permanently delete your account',
              icon: Icons.delete_outline,
              iconColor: AppTheme.errorColor,
              titleColor: AppTheme.errorColor,
              onTap: () {
                _showDeleteAccountDialog();
              },
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppTheme.errorColor,
              ),
            ),
          ]),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppTheme.textSecondary,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildSettingsCard(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    required IconData icon,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppTheme.primaryBlue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: AppTheme.primaryBlue,
          size: 24,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 12,
          color: AppTheme.textSecondary,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: AppTheme.primaryBlue,
      ),
    );
  }

  Widget _buildListTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
    required Widget trailing,
    Color? iconColor,
    Color? titleColor,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: (iconColor ?? AppTheme.primaryBlue).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: iconColor ?? AppTheme.primaryBlue,
          size: 24,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: titleColor,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 12,
          color: AppTheme.textSecondary,
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }

  void _showLanguageDialog() {
    final languages = ['English', 'Spanish', 'French', 'German', 'Italian'];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: languages.map((lang) {
            return RadioListTile<String>(
              title: Text(lang),
              value: lang,
              groupValue: _language,
              onChanged: (value) {
                setState(() {
                  _language = value!;
                });
                Navigator.pop(context);
              },
              activeColor: AppTheme.primaryBlue,
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showCurrencyDialog() {
    final currencies = ['USD', 'EUR', 'GBP', 'JPY', 'CAD'];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Currency'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: currencies.map((curr) {
            return RadioListTile<String>(
              title: Text(curr),
              value: curr,
              groupValue: _currency,
              onChanged: (value) {
                setState(() {
                  _currency = value!;
                });
                Navigator.pop(context);
              },
              activeColor: AppTheme.primaryBlue,
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showChangePasswordDialog() {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: currentPasswordController,
              decoration: const InputDecoration(
                labelText: 'Current Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: newPasswordController,
              decoration: const InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: confirmPasswordController,
              decoration: const InputDecoration(
                labelText: 'Confirm New Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Password changed successfully!'),
                  backgroundColor: AppTheme.successColor,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryBlue,
              foregroundColor: Colors.white,
            ),
            child: const Text('Change'),
          ),
        ],
      ),
    );
  }

  void _showClearCacheDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Cache'),
        content: const Text(
          'This will clear all cached data and free up storage space. Continue?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Cache cleared successfully!'),
                  backgroundColor: AppTheme.successColor,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryBlue,
              foregroundColor: Colors.white,
            ),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning, color: AppTheme.errorColor),
            SizedBox(width: 8),
            Text('Delete Account'),
          ],
        ),
        content: const Text(
          'Are you sure you want to delete your account? This action cannot be undone and all your data will be permanently deleted.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Account deletion - Coming soon!'),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.errorColor,
              foregroundColor: Colors.white,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
