class User {
  int id;
  String firstName;
  String lastName;
  String about;
  String workplace;
  String location;
  String studiedAt;
  String imageUrl;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.about,
    required this.workplace,
    required this.location,
    required this.studiedAt,
    required this.imageUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          about == other.about &&
          workplace == other.workplace &&
          location == other.location &&
          studiedAt == other.studiedAt &&
          imageUrl == other.imageUrl);

  @override
  int get hashCode =>
      id.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      about.hashCode ^
      workplace.hashCode ^
      location.hashCode ^
      studiedAt.hashCode;

  @override
  String toString() {
    return 'User{ id: $id, firstName: $firstName, lastName: $lastName, about: '
        '$about, workplace: $workplace, location: $location, studiedAt: '
        '$studiedAt, imageUrl: $imageUrl}';
  }

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? about,
    String? workplace,
    String? location,
    String? studiedAt,
    String? imageUrl,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      about: about ?? this.about,
      workplace: workplace ?? this.workplace,
      location: location ?? this.location,
      studiedAt: studiedAt ?? this.studiedAt,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'about': about,
      'workplace': workplace,
      'location': location,
      'studiedAt': studiedAt,
      'imageUrl': imageUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      about: map['about'] as String,
      workplace: map['workplace'] as String,
      location: map['location'] as String,
      studiedAt: map['studiedAt'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }
}
