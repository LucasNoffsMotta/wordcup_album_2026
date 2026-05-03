class Sticker {
  final int id;
  final String number;
  final String section;
  int ammount;

  Sticker({required this.id,
  required this.section,
  required this.ammount,
  required this.number
  }); 

  factory Sticker.fromJson(Map<String, dynamic> json) {
  return Sticker(
    id: json['id'],
    number: json['position'],
    section: json['section'],
    ammount: json['ammount']
  );
}

Map<String, dynamic> toJson() => {
  'id': id,
  'position': number,
  'section': section,
  'ammount' : ammount
};
}