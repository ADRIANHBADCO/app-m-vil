import 'package:flutter/material.dart';

class CategoriasProductos extends StatelessWidget {
  final List<Category> categories = [
    Category('Alimentos', 'images/alimento.jpg'),
    Category('Suplementos', 'images/suplemento.jpeg'),
    Category('Accesorios', 'images/accesorio.jpg'),
    Category('Vitaminas', 'images/vitaminas.jpg'),
    Category('Ropa', 'images/ropa.jpg'),
    Category('Higiene', 'images/higiene.jpg'),
  ];

  CategoriasProductos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categorías',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFB0404),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}

class Category {
  final String name;
  final String imageUrl;

  Category(this.name, this.imageUrl);
}

class CategoryCard extends StatelessWidget {
  final Category category;

  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          // Agrega aquí la acción que deseas realizar al hacer clic en una categoría.
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              category.imageUrl,
              width: 150,
              height: 150,
            ),
            SizedBox(height: 10),
            Text(
              category.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
