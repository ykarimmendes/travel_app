class IntelligenceTravel{

  int id;
  String name;
  bool check;
  String photo;

  IntelligenceTravel.mock(this.name, this.check, this.photo);
  IntelligenceTravel();

  List<IntelligenceTravel> mock(){

    List<IntelligenceTravel> ies = List<IntelligenceTravel>();

    IntelligenceTravel ie = IntelligenceTravel.mock("Museu da Água", false, "assets/museu/m0.jpg");
    ies.add(ie);
    ie = IntelligenceTravel.mock("Museu Família Colonial", false, "assets/museu_familia_colonial.jpeg");
    ies.add(ie);
    ie = IntelligenceTravel.mock("Mirante do mar", false, "assets/paisagem1.jpeg");
    ies.add(ie);
    ie = IntelligenceTravel.mock("Museu da Vida", false, "assets/museu.jpeg");
    ies.add(ie);

    return ies;
}

}