import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseStatePage extends HookWidget {
  const UseStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    final nullableCounter = useState<int?>(null);
    final stateCounter = useState(StateModel());
    final textStyleHL4 = Theme.of(context).textTheme.headline4;

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
              style: textStyleHL4,
            ),
            const Text(
              'Nullable Value',
            ),
            Text(
              nullableCounter.value?.toString() ?? 'NULL',
              style: textStyleHL4,
            ),
            const Text(
              'State Class Value',
            ),
            Text(
              stateCounter.value.countValue.toString(),
              style: textStyleHL4,
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
