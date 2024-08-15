import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/chat_provider.dart';

class EmptyHistoryWidget extends StatelessWidget {
  const EmptyHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          final chatProvider = context.read<ChatProvider>();
          await chatProvider.prepareChatRoom(
            isNewChat: true,
            chatID: '',
          );
          chatProvider.setCurrentIndex(newIndex: 1);
          chatProvider.pageController.jumpToPage(1);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.cyan.shade200,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'No chat found, start a new chat!',
            ),
          ),
        ),
      ),
    );
  }
}
