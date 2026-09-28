import 'package:flutter/material.dart';

class Watsapui extends StatefulWidget {
  const Watsapui({super.key});

  @override
  State<Watsapui> createState() => _WatsapuiState();
}

class _WatsapuiState extends State<Watsapui> {
  List<Map<String, dynamic>> data = [
    {
      'name': 'Talha',
      'msg': 'How are you?',
      'time': '12:00',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTfCnpTx84kPBerrKctOBV19Rj4GbcFTBZif8gJ8Cy1g&s=10',
    },
    {
      'name': 'husnnain',
      'msg': 'mubarik ho aoko',
      'time': '10:00',
      'image':
          'https://clickpakistan.org/wp-content/uploads/2021/12/Katora-Lake...-768x768.jpg',
    },
    {
      'name': 'zaid',
      'msg': 'kider ho?',
      'time': '1:00',
      'image':
          'https://mooddp.com/wp-content/uploads/2025/11/simple-profile-pic-for-boys.jpg',
    },
    {
      'name': 'osama',
      'msg': 'apka kam hogaya',
      'time': '12:47',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDAcL_4t9zCoWZOUVZ9kJmfJBGpLYcavBuokdL-q5bQSmARrAOQk5c0w-d&s=10',
    },
    {
      'name': 'muqsit',
      'msg': 'aj class kab start hogi?',
      'time': '11:00',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD16Pj0W1P0zUDUEFxyRWNkS9tPLFWVzWNs0dpfVRet7do1f8GORM33U0&s=10',
    },
    {
      'name': 'abbass',
      'msg': 'program ba kala koo',
      'time': '4:27',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiXKA7f80BKiAcyAaAUY75NWd1CqYB5BVZ8FCDfhD-487FVjNuBcX-Wbg&s=10',
    },
    {
      'name': 'haroon',
      'msg': 'Salam o alikum',
      'time': '2:00',
      'image':
          'https://cdn.britannica.com/47/188747-050-1D34E743/Bill-Gates-2011.jpg',
    },
    {
      'name': 'sana',
      'msg': 'hey!',
      'time': '11:00',
      'image':
          'https://yt3.googleusercontent.com/ytc/AIdro_lEeZP6Urk3JhCp_BnVamf57KSdAv-ZJb2nJqHmW-8ZIuM=s900-c-k-c0x00ffffff-no-rj',
    },
    {
      'name': 'sabila',
      'msg': 'ok',
      'time': '10:00',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR98h6Dlaq7zUz_4RSUmi-A2rY1XpE10N9hql9I7Fr3rw&s=10',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Whatsapp', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(data[index]['image'].toString()),
            ),
            title: Text(data[index]['name']),
            subtitle: Text(data[index]['msg']),
            trailing: Text(data[index]['time']),
          );
        },
      ),
    );
  }
}
