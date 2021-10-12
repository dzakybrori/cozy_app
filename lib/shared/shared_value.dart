import '../models/city.dart';
import '../models/tips.dart';

class RouteName {
  static const splashPage = '/';
  static const homePage = '/home-page';
  static const errorPage = '/error-page';
}

const List<Tips> mTipsList = [
  const Tips(
      id: 1,
      title: 'City Guidelines',
      imageUrl: 'assets/images/icon_tips1.png',
      updatedAt: '20 Apr'),
  const Tips(
      id: 2,
      title: 'Jakarta Fairship',
      imageUrl: 'assets/images/icon_tips2.png',
      updatedAt: '11 Dec')
];

const List<City> mCityList = [
  const City(
      id: 1, name: 'Jakarta', imageUrl: 'assets/images/city1_jakarta.png'),
  const City(
      id: 2,
      name: 'Bandung',
      imageUrl: 'assets/images/city2_bandung.png',
      isFavorite: true),
  const City(
      id: 3, name: 'Surabaya', imageUrl: 'assets/images/city3_surabaya.png'),
  const City(
      id: 4, name: 'Palembang', imageUrl: 'assets/images/city4_palembang.png'),
  const City(
      id: 5,
      name: 'Aceh',
      imageUrl: 'assets/images/city5_aceh.png',
      isFavorite: true),
  const City(id: 6, name: 'Bogor', imageUrl: 'assets/images/city6_bogor.png')
];
