import 'package:over_react/over_react.dart';

import 'package:ap_over_react/src/app_components/component_container.dart';
import 'package:ap_over_react/src/app_components/fullpage.dart';
import 'package:ap_over_react/src/shared/exercise_titles.dart';

part 'exercise_container.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ExerciseContainerProps> ExerciseContainer = castUiFactory(_$ExerciseContainer);

mixin ExerciseContainerProps on UiProps {}

class ExerciseContainerComponent extends UiComponent2<ExerciseContainerProps> {
  get exerciseId => props.id;

  @override
  get defaultProps => (newProps()..id = '01');

  @override
  render() {
    return (Dom.div()
      ..style = {
        'padding': 20,
        'paddingTop': 0,
        'height': '100%',
        'display': 'grid',
        'gridGap': '20px',
        'gridTemplateColumns': '1fr 1fr',
        'gridTemplateRows': '100px 1fr 30px'
      }
    )(
      (Dom.div()..style = {'gridColumn': 'span 2', 'textAlign': 'center'})(
        Dom.h1()('Exercise $exerciseId'),
        (Dom.h3()..style = {'marginTop': 0})('${exerciseTitles[exerciseId]}'),
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
