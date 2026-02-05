
import 'package:country_app/View/ChatBotViewModel.dart';
import 'package:flutter/material.dart';


class ChatBotView extends StatefulWidget {
  @override
  State<ChatBotView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatBotView> {
  final ChatBotViewModel vm = ChatBotViewModel();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gemini Chat 🤖"),backgroundColor: Colors.blueGrey,),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: vm.messages.length,
              itemBuilder: (context, index) {
                var message = vm.messages[index];
                return Align(
                  alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: message.isUser
                              ? Colors.blue
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          message.text,
                          style: TextStyle(
                            color: message.isUser
                                ? Colors.white
                                : Colors.black,
                          )
                        ),
                    ),
                );
              },
            ),
          ),

          if (vm.isLoading) CircularProgressIndicator(),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(hintText: "Mesaj yaz",border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () async {
                  if (controller.text.isNotEmpty) {
                    await vm.sendMessage(controller.text);
                    controller.clear();
                    setState(() {});
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
