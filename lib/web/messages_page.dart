import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Messages Inbox",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Row(
                  children: [
                    // වම් පැත්තේ Chat List එක
                    Container(
                      width: 350,
                      decoration: BoxDecoration(
                        border: Border(right: BorderSide(color: Colors.grey[300]!)),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search messages...",
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              children: [
                                _buildChatTile("Kasun Perera", "Inquiry about Brake Pads", "Great! I need the front set...", true),
                                _buildChatTile("Nimal Silva", "Honda Fit Timing Belt", "Do you have timing belt for...", false),
                                _buildChatTile("Priya Fernando", "Alternator Availability", "Is it currently available?", false),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // දකුණු පැත්තේ Chat Window එක
                    Expanded(
                      child: Column(
                        children: [
                          // Header
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                const CircleAvatar(child: Text("KP")),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("Kasun Perera", style: TextStyle(fontWeight: FontWeight.bold)),
                                    Text("Inquiry about Brake Pads", style: TextStyle(fontSize: 12, color: Colors.grey)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          // Messages Area
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.all(16),
                              children: [
                                _buildMessageBubble("Hi, I am looking for brake pads for my 2019 Toyota Corolla. Do you have stock?", "10:30 AM", false),
                                _buildMessageBubble("Yes, we have Premium Ceramic Brake Pads available. Front set is LKR 4,500 and rear is LKR 4,200.", "10:35 AM", true),
                                _buildMessageBubble("Great! I need the front set. Is installation available?", "10:38 AM", false),
                              ],
                            ),
                          ),
                          // Message Input
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Type your message...",
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                IconButton(
                                  icon: const Icon(Icons.send, color: Colors.blue),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatTile(String name, String subject, String lastMsg, bool isSelected) {
    return Container(
      color: isSelected ? Colors.blue[50] : null,
      child: ListTile(
        leading: CircleAvatar(child: Text(name[0])),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subject, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
            Text(lastMsg, maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(String text, String time, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(text, style: TextStyle(color: isMe ? Colors.white : Colors.black)),
            const SizedBox(height: 4),
            Text(time, style: TextStyle(fontSize: 10, color: isMe ? Colors.white70 : Colors.grey)),
          ],
        ),
      ),
    );
  }
}