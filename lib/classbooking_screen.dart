import 'package:flutter/material.dart';
import 'package:dance_studio/classschedule_screen.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final bool _isBookingComplete = false;
  String? _selectedLocation;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: TabBar(
              controller: _tabController,
              labelColor: const Color(0xFF4146F5),
              unselectedLabelColor: const Color(0xFF9CA3AF),
              indicatorColor: const Color(0xFF4146F5),
              tabs: const [
                Tab(text: 'Weekday Class'),
                Tab(text: 'Courses'),
                Tab(text: 'Hire Studio'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _isBookingComplete ? _buildBookingSummary(context) : _buildWeekdayClassContent(context),
          _buildCoursesContent(context),
          _buildHireStudioContent(context),
        ],
      ),
    );
  }

  Widget _buildWeekdayClassContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              width: 200,
              height: 200,
              child: Center(
                child: Image(
                  image: AssetImage('assets/images/BCempty_state.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'No Upcoming Booking',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontFamily: 'SF Pro Display',
              ),
            ),
            const Text(
              'Book your first class today!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontFamily: 'SF Pro Display',
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.pressed)) {
                          return const Color(0xFF4146F5);
                        }
                        return const Color(0xFF4146F5);
                      },
                    ),
                    minimumSize: WidgetStateProperty.all<Size>(
                      const Size(double.infinity, 50),
                    ),
                    foregroundColor: WidgetStateProperty.all<Color>(
                      Colors.white,
                    ),
                    textStyle: WidgetStateProperty.all<TextStyle>(
                      const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'SF Pro Display',
                      ),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    selectLocation(context);
                  },
                  child: const Text('Book a Class'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingSummary(BuildContext context) {
    return const Center(
      child: Text(
        'Booking Summary',
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'SF Pro Display',
        ),
      ),
    );
  }

  Widget _buildCoursesContent(BuildContext context) {
    return const Center(
      child: Text(
        'Course page here',
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'SF Pro Display',
        ),
      ),
    );
  }

  Widget _buildHireStudioContent(BuildContext context) {
    return const Center(
      child: Text(
        'Hire studio page here',
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'SF Pro Display',
        ),
      ),
    );
  }

  void selectLocation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text(
                'Choose Location',
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Choose where do you want to attend classes.',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildLocationOption(
                    context,
                    'Parramatta',
                    'assets/images/BlueLogo.png',
                    'Parramatta Studio',
                    const Color(0xFF4146F5),
                    setState,
                  ),
                  const SizedBox(height: 20),
                  _buildLocationOption(
                    context,
                    'Hurstville',
                    'assets/images/RedLogo.png',
                    'Hurstville Studio',
                    const Color(0xFFE84479),
                    setState,
                  ),
                ],
              ),
              actions: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.pressed)) {
                            return const Color(0xFF4146F5);
                          }
                          return _selectedLocation != null
                              ? const Color(0xFF4146F5)
                              : const Color(0xFF93A4C1);
                        },
                      ),
                      minimumSize: WidgetStateProperty.all<Size>(
                        const Size(double.infinity, 50),
                      ),
                      foregroundColor: WidgetStateProperty.all<Color>(
                        Colors.white,
                      ),
                      textStyle: WidgetStateProperty.all<TextStyle>(
                        const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    onPressed: _selectedLocation != null
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ClassSchedule()),
                            );
                          }
                        : null,
                    child: const Text(
                      'Book',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        side: WidgetStateProperty.all<BorderSide>(
                          const BorderSide(color: Color(0xFF9CA3AF)),
                        ),
                        minimumSize: WidgetStateProperty.all<Size>(
                          const Size(double.infinity, 50),
                        ),
                        foregroundColor: WidgetStateProperty.all<Color>(
                          Colors.black,
                        ),
                        textStyle: WidgetStateProperty.all<TextStyle>(
                          const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SF Pro Display',
                            fontSize: 16,
                          ),
                        ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildLocationOption(BuildContext context, String location, String imagePath, String label, Color selectedColor, StateSetter setState) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedLocation = location;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: _selectedLocation == location ? selectedColor : const Color(0xFF9CA3AF),
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 73,
              height: 54,
              padding: const EdgeInsets.all(2.0),
              child: Image(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

