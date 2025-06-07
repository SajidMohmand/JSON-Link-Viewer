import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_json_view/flutter_json_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ViewJsonScreen extends StatefulWidget {
  final String url;

  const ViewJsonScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<ViewJsonScreen> createState() => _ViewJsonScreenState();
}

class _ViewJsonScreenState extends State<ViewJsonScreen> {
  late Future<Map<String, dynamic>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = getData(); // ✅ Initialize it here
  }

  Future<Map<String, dynamic>> getData() async {
    final response = await http.get(Uri.parse(widget.url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ViewJson App",
          style: GoogleFonts.eduNswActFoundation(
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("No data found."));
          } else {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: JsonView.map(snapshot.data!),
            );
          }
        },
      ),
    );
  }
}
