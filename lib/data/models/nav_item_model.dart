import 'package:flexlingua_app/data/models/rive_model.dart';

class NavItemModel {
  final String title;
  final RiveModel rive;

  NavItemModel({required this.title, required this.rive});
}

List<NavItemModel> bottomNavItems = [
  NavItemModel(
    title: 'Home',
    rive: RiveModel(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'Home',
      stateMachineName: 'StateMachine',
    ),
  ),
  NavItemModel(
    title: 'Profile',
    rive: RiveModel(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'Profile',
      stateMachineName: 'StateMachine',
    ),
  ),
  NavItemModel(
    title: 'Education',
    rive: RiveModel(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'Education',
      stateMachineName: 'StateMachine',
    ),
  ),
  NavItemModel(
    title: 'Exercises',
    rive: RiveModel(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'Exercises',
      stateMachineName: 'StateMachine',
    ),
  ),
  NavItemModel(
    title: 'Progress',
    rive: RiveModel(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'Progress',
      stateMachineName: 'StateMachine',
    ),
  ),
];
