/*import 'package:flutter/material.dart';

class AddListingPage extends StatefulWidget {
  const AddListingPage({super.key});

  @override
  State<AddListingPage> createState() => _AddListingPageState();
}

class _AddListingPageState extends State<AddListingPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Add Listing",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text("Add a new spare part to your inventory",
              style: TextStyle(color: Colors.grey)),
          SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // වම් පැත්තේ Form එක
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    _buildSectionCard("Basic Information", [
                      Row(
                        children: [
                          Expanded(
                              child: _buildTextField(
                                  "Part Label", "Select part type",
                                  isDropdown: true)),
                          SizedBox(width: 20),
                          Expanded(
                              child: _buildTextField(
                                  "Category", "Select category",
                                  isDropdown: true)),
                        ],
                      ),
                      SizedBox(height: 20),
                      _buildTextField("Display Name",
                          "e.g., Premium Ceramic Brake Pads - Front"),
                      SizedBox(height: 20),
                      _buildTextField("Description",
                          "Describe the part, its features, and condition...",
                          maxLines: 4),
                    ]),
                    SizedBox(height: 20),
                    _buildSectionCard("Compatible Models", [
                      Wrap(
                        spacing: 40,
                        children: [
                          _buildCheckbox("Toyota Corolla"),
                          _buildCheckbox("Toyota Vitz"),
                          _buildCheckbox("Toyota Axio"),
                          _buildCheckbox("Toyota Premio"),
                          _buildCheckbox("Honda Fit"),
                          _buildCheckbox("Honda Civic"),
                        ],
                      ),
                    ]),
                    SizedBox(height: 20),
                    _buildSectionCard("Pricing & Stock", [
                      Row(
                        children: [
                          Expanded(child: _buildTextField("Price (LKR)", "0")),
                          SizedBox(width: 20),
                          Expanded(
                              child: _buildTextField("Stock Quantity", "0")),
                        ],
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(width: 30),

              // දකුණු පැත්තේ Image Upload සහ Buttons
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.upload_file, size: 50, color: Colors.grey),
                          SizedBox(height: 10),
                          Text("Upload Image",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("PNG, JPG up to 5MB",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    _buildActionButton(
                        "Publish Listing", Color(0xFF1A3D7C), Colors.white),
                    SizedBox(height: 10),
                    _buildActionButton(
                        "Save", Colors.grey.shade200, Colors.black),
                    SizedBox(height: 10),
                    _buildActionButton(
                        "Cancel", Colors.grey.shade300, Colors.black),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(String title, List<Widget> children) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint,
      {bool isDropdown = false, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: isDropdown ? Icon(Icons.arrow_drop_down) : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckbox(String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(value: false, onChanged: (v) {}),
        Text(label, style: TextStyle(fontSize: 13)),
      ],
    );
  }

  Widget _buildActionButton(String label, Color bgColor, Color textColor) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {},
        child: Text(label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}*/

