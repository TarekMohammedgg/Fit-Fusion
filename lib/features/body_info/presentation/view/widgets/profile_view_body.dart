import 'package:fit_fusion/core/helper/supabase_helper.dart';
import 'package:fit_fusion/features/body_info/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _bounceController = TextEditingController();
  final _gymDurationController = TextEditingController();
  final _workoutDurationController = TextEditingController();

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      final profile = UserProfile(
        id: Supabase.instance.client.auth.currentUser!.id,
        username: _usernameController.text,
        weight: double.tryParse(_weightController.text.trim()),
        height: double.tryParse(_heightController.text.trim()),
        bounce: double.tryParse(_bounceController.text.trim()),
        gymDuration: int.tryParse(_gymDurationController.text.trim()),
        workoutDuration: int.tryParse(_workoutDurationController.text.trim()),
        createdAt: DateTime.now(),
      );
      await SupabaseHelper.insertData(profile);
    }
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType type = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter $label";
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Profile"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(
                label: "Username",
                controller: _usernameController,
              ),
              _buildTextField(
                label: "Weight (kg)",
                controller: _weightController,
                type: TextInputType.number,
              ),
              _buildTextField(
                label: "Height (cm)",
                controller: _heightController,
                type: TextInputType.number,
              ),
              _buildTextField(
                label: "Bounce",
                controller: _bounceController,
                type: TextInputType.number,
              ),
              _buildTextField(
                label: "Gym Duration (months)",
                controller: _gymDurationController,
                type: TextInputType.number,
              ),
              _buildTextField(
                label: "Workout Duration (minutes)",
                controller: _workoutDurationController,
                type: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _saveProfile,
                icon: const Icon(Icons.save),
                label: const Text("Save Profile"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
