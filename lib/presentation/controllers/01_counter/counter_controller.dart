import 'package:get/get.dart';

class CounterController extends GetxController {
  final _count = 0.obs;

  int get count => _count.value;

  void increase() => _count.value++;

  void decrease() => _count.value--;

  static CounterController get instance => Get.find<CounterController>();

  @override
  void onClose() {
    super.onClose();
    print('CLOSED!');
  }
}

class ConfigController extends GetxController {
  final showCounterWidget = true.obs;

  void changeCounterConfig() {
    showCounterWidget.value = !showCounterWidget.value;
  }

  static ConfigController get instance => Get.find<ConfigController>();
}
