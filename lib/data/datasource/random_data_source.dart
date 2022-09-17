import 'dart:math';

import 'package:career_bss_interview_test/domain/entity/user.dart';
import 'package:faker_dart/faker_dart.dart';

class RemoteDataSource {
  final _faker = Faker.instance;

  List<User> mockUsers() {
    return List.generate(10, (index) => mockUser());
  }

  User mockUser() {
    final date = DateTime.now();
    final id = date.microsecond + Random().nextInt(100);
    final name = _faker.name;
    final address = _faker.address;
    return User(
      id: id,
      firstName: name.firstName(),
      lastName: name.lastName(),
      about: _faker.lorem.sentence(wordCount: 6),
      workplace: _faker.company.companyName(),
      location: "${address.city()}, ${address.country()}",
      studiedAt: _faker.hacker.noun(),
      imageUrl: id % 2 == 0
          ? _faker.image.unsplash.nature()
          : _faker.image.unsplash.buildings(),
    );
  }
}
