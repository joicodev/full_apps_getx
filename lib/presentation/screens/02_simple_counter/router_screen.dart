import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const GetMaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enel Inspections',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ConfigController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Obx(() {
        final showCounter = ConfigController.instance.showCounterWidget.value;
        if (showCounter) {
          return Center(child: _counterWidget(context));
        }

        return const Center(
          child: Text('Counter no available'),
        );
      }),
      floatingActionButton: Obx(() {
        final showCounter = ConfigController.instance.showCounterWidget.value;
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => ConfigController.instance.changeCounterConfig(),
              tooltip: 'Change config counter',
              child: Icon(
                showCounter ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            if (showCounter) ...[
              const SizedBox(height: 16),
              FloatingActionButton(
                onPressed: () => CounterController.instance.increment(),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ]
          ],
        );
      }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _counterWidget(BuildContext context) {
    return GetBuilder<CounterController>(
      id: "customController",
      init: CounterController(),
      builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(() {
              return Text(
                '${controller.count.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
          ],
        );
      },
    );
  }
}

class CounterController extends GetxController {
  final count = 0.obs;

  increment() => count.value++;

  static CounterController get instance => Get.find<CounterController>();
}

class ConfigController extends GetxController {
  final showCounterWidget = true.obs;

  void changeCounterConfig() {
    showCounterWidget.value = !showCounterWidget.value;
  }

  static ConfigController get instance => Get.find<ConfigController>();
}
