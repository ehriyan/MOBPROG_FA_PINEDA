import 'package:fa4_reverse_engineering/models/parameter.dart';
import 'package:fa4_reverse_engineering/models/supply.dart';
import 'package:flutter/material.dart';
 
final List<Parameter> parameters = [
  const Parameter(
    name: 'Melee',
    parameterClass: 'BASE_WEAPON',
    color: Color(0xFFFF33FF),
  ),
  const Parameter(
    name: 'Assault Rifle',
    parameterClass: 'BASE_WEAPON',
    color: Color(0xFF99FF4D),
  ),
  const Parameter(
    name: 'Toy',
    parameterClass: 'GAME',
    color: Color(0xFFFF3B3B),
  ),
];

final List<Supply> supplies = [
  Supply(
    name: 'Combat Axe',
    quantity: 25,
    unitPrice: 80,
    category: parameters[0],
  ),
  Supply(
    name: 'Gun',
    quantity: 4,
    unitPrice: 3,
    category: parameters[1],
  ),
];