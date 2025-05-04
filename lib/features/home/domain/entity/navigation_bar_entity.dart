import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NavigationBarEntity extends Equatable{
  final Widget screen;
  final IconData icon;
  final String label;

  const NavigationBarEntity({
    required this.screen, 
    required this.icon, 
    required this.label,
  });

  @override
  List<Object?> get props => [screen, icon, label];
}