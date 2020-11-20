class IntelligenceTravel{

  int id;
  double distance;
  String name;
  bool check;
  String photo;

  IntelligenceTravel.mock(this.name, this.check, this.photo, this.distance);
  IntelligenceTravel();

  List<IntelligenceTravel> mock(){

    List<IntelligenceTravel> ies = List<IntelligenceTravel>();

    IntelligenceTravel ie = IntelligenceTravel.mock("Museu da Água", false, "assets/museu/m0.jpg",1.5);
    ies.add(ie);
    ie = IntelligenceTravel.mock("Museu Família Colonial", false, "assets/museu_familia_colonial.jpeg",3);
    ies.add(ie);
    ie = IntelligenceTravel.mock("Mirante do mar", false, "assets/paisagem1.jpeg",1.8);
    ies.add(ie);
    ie = IntelligenceTravel.mock("Museu da Vida", false, "assets/museu.jpeg",9.1);
    ies.add(ie);

    return ies;
}

}