import 'dart:math';

import 'package:react/react.dart' as react;
import 'package:over_react/over_react.dart';

const MAX_SIGNED_31_BIT_INT = 1073741823;

class ProviderBaseComponent extends react.Component {
  ProviderBaseComponent(
      this.contextKey, this.defaultValue, this.calculateChangedBits) {
    this.emitter = createEventEmitter(this.defaultValue);
  }

  String contextKey;
  dynamic defaultValue;
  Callback2Arg calculateChangedBits;
  dynamic observedBits;
  EventEmitter emitter;

  @override
  Iterable<String> get contextKeys => [contextKey];

  @override
  render() {
    return react.div({}, props['children']);
  }

  @override
  void componentWillMount() {
    this.emitter.set(props['value'], MAX_SIGNED_31_BIT_INT);
  }

  @override
  Iterable<String> get childContextKeys => [contextKey];

  @override
  getChildContext() {
    return {'$contextKey': this.emitter};
  }

  @override
  componentWillReceiveProps(newProps) {
    var oldValue = props['value'];
    var newValue = newProps['value'];
    int changedBits = 0;

    changedBits = props['calculateChangedBits'] != null
        ? props['calculateChangedBits'](oldValue, newValue)
        : MAX_SIGNED_31_BIT_INT;

    if (changedBits != 0) {
      this.emitter.set(newProps['value'], changedBits);
    }

    super.componentWillReceiveProps(newProps);
  }
}


class ConsumerBaseComponent extends react.Component {
  ConsumerBaseComponent(this.contextKey);

  String contextKey;
  dynamic observedBits;

  @override
  Iterable<String> get contextKeys => [contextKey];

  @override
  Map getInitialState() => {'value': getValue()};

  @override
  render() {
    return props['children'].single(state['value']);
  }

  @override
  componentWillReceiveProps(newProps) {
    observedBits = newProps['observedBits'] == null
        ? MAX_SIGNED_31_BIT_INT // Subscribe to all changes by default
        : newProps['observedBits'];
    super.componentWillReceiveProps(newProps);
  }

  @override
  componentDidMount() {
    if (context[contextKey] != null) {
      context[contextKey].on(onUpdate);
    }

    observedBits = props['observedBits'] == null
        ? MAX_SIGNED_31_BIT_INT // Subscribe to all changes by default
        : props['observedBits'];
  }

  @override
  componentWillUnmount() {
    if (context[contextKey] != null) {
      context[contextKey].off(onUpdate);
    }
    super.componentWillUnmount();
  }

  getValue() {
    return context[contextKey].get();
  }

  onUpdate(newValue, changedBits) {
    observedBits = observedBits ?? 0;
    if ((observedBits & changedBits) != 0) {
      setState({'value': getValue()});
    }
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

    ReactComponentFactoryProxy _ProviderBase = registerComponent(() =>
        new ProviderBaseComponent(
            contextKey, defaultValue, calculateChangedBits));
    ReactComponentFactoryProxy _ConsumerBase =
        registerComponent(() => new ConsumerBaseComponent(contextKey));

    Provider = ([Map props = const {}]) {
      return ([children]) {
        var propsValue = (props != null) ? props['value'] : defaultValue;
        return _ProviderBase(
            {'value': propsValue, 'calculateChangedBits': calculateChangedBits},
            children);
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
