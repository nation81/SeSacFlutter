import 'package:bmi_calculator/result/result_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Form의 상태를 담아두는 key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // TextFormField에 입력된 값을 가져올 controller
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end, //
            children: [
              TextFormField(
                controller: _heightController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Height',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  // 유효성 검사
                  if (value == null || value.isEmpty) {
                    return 'Plz type your Height';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _weightController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Weight',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  // 유효성 검사
                  if (value == null || value.isEmpty) {
                    return 'Plz type your Weight';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == false) {
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(
                              height: double.parse(_heightController.text),
                              weight: double.parse(_weightController.text),
                            )),
                  );
                },
                child: const Text('Result'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
