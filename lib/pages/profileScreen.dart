import 'package:flutter/material.dart';
import '../widgets/theme.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _profileImageUrl =
      "https://unsplash.com/photos/man-in-black-hoodie-wearing-black-framed-eyeglasses-3JmfENcL24M"; // Replace with your image URL
  TextEditingController _nameController =
      TextEditingController(text: "John Doe");
  TextEditingController _phoneNumberController =
      TextEditingController(text: "+1234567890");
  TextEditingController _emailController =
      TextEditingController(text: "johndoe@example.com");
  TextEditingController _addressController =
      TextEditingController(text: "123 Main St");
  TextEditingController _cityController =
      TextEditingController(text: "Cityville");
  TextEditingController _zipcodeController =
      TextEditingController(text: "12345");
  TextEditingController _pincodeController =
      TextEditingController(text: "67890");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200], // Background color for the profile section
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/man.jpg'),
                ),
              ),
              SizedBox(height: 20),
              _buildEditableField(Icons.person, 'Name', _nameController),
              _buildEditableField(
                  Icons.phone, 'Phone Number', _phoneNumberController),
              _buildEditableField(Icons.email, 'Email', _emailController),
              _buildEditableField(
                  Icons.location_on, 'Address', _addressController),
              _buildEditableField(Icons.location_city, 'City', _cityController),
              _buildEditableField(
                  Icons.location_on_outlined, 'Zipcode', _zipcodeController),
              _buildEditableField(
                  Icons.location_pin, 'Pincode', _pincodeController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _updateProfile(); // Handle update profile button press
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MyTheme.darkBluishColor),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text('Update Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField(
      IconData icon, String title, TextEditingController controller) {
    return ListTile(
      tileColor: Colors.white, // Background color for each ListTile
      leading: Icon(icon),
      title: Text(title),
      subtitle: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Enter $title',
        ),
      ),
    );
  }

  void _updateProfile() {
    // Perform update logic here
    String name = _nameController.text;
    String phoneNumber = _phoneNumberController.text;
    String email = _emailController.text;
    String address = _addressController.text;
    String city = _cityController.text;
    String zipcode = _zipcodeController.text;
    String pincode = _pincodeController.text;

    // Example: Update profile in backend/database
    // Replace with your actual update logic

    // Show confirmation message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile updated successfully')),
    );
  }
}
