import 'dart:async';

import 'package:over_react/components.dart' show ErrorBoundary;
import 'package:over_react/over_react.dart' hide ErrorBoundary;
import 'package:ap_over_react/src/app_components/example_type.dart';
import 'package:ap_over_react/src/app_components/not_ready.dart';

import 'package:ap_over_react/src/exercises-final/ap_01.dart' deferred as exercise_01_final;
import 'package:ap_over_react/src/exercises/ap_01.dart' deferred as exercise_01;
import 'package:ap_over_react/src/exercises-final/ap_02.dart' deferred as exercise_02_final;
import 'package:ap_over_react/src/exercises/ap_02.dart' deferred as exercise_02;
import 'package:ap_over_react/src/exercises-final/ap_03.dart' deferred as exercise_03_final;
import 'package:ap_over_react/src/exercises/ap_03.dart' deferred as exercise_03;
import 'package:ap_over_react/src/exercises-final/ap_03.extra_1.dart' deferred as exercise_03_1_final;
import 'package:ap_over_react/src/exercises-final/ap_03.extra_2.dart' deferred as exercise_03_2_final;
import 'package:ap_over_react/src/exercises-final/ap_04.dart' deferred as exercise_04_final;
import 'package:ap_over_react/src/exercises/ap_04.dart' deferred as exercise_04;
import 'package:ap_over_react/src/exercises-final/ap_05.dart' deferred as exercise_05_final;
import 'package:ap_over_react/src/exercises/ap_05.dart' deferred as exercise_05;
import 'package:ap_over_react/src/exercises-final/ap_06.dart' deferred as exercise_06_final;
import 'package:ap_over_react/src/exercises/ap_06.dart' deferred as exercise_06;
import 'package:ap_over_react/src/exercises-final/ap_07.dart' deferred as exercise_07_final;
import 'package:ap_over_react/src/exercises/ap_07.dart' deferred as exercise_07;
import 'package:ap_over_react/src/exercises-final/ap_08.dart' deferred as exercise_08_final;
import 'package:ap_over_react/src/exercises/ap_08.dart' deferred as exercise_08;
import 'package:ap_over_react/src/exercises-final/ap_09.dart' deferred as exercise_09_final;
import 'package:ap_over_react/src/exercises/ap_09.dart' deferred as exercise_09;
import 'package:ap_over_react/src/exercises-final/ap_10.dart' deferred as exercise_10_final;
import 'package:ap_over_react/src/exercises-final/ap_10.extra_1.dart' deferred as exercise_10_1_final;
import 'package:ap_over_react/src/exercises-final/ap_10.extra_2.dart' deferred as exercise_10_2_final;
import 'package:ap_over_react/src/exercises-final/ap_10.extra_3.dart' deferred as exercise_10_3_final;
import 'package:ap_over_react/src/exercises/ap_10.dart' deferred as exercise_10;
import 'package:ap_over_react/src/exercises-final/ap_11.dart' deferred as exercise_11_final;
import 'package:ap_over_react/src/exercises-final/ap_11.extra_1.dart' deferred as exercise_11_1_final;
import 'package:ap_over_react/src/exercises-final/ap_11.extra_2.dart' deferred as exercise_11_2_final;
import 'package:ap_over_react/src/exercises-final/ap_11.extra_3.dart' deferred as exercise_11_3_final;
import 'package:ap_over_react/src/exercises-final/ap_11.extra_4.dart' deferred as exercise_11_4_final;
import 'package:ap_over_react/src/exercises/ap_11.dart' deferred as exercise_11;

part 'fullpage.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<FullPageProps> FullPage = castUiFactory(_$FullPage);

mixin FullPageProps on UiProps {
  ExampleType type;
}

mixin FullPageState on UiState {
  UiFactory componentFactory;
}

class FullPageComponent extends UiStatefulComponent2<FullPageProps, FullPageState> {
  void updateFactory() {
    getExerciseClass().then((cfactory) {
      setState(newState()..componentFactory = cfactory);
    });
  }

  @override
  componentDidUpdate(prevProps, prevState, [snapshot]) {
    final tPrevProps = typedPropsFactory(prevProps);
    if (tPrevProps.id != props.id) {
      updateFactory();
    }
    super.componentDidUpdate(prevProps, prevState);
  }

  @override
  componentDidMount() async {
    updateFactory();
  }