/*import 'package:flutter/material.dart';

// --- MAIN HUB VIEW TO NAVIGATE BETWEEN PAGES ---
class DashboardHubPage extends StatefulWidget {
  const DashboardHubPage({super.key});

  @override
  State<DashboardHubPage> createState() => _DashboardHubPageState();
}

class _DashboardHubPageState extends State<DashboardHubPage> {
  int _selectedIndex = 0; // 0 = Add Listing, 1 = Messages Inbox

  // Static list to hold chat data so both screens can sync
  static List<Map<String, dynamic>> chatList = [
    {
      "name": "Kasun Perera",
      "subject": "Inquiry about Brake Pads",
      "lastMsg": "Great! I need the front set...",
      "isSelected": true
    },
    {
      "name": "Nimal Silva",
      "subject": "Honda Fit Timing Belt",
      "lastMsg": "Do you have timing belt for...",
      "isSelected": false
    },
    {
      "name": "Priya Fernando",
      "subject": "Alternator Availability",
      "lastMsg": "Is it currently available?",
      "isSelected": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // Side navigation bar or Top App bar based on your main dashboard structure
      appBar: AppBar(
        title: const Text("Auto-Parts-Connect Dashboard", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1A3D7C),
        foregroundColor: Colors.white,
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.add_box, color: Colors.white),
            label: const Text("Add Listing", style: TextStyle(color: Colors.white)),
            onPressed: () => setState(() => _selectedIndex = 0),
          ),
          TextButton.icon(
            icon: const Icon(Icons.mail, color: Colors.white),
            label: const Text("Inbox", style: TextStyle(color: Colors.white)),
            onPressed: () => setState(() => _selectedIndex = 1),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          AddListingPage(onPublishSuccess: (newListingSubject) {
            // When a listing is published, instantly create a dummy buyer inquiry in the inbox
            setState(() {
              chatList.insert(0, {
                "name": "New Buyer (Inquiry)",
                "subject": "Regarding: $newListingSubject",
                "lastMsg": "Is this part still available for purchase?",
                "isSelected": false
              });
              _selectedIndex = 1; // Auto redirect to Inbox
            });
          }),
          MessagesPage(chats: chatList),
        ],
      ),
    );
  }
}

// ==========================================
// 1. ADD LISTING PAGE
// ==========================================
class AddListingPage extends StatefulWidget {
  final Function(String) onPublishSuccess;
  const AddListingPage({super.key, heavyweight, required this.onPublishSuccess});

  @override
  State<AddListingPage> createState() => _AddListingPageState();
}

class _AddListingPageState extends State<AddListingPage> {
  // Form values controllers & states
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();

  String? _selectedPartLabel;
  String? _selectedCategory;

  // Track checked compatible models
  final Map<String, bool> _compatibleModels = {
    "Toyota Corolla": false,
    "Toyota Vitz": false,
    "Toyota Axio": false,
    "Toyota Premio": false,
    "Honda Fit": false,
    "Honda Civic": false,
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Add Listing", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text("Add a new spare part to your inventory", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Form Column
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    _buildSectionCard("Basic Information", [
                      Row(
                        children: [
                          Expanded(
                            child: _buildDropdownField(
                              "Part Label",
                              "Select part type",
                              ["Brake System", "Engine Parts", "Suspension", "Transmission"],
                              _selectedPartLabel,
                              (val) => setState(() => _selectedPartLabel = val),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: _buildDropdownField(
                              "Category",
                              "Select category",
                              ["Brand New", "Reconditioned", "Used"],
                              _selectedCategory,
                              (val) => setState(() => _selectedCategory = val),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildTextField("Display Name", "e.g., Premium Ceramic Brake Pads - Front", _nameController),
                      const SizedBox(height: 20),
                      _buildTextField(
                        "Description",
                        "Describe the part, its features, and condition...",
                        _descController,
                        maxLines: 4,
                      ),
                    ]),
                    const SizedBox(height: 20),
                    _buildSectionCard("Compatible Models", [
                      Wrap(
                        spacing: 20,
                        runSpacing: 10,
                        children: _compatibleModels.keys.map((model) {
                          return _buildCheckbox(model, _compatibleModels[model]!, (val) {
                            setState(() => _compatibleModels[model] = val!);
                          });
                        }).toList(),
                      ),
                    ]),
                    const SizedBox(height: 20),
                    _buildSectionCard("Pricing & Stock", [
                      Row(
                        children: [
                          Expanded(child: _buildTextField("Price (LKR)", "0", _priceController, isNumber: true)),
                          const SizedBox(width: 20),
                          Expanded(child: _buildTextField("Stock Quantity", "0", _stockController, isNumber: true)),
                        ],
                      ),
                    ]),
                  ],
                ),
              ),
              const SizedBox(width: 30),

              // Right Actions & Media Column
              Expanded(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Triggering image upload system..."))
                        );
                      },
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.upload_file, size: 50, color: Colors.grey),
                            const SizedBox(height: 10),
                            const Text("Upload Image", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("PNG, JPG up to 5MB", style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildActionButton("Publish Listing", const Color(0xFF1A3D7C), Colors.white, () {
                      if (_nameController.text.isNotEmpty) {
                        // Pass listing name to inbox update function
                        widget.onPublishSuccess(_nameController.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Listing Published Successfully! Connecting to Inbox..."))
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please enter a Display Name at least."))
                        );
                      }
                    }),
                    const SizedBox(height: 10),
                    _buildActionButton("Save Draft", Colors.grey.shade200, Colors.black, () {}),
                    const SizedBox(height: 10),
                    _buildActionButton("Cancel", Colors.grey.shade300, Colors.black, () {
                      _nameController.clear();
                      _descController.clear();
                      _priceController.clear();
                      _stockController.clear();
                    }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(String title, List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1A3D7C))),
          const SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint, TextEditingController controller, {int maxLines = 1, bool isNumber = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black70)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey.shade300)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey.shade300)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, String hint, List<String> items, String? selectedValue, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black70)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedValue,
          hint: Text(hint, style: TextStyle(color: Colors.grey.shade400, fontSize: 13)),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey.shade300)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey.shade300)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          ),
          items: items.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value, style: const TextStyle(fontSize: 13)));
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildCheckbox(String label, bool value, Function(bool?) onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(value: value, activeColor: const Color(0xFF1A3D7C), onChanged: onChanged),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }

  Widget _buildActionButton(String label, Color bgColor, Color textColor, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      ),
    );
  }
}

// ==========================================
// 2. MESSAGES INBOX PAGE
// ==========================================
class MessagesPage extends StatefulWidget {
  final List<Map<String, dynamic>> chats;
  const MessagesPage({super.key, required this.chats});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final TextEditingController _msgInputController = TextEditingController();
  
  // Local active chat visualization tracker
  int _activeChatIndex = 0;

  @override
  Widget build(BuildContext context) {
    var activeChat = widget.chats.isNotEmpty ? widget.chats[_activeChatIndex] : null;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Messages Inbox", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
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
                  // Left Side: Chat List View
                  Container(
                    width: 350,
                    decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.grey[300]!))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search messages...",
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                              contentPadding: const EdgeInsets.symmetric(vertical: 8),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: widget.chats.length,
                            itemBuilder: (context, index) {
                              var item = widget.chats[index];
                              return InkWell(
                                onTap: () => setState(() => _activeChatIndex = index),
                                child: _buildChatTile(
                                  item["name"], 
                                  item["subject"], 
                                  item["lastMsg"], 
                                  _activeChatIndex == index
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Right Side: Opened Chat Window
                  Expanded(
                    child: activeChat == null 
                    ? const Center(child: Text("No inquiries yet."))
                    : Column(
                      children: [
                        // Active Chat Header
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: const Color(0xFF1A3D7C),
                                foregroundColor: Colors.white,
                                child: Text(activeChat["name"][0])
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(activeChat["name"], style: const TextStyle(fontWeight: FontWeight.bold)),
                                  Text(activeChat["subject"], style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(height: 1),
                        
                        // Messages Conversation Timeline
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.all(16),
                            children: [
                              _buildMessageBubble("Hi, I am looking for this part. Do you have stock?", "10:30 AM", false),
                              _buildMessageBubble("Yes, it is available in our inventory.", "10:35 AM", true),
                              _buildMessageBubble(activeChat["lastMsg"], "10:38 AM", false),
                            ],
                          ),
                        ),
                        
                        // Message Input Field Box
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _msgInputController,
                                  decoration: InputDecoration(
                                    hintText: "Type your message...",
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                icon: const Icon(Icons.send, color: Color(0xFF1A3D7C)),
                                onPressed: () {
                                  if (_msgInputController.text.isNotEmpty) {
                                    setState(() {
                                      widget.chats[_activeChatIndex]["lastMsg"] = _msgInputController.text;
                                      _msgInputController.clear();
                                    });
                                  }
                                },
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
    );
  }

  Widget _buildChatTile(String name, String subject, String lastMsg, bool isSelected) {
    return Container(
      color: isSelected ? Colors.blue[50] : null,
      border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: Colors.grey.shade300, child: Text(name[0], style: const TextStyle(color: Colors.black80))),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subject, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black54)),
            Text(lastMsg, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12)),
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
          color: isMe ? const Color(0xFF1A3D7C) : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(text, style: TextStyle(color: isMe ? Colors.white : Colors.black80, fontSize: 13)),
            const SizedBox(height: 4),
            Text(time, style: TextStyle(fontSize: 10, color: isMe ? Colors.white70 : Colors.grey)),
          ],
        ),
      ),
    );
  }
}
*/

