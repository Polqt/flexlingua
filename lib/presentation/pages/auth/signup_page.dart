import 'package:flexlingua_app/core/utils/validators.dart';
import 'package:flexlingua_app/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _childNameController = TextEditingController();
  DateTime? _childBirthDate;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _childNameController.dispose();
    super.dispose();
  }

  Future<void> _selectBirthDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 5)),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _childBirthDate) {
      setState(() {
        _childBirthDate = picked;
      });
    }
  }

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      final authNotifier = ref.read(authNotifierProvider.notifier);
      await authNotifier.signUp(
        _emailController.text.trim(),
        _passwordController.text,
        childName: _childNameController.text.trim().isNotEmpty
            ? _childNameController.text.trim()
            : null,
        childBirthDate: _childBirthDate,
      );

      await authNotifier.signOut();
      if (mounted) {
        context.go('/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }

                    if (!Validators.isValidEmail(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }

                    if (!Validators.isValidPassword(value)) {
                      return 'Password too short';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }

                    if (!Validators.doPasswordsMatch(
                      value,
                      _passwordController.text,
                    )) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _childNameController,
                  decoration: const InputDecoration(
                    labelText: 'Child\'s Name (optional)',
                  ),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () => _selectBirthDate(context),
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Child\'s Birth Date (optional)',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    child: Text(
                      _childBirthDate != null
                          ? '${_childBirthDate!.month}/${_childBirthDate!.day}/${_childBirthDate!.year}'
                          : 'Select Date',
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                if (authState.isLoading) const CircularProgressIndicator(),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: authState.isLoading ? null : _signUp,
                  child: const Text('Sign up'),
                ),
                TextButton(
                  onPressed: () {
                    context.go('/login');
                  },
                  child: const Text('Already have an account? Sign in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
