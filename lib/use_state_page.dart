import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseStatePage extends HookWidget {
  const UseStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    final nullableCounter = useState<int?>(null);
    final stateCounter = useState(StateModel());

    return Scaffold(
      appBar: AppBar(
        title: const Text('useState Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Integer Value',
            ),
            Text(
              counter.value.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            const Text(
              'Nullable Value',
            ),
            Text(
              nullableCounter.value?.toString() ?? 'NULL',
              style: Theme.of(context).textTheme.headline4,
            ),
            const Text(
              'State Class Value',
            ),
            Text(
              stateCounter.value.countValue.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // increment state value by int.
          counter.value++;
          // increment state value if that null for zero.
          nullableCounter.value = (nullableCounter.value ?? 0) + 1;
          // increment property value of state model class.
          stateCounter.value.countValue++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class StateModel {
  int countValue = 0;
}