/*import 'package:flutter/material.dart';
import 'messages_page.dart';

class AddListingPage extends StatefulWidget {
  const AddListingPage({super.key});

  @override
  State<AddListingPage> createState() => _AddListingPageState();
}

class _AddListingPageState extends State<AddListingPage> {
  String? selectedPartLabel;
  String? selectedCategory;
  final _displayNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();

  final List<String> partLabels = [
    'Brake Pad',
    'Filter',
    'Belt',
    'Alternator',
    'Compressor'
  ];
  final List<String> categories = [
    'Brakes',
    'Engine',
    'Suspension',
    'Electrical',
    'Cooling'
  ];

  final Map<String, bool> compatibleModels = {
    'Toyota Corolla': false,
    'Toyota Vitz': false,
    'Toyota Axio': false,
    'Toyota Premio': false,
    'Honda Fit': false,
    'Honda Civic': false,
    'Honda Vezel': false,
    'Nissan March': false,
    'Nissan Sunny': false,
  };

  static const Color navyBlue = Color(0xFF1A3D7C);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Add Listing',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A2E))),
          const SizedBox(height: 6),
          const Text('Add a new spare part to your inventory',
              style: TextStyle(fontSize: 13, color: Colors.grey)),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left column
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    _buildCard('Basic Information', [
                      Row(
                        children: [
                          Expanded(
                              child: _buildDropdown(
                                  'Part Label',
                                  partLabels,
                                  selectedPartLabel,
                                  (v) =>
                                      setState(() => selectedPartLabel = v))),
                          const SizedBox(width: 16),
                          Expanded(
                              child: _buildDropdown(
                                  'Category',
                                  categories,
                                  selectedCategory,
                                  (v) => setState(() => selectedCategory = v))),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildTextField('Display Name',
                          'e.g., Premium Ceramic Brake Pads - Front',
                          controller: _displayNameController),
                      const SizedBox(height: 16),
                      _buildTextField('Description',
                          'Describe the part, its features, and condition...',
                          controller: _descriptionController, maxLines: 4),
                    ]),
                    const SizedBox(height: 16),
                    _buildCard('Compatible Models', [
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        childAspectRatio: 4,
                        children: compatibleModels.keys.map((model) {
                          return Row(
                            children: [
                              Checkbox(
                                value: compatibleModels[model],
                                activeColor: navyBlue,
                                onChanged: (v) => setState(
                                    () => compatibleModels[model] = v!),
                              ),
                              Flexible(
                                child: Text(model,
                                    style: const TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ]),
                    const SizedBox(height: 16),
                    _buildCard('Pricing & Stock', [
                      Row(
                        children: [
                          Expanded(
                              child: _buildTextField('Price (LKR)', '0',
                                  controller: _priceController,
                                  keyboardType: TextInputType.number)),
                          const SizedBox(width: 16),
                          Expanded(
                              child: _buildTextField('Stock Quantity', '0',
                                  controller: _stockController,
                                  keyboardType: TextInputType.number)),
                        ],
                      ),
                    ]),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              // Right column
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.upload_file_outlined,
                              size: 40, color: Colors.grey.shade400),
                          const SizedBox(height: 8),
                          const Text('Upload Image',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 13)),
                          const SizedBox(height: 4),
                          Text('PNG, JPG up to 5MB',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.grey.shade500)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildButton('Publish Listing', navyBlue, Colors.white, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const MessagesPage()),
                      );
                    }),
                    const SizedBox(height: 10),
                    _buildButton(
                        'Save', Colors.grey.shade200, Colors.black87, () {}),
                    const SizedBox(height: 10),
                    _buildButton(
                        'Cancel', Colors.grey.shade300, Colors.black87, () {}),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 8,
              offset: const Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xFF1A1A2E))),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint,
      {TextEditingController? controller,
      int maxLines = 1,
      TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A1A2E))),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 13),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: Color(0xFF1A3D7C)),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? value,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A1A2E))),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: value,
          hint: Text('Select ${label.toLowerCase()}',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
          style: const TextStyle(fontSize: 13, color: Color(0xFF1A1A2E)),
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildButton(
      String label, Color bg, Color textColor, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onTap,
        child: Text(label,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, color: textColor)),
      ),
    );
  }
}*/

