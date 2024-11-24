import 'dart:convert';
import 'dart:io';

Future<List<Map<String, dynamic>>> loadJson(String fileName) async {
  final file = File('test/helper/$fileName');
  final jsonString = await file.readAsString();
  return List<Map<String, dynamic>>.from(jsonDecode(jsonString));
}
