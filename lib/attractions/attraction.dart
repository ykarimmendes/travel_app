class Attraction {
  int id;
  String name;
  String description;
  String photoLink;
  String topDescription;

  Attraction.mock(this.id, this.name, this.description, this.photoLink,
      this.topDescription);


  Attraction();

  List<Attraction> mock() {
    List<Attraction> atts = new List<Attraction>();
    Attraction att = new Attraction.mock(
        1,
        "Museu da Água",
        "Museu dedicado à história do tratamento da água na cidade",
        "assets/museu_da_agua.jpeg",
        "Top #1 Museus");

    atts.add(att);

    att = new Attraction.mock(
        2,
        "Rua das Palmeiras",
        "Marco histórico em Blumenau, Santa Catarina",
        "assets/museu_familia_colonial.jpeg",
        "Top #2 Museus");

    atts.add(att);

    att = new Attraction.mock(
        3,
        "Museu de Hábitos e Costumes",
        "Museu histórico, com objetos como roupas, bolsas e chapéus",
        "assets/museu.jpeg",
        "Top #3 Museus");

    atts.add(att);

    return atts;

  }
}