/*import 'package:flutter/material.dart';

// =========================================================
// MAIN DASHBOARD PAGE WITH SIDEBAR NAVIGATION
// =========================================================
class MainDashboardPage extends StatefulWidget {
  const MainDashboardPage({super.key});

  @override
  State<MainDashboardPage> createState() => _MainDashboardPageState();
}

class _MainDashboardPageState extends State<MainDashboardPage> {
  int _selectedIndex = 0; // 0: Add Listing, 1: Messages, 2: Pickup Requests

  // Shared state storage for messages sync
  static List<Map<String, dynamic>> sharedChats = [
    {
      "name": "Ruwan Kumara",
      "subject": "Inquiry about Ceramic Brake Pads",
      "lastMsg": "Hi, is the price negotiable for 2 packs?",
      "isSelected": true
    },
    {
      "name": "Chaminda Perera",
      "subject": "Toyota Oil Filter",
      "lastMsg": "Do you have the genuine one?",
      "isSelected": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // LEFT SIDEBAR MENU
          Container(
            width: 260,
            color: const Color(0xFF1A3D7C), // Dark Blue Brand Theme
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Row(
                    children: [
                      Icon(Icons.directions_car, color: Colors.white, size: 28),
                      SizedBox(width: 10),
                      Text(
                        "Auto-Parts",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.white24, height: 1),
                const SizedBox(height: 15),
                _buildSidebarItem(Icons.add_box, "Add Listing", 0),
                _buildSidebarItem(Icons.mail, "Messages Inbox", 1),
                _buildSidebarItem(Icons.local_shipping, "Pickup Requests", 2),
                const Spacer(),
                const Divider(color: Colors.white24),
                _buildSidebarItem(Icons.logout, "Logout", -1),
                const SizedBox(height: 15),
              ],
            ),
          ),

          // RIGHT SIDE: CONTENT DISPLAY
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                // 1. Add Listing Page
                AddListingPage(onPublishSuccess: (partName) {
                  setState(() {
                    sharedChats.insert(0, {
                      "name": "New Inquiry",
                      "subject": "Regarding: $partName",
                      "lastMsg": "Is this part currently in stock?",
                      "isSelected": false
                    });
                    _selectedIndex =
                        1; // Redirect to Messages page automatically
                  });
                }),

                // 2. Messages Page
                MessagesPage(chats: sharedChats),

                // 3. Pickup Requests Page
                const PickupRequestsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(IconData icon, String title, int index) {
    bool isSelected = _selectedIndex == index;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white.withOpacity(0.15) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon,
            color: isSelected ? Colors.amber : Colors.white70, size: 20),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
        onTap: () {
          if (index != -1) {
            setState(() => _selectedIndex = index);
          }
        },
      ),
    );
  }
}

// =========================================================
// 1. ADD LISTING PAGE CODE (FIXED DROPDOWN CRASH ERROR)
// =========================================================
class AddListingPage extends StatefulWidget {
  final Function(String) onPublishSuccess;
  const AddListingPage({super.key, required this.onPublishSuccess});

  @override
  State<AddListingPage> createState() => _AddListingPageState();
}

class _AddListingPageState extends State<AddListingPage> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();

  String? _selectedPartLabel;
  String? _selectedCategory;

  final Map<String, bool> _compatibleModels = {
    "Toyota Corolla": false,
    "Toyota Vitz": false,
    "Toyota Axio": false,
    "Toyota Premio": false,
    "Honda Fit": false,
    "Honda Civic": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Add Listing",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Add a new spare part to your inventory",
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      _buildSectionCard("Basic Information", [
                        Row(
                          children: [
                            Expanded(
                              child: _buildDropdownField(
                                "Part Label",
                                "Select part type",
                                [
                                  "Brake System",
                                  "Engine Parts",
                                  "Suspension",
                                  "Transmission"
                                ],
                                _selectedPartLabel,
                                (v) => setState(() => _selectedPartLabel = v),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildDropdownField(
                                "Category",
                                "Select category",
                                ["Brand New", "Reconditioned", "Used"],
                                _selectedCategory,
                                (v) => setState(() => _selectedCategory = v),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                            "Display Name",
                            "e.g., Premium Ceramic Brake Pads",
                            _nameController),
                        const SizedBox(height: 20),
                        _buildTextField("Description",
                            "Describe the part features...", _descController,
                            maxLines: 4),
                      ]),
                      const SizedBox(height: 20),
                      _buildSectionCard("Compatible Models", [
                        Wrap(
                          spacing: 20,
                          runSpacing: 10,
                          children: _compatibleModels.keys.map((model) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: _compatibleModels[model],
                                  activeColor: const Color(0xFF1A3D7C),
                                  onChanged: (val) => setState(
                                      () => _compatibleModels[model] = val!),
                                ),
                                Text(model,
                                    style: const TextStyle(fontSize: 13)),
                              ],
                            );
                          }).toList(),
                        ),
                      ]),
                      const SizedBox(height: 20),
                      _buildSectionCard("Pricing & Stock", [
                        Row(
                          children: [
                            Expanded(
                                child: _buildTextField(
                                    "Price (LKR)", "0", _priceController,
                                    isNumber: true)),
                            const SizedBox(width: 20),
                            Expanded(
                                child: _buildTextField(
                                    "Stock Quantity", "0", _stockController,
                                    isNumber: true)),
                          ],
                        ),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 260,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.upload_file,
                                size: 50, color: Colors.grey),
                            SizedBox(height: 10),
                            Text("Upload Image",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("PNG, JPG up to 5MB",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1A3D7C),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 0,
                          ),
                          onPressed: () {
                            if (_nameController.text.isNotEmpty) {
                              widget.onPublishSuccess(_nameController.text);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Please enter a Display Name first!")));
                            }
                          },
                          child: const Text("Publish Listing",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildActionBtn(
                          "Save as Draft", Colors.grey.shade200, Colors.black),
                      const SizedBox(height: 10),
                      _buildActionBtn(
                          "Cancel", Colors.grey.shade300, Colors.black),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard(String title, List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6)
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF1A3D7C))),
        const SizedBox(height: 20),
        ...children,
      ]),
    );
  }

  Widget _buildTextField(
      String label, String hint, TextEditingController controller,
      {int maxLines = 1, bool isNumber = false}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      TextField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.all(12)),
      ),
    ]);
  }

  // 🌟 FIXED LOGIC FOR DROPDOWN TO PREVENT ASSERTION CRASH
  Widget _buildDropdownField(String label, String hint, List<String> items,
      String? val, Function(String?) onChange) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          // Validation: explicit string membership testing to intercept unmatched selection states
          value: (val != null && items.contains(val)) ? val : null,
          hint: Text(hint),
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChange,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildActionBtn(String txt, Color bg, Color tx) {
    return SizedBox(
        width: double.infinity,
        height: 45,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: bg,
                foregroundColor: tx,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 0),
            onPressed: () {},
            child: Text(txt)));
  }
}

// =========================================================
// 2. MESSAGES INBOX PAGE CODE
// =========================================================
class MessagesPage extends StatefulWidget {
  final List<Map<String, dynamic>> chats;
  const MessagesPage({super.key, required this.chats});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final _msgInputController = TextEditingController();
  int _activeChatIndex = 0;

  @override
  Widget build(BuildContext context) {
    var activeChat =
        widget.chats.isNotEmpty ? widget.chats[_activeChatIndex] : null;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Messages Inbox",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[300]!)),
                child: Row(
                  children: [
                    Container(
                      width: 320,
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(color: Colors.grey[300]!))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Search chat...",
                                    prefixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    contentPadding: EdgeInsets.zero)),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: widget.chats.length,
                              itemBuilder: (context, i) {
                                return ListTile(
                                  selected: _activeChatIndex == i,
                                  selectedTileColor: Colors.blue[50],
                                  leading: CircleAvatar(
                                      backgroundColor: const Color(0xFF1A3D7C),
                                      foregroundColor: Colors.white,
                                      child: Text(widget.chats[i]["name"][0])),
                                  title: Text(widget.chats[i]["name"],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(widget.chats[i]["subject"],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                  onTap: () =>
                                      setState(() => _activeChatIndex = i),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: activeChat == null
                          ? const Center(
                              child:
                                  Text("Select a conversation to start chat"))
                          : Column(
                              children: [
                                ListTile(
                                  title: Text(activeChat["name"],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  subtitle: Text(activeChat["subject"],
                                      style:
                                          const TextStyle(color: Colors.blue)),
                                ),
                                const Divider(height: 1),
                                Expanded(
                                  child: ListView(
                                    padding: const EdgeInsets.all(16),
                                    children: [
                                      _chatBubble(
                                          "Hello, is this item still available for quick pick up?",
                                          "10:10 AM",
                                          false),
                                      _chatBubble(activeChat["lastMsg"],
                                          "10:12 AM", true),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: TextField(
                                              controller: _msgInputController,
                                              decoration: InputDecoration(
                                                  hintText:
                                                      "Write a message...",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 14)))),
                                      const SizedBox(width: 8),
                                      IconButton(
                                          icon: const Icon(Icons.send,
                                              color: Color(0xFF1A3D7C)),
                                          onPressed: () {
                                            if (_msgInputController
                                                .text.isNotEmpty) {
                                              setState(() {
                                                widget.chats[_activeChatIndex]
                                                        ["lastMsg"] =
                                                    _msgInputController.text;
                                                _msgInputController.clear();
                                              });
                                            }
                                          })
                                    ],
                                  ),
                                )
                              ],
                            ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _chatBubble(String text, String time, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: isMe ? const Color(0xFF1A3D7C) : Colors.grey[200],
            borderRadius: BorderRadius.circular(12)),
        child: Text(text,
            style: TextStyle(
                color: isMe ? Colors.white : Colors.black, fontSize: 13)),
      ),
    );
  }
}

// =========================================================
// 3. PICKUP REQUESTS PAGE CODE
// =========================================================
class PickupRequestsPage extends StatelessWidget {
  const PickupRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Pickup Requests",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              children: [
                _buildStatCard("Total Reservations", "5", Colors.black),
                _buildStatCard("Pending", "2", Colors.orange),
                _buildStatCard("Accepted", "1", Colors.blue),
                _buildStatCard("Completed", "1", Colors.green),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("All Reservations",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      DropdownButton<String>(
                        value: "All Status",
                        items: ["All Status", "Pending", "Accepted"]
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (v) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(1.2),
                      1: FlexColumnWidth(2.2),
                      2: FlexColumnWidth(0.8),
                      3: FlexColumnWidth(1.8),
                      4: FlexColumnWidth(1.3),
                      5: FlexColumnWidth(1.8),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                        decoration: BoxDecoration(color: Colors.grey[100]),
                        children: [
                          _tableHeader("Reservation ID"),
                          _tableHeader("Part"),
                          _tableHeader("Qty"),
                          _tableHeader("Buyer"),
                          _tableHeader("Status"),
                          _tableHeader("Actions"),
                        ],
                      ),
                      _buildDataRow(
                          context,
                          "#RES1",
                          "Premium Ceramic Brake Pads",
                          "2",
                          "Ruwan Kumara",
                          "Pending",
                          true),
                      _buildDataRow(
                          context,
                          "#RES2",
                          "Genuine Oil Filter - Toyota",
                          "1",
                          "Chaminda Perera",
                          "Pending",
                          true),
                      _buildDataRow(context, "#RES3", "Gates Timing Belt Kit",
                          "1", "Saman Jayasuriya", "Accepted", false),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Expanded(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey.shade200)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(fontSize: 14, color: Colors.grey)),
              const SizedBox(height: 10),
              Text(value,
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, color: color)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(text,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Color(0xFF1A3D7C))),
    );
  }

  TableRow _buildDataRow(BuildContext context, String id, String part,
      String qty, String buyer, String status, bool showButtons) {
    return TableRow(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFF1F1F1)))),
      children: [
        Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(id,
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold))),
        Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(part, style: const TextStyle(fontSize: 13))),
        Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(qty, style: const TextStyle(fontSize: 13))),
        Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(buyer,
                style: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w500))),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: status == "Pending" ? Colors.orange[50] : Colors.blue[50],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(status,
                style: TextStyle(
                    color: status == "Pending" ? Colors.orange : Colors.blue,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: showButtons
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          elevation: 0),
                      child: const Text("Accept",
                          style: TextStyle(fontSize: 11, color: Colors.white)),
                    ),
                    const SizedBox(width: 4),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          elevation: 0),
                      child: const Text("Reject",
                          style: TextStyle(fontSize: 11, color: Colors.white)),
                    ),
                  ],
                )
              : SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, elevation: 0),
                    child: const Text("Mark Completed",
                        style: TextStyle(fontSize: 11, color: Colors.white)),
                  ),
                ),
        ),
      ],
    );
  }
}*/

