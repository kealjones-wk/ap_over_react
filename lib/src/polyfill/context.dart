import 'dart:math';

import 'package:react/react.dart';
import './context_provider.dart';
import './context_consumer.dart';

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
  EventEmitter([this.value]);

  List handlers = [];
  dynamic value;

  on(handler) {
    handlers.add(handler);
  }

  off(handler) {
    handlers = handlers.where((h) => h != handler).toList();
  }

  get() {
    return value;
  }

  set(newValue, changedBits) {
    value = newValue;
    Function callHandler = (handler) => handler(value, changedBits);
    handlers.forEach(callHandler);
  }
}

createEventEmitter(dynamic value) {
  return new EventEmitter(value);
}

class Context<T> {
  Context([dynamic defaultValue, Function calculateChangedBits]) {
    var r = new Random();
    var _random1 = r.nextInt(pow(2, 32));
    var _random2 = r.nextInt(pow(2, 32));
    var _bigRandom = (_random1 << 32) | _random2;
    contextKey = '__create-context-${_bigRandom}__';

    ReactComponentFactoryProxy _ProviderBase = registerComponent(
        () => new ProviderBaseComponent(contextKey, defaultValue, calculateChangedBits));
    ReactComponentFactoryProxy _ConsumerBase =
        registerComponent(() => new ConsumerBaseComponent(contextKey));

    Provider = ([Map props = const {}]) {
      return ([children]) {
        var propsValue = (props != null) ? props['value'] : defaultValue;
        return _ProviderBase(
            {'value': propsValue, 'calculateChangedBits': calculateChangedBits}, children);
      };
    };

    Consumer = ([Map props = const {}]) {
      return ([children]) {
        return _ConsumerBase(props, children);
      };
    };
  }

  String contextKey;
  Function([dynamic]) Function([Map]) Provider;
  Function([dynamic]) Function([Map]) Consumer;
}

createContext([defaultValue, Function calculateChangedBits]) {
  return new Context(defaultValue, calculateChangedBits);
}
