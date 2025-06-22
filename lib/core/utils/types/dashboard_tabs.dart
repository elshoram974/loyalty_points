import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../features/dashboard/presentation/screens/add_new_code_screen.dart';
import '../../../features/dashboard/presentation/screens/home_screen.dart';
import '../../../features/dashboard/presentation/screens/orders_screen.dart';
import '../../../features/dashboard/presentation/screens/points_screen.dart';
import '../config/locale/local_lang.dart';

enum DashboardTabsEnum {
  home(HomeTabItem()),
  orders(OrdersTabItem()),
  addPoints(AddNewCodeScreenTabItem()),
  points(PointsTabItem()),
  menu(MenuTabItem());

  final DashboardTabItem data;

  const DashboardTabsEnum(this.data);
}

abstract class DashboardTabItem extends Equatable {
  const DashboardTabItem();
  Widget get screen;
  IconData get icon;
  IconData get activeIcon;
  String get label;

  bool get isHidden => false;

  @override
  List<Object?> get props => [screen, icon, activeIcon, label, isHidden];
}

class HomeTabItem extends DashboardTabItem {
  const HomeTabItem();

  @override
  IconData get activeIcon => Icons.home;

  @override
  IconData get icon => Icons.home_outlined;

  @override
  String get label => localeLang().home;

  @override
  Widget get screen => const HomeScreen();
}

class OrdersTabItem extends DashboardTabItem {
  const OrdersTabItem();

  @override
  IconData get activeIcon => Icons.assignment;

  @override
  IconData get icon => Icons.assignment_outlined;

  @override
  String get label => localeLang().orders;

  @override
  Widget get screen => const OrdersScreen();
}

class AddNewCodeScreenTabItem extends DashboardTabItem {
  const AddNewCodeScreenTabItem();

  @override
  IconData get activeIcon => FontAwesomeIcons.barcode;

  @override
  IconData get icon => Icons.sync_outlined;

  @override
  String get label => localeLang().addNewCode;

  @override
  Widget get screen => const AddNewCodeScreen();

  @override
  bool get isHidden => true;
}

class PointsTabItem extends DashboardTabItem {
  const PointsTabItem();

  @override
  IconData get activeIcon => Icons.assignment;

  @override
  IconData get icon => Icons.assignment_outlined;

  @override
  String get label => localeLang().points;

  @override
  Widget get screen => const PointsScreen();
}

class MenuTabItem extends DashboardTabItem {
  const MenuTabItem();

  @override
  IconData get activeIcon => Icons.menu;

  @override
  IconData get icon => Icons.menu_outlined;

  @override
  String get label => localeLang().menu;

  @override
  Widget get screen => const Placeholder();
}
