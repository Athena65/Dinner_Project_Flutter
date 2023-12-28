class User1 {
  final String username;
  final String password;
  final String email;
  final String about;

  User1({
    required this.username,
    required this.email,
    required this.about,
    required this.password
  });
}

List Users = [
  User1(
      username:"Athena65",
      email: "burak@burak.com",
    about: "He went Kartal Anadolu Lisesi. He was born in Sultanbeyli which small city of Istanbul. He works hard in his lectures because he has discipline and self motivation."
      "And He loves coding Back-End with .NET CORE WEB API and MVC. And He dreams to be .NET Developer in future.",
    password: "123456789"
  )
];
