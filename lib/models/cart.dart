// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:provider_shopper/models/catalog.dart';

class CartModel extends ChangeNotifier {
  late CatalogModel _catalog;

  /// カートの内部。プライベートな状態で、各アイテムのIDを格納する。
  final List<int> _itemIds = [];

  /// 現在のカタログ。数値のIDからアイテムを構築するために使用されます。
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    // 新しいカタログが以前のカタログと異なる情報を提供する場合、リスナーに通知します。
    // 例えば、あるアイテムの在庫が変更されたかもしれません。
    notifyListeners();
  }

  /// カート内のアイテム一覧
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  /// すべてのアイテムの合計価格
  int get totalPrice => items.fold(0, (total, current) => total + current.price);

  /// カートに[item]を追加します。外部からカートを変更する場合は、この方法しかありません。
  void add(Item item) {
    _itemIds.add(item.id);
    // この行は、[Model]に依存しているウィジェットを再構築するように指示します。
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    // モデルを変更するたびに、依存するウィジェットを再構築するように指示することを忘れないでください。
    notifyListeners();
  }
}
