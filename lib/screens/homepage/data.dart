class CategoryButton {
  String name;
  String description;
  String image;

  CategoryButton({
    required this.name,
    required this.description,
    required this.image,
  });
}

class CategoryItem {
  String name;
  String description;
  String image;

  CategoryItem({
    required this.name,
    required this.description,
    required this.image,
  });
}

const String headline = 'What would you like to order today?';
const String homeHeadline = 'How can we serve you today?';

final tipHeadline = [
  'Go to RIDE',
  'Go to EAT',
  'Go to GROCERY',
  'Go to SHOPPING',
];

final tipBody = [
  'Take a trip with us and get a 10% discount for your first trip.',
  'Eat with us and get a 10% discount for your first order.',
  'Order groceries with us and get a 10% discount for your first order.',
  'Shop with us and get a 10% discount for your first order.',
];

final List<String> homescreenCarouselImages = [
  'assets/images/home/5K.png',
  'assets/images/home/feed_community.png',
  'assets/images/home/run.png',
];

final List<String> tipImages = [
  'assets/images/illustrations/goto_ridegroup.png',
  'assets/images/illustrations/goto_ridegroup.png',
  'assets/images/illustrations/goto_ridegroup.png',
  'assets/images/illustrations/goto_ridegroup.png',
];

List categoryList = [
  CategoryItem(
    name: "Economy",
    description:
        'Select the vehicle size and price that fits your comfort level.',
    image: 'assets/images/ridesharing/Vehicles-04.png',
  ),
  CategoryItem(
    name: "Taxicab",
    description:
        'Support your local cab company with an opportunity to serve you.',
    image: 'assets/images/ridesharing/Vehicles-02.png',
  ),
  CategoryItem(
    name: "Luxury",
    description:
        'Support your local cab company with an opportunity to serve you.',
    image: 'assets/images/ridesharing/Vehicles-03.png',
  ),
];

List categoryButtonList = [
  CategoryButton(
    name: "RIDE",
    description:
        'Select the vehicle size and price that fits your comfort level.',
    image: 'assets/images/illustrations/Ride.png',
  ),
  CategoryButton(
    name: "EAT",
    description:
        'Support your local cab company with an opportunity to serve you.',
    image: 'assets/images/illustrations/Eat.png',
  ),
  CategoryButton(
    name: "GROCERY",
    description:
        'Support your local cab company with an opportunity to serve you.',
    image: 'assets/images/illustrations/Grocery.png',
  ),
  CategoryButton(
    name: "SHOPPING",
    description:
        'Support your local cab company with an opportunity to serve you.',
    image: 'assets/images/illustrations/Shopping.png',
  ),
];
