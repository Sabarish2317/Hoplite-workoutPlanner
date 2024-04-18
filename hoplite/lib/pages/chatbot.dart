import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:hoplite/const.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final List<ChatMessage> displayChat = [];
  final _openAI = OpenAI.instance.build(
      token: apiKeys,
      baseOption: HttpSetup(
        receiveTimeout: const Duration(seconds: 5),
      ),
      enableLog: true);

  final ChatUser _currentUser = ChatUser(
    id: "1",
    firstName: "Sabarish",
    lastName: "V S",
  );
  final ChatUser gptChatUser = ChatUser(
    id: "2",
    firstName: "chatGPT",
  );
  final List<ChatMessage> messages = [];

  ////
  @override
  void initState() {
    super.initState();
    sendInitialRequest();
  }

  Future<void> sendInitialRequest() async {
    final String initialMessageText =
        "hello my name is sherlin kumar i want you to be a fitness assistant and reply to the messages with fitness content with answers and if it not related to fitness or diet say that \"Please ask something related to fitness\" i you agree to be my fitness assistant please say only \"Hi Sherlin how can i help with you today \"";
    // Create a ChatMessage with the initial message
    final initialMessage = ChatMessage(
        user: _currentUser,
        createdAt: DateTime.now(),
        text: initialMessageText);

    // Add the initial message to the messages list

    // Call getChatResponse to send the initial message to the API
    await getChatResponse(initialMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DashChat(
          messageOptions: const MessageOptions(
              textColor: Colors.grey,
              containerColor: Color(0xff5AF5C4),
              currentUserContainerColor: Color(0xff5AF5C4),
              currentUserTextColor: Color(0xff242731)),
          currentUser: _currentUser,
          onSend: getChatResponse,
          messages: messages,
        ),
      ),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async {
    // Convert DashChat messages to maps
    List<Map<String, dynamic>> _messageHistory = messages.reversed.map((m) {
      if (m.user == _currentUser) {
        return {
          'role': Role.user.toString(),
          'content': m.text,
        };
      } else {
        return {
          'role': Role.assistant.toString(),
          'content': m.text,
        };
      }
    }).toList();

    // Create the request
    final request = ChatCompleteText(
      model: GptTurbo0301ChatModel(),
      messages: _messageHistory,
      maxToken: 200,
    );
    final response = await _openAI.onChatCompletion(request: request);
    if (response != null) {
      print('Response: $response');
      for (var element in response.choices) {
        if (element.message != null) {
          setState(() {
            messages.insert(
              0,
              ChatMessage(
                user: gptChatUser,
                createdAt: DateTime.now(),
                text: element.message!.content,
              ),
            );
          });
        }
      }
    } else {
      print('Error: No response from the API');
    }
  }
}
