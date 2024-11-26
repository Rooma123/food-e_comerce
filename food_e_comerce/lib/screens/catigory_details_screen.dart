import 'package:flutter/material.dart';
import '../classesanddata/app_data.dart';

class CatigoryDetails extends StatelessWidget {
  // Function to navigate to the food detail page
  void foodDetail(BuildContext context, String id, String title, String image, String price, double rating) {
    Navigator.of(context).pushNamed(
      "fooddetail",
      arguments: [id, title, image, price, rating],
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> args = ModalRoute.of(context)!.settings.arguments as List<String>;

    final String id = args[0];
    final String title = args[1];
    final String image = args[2];

    // Function to filter categories based on the category ID
    List getFilteredCategories(String catigoryId) {
      return catigories_data.where((item) => item.catigory == catigoryId).toList();
    }

    final filteredCategories = getFilteredCategories(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top image with rounded corners
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
            SizedBox(height: 10),

            // Section header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Popular Items',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            SizedBox(height: 10),

            // List of items
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: filteredCategories.length,
              itemBuilder: (context, index) {
                final item = filteredCategories[index];
                return InkWell(
                  onTap: () {
                    foodDetail(context, item.id, item.title, item.image, item.price, item.rating);
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          item.image,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price: ${item.price}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 18),
                                SizedBox(width: 4),
                                Text(
                                  '${item.rating}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
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
