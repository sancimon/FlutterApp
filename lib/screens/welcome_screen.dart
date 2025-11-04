import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkshare/utils/app_theme.dart';
import 'package:parkshare/screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.primaryGradient,
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),

                  // App Logo / Icon
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.local_parking_rounded,
                      size: 70,
                      color: AppTheme.primaryBlue,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // App Name
                  Text(
                    'ParkShare',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                  ),

                  const SizedBox(height: 12),

                  // Tagline
                  Text(
                    'Find & Reserve Parking Spots\nAnywhere, Anytime',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16,
                          height: 1.5,
                        ),
                  ),

                  const SizedBox(height: 60),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppTheme.primaryBlue,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 8,
                      ),
                      child: Text(
                        'Login',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: AppTheme.primaryBlue,
                              fontSize: 18,
                            ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        // TODO: Navigate to Sign Up screen
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Sign Up pressed')),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        side: const BorderSide(color: Colors.white, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Divider with text
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.white.withOpacity(0.5),
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Or continue with',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.white.withOpacity(0.5),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Social Sign-in Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google Sign-in
                      _SocialSignInButton(
                        icon: FontAwesomeIcons.google,
                        label: 'Google',
                        onPressed: () {
                          // TODO: Implement Google Sign-In
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Google Sign-In pressed')),
                          );
                        },
                      ),

                      const SizedBox(width: 16),

                      // Apple Sign-in
                      _SocialSignInButton(
                        icon: FontAwesomeIcons.apple,
                        label: 'Apple',
                        onPressed: () {
                          // TODO: Implement Apple Sign-In
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Apple Sign-In pressed')),
                          );
                        },
                      ),

                      const SizedBox(width: 16),

                      // Facebook Sign-in
                      _SocialSignInButton(
                        icon: FontAwesomeIcons.facebook,
                        label: 'Facebook',
                        onPressed: () {
                          // TODO: Implement Facebook Sign-In
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Facebook Sign-In pressed')),
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  // Terms & Privacy
                  Text(
                    'By continuing, you agree to our Terms of Service\nand Privacy Policy',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 12,
                        ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Social Sign-in Button Widget
class _SocialSignInButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _SocialSignInButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(16),
              child: Icon(
                icon,
                size: 28,
                color: AppTheme.primaryBlue,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white.withOpacity(0.9),
                fontSize: 12,
              ),
        ),
      ],
    );
  }
}
