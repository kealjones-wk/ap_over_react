import 'dart:async';

import 'package:over_react/react_dom.dart' as react_dom;
import 'package:over_react/over_react.dart';

import 'package:ap_over_react/src/app_components/error_catcher.dart';

// ignore: uri_has_not_been_generated
part 'component_container.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ComponentContainerProps> ComponentContainer = _$ComponentContainer;

@Props()
class _$ComponentContainerProps extends UiProps {
  String label;
}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class ComponentContainerProps extends _$ComponentContainerProps with _$ComponentContainerPropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForComponentContainerProps;
}

@Component()
class ComponentContainerComponent extends UiComponent<ComponentContainerProps> {
  render(){
    return (Dom.div()
        ..style = {'display': 'flex', 'flexDirection': 'column'}
      )(
        (Dom.h2()
          ..style = {'textAlign': 'center'}
        )(props.label),
        (Dom.div()
          ..style = {
            'flex': 1,
            'padding': 20,
            'border': '1px solid',
            'display': 'grid',
            'alignItems': 'center',
            'justifyContent': 'center',
          }
        )(
          props.children
        )
      );
  /*
    <div style={{display: 'flex', flexDirection: 'column'}}>
      <h2 style={{textAlign: 'center'}}>{label}</h2>
      <div
        style={{
          flex: 1,
          padding: 20,
          border: '1px solid',
          display: 'grid',
          alignItems: 'center',
          justifyContent: 'center',
        }}
      >
        <ErrorCatcher {...props} />
      </div>
    </div>
  */
  }
}
