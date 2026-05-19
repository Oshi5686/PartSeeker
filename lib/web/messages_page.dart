/*import 'package:flutter/material.dart';

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
}*/

/*import 'package:flutter/material.dart';

class Message {
  final String id;
  final String senderName;
  final String initials;
  final Color avatarColor;
  final String subject;
  final List<ChatMessage> messages;

  Message({
    required this.id,
    required this.senderName,
    required this.initials,
    required this.avatarColor,
    required this.subject,
    required this.messages,
  });
}

class ChatMessage {
  final String text;
  final bool isMe;
  final String time;

  ChatMessage({required this.text, required this.isMe, required this.time});
}

class MessagesInboxPage extends StatefulWidget {
  const MessagesInboxPage({super.key});

  @override
  State<MessagesInboxPage> createState() => _MessagesInboxPageState();
}

class _MessagesInboxPageState extends State<MessagesInboxPage> {
  static const Color navyBlue = Color(0xFF1A3D7C);

  final TextEditingController _msgController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String _searchQuery = '';
  String _selectedId = 'kp';

  final List<Message> _messages = [
    Message(
      id: 'kp',
      senderName: 'Kasun Perera',
      initials: 'KP',
      avatarColor: navyBlue,
      subject: 'Inquiry about Brake Pads',
      messages: [
        ChatMessage(text: 'Hi, I am looking for brake pads for my 2019 Toyota Corolla. Do you have stock?', isMe: false, time: '2026-03-28 9:30'),
        ChatMessage(text: 'Yes, we have Premium Ceramic Brake Pads available. Front set is LKR 4,500 and rear is LKR 4,200.', isMe: true, time: '2026-03-28 9:35'),
        ChatMessage(text: 'Great! I need the front set. Is installation available?', isMe: false, time: '2026-03-28 9:38'),
      ],
    ),
    Message(
      id: 'ns',
      senderName: 'Nimal Silva',
      initials: 'NS',
      avatarColor: Color(0xFF0F6E56),
      subject: 'Honda Fit Timing Belt',
      messages: [
        ChatMessage(text: 'Do you have timing belt for Honda Fit 2015?', isMe: false, time: '2026-03-29 10:00'),
        ChatMessage(text: 'Yes, we have it in stock. Price is LKR 3,800.', isMe: true, time: '2026-03-29 10:05'),
      ],
    ),
    Message(
      id: 'pf',
      senderName: 'Priya Fernando',
      initials: 'PF',
      avatarColor: Color(0xFF993C1D),
      subject: 'Alternator Availability',
      messages: [
        ChatMessage(text: 'Is the alternator still available?', isMe: false, time: '2026-03-30 14:00'),
      ],
    ),
    Message(
      id: 'aj',
      senderName: 'Amal Jayawardena',
      initials: 'AJ',
      avatarColor: Color(0xFF534AB7),
      subject: 'Bulk Order Inquiry',
      messages: [
        ChatMessage(text: 'We are interested in purchasing brake pads in bulk for our fleet.', isMe: false, time: '2026-03-31 9:00'),
      ],
    ),
    Message(
      id: 'dw',
      senderName: 'Dilan Wickrama',
      initials: 'DW',
      avatarColor: Color(0xFF3B6D11),
      subject: 'Warranty Question',
      messages: [
        ChatMessage(text: 'What is the warranty period for the AC compressor?', isMe: false, time: '2026-04-01 11:00'),
      ],
    ),
  ];

  Message get _selectedMessage => _messages.firstWhere((m) => m.id == _selectedId);

  List<Message> get _filtered => _searchQuery.isEmpty
      ? _messages
      : _messages.where((m) =>
          m.senderName.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          m.subject.toLowerCase().contains(_searchQuery.toLowerCase())).toList();

  void _sendMessage() {
    final text = _msgController.text.trim();
    if (text.isEmpty) return;
    final now = DateTime.now();
    final time =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
    setState(() {
      _selectedMessage.messages.add(ChatMessage(text: text, isMe: true, time: time));
      _msgController.clear();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      body: Column(
        children: [
          // Top bar
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A2E)),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 8),
                const Text('Messages Inbox',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E))),
                const Spacer(),
                const Icon(Icons.notifications_outlined, color: Colors.grey),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Hill Country Auto Mart', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                    Text('Garage Owner', style: TextStyle(fontSize: 11, color: Colors.grey)),
                  ],
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Color(0xFFDCE3F3),
                  child: Text('HC', style: TextStyle(color: navyBlue, fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          // Sub title
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.only(left: 24, bottom: 12),
            child: const Text('Respond to customer inquiries about your spare parts',
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ),
          const Divider(height: 1),
          // Body
          Expanded(
            child: Row(
              children: [
                // Left: contact list
                Container(
                  width: 260,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          onChanged: (v) => setState(() => _searchQuery = v),
                          style: const TextStyle(fontSize: 12),
                          decoration: InputDecoration(
                            hintText: 'Search messages...',
                            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                            prefixIcon: Icon(Icons.search, size: 18, color: Colors.grey.shade400),
                            filled: true,
                            fillColor: const Color(0xFFF4F6FB),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.grey.shade200),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.grey.shade200),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                        ),
                      ),
                      const Divider(height: 1),
                      Expanded(
                        child: ListView.separated(
                          itemCount: _filtered.length,
                          separatorBuilder: (_, __) => const Divider(height: 1),
                          itemBuilder: (_, i) {
                            final m = _filtered[i];
                            final isActive = m.id == _selectedId;
                            final lastMsg = m.messages.isNotEmpty ? m.messages.last.text : '';
                            return InkWell(
                              onTap: () => setState(() => _selectedId = m.id),
                              child: Container(
                                color: isActive ? const Color(0xFFEEF2FA) : Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 17,
                                      backgroundColor: m.avatarColor,
                                      child: Text(m.initials,
                                          style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(m.senderName,
                                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E))),
                                          Text(m.subject,
                                              style: const TextStyle(fontSize: 10, color: navyBlue, fontWeight: FontWeight.w600)),
                                          const SizedBox(height: 2),
                                          Text(lastMsg,
                                              style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(width: 1),
                // Right: chat area
                Expanded(
                  child: Column(
                    children: [
                      // Chat header
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_selectedMessage.senderName,
                                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E))),
                            const SizedBox(height: 2),
                            Text(_selectedMessage.subject,
                                style: const TextStyle(fontSize: 11, color: navyBlue, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      const Divider(height: 1),
                      // Chat messages
                      Expanded(
                        child: Container(
                          color: const Color(0xFFFAFBFD),
                          child: ListView.builder(
                            controller: _scrollController,
                            padding: const EdgeInsets.all(16),
                            itemCount: _selectedMessage.messages.length,
                            itemBuilder: (_, i) {
                              final msg = _selectedMessage.messages[i];
                              return Align(
                                alignment: msg.isMe ? Alignment.centerRight : Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: msg.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.4),
                                      margin: const EdgeInsets.only(bottom: 4),
                                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: msg.isMe ? navyBlue : Colors.white,
                                        border: msg.isMe ? null : Border.all(color: Colors.grey.shade200),
                                        borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(12),
                                          topRight: const Radius.circular(12),
                                          bottomLeft: Radius.circular(msg.isMe ? 12 : 2),
                                          bottomRight: Radius.circular(msg.isMe ? 2 : 12),
                                        ),
                                      ),
                                      child: Text(
                                        msg.text,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: msg.isMe ? Colors.white : const Color(0xFF1A1A2E),
                                          height: 1.5,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 12, left: 4, right: 4),
                                      child: Text(msg.time,
                                          style: TextStyle(fontSize: 10, color: Colors.grey.shade400)),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      // Input bar
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _msgController,
                                style: const TextStyle(fontSize: 13),
                                onSubmitted: (_) => _sendMessage(),
                                decoration: InputDecoration(
                                  hintText: 'Type your message...',
                                  hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.grey.shade300),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.grey.shade300),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(color: navyBlue),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: _sendMessage,
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                padding: const EdgeInsets.all(11),
                                decoration: BoxDecoration(
                                  color: navyBlue,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.send, color: Colors.white, size: 18),
                              ),
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
          // Footer
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Row(
              children: [
                const Text('2026 Partseeker Seller Dashboard', style: TextStyle(fontSize: 11, color: Colors.grey)),
                const Spacer(),
                _footerLink('Privacy Policy'),
                const SizedBox(width: 16),
                _footerLink('Term & Condition'),
                const SizedBox(width: 16),
                _footerLink('Help'),
                const Spacer(),
                const Text('version 1.0.0', style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _footerLink(String text) {
    return Text(text, style: const TextStyle(fontSize: 11, color: Colors.grey));
  }
}*/

