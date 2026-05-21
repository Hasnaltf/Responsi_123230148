import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  static Future<List<dynamic>> getBooks() async {

    final response = await http.get(

      Uri.parse(
        'https://potterapi-fedeperin.vercel.app/en/books',
      ),
    );

    return jsonDecode(response.body);
  }

  static Future<List<dynamic>> getSpells() async {

    final response = await http.get(

      Uri.parse(
        'https://potterapi-fedeperin.vercel.app/en/spells',
      ),
    );

    return jsonDecode(response.body);
  }
}