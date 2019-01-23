import 'dart:math';

import 'package:over_react/over_react.dart';
import 'package:react/react.dart' as react;
import 'package:ap_over_react/src/polyfill/context_provider.dart';
import 'package:ap_over_react/src/polyfill/context_consumer.dart';

const MAX_SIGNED_31_BIT_INT = 1073741823;



// Inlined Object.is polyfill.
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/is
objectIs(x, y) {
  if (x == y) {
    return x != 0 || 1 / x == 1 / y;
  } else {
    return x != x && y != y;
  }
}

class EventEmitter {
  EventEmitter(this.value);

  List handlers = [];
  dynamic value;

  on(handler) {
    handlers.add(handler);
  }

  off(handler) {
    handlers = handlers.where((h) => h != handler);
  }

  get() {
    return value;
  }

  set(newValue, changedBits) {
    value = newValue;
    Callback1Arg callHandler = (handler) => handler(value, changedBits);
    handlers.forEach(callHandler);
  }
}

createEventEmitter(dynamic value) {
  return EventEmitter(value);
}

class Context<T> {
  static String contextKey = '__create-context-${Random()}__';
  Function([dynamic]) Function([Map]) Provider;
  Function([dynamic]) Function([Map]) Consumer;

  Context([dynamic defaultValue, Function calculateChangedBits]) {
    ReactComponentFactoryProxy _ProviderBase = registerComponent(() => new ProviderBaseComponent(contextKey, defaultValue, calculateChangedBits));
    ReactComponentFactoryProxy _ConsumerBase = registerComponent(() => new ConsumerBaseComponent(contextKey));

    Provider = ([Map props]) {
      return ([children]) {
        var propsValue = (props != null) ? props['value'] : defaultValue;
        return _ProviderBase(
          {
            'value': propsValue,
            'calculateChangedBits': calculateChangedBits
          },
          children);
      };
    };

    Consumer = ([Map props = const {}]) {
      return ([children]) {
        return _ConsumerBase(props, children);
      };
    };
  }

}

createContext([defaultValue, Function calculateChangedBits]){
  return Context(defaultValue, calculateChangedBits);
}
