import 'dart:convert';

import 'package:arom_proj_meomeok/models/example..g.dart';
import 'package:http/http.dart' as http;

class API_service {
  static const String base = 'http://3.105.182.199:8080';
  static const String menu = 'menu';

  static Future<List<MenuModel>> Quest_menu(List menu_list) async {
    final url = Uri.parse('$base/$menu');
    final respons = await http.get(url);
    List<MenuModel> asdf = [];

    if (respons.statusCode == 200) {
      final List<dynamic> Drsp = jsonDecode(utf8.decode(respons.bodyBytes));

      for (var mn in Drsp) {
        asdf.add(MenuModel.fromJson(mn));
      }
    }

    return asdf;
  }
}
