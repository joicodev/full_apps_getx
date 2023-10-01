import 'package:get/get.dart';

class CounterController extends GetxController {
  final _count = 0.obs;

  int get count => _count.value;

  void increase() => _count.value++;

  void decrease() => _count.value--;

  @override
  void onClose() {
    super.onClose();
    print('CLOSED!');
  }
}
