import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form Builder Validators',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FormBuilderDemo(),
    );
  }
}

class FormBuilderDemo extends StatefulWidget {
  const FormBuilderDemo({super.key});

  @override
  State<FormBuilderDemo> createState() => _FormBuilderDemoState();
}

class _FormBuilderDemoState extends State<FormBuilderDemo> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Builder Validators Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Required Text Field
              FormBuilderTextField(
                name: 'fullName',
                decoration: const InputDecoration(
                  labelText: 'Full Name *',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: 'Name is required'),
                  FormBuilderValidators.minLength(
                    2,
                    errorText: 'Name must be at least 2 characters',
                  ),
                  FormBuilderValidators.maxLength(
                    50,
                    errorText: 'Name cannot exceed 50 characters',
                  ),
                ]),
              ),
              const SizedBox(height: 16),

              // Email Field
              FormBuilderTextField(
                name: 'email',
                decoration: const InputDecoration(
                  labelText: 'Email Address *',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'Email is required',
                  ),
                  FormBuilderValidators.email(
                    errorText: 'Please enter a valid email',
                  ),
                ]),
              ),
              const SizedBox(height: 16),

              // Phone Number Field
              FormBuilderTextField(
                name: 'phone',
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.match(
                    RegExp(r'^\+?[\d\s-()]+$'),
                    errorText: 'Please enter a valid phone number',
                  ),
                ]),
              ),
              const SizedBox(height: 16),

              // Password Field
              FormBuilderTextField(
                name: 'password',
                decoration: const InputDecoration(
                  labelText: 'Password *',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'Password is required',
                  ),
                  FormBuilderValidators.minLength(
                    8,
                    errorText: 'Password must be at least 8 characters',
                  ),
                  FormBuilderValidators.match(
                    RegExp(
                      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]',
                    ),
                    errorText:
                        'Password must contain uppercase, lowercase, number and special character',
                  ),
                ]),
              ),
              const SizedBox(height: 16),

              // Confirm Password Field
              FormBuilderTextField(
                name: 'confirmPassword',
                decoration: const InputDecoration(
                  labelText: 'Confirm Password *',
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  final password =
                      _formKey.currentState?.fields['password']?.value;
                  if (value != password) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Age Field
              FormBuilderTextField(
                name: 'age',
                decoration: const InputDecoration(
                  labelText: 'Age',
                  prefixIcon: Icon(Icons.cake),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.numeric(
                    errorText: 'Please enter a valid number',
                  ),
                  FormBuilderValidators.min(
                    18,
                    errorText: 'Must be at least 18 years old',
                  ),
                  FormBuilderValidators.max(
                    120,
                    errorText: 'Please enter a valid age',
                  ),
                ]),
              ),
              const SizedBox(height: 16),

              // URL Field
              FormBuilderTextField(
                name: 'website',
                decoration: const InputDecoration(
                  labelText: 'Website URL',
                  prefixIcon: Icon(Icons.link),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.url,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.url(
                    errorText: 'Please enter a valid URL',
                  ),
                ]),
              ),
              const SizedBox(height: 16),

              // Dropdown Field
              FormBuilderDropdown<String>(
                name: 'country',
                decoration: const InputDecoration(
                  labelText: 'Country *',
                  prefixIcon: Icon(Icons.location_on),
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'us', child: Text('United States')),
                  DropdownMenuItem(value: 'ca', child: Text('Canada')),
                  DropdownMenuItem(value: 'uk', child: Text('United Kingdom')),
                  DropdownMenuItem(value: 'au', child: Text('Australia')),
                  DropdownMenuItem(value: 'de', child: Text('Germany')),
                ],
                validator: FormBuilderValidators.required(
                  errorText: 'Please select a country',
                ),
              ),
              const SizedBox(height: 16),

              // Checkbox Field
              FormBuilderCheckbox(
                name: 'terms',
                title: const Text('I agree to the terms and conditions'),
                validator: FormBuilderValidators.equal(
                  true,
                  errorText: 'You must accept the terms',
                ),
              ),
              const SizedBox(height: 16),

              // Radio Group Field
              FormBuilderRadioGroup<String>(
                name: 'gender',
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                ),
                options: const [
                  FormBuilderFieldOption(value: 'male', child: Text('Male')),
                  FormBuilderFieldOption(
                    value: 'female',
                    child: Text('Female'),
                  ),
                  FormBuilderFieldOption(value: 'other', child: Text('Other')),
                ],
              ),
              const SizedBox(height: 16),

              // Date Field
              FormBuilderDateTimePicker(
                name: 'birthDate',
                decoration: const InputDecoration(
                  labelText: 'Birth Date',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
                inputType: InputType.date,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'Birth date is required',
                  ),
                ]),
              ),
              const SizedBox(height: 16),

              // Time Field
              FormBuilderDateTimePicker(
                name: 'appointmentTime',
                decoration: const InputDecoration(
                  labelText: 'Appointment Time',
                  prefixIcon: Icon(Icons.access_time),
                  border: OutlineInputBorder(),
                ),
                inputType: InputType.time,
              ),
              const SizedBox(height: 24),

              // Submit Button
              ElevatedButton(
                onPressed: _isLoading ? null : _onSubmit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Submit Form'),
              ),
              const SizedBox(height: 16),

              // Reset Button
              OutlinedButton(
                onPressed: _onReset,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Reset Form'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmit() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      // Show success dialog
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Success!'),
            content: Text(
              'Form submitted successfully!\n\nForm data:\n${_formKey.currentState?.value.toString()}',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _onReset();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fix the errors in the form'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _onReset() {
    _formKey.currentState?.reset();
  }
}
