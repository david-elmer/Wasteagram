import 'package:test/test.dart';
import 'package:intl/intl.dart';
import 'package:wasteagram/models/food_waste_post.dart';

// adapted from exploration 10 - 1.1 video 
void main() {
  test('Post created with fromMap constructor saves attributes correctly', () {
    final date = DateFormat('EEE, MMMM dd, yyyy').format(DateTime.now());
    const imageURL = 'test_url';
    const quantity = 5;
    const latitude = 40.7128;
    const longitude = 74.0060;

    final foodWastePost = FoodWastePost.fromMap({
      'date' : date,
      'imageURL': imageURL,
      'quantity': quantity,
      'latitude': latitude,
      'longitude': longitude
    });

    expect(foodWastePost.date, date);
    expect(foodWastePost.imageURL, imageURL);
    expect(foodWastePost.quantity, quantity);
    expect(foodWastePost.latitude, latitude);
    expect(foodWastePost.longitude, longitude);
  });

  test('toMap function returns map.', () {
    final date = DateFormat('EEE, MMMM dd, yyyy').format(DateTime.now());
    const imageURL = 'test_url';
    const quantity = 5;
    const latitude = 40.7128;
    const longitude = 74.0060;

    var foodWastePost = FoodWastePost();

    foodWastePost.date = date;
    foodWastePost.imageURL = imageURL;
    foodWastePost.quantity = quantity;
    foodWastePost.latitude = latitude;
    foodWastePost.longitude = longitude;

    expect(foodWastePost.toMap(), isMap);
  });

  test('toMap function returns map with appropriate values', () {
    final date = DateFormat('EEE, MMMM dd, yyyy').format(DateTime.now());
    const imageURL = 'test_url';
    const quantity = 5;
    const latitude = 40.7128;
    const longitude = 74.0060;


    var foodWastePost = FoodWastePost();

    foodWastePost.date = date;
    foodWastePost.imageURL = imageURL;
    foodWastePost.quantity = quantity;
    foodWastePost.latitude = latitude;
    foodWastePost.longitude = longitude;

    Map<String, dynamic> expected = {
      'date': date,
      'imageURL': imageURL,
      'quantity': quantity,
      'latitude' : latitude,
      'longitude': longitude
    };

    expect(foodWastePost.toMap(), expected);
  });

}