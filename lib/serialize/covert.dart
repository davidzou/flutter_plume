import 'package:flutter/material.dart';

///
/// [T] 被转换的数据对象。
///
mixin MapConvert<T> {
  ///
  /// 将对象转换为Map
  ///
  /// ```
  ///   @override
  ///   Map<String, dynamic> toMap() {
  ///     var map = <String, dynamic>{
  ///       "id": id,
  ///       "name": name,
  ///     };
  ///     return map;
  ///   }
  /// ```
  ///
  Map<String, dynamic> toMap();

  ///
  /// 将Map转换为对象
  ///
  /// ```
  ///   @override
  ///   Model fromMap(Map<String, dynamic> map) {
  ///     return Model(id: map["id"], name: map["name"]);
  ///   }
  /// ```
  ///
  ///
  ///
  T fromMap(Map<String, dynamic> map);
}

extension MapConvertExtension<T> on MapConvert<T> {
  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      // T.noSuchMethod(invocation);
    };
    return map;
  }
}