  Future<UiFactory> getExerciseClass() async {
    switch (props.id) {
      case '01':
        {
          if (props.type == ExampleType.final_) {
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
          if (props.type == ExampleType.final_) {
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
          if (props.type == ExampleType.final_) {
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
          if (props.type == ExampleType.final_) {
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
          if (props.type == ExampleType.final_) {
            await exercise_03_2_final.loadLibrary();
            return exercise_03_2_final.Usage;
          } else {
            await exercise_03.loadLibrary();
            return exercise_03.Usage;
          }
        }
        break;
      case '04':
        {
          if (props.type == ExampleType.final_) {
            await exercise_04_final.loadLibrary();
            return exercise_04_final.Usage;
          } else {
            await exercise_04.loadLibrary();
            return exercise_04.Usage;
          }
        }
        break;
      case '05':
        {
          if (props.type == ExampleType.final_) {
            await exercise_05_final.loadLibrary();
            return exercise_05_final.Usage;
          } else {
            await exercise_05.loadLibrary();
            return exercise_05.Usage;
          }
        }
        break;
      case '06':
        {
          if (props.type == ExampleType.final_) {
            await exercise_06_final.loadLibrary();
            return exercise_06_final.Usage;
          } else {
            await exercise_06.loadLibrary();
            return exercise_06.Usage;
          }
        }
        break;
      case '07':
        {
          if (props.type == ExampleType.final_) {
            await exercise_07_final.loadLibrary();
            return exercise_07_final.Usage;
          } else {
            await exercise_07.loadLibrary();
            return exercise_07.Usage;
          }
        }
        break;
      case '08':
        {
          if (props.type == ExampleType.final_) {
            await exercise_08_final.loadLibrary();
            return exercise_08_final.Usage;
          } else {
            await exercise_08.loadLibrary();
            return exercise_08.Usage;
          }
        }
        break;
      case '09':
        {
          if (props.type == ExampleType.final_) {
            await exercise_09_final.loadLibrary();
            return exercise_09_final.Usage;
          } else {
            await exercise_09.loadLibrary();
            return exercise_09.Usage;
          }
        }
        break;
      case '10':
        {
          if (props.type == ExampleType.final_) {
            await exercise_10_final.loadLibrary();
            return exercise_10_final.Usage;
          } else {
            await exercise_10.loadLibrary();
            return exercise_10.Usage;
          }
        }
        break;
      case '10.1':
        {
          if (props.type == ExampleType.final_) {
            await exercise_10_1_final.loadLibrary();
            return exercise_10_1_final.Usage;
          } else {
            await exercise_10.loadLibrary();
            return exercise_10.Usage;
          }
        }
        break;
      case '10.2':
        {
          if (props.type == ExampleType.final_) {
            await exercise_10_2_final.loadLibrary();
            return exercise_10_2_final.Usage;
          } else {
            await exercise_10.loadLibrary();
            return exercise_10.Usage;
          }
        }
        break;
      case '10.3':
        {
          if (props.type == ExampleType.final_) {
            await exercise_10_3_final.loadLibrary();
            return exercise_10_3_final.Usage;
          } else {
            await exercise_10.loadLibrary();
            return exercise_10.Usage;
          }
        }
        break;
      case '11':
        {
          if (props.type == ExampleType.final_) {
            await exercise_11_final.loadLibrary();
            return exercise_11_final.Usage;
          } else {
            await exercise_11.loadLibrary();
            return exercise_11.Usage;
          }
        }
        break;
      case '11.1':
        {
          if (props.type == ExampleType.final_) {
            await exercise_11_1_final.loadLibrary();
            return exercise_11_1_final.Usage;
          } else {
            await exercise_11.loadLibrary();
            return exercise_11.Usage;
          }
        }
        break;
      case '11.2':
        {
          if (props.type == ExampleType.final_) {
            await exercise_11_2_final.loadLibrary();
            return exercise_11_2_final.Usage;
          } else {
            await exercise_11.loadLibrary();
            return exercise_11.Usage;
          }
        }
        break;
      case '11.3':
        {
          if (props.type == ExampleType.final_) {
            await exercise_11_3_final.loadLibrary();
            return exercise_11_3_final.Usage;
          } else {
            await exercise_11.loadLibrary();
            return exercise_11.Usage;
          }
        }
        break;
      case '11.4':
        {
          if (props.type == ExampleType.final_) {
            await exercise_11_4_final.loadLibrary();
            return exercise_11_4_final.Usage;
          } else {
            await exercise_11.loadLibrary();
            return exercise_11.Usage;
          }
        }
        break;
      default:
        return NotReady;
    }
  }

  @override
  render() {
    return (Dom.div()
      ..style = {
        'flex': 1,
        'padding': 20,
        'margin': 20,
        'display': 'grid',
        'alignItems': 'center',
        'justifyContent': 'center',
      }
    )(
      (ErrorBoundary()..fallbackUIRenderer = (_, __) => Dom.span()('There was an error. Edit the code and try again.'))(
        state.componentFactory != null ? state.componentFactory()() : null,
      ),
    );
  }
}
