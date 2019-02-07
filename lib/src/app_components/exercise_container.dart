import 'package:over_react/over_react.dart';

import 'package:ap_over_react/src/app_components/component_container.dart';
import 'package:ap_over_react/src/app_components/fullpage.dart';

// ignore: uri_has_not_been_generated
part 'exercise_container.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ExerciseContainerProps> ExerciseContainer = _$ExerciseContainer;

@Props()
class _$ExerciseContainerProps extends UiProps {}

@Component()
class ExerciseContainerComponent extends UiComponent<ExerciseContainerProps> {
  get exerciseId => props.id;

  @override
  Map getDefaultProps() => newProps()..id = '01';

  @override
  render() {
    return (Dom.div()
      ..style = {
        'padding': 20,
        'height': '100%',
        'display': 'grid',
        'gridGap': '20px',
        'gridTemplateColumns': '1fr 1fr',
        'gridTemplateRows': '30px 1fr 30px'
      }
    )(
      (Dom.h1()..style = {'gridColumn': 'span 2', 'textAlign': 'center'})(
        'Exercise $exerciseId',
      ),
      (ComponentContainer()..label = 'Exercise')(
        (FullPage()..id = props.id)(),
      ),
      (ComponentContainer()..label = 'Final Version')(
        (FullPage()
          ..type = 'final'
          ..id = props.id
        )(),
      ),
    );
  }
}