import 'package:flutter/material.dart';

// =========================================================
// MAIN DASHBOARD PAGE WITH SIDEBAR NAVIGATION
// =========================================================
class MainDashboardPage extends StatefulWidget {
  const MainDashboardPage({super.key});

  @override
  State<MainDashboardPage> createState() => _MainDashboardPageState();
}

class _MainDashboardPageState extends State<MainDashboardPage> {
  int _selectedIndex = 0; // 0: Add Listing, 1: Messages, 2: Pickup Requests

  // Shared state storage for messages sync
  static List<Map<String, dynamic>> sharedChats = [
    {
      "name": "Ruwan Kumara",
      "subject": "Inquiry about Ceramic Brake Pads",
      "lastMsg": "Hi, is the price negotiable for 2 packs?",
      "isSelected": true
    },
    {
      "name": "Chaminda Perera",
      "subject": "Toyota Oil Filter",
      "lastMsg": "Do you have the genuine one?",
      "isSelected": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // LEFT SIDEBAR MENU
          Container(
            width: 260,
            color: const Color(0xFF1A3D7C), // Dark Blue Brand Theme
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Row(
                    children: [
                      Icon(Icons.directions_car, color: Colors.white, size: 28),
                      SizedBox(width: 10),
                      Text(
                        "Auto-Parts",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.white24, height: 1),
                const SizedBox(height: 15),
                _buildSidebarItem(Icons.add_box, "Add Listing", 0),
                _buildSidebarItem(Icons.mail, "Messages Inbox", 1),
                _buildSidebarItem(Icons.local_shipping, "Pickup Requests", 2),
                const Spacer(),
                const Divider(color: Colors.white24),
                _buildSidebarItem(Icons.logout, "Logout", -1),
                const SizedBox(height: 15),
              ],
            ),
          ),

          // RIGHT SIDE: CONTENT DISPLAY
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                // 1. Add Listing Page
                AddListingPage(onPublishSuccess: (partName) {
                  setState(() {
                    sharedChats.insert(0, {
                      "name": "New Inquiry",
                      "subject": "Regarding: $partName",
                      "lastMsg": "Is this part currently in stock?",
                      "isSelected": false
                    });
                    _selectedIndex =
                        1; // Redirect to Messages page automatically
                  });
                }),

                // 2. Messages Page
                MessagesPage(chats: sharedChats),

                // 3. Pickup Requests Page
                const PickupRequestsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(IconData icon, String title, int index) {
    bool isSelected = _selectedIndex == index;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white.withOpacity(0.15) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon,
            color: isSelected ? Colors.amber : Colors.white70, size: 20),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
        onTap: () {
          if (index != -1) {
            setState(() => _selectedIndex = index);
          }
        },
      ),
    );
  }
}

