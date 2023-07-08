import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:crud_app/widget/sidebar.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Person> persons = [
    Person('Ogan'),
    Person('Alif GOKIL GONRONG DEKIL'),
    Person('HUSEN'),
    Person('ADI'),
    Person('Iksan')
  ];

  List<AbsensiReport> reports = [];

  void absen(int index) {
    final currentTime = DateTime.now();
    setState(() {
      persons[index].isAbsent = true;
      persons[index].absentTime = currentTime;
    });
  }

  void generateReport() {
    final currentDate = DateTime.now();
    final report = AbsensiReport(currentDate, List.from(persons));
    setState(() {
      reports.add(report);
      persons.forEach((person) {
        person.isAbsent = false;
        person.absentTime = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
      ),
      drawer: Sidebar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Daftar Nama:',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: persons.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    persons[index].name,
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(persons[index].formattedAbsentTime),
                  trailing: persons[index].isAbsent
                      ? Text(
                          'Sudah Absen',
                          style: TextStyle(color: Colors.black),
                        )
                      : ElevatedButton(
                          onPressed: () => absen(index),
                          style: ElevatedButton.styleFrom(
                            primary: Colors
                                .orange, // Ubah warna latar belakang tombol di sini
                          ),
                          child: Text(
                            'Absen',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                );
              },
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: generateReport,
              style: ElevatedButton.styleFrom(
                primary:
                    Colors.yellow, // Ubah warna latar belakang tombol di sini
              ),
              child: Text(
                'Generate Laporan',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Laporan Absensi:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: reports.length,
              itemBuilder: (context, index) {
                final report = reports[index];
                return ListTile(
                  title: Text(
                    DateFormat('dd/MM/yyyy').format(report.date),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: report.persons
                        .map((person) => Text(
                              '${person.name}: ${person.isAbsent ? 'Hadir' : 'Belum Hadir'}',
                              style: TextStyle(fontSize: 16),
                            ))
                        .toList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
