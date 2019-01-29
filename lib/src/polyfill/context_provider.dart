import 'package:collection/collection.dart';
import 'package:over_react/over_react.dart';
import 'package:react/react.dart' as react;
import './context.dart';

class ProviderBaseComponent extends react.Component {
  ProviderBaseComponent(this.contextKey, this.defaultValue, this.calculateChangedBits) {
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
