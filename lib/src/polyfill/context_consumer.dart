import 'package:react/react.dart' as react;
import './context.dart';

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
