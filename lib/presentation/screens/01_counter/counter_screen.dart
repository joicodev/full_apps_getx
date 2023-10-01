import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx_app/presentation/controllers/01_counter/counter_controller.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(context) {
    final controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text("Clicks: ${controller.count}");
        }),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to Counter View"),
          onPressed: () => Get.to(() => const _CounterView()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increase(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _CounterView extends StatelessWidget {
  const _CounterView();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CounterController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Increase/Decrease Counter'),
      ),
      body: Center(
        child: Obx(() {
          return Text('Count value: ${controller.count}');
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn1',
            child: const Text("+1"),
            onPressed: () => controller.increase(),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            child: const Text("-1"),
            onPressed: () => controller.decrease(),
          ),
        ],
      ),
    );
  }
}
