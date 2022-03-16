import 'package:chopper/chopper.dart';

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

class JsonSerializableConverter extends JsonConverter {
  final Map<Type, JsonFactory> factories;

  const JsonSerializableConverter(this.factories);

  T? _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      return null;
    }
    return jsonFactory(values);
  }

  List<T> _decodeList<T>(List values) => values
      .where((v) => v != null)
      .map<T>(
        (v) => _decode<T>(v),
      )
      .toList();

  dynamic _decode<T>(entity) {
    if (entity is Iterable) return _decodeList<T>(entity.toList());

    if (entity is Map) return _decodeMap<T>(Map.from(entity));
    return entity;
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    final jsonRes = super.convertResponse(response);

    return jsonRes.copyWith<BodyType>(
      body: _decode<InnerType>(jsonRes.body),
    );
  }
}
