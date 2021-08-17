import 'package:tatsam/screens/home/Model/CountryModel.dart';
import 'package:tatsam/screens/home/repository/country_repository.dart';

class Repository {
  CountryRepository countryRepository = new CountryRepository();
  Future<List<CountryModel>> getCountryList() =>
      countryRepository.getCountryList();
}
