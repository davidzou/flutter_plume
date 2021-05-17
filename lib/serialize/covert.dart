///
/// [T] 被转换的数据对象。
///
/// ```
/// class Model extends MapConvert<Model> {
///   toMap() {
///     return ModelExtension().toMap();
///   }
/// }
///
/// extension ModelExtension on Model {
///   Map<String, dynamic> get mapping => toMap();
///
///   toMap() {
///     return {
///       "key":"value",
///     }
///   }
/// }
/// ```
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
      // 这里使用反射来处理数据？
    };
    return map;
  }
}