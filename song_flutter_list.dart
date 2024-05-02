import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Song {
  final String name;
  final String image;
  final String category;
  final String description;

  Song({required this.name, required this.image, required this.category, required this.description});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Songs App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Song> songs = [
    Song(
      name: 'Song 1',
      image: 'https://via.placeholder.com/150',
      category: 'Bollywood',
      description: 'Description of Song 1',
    ),
    Song(
      name: 'Song 2',
      image: 'https://via.placeholder.com/150',
      category: 'Hollywood',
      description: 'Description of Song 2',
    ),
    Song(
      name: 'Song 3',
      image: 'https://via.placeholder.com/150',
      category: 'Tollywood',
      description: 'Description of Song 3',
    ),
    Song(
      name: 'Song 4',
      image: 'https://via.placeholder.com/150',
      category: 'Bollywood',
      description: 'Description of Song 4',
    ),
    Song(
      name: 'Song 5',
      image: 'https://via.placeholder.com/150',
      category: 'Hollywood',
      description: 'Description of Song 5',
    ),
    Song(
      name: 'Song 6',
      image: 'https://via.placeholder.com/150',
      category: 'Tollywood',
      description: 'Description of Song 6',
    ),
    Song(
      name: 'Song 7',
      image: 'https://via.placeholder.com/150',
      category: 'Bollywood',
      description: 'Description of Song 7',
    ),
    Song(
      name: 'Song 8',
      image: 'https://via.placeholder.com/150',
      category: 'Hollywood',
      description: 'Description of Song 8',
    ),
    Song(
      name: 'Song 9',
      image: 'https://via.placeholder.com/150',
      category: 'Tollywood',
      description: 'Description of Song 9',
    ),
    Song(
      name: 'Song 10',
      image: 'https://via.placeholder.com/150',
      category: 'Bollywood',
      description: 'Description of Song 10',
    ),
    // Add more songs as needed
  ];

  String currentCategory = 'All';

  @override
  Widget build(BuildContext context) {
    List<Song> filteredSongs = currentCategory == 'All'
        ? songs
        : songs.where((song) => song.category == currentCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Songs'),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildCategoryButton('All'),
                buildCategoryButton('Bollywood'),
                buildCategoryButton('Hollywood'),
                buildCategoryButton('Tollywood'),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: filteredSongs.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Image.network(
                          filteredSongs[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              filteredSongs[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              filteredSongs[index].description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryButton(String category) {
    return TextButton(
      onPressed: () {
        setState(() {
          currentCategory = category;
        });
      },
      child: Text(category),
    );
  }
}
