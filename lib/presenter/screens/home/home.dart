import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';

class HomeController extends Controller {
  Notifier<int> counter = Notifier(0);

  @override
  onInit() {}

  _incrementCounter() {
    counter.value++;
  }

  @override
  onClose() {}
}

class HomeView extends View<HomeController> {
  HomeView({required HomeController controller})
      : super(controller: controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            controller.counter.show(
              (counter) => Text(
                counter.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller._incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
