import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpodtutorial/controllers/auth_controller.dart';
import 'package:riverpodtutorial/screens/signup_screen.dart';

class SignInScreen extends ConsumerStatefulWidget {
  static String name = 'SignIn';
  static String path = '/signin';
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  BuildContext? _progressIndicatorContext;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    if (_progressIndicatorContext != null &&
        _progressIndicatorContext!.mounted) {
      Navigator.of(_progressIndicatorContext!).pop();
      _progressIndicatorContext = null;
    }
    super.dispose();
  }

  Future<void> _signIn() async {
    final auth = ref.read(authControllerProvider.notifier);

    await auth.sigInInUserWithEmailAndPassword(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authControllerProvider, (prev, state) async {
      if (state.isLoading) {
        await showDialog(
            context: context,
            builder: (ctx) {
              _progressIndicatorContext = ctx;
              return const Center(
                child: CircularProgressIndicator(),
              );
            });

        return;
      }

      WidgetsBinding.instance.addPostFrameCallback((timestamp) {
        if (_progressIndicatorContext != null &&
            _progressIndicatorContext!.mounted) {
          Navigator.of(_progressIndicatorContext!).pop();
          _progressIndicatorContext = null;
        }
      });

      if (state.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text("Error: ${state.error}"),
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Welcome Back',
                style: TextStyle(fontSize: 24),
              ),
              const Text('Sign in to your account'),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.5,
                child: ElevatedButton(
                  onPressed: _signIn,
                  child: const Text('Sign In'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('Don\'t have an account?'),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: () {
                    context.go(SignUpScreen.path);
                  },
                  child: const Text('Sign Up'),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
