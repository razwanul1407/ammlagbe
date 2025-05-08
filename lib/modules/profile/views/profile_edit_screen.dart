import 'package:ammlagbe/core/services/firebase_services.dart';
import 'package:ammlagbe/modules/profile/bloc/profile_bloc.dart';
import 'package:ammlagbe/modules/profile/bloc/profile_event.dart';
import 'package:ammlagbe/modules/profile/bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditScreen extends StatefulWidget {
  final String uid;

  const ProfileEditScreen({super.key, required this.uid});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _courierController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   context.read<ProfileBloc>().add(LoadProfile(widget.uid));
  // }

  // void _saveProfile() {
  //   if (_formKey.currentState!.validate()) {
  //     context.read<ProfileBloc>().add(
  //       UpdateProfile(
  //         userId: widget.uid,
  //         updatedData: {
  //           'username': _usernameController.text,
  //           'email': _emailController.text,
  //           'phone': _phoneController.text,
  //           'address': _addressController.text,
  //           'courier_service': _courierController.text,
  //         },
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProfileBloc(firestoreService: FirestoreService())
                ..add(LoadProfile(widget.uid)),
      child: Scaffold(
        appBar: AppBar(title: const Text('Edit Profile')),
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is ProfileLoaded) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profile updated successfully')),
              );
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              _usernameController.text = state.userData['username'] ?? '';
              _emailController.text = state.userData['email'] ?? '';
              _phoneController.text = state.userData['phone'] ?? '';
              _addressController.text = state.userData['address'] ?? '';
              _courierController.text = state.userData['courier_service'] ?? '';

              return Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      _buildField(_usernameController, 'Username'),
                      _buildField(_emailController, 'Email'),
                      _buildField(_phoneController, 'Phone Number'),
                      _buildField(_addressController, 'Address'),
                      _buildField(_courierController, 'Courier Service'),
                      const SizedBox(height: 20),
                      // ElevatedButton.icon(
                      //   onPressed: _saveProfile,
                      //   icon: const Icon(Icons.save),
                      //   label: const Text('Save'),
                      // ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator:
            (value) => value == null || value.isEmpty ? 'Enter $label' : null,
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _courierController.dispose();
    super.dispose();
  }
}