// =========================================================
// 1. ADD LISTING PAGE CODE (UPDATED WITH VEHICLE BRAND & CATEGORY)
// =========================================================
class AddListingPage extends StatefulWidget {
  final Function(String) onPublishSuccess;
  const AddListingPage({super.key, required this.onPublishSuccess});

  @override
  State<AddListingPage> createState() => _AddListingPageState();
}

class _AddListingPageState extends State<AddListingPage> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();

  String? _selectedPartLabel;
  String? _selectedCategory; // Brand New, Reconditioned, Used
  String? _selectedBrand; // Toyota, Honda, Nissan, etc.
  String? _selectedVehicleType; // Sedan, SUV, Van, Hatchback, etc.

  // Mock variable to simulate image preview (e.g., if you use image_picker bytes)
  dynamic _pickedImage;

  final Map<String, bool> _compatibleModels = {
    "Toyota Corolla": false,
    "Toyota Vitz": false,
    "Toyota Axio": false,
    "Toyota Premio": false,
    "Honda Fit": false,
    "Honda Civic": false,
  };

  // Clear Form Fields
  void _clearForm() {
    _nameController.clear();
    _descController.clear();
    _priceController.clear();
    _stockController.clear();
    setState(() {
      _selectedPartLabel = null;
      _selectedCategory = null;
      _selectedBrand = null;
      _selectedVehicleType = null;
      _pickedImage = null;
      _compatibleModels.updateAll((key, value) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Add Listing",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Add a new spare part to your inventory",
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LEFT FORM SIDE
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      _buildSectionCard("Basic Information", [
                        Row(
                          children: [
                            Expanded(
                              child: _buildDropdownField(
                                "Part Label",
                                "Select part type",
                                [
                                  "Brake System",
                                  "Engine Parts",
                                  "Suspension",
                                  "Transmission",
                                  "Electrical Parts"
                                ],
                                _selectedPartLabel,
                                (v) => setState(() => _selectedPartLabel = v),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildDropdownField(
                                "Condition Category",
                                "Select condition",
                                ["Brand New", "Reconditioned", "Used"],
                                _selectedCategory,
                                (v) => setState(() => _selectedCategory = v),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: _buildDropdownField(
                                "Vehicle Brand",
                                "Select brand (e.g., Toyota)",
                                [
                                  "Toyota",
                                  "Honda",
                                  "Nissan",
                                  "Mitsubishi",
                                  "Suzuki",
                                  "Suzuki Maruti"
                                ],
                                _selectedBrand,
                                (v) => setState(() => _selectedBrand = v),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildDropdownField(
                                "Vehicle Type",
                                "Select type (e.g., Sedan)",
                                [
                                  "Sedan",
                                  "SUV",
                                  "Hatchback",
                                  "Van",
                                  "Lorry",
                                  "Motorbike"
                                ],
                                _selectedVehicleType,
                                (v) => setState(() => _selectedVehicleType = v),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                            "Display Name",
                            "e.g., Premium Ceramic Brake Pads",
                            _nameController),
                        const SizedBox(height: 20),
                        _buildTextField("Description",
                            "Describe the part features...", _descController,
                            maxLines: 4),
                      ]),
                      const SizedBox(height: 20),
                      _buildSectionCard("Compatible Models", [
                        Wrap(
                          spacing: 20,
                          runSpacing: 10,
                          children: _compatibleModels.keys.map((model) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: _compatibleModels[model],
                                  activeColor: const Color(0xFF1A3D7C),
                                  onChanged: (val) => setState(
                                      () => _compatibleModels[model] = val!),
                                ),
                                Text(model,
                                    style: const TextStyle(fontSize: 13)),
                              ],
                            );
                          }).toList(),
                        ),
                      ]),
                      const SizedBox(height: 20),
                      _buildSectionCard("Pricing & Stock", [
                        Row(
                          children: [
                            Expanded(
                                child: _buildTextField(
                                    "Price (LKR)", "0", _priceController,
                                    isNumber: true)),
                            const SizedBox(width: 20),
                            Expanded(
                                child: _buildTextField(
                                    "Stock Quantity", "0", _stockController,
                                    isNumber: true)),
                          ],
                        ),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(width: 30),

                // RIGHT SIDE: IMAGE UPLOAD & ACTIONS
                Expanded(
                  child: Column(
                    children: [
                      // INTERACTIVE IMAGE UPLOAD CONTAINER
                      InkWell(
                        onTap: () {
                          // TODO: Integrate image_picker package here
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Image Selection Triggered! (Integrate Image Picker here)")));
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 260,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: _pickedImage != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(11),
                                  child: Image.memory(_pickedImage,
                                      fit: BoxFit.cover),
                                )
                              : const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add_photo_alternate_outlined,
                                        size: 50, color: Colors.blueGrey),
                                    SizedBox(height: 10),
                                    Text("Upload Image",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 4),
                                    Text("Click to browse PNG, JPG up to 5MB",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey)),
                                  ],
                                ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // PUBLISH BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1A3D7C),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 0,
                          ),
                          onPressed: () {
                            if (_nameController.text.isNotEmpty) {
                              widget.onPublishSuccess(_nameController.text);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Listing Published Successfully!")));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Please enter a Display Name first!")));
                            }
                          },
                          child: const Text("Publish Listing",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // SAVE AS DRAFT BUTTON
                      _buildActionBtn(
                          "Save as Draft", Colors.grey.shade200, Colors.black,
                          () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Saved to Drafts successfully!")));
                      }),
                      const SizedBox(height: 10),

                      // CANCEL BUTTON
                      _buildActionBtn(
                          "Cancel / Reset", Colors.red.shade50, Colors.red, () {
                        _clearForm();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Form fields reset.")));
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard(String title, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6)
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF1A3D7C))),
        const SizedBox(height: 20),
        ...children,
      ]),
    );
  }

  Widget _buildTextField(
      String label, String hint, TextEditingController controller,
      {int maxLines = 1, bool isNumber = false}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      TextField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.all(12)),
      ),
    ]);
  }

  Widget _buildDropdownField(String label, String hint, List<String> items,
      String? val, Function(String?) onChange) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: (val != null && items.contains(val)) ? val : null,
          hint: Text(hint, style: const TextStyle(fontSize: 13)),
          items: items
              .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e, style: const TextStyle(fontSize: 13))))
              .toList(),
          onChanged: onChange,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildActionBtn(
      String txt, Color bg, Color tx, VoidCallback onPressAction) {
    return SizedBox(
        width: double.infinity,
        height: 45,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: bg,
                foregroundColor: tx,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 0),
            onPressed: onPressAction,
            child: Text(txt,
                style: const TextStyle(fontWeight: FontWeight.w600))));
  }
}

