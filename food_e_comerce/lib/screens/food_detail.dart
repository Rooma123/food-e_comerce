import 'package:flutter/material.dart';
import '../classesanddata/app_data.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> args = ModalRoute.of(context)!.settings.arguments as List<dynamic>;

    final String id = args[0];
    final String title = args[1];
    final String image = args[2];
    final String price = args[3];
    final double rating = args[4];

    // Retrieve the filtered food item by ID
     getFilteredFood(String id) {
      return catigories_data.firstWhere((item) => item.id == id);
    }

    final filteredFood = getFilteredFood(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with rounded corners
            Container(
              width: double.infinity,
              height: 250,
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Buttons for Favorite and Add to Cart
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add to favorite functionality
                    },
                    icon: Icon(Icons.favorite_border, color: Colors.red),
                    label: Text('Favorite'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 4,
                      shadowColor: Colors.black45,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add to cart functionality
                    },
                    icon: Icon(Icons.shopping_cart_outlined, color: Colors.deepOrange),
                    label: Text('Add to Cart'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 4,
                      shadowColor: Colors.black45,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Price and rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price: $price',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 24),
                      SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Ingredients and tags
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingredients',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    filteredFood.ingredients,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Tags',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    filteredFood.tags.join(", "),
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Sizes Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sizes',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildSizeOption('Small'),
                      _buildSizeOption('Medium'),
                      _buildSizeOption('Large'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Extras
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Extras: ${filteredFood.extra}',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),

            // Reviews Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reviews',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  for (String review in filteredFood.reviews)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text('- $review'),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Calories and Allergens Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Calories: ${filteredFood.calories} kcal',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Allergens: ${filteredFood.allergens.join(", ")}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.redAccent),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),

            // Add to Cart Button at the bottom
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity, // Button takes full width
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Add to cart functionality
                  },
                  icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
                  label: Text('Add to Cart'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    elevation: 4,
                    shadowColor: Colors.black45,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Extra space at the bottom
          ],
        ),
      ),
    );
  }

  // Helper method to create size options
  Widget _buildSizeOption(String size) {
    return InkWell(
      onTap: () {
        // Handle size selection
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          size,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
