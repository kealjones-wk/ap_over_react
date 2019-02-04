import 'dart:async';

import 'package:ap_over_react/src/app_components/error_catcher.dart';
import 'package:over_react/over_react.dart';

import 'package:ap_over_react/src/exercises-final/01/usage.dart'
    deferred as exercise_01_final;
import 'package:ap_over_react/src/exercises/01/usage.dart'
    deferred as exercise_01;
import 'package:ap_over_react/src/exercises-final/02/usage.dart'
    deferred as exercise_02_final;
import 'package:ap_over_react/src/exercises/02/usage.dart'
    deferred as exercise_02;
import 'package:ap_over_react/src/exercises-final/03/usage.dart'
    deferred as exercise_03_final;
import 'package:ap_over_react/src/exercises/03/usage.dart'
    deferred as exercise_03;
import 'package:ap_over_react/src/exercises-final/03/extra/1/usage.dart'
    deferred as exercise_03_1_final;
//import 'package:ap_over_react/src/exercises/03/extra/1/usage.dart' deferred as exercise_03_1;
import 'package:ap_over_react/src/exercises-final/03/extra/2/usage.dart'
    deferred as exercise_03_2_final;
//import 'package:ap_over_react/src/exercises/03/extra/2/usage.dart' deferred as exercise_03_2;

// ignore: uri_has_not_been_generated
part 'fullpage.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<FullPageProps> FullPage = _$FullPage;

@Props()
class _$FullPageProps extends UiProps {
  String type;
}

@State()
class _$FullPageState extends UiState {
  UiFactory componentFactory;
}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class FullPageState extends _$FullPageState with _$FullPageStateAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const StateMeta meta = _$metaForFullPageState;
}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class FullPageProps extends _$FullPageProps with _$FullPagePropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForFullPageProps;
}

@Component()
class FullPageComponent
    extends UiStatefulComponent<FullPageProps, FullPageState> {
  @override
  getInitialState() => newState()..componentFactory = null;

  void updateFactory() {
    getExerciseClass().then((UiFactory cfactory) {
      setState(newState()..componentFactory = cfactory);
    });
  }

  @override
  componentDidUpdate(prevProps, prevState) {
    FullPageProps tprevProps = typedPropsFactory(prevProps);
    if (tprevProps.id != props.id) {
      updateFactory();
    }
    super.componentDidUpdate(prevProps, prevState);
  }

  @override
  componentDidMount() async {
    updateFactory();
    super.componentWillMount();
  }

  Future<UiFactory> getExerciseClass() async {
    switch (props.id) {
      case '01':
        {
          if (props.type == 'final') {
            await exercise_01_final.loadLibrary();
            return exercise_01_final.Usage;
          } else {
            await exercise_01.loadLibrary();
            return exercise_01.Usage;
          }
        }
        break;
      case '02':
        {
          if (props.type == 'final') {
            await exercise_02_final.loadLibrary();
            return exercise_02_final.Usage;
          } else {
            await exercise_02.loadLibrary();
            return exercise_02.Usage;
          }
        }
        break;
      case '03':
        {
          if (props.type == 'final') {
            await exercise_03_final.loadLibrary();
            return exercise_03_final.Usage;
          } else {
            await exercise_03.loadLibrary();
            return exercise_03.Usage;
          }
        }
        break;
      case '03.1':
        {
          if (props.type == 'final') {
            await exercise_03_1_final.loadLibrary();
            return exercise_03_1_final.Usage;
          } else {
            await exercise_03.loadLibrary();
            return exercise_03.Usage;
          }
        }
        break;
      case '03.2':
        {
          if (props.type == 'final') {
            await exercise_03_2_final.loadLibrary();
            return exercise_03_2_final.Usage;
          } else {
            await exercise_03.loadLibrary();
            return exercise_03.Usage;
          }
        }
        break;
      default:
        return null;
    }
  }

  @override
  render() {
    return (ErrorCatcher()
      ..style = {
        'flex': 1,
        'padding': 20,
        'margin': 20,
        'display': 'grid',
        'alignItems': 'center',
        'justifyContent': 'center',
      }
    )(
      state.componentFactory != null ? state.componentFactory()() : null,
    );
  }

  /*
  <div>
      <div
        style={{
          marginLeft: 10,
          marginRight: 10,
          marginTop: 10,
          display: 'flex',
          justifyContent: 'space-between',
        }}
      >
        <Link to={`/${exerciseId}`}>
          <span role='img' aria-label='back'>
            👈
          </span>
          Exercise Page
        </Link>
        <Link to={isolatedPath}>isolated</Link>
      </div>
      <div style={{textAlign: 'center'}}>
        <h1>'Exercise ${props.id}'</h1>
      </div>
      <div
        style={{
          flex: 1,
          padding: 20,
          margin: 20,
          border: '1px solid',
          display: 'grid',
          alignItems: 'center',
          justifyContent: 'center',
        }}
      >
        <FullPage>
          <Usage />
        </FullPage>
      </div>
      <NavigationFooter exerciseId={exerciseId} type={type} />
    </div>
  )*/
}