/*import 'package:flutter/material.dart';

class ChatMessage {
  final String text;
  final bool isMe;
  final String time;

  ChatMessage({required this.text, required this.isMe, required this.time});
}

class Conversation {
  final String id;
  final String senderName;
  final String initials;
  final Color avatarColor;
  final String subject;
  final List<ChatMessage> messages;

  Conversation({
    required this.id,
    required this.senderName,
    required this.initials,
    required this.avatarColor,
    required this.subject,
    required this.messages,
  });
}

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  static const Color navyBlue = Color(0xFF1A3D7C);

  final TextEditingController _msgController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String _searchQuery = '';
  String _selectedId = 'kp';

  final List<Conversation> _conversations = [
    Conversation(
      id: 'kp',
      senderName: 'Kasun Perera',
      initials: 'KP',
      avatarColor: navyBlue,
      subject: 'Inquiry about Brake Pads',
      messages: [
        ChatMessage(
            text:
                'Hi, I am looking for brake pads for my 2019 Toyota Corolla. Do you have stock?',
            isMe: false,
            time: '2026-03-28 9:30'),
        ChatMessage(
            text:
                'Yes, we have Premium Ceramic Brake Pads available. Front set is LKR 4,500 and rear is LKR 4,200.',
            isMe: true,
            time: '2026-03-28 9:35'),
        ChatMessage(
            text: 'Great! I need the front set. Is installation available?',
            isMe: false,
            time: '2026-03-28 9:38'),
      ],
    ),
    Conversation(
      id: 'ns',
      senderName: 'Nimal Silva',
      initials: 'NS',
      avatarColor: Color(0xFF0F6E56),
      subject: 'Honda Fit Timing Belt',
      messages: [
        ChatMessage(
            text: 'Do you have timing belt for Honda Fit 2015?',
            isMe: false,
            time: '2026-03-29 10:00'),
        ChatMessage(
            text: 'Yes, we have it in stock. Price is LKR 3,800.',
            isMe: true,
            time: '2026-03-29 10:05'),
      ],
    ),
    Conversation(
      id: 'pf',
      senderName: 'Priya Fernando',
      initials: 'PF',
      avatarColor: Color(0xFF993C1D),
      subject: 'Alternator Availability',
      messages: [
        ChatMessage(
            text: 'Is the alternator still available?',
            isMe: false,
            time: '2026-03-30 14:00'),
      ],
    ),
    Conversation(
      id: 'aj',
      senderName: 'Amal Jayawardena',
      initials: 'AJ',
      avatarColor: Color(0xFF534AB7),
      subject: 'Bulk Order Inquiry',
      messages: [
        ChatMessage(
            text:
                'We are interested in purchasing brake pads in bulk for our fleet.',
            isMe: false,
            time: '2026-03-31 9:00'),
      ],
    ),
    Conversation(
      id: 'dw',
      senderName: 'Dilan Wickrama',
      initials: 'DW',
      avatarColor: Color(0xFF3B6D11),
      subject: 'Warranty Question',
      messages: [
        ChatMessage(
            text: 'What is the warranty period for the AC compressor?',
            isMe: false,
            time: '2026-04-01 11:00'),
      ],
    ),
  ];

  Conversation get _selected =>
      _conversations.firstWhere((c) => c.id == _selectedId);

  List<Conversation> get _filtered => _searchQuery.isEmpty
      ? _conversations
      : _conversations
          .where((c) =>
              c.senderName.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              c.subject.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();

  void _sendMessage() {
    final text = _msgController.text.trim();
    if (text.isEmpty) return;
    final now = DateTime.now();
    final time =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} '
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
    setState(() {
      _selected.messages.add(ChatMessage(text: text, isMe: true, time: time));
      _msgController.clear();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Page heading
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 28, 28, 4),
          child: const Text(
            'Messages',
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1A2E)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28, bottom: 16),
          child: const Text(
            'Respond to customer inquiries about your spare parts',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ),
        // Main content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 28),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      blurRadius: 10,
                      offset: const Offset(0, 2))
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Row(
                  children: [
                    // ── Left: conversation list ──
                    SizedBox(
                      width: 270,
                      child: Column(
                        children: [
                          // Search bar
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade200)),
                            ),
                            child: TextField(
                              onChanged: (v) =>
                                  setState(() => _searchQuery = v),
                              style: const TextStyle(fontSize: 12),
                              decoration: InputDecoration(
                                hintText: 'Search messages...',
                                hintStyle: TextStyle(
                                    color: Colors.grey.shade400, fontSize: 12),
                                prefixIcon: Icon(Icons.search,
                                    size: 18, color: Colors.grey.shade400),
                                filled: true,
                                fillColor: const Color(0xFFF4F6FB),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade200),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade200),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: navyBlue),
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 8),
                              ),
                            ),
                          ),
                          // Conversation items
                          Expanded(
                            child: ListView.separated(
                              itemCount: _filtered.length,
                              separatorBuilder: (_, __) => Divider(
                                  height: 1, color: Colors.grey.shade100),
                              itemBuilder: (_, i) {
                                final c = _filtered[i];
                                final isActive = c.id == _selectedId;
                                final lastMsg = c.messages.isNotEmpty
                                    ? c.messages.last.text
                                    : '';
                                return InkWell(
                                  onTap: () =>
                                      setState(() => _selectedId = c.id),
                                  child: Container(
                                    color: isActive
                                        ? const Color(0xFFEEF2FA)
                                        : Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 12),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 18,
                                          backgroundColor: c.avatarColor,
                                          child: Text(
                                            c.initials,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                c.senderName,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF1A1A2E)),
                                              ),
                                              const SizedBox(height: 2),
                                              Text(
                                                c.subject,
                                                style: const TextStyle(
                                                    fontSize: 10,
                                                    color: navyBlue,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(height: 3),
                                              Text(
                                                lastMsg,
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color:
                                                        Colors.grey.shade500),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Divider
                    VerticalDivider(width: 1, color: Colors.grey.shade200),

                    // ── Right: chat area ──
                    Expanded(
                      child: Column(
                        children: [
                          // Chat header
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 14),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade200)),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: _selected.avatarColor,
                                  child: Text(
                                    _selected.initials,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _selected.senderName,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF1A1A2E)),
                                    ),
                                    Text(
                                      _selected.subject,
                                      style: const TextStyle(
                                          fontSize: 11,
                                          color: navyBlue,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Chat messages
                          Expanded(
                            child: Container(
                              color: const Color(0xFFFAFBFD),
                              child: ListView.builder(
                                controller: _scrollController,
                                padding: const EdgeInsets.all(16),
                                itemCount: _selected.messages.length,
                                itemBuilder: (_, i) {
                                  final msg = _selected.messages[i];
                                  return Align(
                                    alignment: msg.isMe
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment: msg.isMe
                                          ? CrossAxisAlignment.end
                                          : CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.38),
                                          margin:
                                              const EdgeInsets.only(bottom: 4),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 14, vertical: 10),
                                          decoration: BoxDecoration(
                                            color: msg.isMe
                                                ? navyBlue
                                                : Colors.white,
                                            border: msg.isMe
                                                ? null
                                                : Border.all(
                                                    color:
                                                        Colors.grey.shade200),
                                            borderRadius: BorderRadius.only(
                                              topLeft:
                                                  const Radius.circular(12),
                                              topRight:
                                                  const Radius.circular(12),
                                              bottomLeft: Radius.circular(
                                                  msg.isMe ? 12 : 2),
                                              bottomRight: Radius.circular(
                                                  msg.isMe ? 2 : 12),
                                            ),
                                          ),
                                          child: Text(
                                            msg.text,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: msg.isMe
                                                  ? Colors.white
                                                  : const Color(0xFF1A1A2E),
                                              height: 1.5,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 14, left: 4, right: 4),
                                          child: Text(
                                            msg.time,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey.shade400),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          // Input bar
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                  top: BorderSide(color: Colors.grey.shade200)),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _msgController,
                                    style: const TextStyle(fontSize: 13),
                                    onSubmitted: (_) => _sendMessage(),
                                    decoration: InputDecoration(
                                      hintText: 'Type your message...',
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: 12),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            const BorderSide(color: navyBlue),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 10),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                InkWell(
                                  onTap: _sendMessage,
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    padding: const EdgeInsets.all(11),
                                    decoration: BoxDecoration(
                                      color: navyBlue,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(Icons.send,
                                        color: Colors.white, size: 18),
                                  ),
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
          ),
        ),
      ],
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'pickup_requests_page.dart';

class ChatMessage {
  final String text;
  final bool isMe;
  final String time;
  ChatMessage({required this.text, required this.isMe, required this.time});
}

class Conversation {
  final String id;
  final String senderName;
  final String initials;
  final Color avatarColor;
  final String subject;
  final List<ChatMessage> messages;

  Conversation({
    required this.id,
    required this.senderName,
    required this.initials,
    required this.avatarColor,
    required this.subject,
    required this.messages,
  });
}

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  static const Color navyBlue = Color(0xFF1A3D7C);

  final TextEditingController _msgController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String _searchQuery = '';
  String _selectedId = 'kp';

  final List<Conversation> _conversations = [
    Conversation(
      id: 'kp',
      senderName: 'Kasun Perera',
      initials: 'KP',
      avatarColor: navyBlue,
      subject: 'Inquiry about Brake Pads',
      messages: [
        ChatMessage(
            text:
                'Hi, I am looking for brake pads for my 2019 Toyota Corolla. Do you have stock?',
            isMe: false,
            time: '2026-03-28 9:30'),
        ChatMessage(
            text:
                'Yes, we have Premium Ceramic Brake Pads available. Front set is LKR 4,500 and rear is LKR 4,200.',
            isMe: true,
            time: '2026-03-28 9:35'),
        ChatMessage(
            text: 'Great! I need the front set. Is installation available?',
            isMe: false,
            time: '2026-03-28 9:38'),
      ],
    ),
    Conversation(
      id: 'ns',
      senderName: 'Nimal Silva',
      initials: 'NS',
      avatarColor: Color(0xFF0F6E56),
      subject: 'Honda Fit Timing Belt',
      messages: [
        ChatMessage(
            text: 'Do you have timing belt for Honda Fit 2015?',
            isMe: false,
            time: '2026-03-29 10:00'),
        ChatMessage(
            text: 'Yes, we have it in stock. Price is LKR 3,800.',
            isMe: true,
            time: '2026-03-29 10:05'),
      ],
    ),
    Conversation(
      id: 'pf',
      senderName: 'Priya Fernando',
      initials: 'PF',
      avatarColor: Color(0xFF993C1D),
      subject: 'Alternator Availability',
      messages: [
        ChatMessage(
            text: 'Is the alternator still available?',
            isMe: false,
            time: '2026-03-30 14:00'),
      ],
    ),
    Conversation(
      id: 'aj',
      senderName: 'Amal Jayawardena',
      initials: 'AJ',
      avatarColor: Color(0xFF534AB7),
      subject: 'Bulk Order Inquiry',
      messages: [
        ChatMessage(
            text:
                'We are interested in purchasing brake pads in bulk for our fleet.',
            isMe: false,
            time: '2026-03-31 9:00'),
      ],
    ),
    Conversation(
      id: 'dw',
      senderName: 'Dilan Wickrama',
      initials: 'DW',
      avatarColor: Color(0xFF3B6D11),
      subject: 'Warranty Question',
      messages: [
        ChatMessage(
            text: 'What is the warranty period for the AC compressor?',
            isMe: false,
            time: '2026-04-01 11:00'),
      ],
    ),
  ];

  Conversation get _selected =>
      _conversations.firstWhere((c) => c.id == _selectedId);

  List<Conversation> get _filtered => _searchQuery.isEmpty
      ? _conversations
      : _conversations
          .where((c) =>
              c.senderName.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              c.subject.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();

  void _sendMessage() {
    final text = _msgController.text.trim();
    if (text.isEmpty) return;
    final now = DateTime.now();
    final time =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} '
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
    setState(() {
      _selected.messages.add(ChatMessage(text: text, isMe: true, time: time));
      _msgController.clear();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Page heading row ──
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 28, 28, 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Messages',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A2E)),
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PickupRequestsPage()),
                ),
                icon: const Icon(Icons.local_shipping_outlined,
                    size: 15, color: Colors.white),
                label: const Text(
                  'Pickup Requests',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: navyBlue,
                  elevation: 0,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 28, bottom: 16),
          child: Text(
            'Respond to customer inquiries about your spare parts',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ),

        // ── Main content ──
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 28),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      blurRadius: 10,
                      offset: const Offset(0, 2))
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Row(
                  children: [
                    // ── Left: contact list ──
                    SizedBox(
                      width: 270,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade200)),
                            ),
                            child: TextField(
                              onChanged: (v) =>
                                  setState(() => _searchQuery = v),
                              style: const TextStyle(fontSize: 12),
                              decoration: InputDecoration(
                                hintText: 'Search messages...',
                                hintStyle: TextStyle(
                                    color: Colors.grey.shade400, fontSize: 12),
                                prefixIcon: Icon(Icons.search,
                                    size: 18, color: Colors.grey.shade400),
                                filled: true,
                                fillColor: const Color(0xFFF4F6FB),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade200),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade200),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: navyBlue),
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 8),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              itemCount: _filtered.length,
                              separatorBuilder: (_, __) => Divider(
                                  height: 1, color: Colors.grey.shade100),
                              itemBuilder: (_, i) {
                                final c = _filtered[i];
                                final isActive = c.id == _selectedId;
                                final lastMsg = c.messages.isNotEmpty
                                    ? c.messages.last.text
                                    : '';
                                return InkWell(
                                  onTap: () =>
                                      setState(() => _selectedId = c.id),
                                  child: Container(
                                    color: isActive
                                        ? const Color(0xFFEEF2FA)
                                        : Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 12),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 18,
                                          backgroundColor: c.avatarColor,
                                          child: Text(c.initials,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(c.senderName,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Color(0xFF1A1A2E))),
                                              const SizedBox(height: 2),
                                              Text(c.subject,
                                                  style: const TextStyle(
                                                      fontSize: 10,
                                                      color: navyBlue,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              const SizedBox(height: 3),
                                              Text(lastMsg,
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color:
                                                          Colors.grey.shade500),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    VerticalDivider(width: 1, color: Colors.grey.shade200),

                    // ── Right: chat area ──
                    Expanded(
                      child: Column(
                        children: [
                          // Chat header
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 14),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade200)),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: _selected.avatarColor,
                                  child: Text(_selected.initials,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold)),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_selected.senderName,
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF1A1A2E))),
                                    Text(_selected.subject,
                                        style: const TextStyle(
                                            fontSize: 11,
                                            color: navyBlue,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Chat messages
                          Expanded(
                            child: Container(
                              color: const Color(0xFFFAFBFD),
                              child: ListView.builder(
                                controller: _scrollController,
                                padding: const EdgeInsets.all(16),
                                itemCount: _selected.messages.length,
                                itemBuilder: (_, i) {
                                  final msg = _selected.messages[i];
                                  return Align(
                                    alignment: msg.isMe
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment: msg.isMe
                                          ? CrossAxisAlignment.end
                                          : CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.38),
                                          margin:
                                              const EdgeInsets.only(bottom: 4),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 14, vertical: 10),
                                          decoration: BoxDecoration(
                                            color: msg.isMe
                                                ? navyBlue
                                                : Colors.white,
                                            border: msg.isMe
                                                ? null
                                                : Border.all(
                                                    color:
                                                        Colors.grey.shade200),
                                            borderRadius: BorderRadius.only(
                                              topLeft:
                                                  const Radius.circular(12),
                                              topRight:
                                                  const Radius.circular(12),
                                              bottomLeft: Radius.circular(
                                                  msg.isMe ? 12 : 2),
                                              bottomRight: Radius.circular(
                                                  msg.isMe ? 2 : 12),
                                            ),
                                          ),
                                          child: Text(
                                            msg.text,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: msg.isMe
                                                  ? Colors.white
                                                  : const Color(0xFF1A1A2E),
                                              height: 1.5,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 14, left: 4, right: 4),
                                          child: Text(msg.time,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.grey.shade400)),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          // Input bar
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                  top: BorderSide(color: Colors.grey.shade200)),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _msgController,
                                    style: const TextStyle(fontSize: 13),
                                    onSubmitted: (_) => _sendMessage(),
                                    decoration: InputDecoration(
                                      hintText: 'Type your message...',
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: 12),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            const BorderSide(color: navyBlue),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 10),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                InkWell(
                                  onTap: _sendMessage,
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    padding: const EdgeInsets.all(11),
                                    decoration: BoxDecoration(
                                      color: navyBlue,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(Icons.send,
                                        color: Colors.white, size: 18),
                                  ),
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
          ),
        ),
      ],
    );
  }
}
