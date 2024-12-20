import 'package:dance_studio/accountsettings.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'splash_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color of the screen
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0), // Horizontal padding for the entire screen
        child: Column(
          children: [
            const SizedBox(height: 120), // Space above the profile picture
            // Profile Picture with Border
            Container(
              padding: const EdgeInsets.all(5), // Padding inside the circle
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Shape of the container
                border: Border.all(
                  color: const Color(0xFF9CA3AF), // Border color
                  width: 2.5, // Border width
                ),
              ),
              child: const CircleAvatar(
                radius: 46, // Radius of the circle
                backgroundImage: AssetImage('assets/images/Avatar.png'), // Profile image
              ),
            ),
            const SizedBox(height: 8), // Space between picture and name
            const Text(
              'Bea A',
              style: TextStyle(
                fontSize: 18, // Font size
                fontWeight: FontWeight.bold, // Font weight
              ),
            ),
            const SizedBox(height: 16), // Space between name and containers
            // New UI Containers
            _buildCustomContainers(context),
            const SizedBox(height: 16), // Space between containers and list
            // Settings List
            _buildSettingsList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomContainers(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width - 12; // Calculate container width

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the row
          children: [
            _buildPackagePlanContainer(context, containerWidth),
            const SizedBox(width: 8), // Space between containers
            _buildWalletCreditContainer(containerWidth),
          ],
        ),
        const SizedBox(height: 8), // Space between rows
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the row
          children: [
            _buildInfoContainer("Total Classes", containerWidth),
            const SizedBox(width: 8), // Space between containers
            _buildInfoContainer("Monthly Classes", containerWidth),
            const SizedBox(width: 8), // Space between containers
            _buildInfoContainer("Goals", containerWidth),
          ],
        ),
      ],
    );
  }

  Widget _buildPackagePlanContainer(BuildContext context, double width) {
    return Container(
      width: width / 2 - 4, // Width of the container
      padding: const EdgeInsets.all(6), // Padding inside the container
      decoration: BoxDecoration(
        color: const Color(0x0D696969), // Background color with 5% opacity
        borderRadius: BorderRadius.circular(4), // Border radius
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Align items to center vertically
        children: [
          Container(
            width: 60, // Width of the circle outline
            height: 60, // Height of the circle outline
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Shape of the outline
              border: Border.all(
                color: Colors.grey[300]!, // Outline color
                width: 3.5, // Outline width
              ),
            ),
            child: Center(
              child: SizedBox(
                width: 44, // Manually set the width of the image
                height: 44, // Manually set the height of the image
                child: Image.asset('assets/images/dance-3.png'), // Image inside the circle
              ),
            ),
          ),
          const SizedBox(width: 8), // Space between icon and text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
              children: [
                // Text for "Package Plan"
                const Text(
                  "Package Plan",
                  style: TextStyle(
                    fontFamily: 'SF-Pro-Display', // Font family
                    fontSize: 16, // Font size
                    fontWeight: FontWeight.w600, // Font weight
                    color: Colors.black, // Text color
                  ),
                ),
                // Clickable text for "Avail Now →"
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()), // Navigate to HomeScreen
                    );
                  },
                  child: const Text(
                    "Avail Now →",
                    style: TextStyle(
                      fontFamily: 'SF-Pro-Display', // Font family
                      fontSize: 14, // Font size
                      fontWeight: FontWeight.w600, // Font weight
                      color: Color(0xFFE84479), // Text color
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWalletCreditContainer(double width) {
    return Container(
      width: width / 2 - 4, // Width of the container
      padding: const EdgeInsets.all(6), // Padding inside the container
      decoration: BoxDecoration(
        color: const Color(0x0D696969), // Background color with 5% opacity
        borderRadius: BorderRadius.circular(4), // Border radius
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Align items to center vertically
        children: [
          Container(
            width: 60, // Width of the circle outline
            height: 60, // Height of the circle outline
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Shape of the outline
              border: Border.all(
                color: Colors.grey[300]!, // Outline color
                width: 3.5, // Outline width
              ),
            ),
            child: const Center(
              child: Text(
                "\$0",
                style: TextStyle(
                  fontFamily: 'SF-Pro-Display', // Font family
                  fontSize: 18, // Font size
                  fontWeight: FontWeight.w600, // Font weight
                  color: Colors.black, // Text color
                ),
              ),
            ),
          ),
          const SizedBox(width: 8), // Space between icon and text
          const Expanded(
            child: Text(
              "Wallet Credit",
              style: TextStyle(
                fontFamily: 'SF-Pro-Display', // Font family
                fontSize: 16, // Font size
                fontWeight: FontWeight.w600, // Font weight
                color: Colors.black, // Text color
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoContainer(String title, double width) {
    return Container(
      width: width / 3 - 5.33, // Width of the container
      padding: const EdgeInsets.all(6), // Padding inside the container
      decoration: BoxDecoration(
        color: const Color(0x0D696969), // Background color with 5% opacity
        borderRadius: BorderRadius.circular(4), // Border radius
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Align items to center vertically
        children: [
          Container(
            width: 40, // Width of the circle outline
            height: 40, // Height of the circle outline
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Shape of the outline
              border: Border.all(
                color: Colors.grey[300]!, // Outline color
                width: 2.5, // Outline width
              ),
            ),
            child: const Center(
              child: Text(
                "0",
                style: TextStyle(
                  fontFamily: 'SF-Pro-Display', // Font family
                  fontSize: 18, // Font size
                  fontWeight: FontWeight.w600, // Font weight
                  color: Colors.black, // Text color
                ),
              ),
            ),
          ),
          const SizedBox(width: 8), // Space between icon and text
          Expanded(
            child: Text(
              title,
              maxLines: 2, // Allow text to wrap into two lines
              overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
              style: const TextStyle(
                fontFamily: 'SF-Pro-Display', // Font family
                fontSize: 14, // Font size
                fontWeight: FontWeight.w600, // Font weight
                color: Colors.black, // Text color
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        children: [
          _buildSettingsItem('assets/images/settings.png', "Account Settings", context, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AccountSettings()),
            );
          }),
          const SizedBox(height: 20),
          _buildSettingsItem('assets/images/history.png', "Booking History", context, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }),
          const SizedBox(height: 20),
          _buildSettingsItem('assets/images/payment.png', "Payment", context, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }),
          const SizedBox(height: 20),
          _buildSettingsItem('assets/images/about.png', "About", context, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }),
          const SizedBox(height: 20),
          _buildSettingsItem('assets/images/privacy.png', "Privacy, Terms and Conditions", context, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }),
          const SizedBox(height: 20),
          _buildSettingsItem('assets/images/help.png', "Help & FAQs", context, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }),
          const SizedBox(height: 20),
          _buildSettingsItem('assets/images/logout.png', "Log out", context, () async {
            // Perform logout operations here
            // await FirebaseAuth.instance.signOut(); // Uncomment if using Firebase
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SplashScreen()), // Navigate to SplashScreen
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(String imagePath, String title, BuildContext context, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                imagePath, // Image on the left
                width: 24, // Set the width of the image
                height: 24, // Set the height of the image
              ),
              const SizedBox(width: 16), // Space between image and text
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'SF-Pro-Display',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF9CA3AF),
            size: 16,
          ),
        ],
      ),
    );
  }
}
