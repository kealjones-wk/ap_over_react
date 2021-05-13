import 'package:over_react/over_react.dart';

part 'fragment.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<FragmentProps> Fragment = castUiFactory(_$Fragment);

mixin FragmentProps on UiProps {}

class FragmentComponent extends UiComponent2<FragmentProps> {
  @override
  render() {
    return []..addAll(props.children);
  }
}
