import 'package:over_react/over_react.dart';

// ignore: uri_has_not_been_generated
part 'fragment.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<FragmentProps> Fragment = _$Fragment;

@Props()
class _$FragmentProps extends UiProps {}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class FragmentProps extends _$FragmentProps with _$FragmentPropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForFragmentProps;
}

@Component2()
class FragmentComponent extends UiComponent2<FragmentProps> {
  @override
  render() {
    return []..addAll(props.children);
  }
}
