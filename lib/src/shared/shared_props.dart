import 'package:over_react/over_react.dart';

part 'shared_props.over_react.g.dart';

// This mixin allows us to share these common props.
@Props(keyNamespace: '')
mixin SharedTogglePropsMixin on UiProps {
  bool isOn;
  Function toggle;
  Function reset;
  DomProps togglerProps;
  dynamic getTogglerProps;
}

// This allows us to create a new class of props and set the values for passing through functions.
class SharedTogglePropsMapView = UiProps with SharedTogglePropsMixin;
