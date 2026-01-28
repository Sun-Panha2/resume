import 'package:flutter/material.dart';

void main() {
  runApp(const ResumeApp());
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResumePage(),
    );
  }
}

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 850;

          return Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1100),
              color: Colors.white,
              child: Column(
                children: [
                  header(isMobile),
                  Expanded(
                    child: isMobile
                        ? SingleChildScrollView(
                            child: Column(
                              children: [leftPanel(), rightPanel()],
                            ),
                          )
                        : Row(
                            children: [
                              leftPanel(),
                              Expanded(child: rightPanel()),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ================= HEADER =================
  Widget header(bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFF123A5A),
      child: isMobile
          ? Column(children: headerContent(isMobile))
          : Row(children: headerContent(isMobile)),
    );
  }

  List<Widget> headerContent(bool isMobile) {
    return [
      Container(
        width: 110,
        height: 130,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 3),
        ),
        child: Image.asset("assets/profile.jpg", fit: BoxFit.cover),
      ),
      const SizedBox(width: 16, height: 16),
      Column(
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: const [
          Text(
            "SOEUNKU SOVATHA",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            "TELECOMMUNICATION AND NETWORKING",
            style: TextStyle(color: Colors.white70),
          ),
          Text("STUDENT", style: TextStyle(color: Colors.white70)),
        ],
      ),
    ];
  }

  // ================= LEFT PANEL =================
  Widget leftPanel() {
    return Container(
      width: 300,
      color: Colors.grey[200],
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            section("CONTACT"),
            iconText(Icons.phone, "+855 939 158 55"),
            iconText(Icons.email, "konnearytha@gmail.com"),
            iconText(Icons.location_on, "GVVN4+V26, St.114"),
            iconText(Icons.public, "093915855 / Soeunku Sovatha"),

            section("SKILLS"),
            iconTitle(Icons.build, "Technical Skills"),
            bullet("Cisco Packet Tracer (Basic)"),
            bullet("Router/Switch Configuration"),
            bullet("IP Addressing & Subnetting"),
            bullet("Object-Oriented Programming (Java)"),
            bullet("Linux Command-line Basics"),
            bullet("Microsoft Office"),

            iconTitle(Icons.people, "Soft Skills"),
            bullet("Teamwork & Collaboration"),
            bullet("Problem Solving"),
            bullet("Time Management"),
            bullet("Good Communication"),

            section("LANGUAGES"),
            iconText(Icons.language, "Khmer: Mother Tongue"),
            iconText(Icons.language, "English: Intermediate (B1)"),

            section("REFERENCES"),
            iconText(Icons.person, "Dr. SRENG Sokchenda"),
            iconText(Icons.school, "Institute of Technology of Cambodia"),
            iconText(Icons.phone, "+85512407910"),
          ],
        ),
      ),
    );
  }

  // ================= RIGHT PANEL =================
  Widget rightPanel() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            iconSection(Icons.person, "PROFILE"),
            paragraph(
              "Motivated and detail-oriented third-year Telecommunication and "
              "Network Engineering student with a strong foundation in networking, "
              "routing, and switching. Familiar with Cisco Packet Tracer and basic "
              "configuration of routers and switches. Eager to apply academic "
              "knowledge in a real-world setting and contribute to a dynamic "
              "engineering team through an internship opportunity.",
            ),

            iconSection(Icons.work, "WORK EXPERIENCE"),
            bold("Arduino Attendance System"),
            text("School Project – 2024"),
            bullet(
              "Developed an attendance scanning system using Arduino and RFID",
            ),
            bullet(
              "Programmed the system to read RFID cards and log student ID with timestamps",
            ),
            bullet(
              "Displayed scan results on an LCD and stored data for attendance tracking",
            ),
            bullet(
              "Gained hands-on experience in microcontroller programming and hardware integration",
            ),

            bold("Student Management System (Data Structures)"),
            text("Course Project – 2023"),
            bullet("Designed and implemented a console-based system using C++"),
            bullet(
              "Applied data structures such as linked lists and binary search trees",
            ),
            bullet(
              "Enabled functionalities like adding, deleting, searching, and sorting student records",
            ),

            bold("Assistant – Family Business (Wing Agent)"),
            bullet("Supported daily operations at a local Wing agent"),
            bullet("Handled mobile payments, transfers, and bill services"),
            bullet("Managed bookkeeping, transaction logs, and cash balancing"),
            bullet("Improved interpersonal and problem-solving skills"),

            iconSection(Icons.school, "EDUCATION"),
            bold("Bachelor of Engineering in Telecommunication and Network"),
            text("Institute of Technology of Cambodia (ITC)"),
            text("2022 – Present"),
            bullet(
              "Relevant Coursework: Network Fundamentals, Routing & Switching",
            ),
            bullet("Arduino Training for Students (Graduated)"),

            bold("High School Diploma"),
            text("Hun Sen Balang High School, Kampong Thom"),
            text("Graduated: 2022"),

            bold("Basic Networking & Cybersecurity – ETEC Center"),
            text("In progress (2025)"),
            bullet(
              "Studying IP addressing, routing, and cybersecurity fundamentals",
            ),
            bullet(
              "Learning firewalls, network attacks, and protection methods",
            ),
          ],
        ),
      ),
    );
  }

  // ================= HELPERS =================
  Widget section(String text) => Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 8),
    child: Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        letterSpacing: 1,
      ),
    ),
  );

  Widget iconSection(IconData icon, String text) => Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 8),
    child: Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            letterSpacing: 1,
          ),
        ),
      ],
    ),
  );

  Widget iconTitle(IconData icon, String text) => Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 4),
    child: Row(
      children: [
        Icon(icon, size: 16),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    ),
  );

  Widget iconText(IconData icon, String text) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: Colors.grey[700]),
        const SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    ),
  );

  Widget bold(String text) => Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 4),
    child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
  );

  Widget text(String text) =>
      Padding(padding: const EdgeInsets.only(bottom: 4), child: Text(text));

  Widget bullet(String text) => Padding(
    padding: const EdgeInsets.only(left: 10, bottom: 4),
    child: Text("• $text"),
  );

  Widget paragraph(String text) =>
      Padding(padding: const EdgeInsets.only(bottom: 10), child: Text(text));
}
