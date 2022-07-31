// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class CatalogModel {
  static List<String> itemNames = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];

  /// [id]でアイテムを取得。  
  /// カタログは無限大で、[itemNames]をループしています。
  Item getById(int id) => Item(id, itemNames[id % itemNames.length]);

  /// カタログ上の位置からアイテムを取得する。.
  Item getByPosition(int position) => getById(position);
}

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int price = 42;

  Item(this.id, this.name)
      // 見栄えを良くするために、各アイテムに マテリアルデザインの原色を使用しています。
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
