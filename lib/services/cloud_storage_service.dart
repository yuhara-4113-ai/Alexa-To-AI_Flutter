import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:alexa_to_ai/models/env.dart';
import 'package:alexa_to_ai/models/setting_screen_model.dart';

String saveAISettingUrl = env[EnvKey.saveAISettingUrl]!;

class CloudStorageService {
  /// クラウド環境に保存した設定内容を送信
  Future<bool> saveAISettingData(
      SettingScreenModel saveData, String idToken) async {
    String apiKey = env[EnvKey.awsXApiKey]!;
    String body = saveData.convertJsonToCloudSave();
    log('saveAISetting body: $body');
    // TODO 確認用なので後で消す
    log('idToken.raw: $idToken');

    final http.Response response = await http.post(
      Uri.parse(saveAISettingUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-api-key': apiKey,
        'Authorization': idToken,
      },
      body: body,
    );

    if (response.statusCode == 200) {
      log('saveAISetting API 成功: ${response.body}');
      return true;
    } else {
      log('saveAISetting API 失敗: ${response.body}');
      return false;
    }
  }
}
