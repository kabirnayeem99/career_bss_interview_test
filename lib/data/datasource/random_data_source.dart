import 'dart:math';

import 'package:career_bss_interview_test/domain/entity/creditcard.dart';
import 'package:career_bss_interview_test/domain/entity/transaction.dart';
import 'package:career_bss_interview_test/domain/entity/user.dart';
import 'package:faker_dart/faker_dart.dart';

class RemoteDataSource {
  static Future<List<User>> mockUsers() async {
    return List.generate(10, (index) => mockUser(index));
  }

  static User mockUser(int index) {
    final faker = Faker.instance;

    final date = DateTime.now();
    final id = date.millisecond + index;
    final name = faker.name;
    final address = faker.address;
    return User(
      id: id,
      firstName: index == 0 ? "John" : name.firstName(gender: Gender.male),
      lastName: name.lastName(gender: Gender.male),
      about: faker.lorem.sentence(wordCount: 6),
      workplace: faker.company.companyName(),
      location: "${address.city()}, ${address.country()}",
      studiedAt: "${address.state()} University",
      imageUrl: [
        "https://i.pinimg.com/originals/22/13/cd/2213cd6a06d3089cf693a6d90d4372e7.jpg",
        "https://i.pinimg.com/originals/50/37/b5/5037b503f2988b2d6d16b4e80130829b.jpg",
        "https://onthewayaround.com/wp-content/uploads/2019/12/DSC06502-1500x1875.jpg",
        "https://i.pinimg.com/736x/5c/98/38/5c983809e08e503d571d6a8f527c7969--stylish-beards-photo-and-video.jpg",
        "https://i.pinimg.com/originals/f1/f0/1c/f1f01c0a989328cd78672dde8e6abd07.jpg",
        "https://onthewayaround.com/wp-content/uploads/2019/12/DSC06502-1500x1875.jpg",
        "https://res.cloudinary.com/fleetnation/image/private/c_fill,g_center,h_640,w_640/v1513116763/mxowgde5qmkhi5zqk2i9.jpg",
        "https://c1.staticflickr.com/5/4034/4272789816_0ca358f8df_b.jpg",
        "https://i.pinimg.com/originals/f1/f0/1c/f1f01c0a989328cd78672dde8e6abd07.jpg",
        "https://i.pinimg.com/originals/f1/f0/1c/f1f01c0a989328cd78672dde8e6abd07.jpg",
        "https://onthewayaround.com/wp-content/uploads/2019/12/DSC06502-1500x1875.jpg",
        "https://i.pinimg.com/736x/19/6a/dd/196add070c8cfda986bd9ad89af602c2--jolie-photo-elderly-man.jpg",
        "https://i.pinimg.com/originals/f1/f0/1c/f1f01c0a989328cd78672dde8e6abd07.jpg",
      ].elementAt(index),
    );
  }

  static Future<List<Transaction>> mockTransactions() async {
    return List.generate(3, (index) => mockTransaction());
  }

  static Transaction mockTransaction() {
    final date = DateTime.now();
    final faker = Faker.instance;

    return Transaction(
      id: date.millisecond,
      organisation: faker.company.companyName().substring(0, 5),
      amount: Random().nextInt(1500),
      time: "${date.hour}:${date.minute - 10} ${date.timeZoneName}",
      date: "${date.day} July ${date.year - Random().nextInt(20)}",
    );
  }

  static Future<CreditCard> mockCreditCard() async {
    final date = DateTime.now();
    final faker = Faker.instance;

    return CreditCard(
      id: date.millisecond,
      holderName: faker.name.fullName(gender: Gender.male),
      creditCardInt:
          "0${Random().nextInt(999)} *** **** ${Random().nextInt(9999)}",
      expiryDate: "${date.month}/${(date.year + Random().nextInt(12)) - 2000}",
      balance: Random().nextInt(9999),
    );
  }
}
