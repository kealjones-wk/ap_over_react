import 'package:over_react/over_react.dart';

// ignore: uri_has_not_been_generated
part 'abstract_02_props.over_react.g.dart';

// This file allows us to share these common props with all of Toggles Child Components
@AbstractProps()
abstract class _$Abstract02Props extends UiProps {
  bool isOn;

  Callback1Arg toggle;

  Map get props;
}


// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
abstract class Abstract02Props extends _$Abstract02Props with _$Abstract02PropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForAbstract02Props;
}
