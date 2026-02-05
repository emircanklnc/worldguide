import 'package:country_app/Model/ChatMessageModel.dart';
import 'package:country_app/Model/GeminiResponseModel.dart';
import 'package:country_app/Services/GeminiService.dart';

class ChatBotViewModel {
  final GeminiService _geminiService = GeminiService();
  List<ChatMessageModel> messages = [];
  bool isLoading = false;


  Future<void> sendMessage(String userMessage) async{
    isLoading = true;
    messages.add(ChatMessageModel(text: "$userMessage", isUser: true));


    try{
      GeminiResponse response = await _geminiService.sendMessage(userMessage);
      final botMessage  = response.candidates.first.content.parts.first.text;
      messages.add(ChatMessageModel(text: "$botMessage", isUser: false));

    }catch(e){
      messages.add(ChatMessageModel(text: "Bir Hata Oluştu", isUser: false));
    }
   isLoading  =false;
  }

}