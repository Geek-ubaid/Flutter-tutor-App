class Profile {
  final String name;
  final String image;
  final String email;

  Profile({required this.name, required this.image, required this.email});

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    name: json["name"] ?? "",
    image: json["image"] ?? "",
    email: json["email"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "email": email,
  };

  static Profile defaultProfile = Profile(
    name: "Sangvaleap",
    image: "https://avatars.githubusercontent.com/u/86506519?v=4",
    email: "sangvaleap.vanny@gmail.com",
  );
}
