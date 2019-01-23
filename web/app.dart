import 'dart:async';
import 'dart:html';
import 'package:over_react/react_dom.dart' as react_dom;
import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/app_components/exercise_container.dart';

// ignore: uri_has_not_been_generated
part 'app.over_react.g.dart';

/*
List files = [
  '01',
  '02',
  '03',
  '04',
  '05',
  '06',
  '07',
  '08',
  '09',
  '10',
  '11',
  '12',
];

List pages = files.reduce((p, filename, index, fullArray) {
  var finalExercise = require('./exercises-final/${filename}');
  Object.assign(finalExercise, Map.from({
    previous: fullArray[index - 1],
    next: fullArray[index + 1],
    isolatedPath: '/isolated/exercises-final/${filename}',
  }));
  var exercise = require('./exercises/${filename}');
  Object.assign(exercise, Map.from({
    previous: fullArray[index - 1],
    next: fullArray[index + 1],
    isolatedPath: '/isolated/exercises/${filename}',
  }));
  p[filename] = Map.from({
    exercise: exercise,
    finalExercise: finalExercise,
    title: finalExercise.default.title
  });
  return p
}, {})

const filesAndTitles = files.map(filename => ({
  title: pages[filename].title,
  filename,
}));
*/



@Factory()
// ignore: undefined_identifier
UiFactory<AppProps> App = _$App;

@Props()
class _$AppProps extends UiProps {

}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class AppProps extends _$AppProps with _$AppPropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForAppProps;
}

@State()
class _$AppState extends UiState {
  int exerciseId;
}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class AppState extends _$AppState with _$AppStateAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const StateMeta meta = _$metaForAppState;
}

@Component()
class AppComponent extends UiStatefulComponent<AppProps, AppState> {

  int defaultExerciseId = 1;

  @override
  Map getDefaultProps() => (newProps());

  @override
  Map getInitialState() => (newState()
    ..exerciseId = exerciseIdFromUrl ?? defaultExerciseId
  );

  int get exerciseIdFromUrl {
    String exerciseId = Uri.base.queryParameters['id'];
    if (exerciseId != null){
      return int.parse(exerciseId);
    }
    return defaultExerciseId;
  }

  String formatExerciseId(id) {
    return id.toString().padLeft(2,'0');
  }

  void goToExercise(int id){
    setState(newState()
      ..exerciseId = id
    );
    window.history.pushState('','','?id=${id}');
  }

  @override
  render() {
      return Dom.div()(
        (Dom.nav()
        ..style = {
          'padding': 20,
          'textAlign': 'center',
          }
        )(
          new List.generate(3, (int i){
            return (Dom.a()..className='${(i+1) == exerciseIdFromUrl ? "active" : ""}'..key=i..onClick = (_){
              goToExercise(i+1);
            })(formatExerciseId(i+1));
          })
        ),
        (ExerciseContainer()..id=formatExerciseId(state.exerciseId))()
      );
  }
}
