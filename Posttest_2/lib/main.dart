import 'package:flutter/material.dart';

void main() {
  runApp(const ReadEraWireframe());
}

class ReadEraWireframe extends StatelessWidget {
  const ReadEraWireframe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ReadEra Wireframe",
      home: Scaffold(
        appBar: AppBar(title: const Text("Wireframe ReadEra Clone")),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // ==== Login Page ====
            _phoneFrame("Login / Sign Up Page", Column(
              children: [
                Row(
                  children: const [
                    Icon(Icons.menu, color: Colors.grey),
                    SizedBox(width: 8),
                    Text("Login / Sign Up", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Login", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 20),
                    Text("Sign Up", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 20),
                _greyBox(height: 40, label: "Email"),
                const SizedBox(height: 10),
                _greyBox(height: 40, label: "Password"),
                const SizedBox(height: 20),
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: const Text("Login"),
                ),
              ],
            )),

            // ==== Main Page ====
            const SizedBox(height: 30),
            _phoneFrame("Reading Now Page", Column(
              children: [
                Row(
                  children: const [
                    Icon(Icons.menu, color: Colors.grey),
                    SizedBox(width: 8),
                    Text("Reading Now", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 20),
                _bookList(),
              ],
            )),
            
            // ==== Book Details Page ====
            const SizedBox(height: 30),
            _phoneFrame("Book Details Page", Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.menu, color: Colors.grey),
                    SizedBox(width: 8),
                    Text("Book Details", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 20),
                _greyBox(height: 150, width: 100, label: "Book Cover"),
                const SizedBox(height: 10),
                _greyBox(height: 20, label: "Book Title"),
                const SizedBox(height: 5),
                _greyBox(height: 15, label: "Author"),
                const SizedBox(height: 5),
                _greyBox(height: 15, label: "EPUB, Size"),
              ],
            )),

            // ==== Information Page ====
            const SizedBox(height: 30),
            _phoneFrame("Book Info Page", Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.menu, color: Colors.grey),
                    SizedBox(width: 8),
                    Text("Book Info", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 20),
                _greyBox(height: 20, label: "Book Language"),
                const SizedBox(height: 5),
                _greyBox(height: 20, label: "Collections"),
                const SizedBox(height: 5),
                _greyBox(height: 20, label: "Genres"),
                const SizedBox(height: 5),
                _greyBox(height: 20, label: "File Info"),
              ],
            )),

            const SizedBox(height: 30),

            // ==== Page for Reading ====
            _phoneFrame("Reader Page", Column(
              children: [
                Row(
                  children: const [
                    Icon(Icons.menu, color: Colors.grey),
                    SizedBox(width: 8),
                    Text("Reader", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 20),
                _greyBox(height: 350, label: "Page Content"),
                const Spacer(),
                _greyBox(height: 20, label: "Progress Bar (1 of 288)"),
              ],
            )),

            // ==== Bookmark Page ====
            const SizedBox(height: 30),
            _phoneFrame("Navigation Drawer", Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(8, (i) =>
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _greyBox(height: 20, label: "Menu Item ${i+1}"),
                )
              ),
            )),
          ],
        ),
      ),
    );
  }

  // ==== Frame Phone ====
  static Widget _phoneFrame(String title, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        // Size of the frame
        Container(
          width: 250,
          height: 500,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Expanded(child: child),
            ],
          ),
        ),
      ],
    );
  }

  // ==== Box For Icons and Text ====
  static Widget _greyBox({double height = 40, double? width, String label = ""}) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      color: Colors.grey[300],
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(label, style: TextStyle(color: Colors.grey[700])),
    );
  }

  // ==== For making the 3 books on the main page ==== dummy
  static Widget _bookList() {
    return Column(
      children: List.generate(3, (i) =>
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              _greyBox(height: 80, width: 60, label: "Cover"),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _greyBox(height: 20, label: "Book ${i+1} Title"),
                    const SizedBox(height: 5),
                    _greyBox(height: 15, label: "Author"),
                    const SizedBox(height: 5),
                    _greyBox(height: 15, label: "EPUB, Size"),
                  ],// hurray
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}