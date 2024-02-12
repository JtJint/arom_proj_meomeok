class MenuModel {
  int? id;
  String? name;
  List<FilterDtos>? filterDtos;

  MenuModel({this.id, this.name, this.filterDtos});

  MenuModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["filterDTOS"] is List) {
      filterDtos = json["filterDTOS"] == null
          ? null
          : (json["filterDTOS"] as List)
              .map((e) => FilterDtos.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    if (filterDtos != null) {
      _data["filterDTOS"] = filterDtos?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class FilterDtos {
  int? id;
  String? name;

  FilterDtos({this.id, this.name});

  FilterDtos.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }
}
