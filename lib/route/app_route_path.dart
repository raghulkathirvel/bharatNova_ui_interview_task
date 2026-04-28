enum AppRoute {
  splash(name : "splash",path: "/"),

  bottomNav(name : "nav", path : "/bottomNav");


  final String path;
  final String name;

  const AppRoute({required this.name, required this.path,});
}
