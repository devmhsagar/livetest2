import 'package:flutter/material.dart';

void main() {
  runApp(const EmployeeApp());
}

class EmployeeApp extends StatelessWidget {
  const EmployeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddEmployeeScreen(),
    );
  }
}

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String age = _ageController.text;
      String salary = _salaryController.text;

      // Print to debug console (for now, later you can store or process this)
      print("Employee Added: Name: $name, Age: $age, Salary: $salary");

      // Clear the input fields after submission
      _nameController.clear();
      _ageController.clear();
      _salaryController.clear();

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Employee Added Successfully!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Employee"),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Name", style: TextStyle(fontSize: 16)),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(border: UnderlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              const Text("Age", style: TextStyle(fontSize: 16)),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(border: UnderlineInputBorder()),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter age";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              const Text("Salary", style: TextStyle(fontSize: 16)),
              TextFormField(
                controller: _salaryController,
                decoration: const InputDecoration(border: UnderlineInputBorder()),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter salary";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade100,
                    foregroundColor: Colors.deepPurple,
                  ),
                  child: const Text("Add Employee"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
