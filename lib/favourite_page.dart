import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final List<String> favorites;

  FavoritesPage({required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: _buildFavoritesList(),
    );
  }
  // Fav list
  Widget _buildFavoritesList() {
    if (favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet!'),
      );
    } else {
      return ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return _buildFavoriteItem(favorites[index]);
        },
      );
    }
  }
  // Fav items
  Widget _buildFavoriteItem(String favorite) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.favorite, color: Colors.red),
        title: Text(favorite),
      ),
    );
  }
}
