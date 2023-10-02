import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:full_apps_getx/presentation/controllers/01_counter/counter_controller.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key}) {
    Get.lazyPut(() => ConfigController());
    Get.lazyPut(() => CounterController());
  }

  @override
  Widget build(context) {
    final configCtrl = ConfigController.instance;
    return Obx(() {
      final showCounter = configCtrl.showCounterWidget.value;
      return Scaffold(
        appBar: AppBar(
          title: showCounter
              ? Text("Counter value: ${CounterController.instance.count}")
              : const Text("Counter not available"),
        ),
        body: Center(
          child: showCounter
              ? ElevatedButton(
                  child: const Text("Go to Counter View"),
                  onPressed: () => Get.to(() => const _CounterView()),
                )
              : ElevatedButton(
                  child: const Text("Press to activate counter"),
                  onPressed: () => configCtrl.changeCounterConfig(),
                ),
        ),
        floatingActionButton: showCounter
            ? FloatingActionButton(
                onPressed: () => configCtrl.changeCounterConfig(),
                child: const Icon(Icons.settings),
              )
            : null,
      );
    });
  }
}

class _CounterView extends StatelessWidget {
  const _CounterView();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(
      assignId: false,
      id: "customController",
      init: CounterController(),
      builder: (controller) {
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
      },
    );
  }
}
