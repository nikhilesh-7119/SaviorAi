import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:ai_assisstance/helper/global.dart';
import 'package:http/http.dart';

class Api {
  
  //get answer from llm
  static Future<String> getAnswer(String question) async {
    try {
      final res = await post(
        Uri.parse(
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent',
        ),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          'X-goog-api-key': apiKey,
        },
        body: jsonEncode({
          "generationConfig": {"temperature": 0, "maxOutputTokens": 2000},
          "contents": [
            {
              "parts": [
                {"text": question},
              ],
            },
          ],
        }),
      );
      final data=jsonDecode(res.body);
      log('res : ${data['candidates'][0]['content']['parts'][0]['text']}');
      return data['candidates'][0]['content']['parts'][0]['text'];
    } catch (e) {
      log(e.toString() + '😂😂');
      return 'Something went wrong (Try again in sometime)';
    }
    // return 
  }
}
