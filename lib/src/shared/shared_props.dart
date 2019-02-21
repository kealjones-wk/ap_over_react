import 'package:over_react/over_react.dart';

// ignore: uri_has_not_been_generated
part 'shared_props.over_react.g.dart';

// This mixin allows us to share these common props.
@PropsMixin(keyNamespace: '')
abstract class _$TogglePropsMixin {
  Map get props;

  bool isOn;
  Function toggle;
  Function reset;
  DomProps togglerProps;
  dynamic getTogglerProps;
  dynamic ref;
}

// This abstract class allow our components to extend from it which inherits the props from the mixin above.
@AbstractProps(keyNamespace: '')
abstract class _$AbstractToggleProps extends UiProps with TogglePropsMixin {
  @override
  Map get props;
}

// This allows us to create a new class of props and set the values for passing through functions.
class BaseToggleProps extends UiPropsMapView with TogglePropsMixin {
  BaseToggleProps([Map map]) : super(map ?? {});
}
