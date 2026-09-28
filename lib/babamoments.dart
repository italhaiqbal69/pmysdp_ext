import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BabyMomentsOnboarding extends StatefulWidget {
  const BabyMomentsOnboarding({super.key});

  @override
  State<BabyMomentsOnboarding> createState() => _BabyMomentsOnboardingState();
}

class _BabyMomentsOnboardingState extends State<BabyMomentsOnboarding>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  // We cycle through 6 different collage “scenes”
  int _currentScene = 0;
  final int _totalScenes = 6;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(
          vsync: this,
          duration: const Duration(seconds: 4), // each scene lasts ~4s
        )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            setState(() {
              _currentScene = (_currentScene + 1) % _totalScenes;
            });
            _controller.forward(from: 0);
          }
        });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F0F8), // soft lavender
      body: SafeArea(
        child: Column(
          children: [
            // ───────── ANIMATED PHOTO COLLAGE ─────────
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // The changing collage
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 900),
                        switchInCurve: Curves.easeInOutCubic,
                        switchOutCurve: Curves.easeInOutCubic,
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: ScaleTransition(
                              scale: Tween<double>(
                                begin: 1.04,
                                end: 1.0,
                              ).animate(animation),
                              child: child,
                            ),
                          );
                        },
                        child: _buildScene(_currentScene),
                      ),

                      // Soft purple gradient fade at the bottom
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        height: 160,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                const Color(0xFFF8F0F8).withOpacity(0.3),
                                const Color(0xFFF8F0F8).withOpacity(0.85),
                                const Color(0xFFF8F0F8),
                              ],
                              stops: const [0.0, 0.4, 0.75, 1.0],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ───────── FIXED BOTTOM CONTENT ─────────
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    // Logo
                    Text(
                      'BabyMoments',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFC77DFF),
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Headline
                    Text(
                      'Let’s keep the\nstories going.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                        height: 1.15,
                        color: const Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Subtitle
                    Text(
                      'Sign up to start preserving the\nmoments that matter.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        height: 1.45,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const Spacer(),

                    // Apple button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.apple, size: 26),
                            const SizedBox(width: 8),
                            Text(
                              'Continue with Apple',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Legal
                    Text(
                      'By continuing, you agree to our\nPrivacy Policy and Terms of Use',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        height: 1.4,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // COLLAGE SCENES
  // ─────────────────────────────────────────────
  Widget _buildScene(int index) {
    switch (index) {
      case 0:
        return _SceneGridA(key: const ValueKey(0));
      case 1:
        return _SceneZoomBaby(key: const ValueKey(1));
      case 2:
        return _SceneSplitKiss(key: const ValueKey(2));
      case 3:
        return _SceneGridB(key: const ValueKey(3));
      case 4:
        return _SceneZoomDad(key: const ValueKey(4));
      case 5:
        return _SceneGridC(key: const ValueKey(5));
      default:
        return _SceneGridA(key: const ValueKey(0));
    }
  }
}

// ────────────────────────────────────────────────
// Individual collage layouts
// (Using Unsplash placeholders – replace with your own assets)
// ────────────────────────────────────────────────

class _SceneGridA extends StatelessWidget {
  const _SceneGridA({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Top-left large
        Positioned(
          top: 0,
          left: 0,
          right: 110,
          bottom: 140,
          child: _Photo(
            'https://images.unsplash.com/photo-1503454537195-1dcabb73ffb9?w=600',
          ),
        ),
        // Top-right small
        Positioned(
          top: 0,
          right: 0,
          width: 105,
          height: 105,
          child: _Photo(
            'https://images.unsplash.com/photo-1516627145497-ae6968895b74?w=400',
          ),
        ),
        // Mid-right
        Positioned(
          top: 110,
          right: 0,
          width: 105,
          bottom: 140,
          child: _Photo(
            'https://images.unsplash.com/photo-1476703993599-0035df94af2a?w=400',
          ),
        ),
        // Bottom-left
        Positioned(
          left: 0,
          bottom: 0,
          width: 160,
          height: 135,
          child: _Photo(
            'https://images.unsplash.com/photo-1544776193-352d25ca82cd?w=500',
          ),
        ),
        // Bottom-right large
        Positioned(
          left: 165,
          right: 0,
          bottom: 0,
          height: 135,
          child: _Photo(
            'https://images.unsplash.com/photo-1515488042361-ee00e0ddd4e4?w=600',
          ),
        ),
      ],
    );
  }
}

class _SceneZoomBaby extends StatelessWidget {
  const _SceneZoomBaby({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Full almost full-screen zoom on the laughing baby
        Positioned.fill(
          child: _Photo(
            'https://images.unsplash.com/photo-1515488042361-ee00e0ddd4e4?w=800',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class _SceneSplitKiss extends StatelessWidget {
  const _SceneSplitKiss({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: _Photo(
            'https://images.unsplash.com/photo-1544776193-352d25ca82cd?w=700',
          ),
        ),
        const SizedBox(height: 6),
        Expanded(
          flex: 4,
          child: _Photo(
            'https://images.unsplash.com/photo-1609220136736-443140cffec6?w=700',
          ),
        ),
      ],
    );
  }
}

class _SceneGridB extends StatelessWidget {
  const _SceneGridB({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 160,
          child: _Photo(
            'https://images.unsplash.com/photo-1609220136736-443140cffec6?w=800',
          ),
        ),
        Positioned(
          top: 166,
          left: 0,
          width: 160,
          bottom: 0,
          child: _Photo(
            'https://images.unsplash.com/photo-1476703993599-0035df94af2a?w=500',
          ),
        ),
        Positioned(
          top: 166,
          left: 166,
          right: 0,
          bottom: 0,
          child: _Photo(
            'https://images.unsplash.com/photo-1516627145497-ae6968895b74?w=500',
          ),
        ),
      ],
    );
  }
}

class _SceneZoomDad extends StatelessWidget {
  const _SceneZoomDad({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: _Photo(
            'https://images.unsplash.com/photo-1609220136736-443140cffec6?w=800',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class _SceneGridC extends StatelessWidget {
  const _SceneGridC({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 120,
          bottom: 150,
          child: _Photo(
            'https://images.unsplash.com/photo-1503454537195-1dcabb73ffb9?w=600',
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          width: 115,
          height: 115,
          child: _Photo(
            'https://images.unsplash.com/photo-1516627145497-ae6968895b74?w=400',
          ),
        ),
        Positioned(
          top: 120,
          right: 0,
          width: 115,
          bottom: 150,
          child: _Photo(
            'https://images.unsplash.com/photo-1476703993599-0035df94af2a?w=400',
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          height: 145,
          child: _Photo(
            'https://images.unsplash.com/photo-1515488042361-ee00e0ddd4e4?w=700',
          ),
        ),
      ],
    );
  }
}

// Simple photo helper
class _Photo extends StatelessWidget {
  final String url;
  final BoxFit fit;

  const _Photo(this.url, {this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image.network(
        url,
        fit: fit,
        loadingBuilder: (_, child, progress) {
          if (progress == null) return child;
          return Container(color: Colors.grey.shade200);
        },
        errorBuilder: (_, __, ___) => Container(color: Colors.grey.shade300),
      ),
    );
  }
}