// =========================================================
// 2. MESSAGES INBOX PAGE CODE
// =========================================================
class MessagesPage extends StatefulWidget {
  final List<Map<String, dynamic>> chats;
  const MessagesPage({super.key, required this.chats});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final _msgInputController = TextEditingController();
  int _activeChatIndex = 0;

  @override
  Widget build(BuildContext context) {
    var activeChat =
        widget.chats.isNotEmpty ? widget.chats[_activeChatIndex] : null;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Messages Inbox",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[300]!)),
                child: Row(
                  children: [
                    Container(
                      width: 320,
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(color: Colors.grey[300]!))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Search chat...",
                                    prefixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    contentPadding: EdgeInsets.zero)),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: widget.chats.length,
                              itemBuilder: (context, i) {
                                return ListTile(
                                  selected: _activeChatIndex == i,
                                  selectedTileColor: Colors.blue[50],
                                  leading: CircleAvatar(
                                      backgroundColor: const Color(0xFF1A3D7C),
                                      foregroundColor: Colors.white,
                                      child: Text(widget.chats[i]["name"][0])),
                                  title: Text(widget.chats[i]["name"],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(widget.chats[i]["subject"],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                  onTap: () =>
                                      setState(() => _activeChatIndex = i),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: activeChat == null
                          ? const Center(
                              child:
                                  Text("Select a conversation to start chat"))
                          : Column(
                              children: [
                                ListTile(
                                  title: Text(activeChat["name"],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  subtitle: Text(activeChat["subject"],
                                      style:
                                          const TextStyle(color: Colors.blue)),
                                ),
                                const Divider(height: 1),
                                Expanded(
                                  child: ListView(
                                    padding: const EdgeInsets.all(16),
                                    children: [
                                      _chatBubble(
                                          "Hello, is this item still available for quick pick up?",
                                          "10:10 AM",
                                          false),
                                      _chatBubble(activeChat["lastMsg"],
                                          "10:12 AM", true),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: TextField(
                                              controller: _msgInputController,
                                              decoration: InputDecoration(
                                                  hintText:
                                                      "Write a message...",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 14)))),
                                      const SizedBox(width: 8),
                                      IconButton(
                                          icon: const Icon(Icons.send,
                                              color: Color(0xFF1A3D7C)),
                                          onPressed: () {
                                            if (_msgInputController
                                                .text.isNotEmpty) {
                                              setState(() {
                                                widget.chats[_activeChatIndex]
                                                        ["lastMsg"] =
                                                    _msgInputController.text;
                                                _msgInputController.clear();
                                              });
                                            }
                                          })
                                    ],
                                  ),
                                )
                              ],
                            ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _chatBubble(String text, String time, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: isMe ? const Color(0xFF1A3D7C) : Colors.grey[200],
            borderRadius: BorderRadius.circular(12)),
        child: Text(text,
            style: TextStyle(
                color: isMe ? Colors.white : Colors.black, fontSize: 13)),
      ),
    );
  }
}

// =========================================================
// 3. PICKUP REQUESTS PAGE CODE
// =========================================================
class PickupRequestsPage extends StatelessWidget {
  const PickupRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Pickup Requests",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              children: [
                _buildStatCard("Total Reservations", "5", Colors.black),
                _buildStatCard("Pending", "2", Colors.orange),
                _buildStatCard("Accepted", "1", Colors.blue),
                _buildStatCard("Completed", "1", Colors.green),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("All Reservations",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      DropdownButton<String>(
                        value: "All Status",
                        items: ["All Status", "Pending", "Accepted"]
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (v) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(1.2),
                      1: FlexColumnWidth(2.2),
                      2: FlexColumnWidth(0.8),
                      3: FlexColumnWidth(1.8),
                      4: FlexColumnWidth(1.3),
                      5: FlexColumnWidth(1.8),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                        decoration: BoxDecoration(color: Colors.grey[100]),
                        children: [
                          _tableHeader("Reservation ID"),
                          _tableHeader("Part"),
                          _tableHeader("Qty"),
                          _tableHeader("Buyer"),
                          _tableHeader("Status"),
                          _tableHeader("Actions"),
                        ],
                      ),
                      _buildDataRow(
                          context,
                          "#RES1",
                          "Premium Ceramic Brake Pads",
                          "2",
                          "Ruwan Kumara",
                          "Pending",
                          true),
                      _buildDataRow(
                          context,
                          "#RES2",
                          "Genuine Oil Filter - Toyota",
                          "1",
                          "Chaminda Perera",
                          "Pending",
                          true),
                      _buildDataRow(context, "#RES3", "Gates Timing Belt Kit",
                          "1", "Saman Jayasuriya", "Accepted", false),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Expanded(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey.shade200)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(fontSize: 14, color: Colors.grey)),
              const SizedBox(height: 10),
              Text(value,
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, color: color)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(text,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Color(0xFF1A3D7C))),
    );
  }

  TableRow _buildDataRow(BuildContext context, String id, String part,
      String qty, String buyer, String status, bool showButtons) {
    return TableRow(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFF1F1F1)))),
      children: [
        Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(id,
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold))),
        Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(part, style: const TextStyle(fontSize: 13))),
        Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(qty, style: const TextStyle(fontSize: 13))),
        Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(buyer,
                style: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w500))),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: status == "Pending" ? Colors.orange[50] : Colors.blue[50],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(status,
                style: TextStyle(
                    color: status == "Pending" ? Colors.orange : Colors.blue,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: showButtons
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          elevation: 0),
                      child: const Text("Accept",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ],
                )
              : const Text("-", textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
