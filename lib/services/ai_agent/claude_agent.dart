import 'package:logger/logger.dart';

import 'package:alexa_to_ai/models/ai_model.dart';
import 'package:alexa_to_ai/services/ai_agent/ai_agent.dart';
import 'package:anthropic_dart/anthropic_dart.dart';

final log = Logger();

class ClaudeAgent implements AIAgent {
  @override
  Future<String> sendMessage(String prompt, AIModel aiModel) async {
    final AnthropicService service =
        AnthropicService(aiModel.apiKey, model: aiModel.model);

    // AIリクエストの作成
    final Request aiRequest = _createAIRequest(prompt);

    try {
      final Response response = await service.sendRequest(request: aiRequest);
      final String responseText = response.toJson()["content"][0]["text"];
      log.i('Response body: $responseText');

      return responseText;
    } catch (e) {
      log.i('Error while sending request: $e');
      throw Exception("AIリクエストの送信中にエラーが発生しました");
    }
  }

  Request _createAIRequest(String prompt) {
    return Request()
      ..maxTokens = 500
      ..messages = [
        Message(
          role: "user",
          content: prompt,
        )
      ];
  }
}
