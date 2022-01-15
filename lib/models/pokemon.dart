import 'nextEvolution.dart';
import 'prevEvolution.dart';

class Pokemon {
  late int id;
  late String num;
  late String name;
  late String img;
  late List<String> type;
  late String height;
  late String weight;
  late String candy;
  late String egg;
  List<NextEvolution>? nextEvolution;
  List<PrevEvolution>? prevEvolution;

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    required this.egg,
    this.nextEvolution,
    this.prevEvolution,
  });

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    name = json['name'];
    img = json['img'];
    type = json['type'].cast<String>();
    height = json['height'];
    weight = json['weight'];
    candy = json['candy'];
    egg = json['egg'];

    if (json['next_evolution'] != null) {
      nextEvolution = <NextEvolution>[];
      json['next_evolution'].forEach((v) {
        nextEvolution!.add(NextEvolution.fromJson(v));
      });
    }

    if (json['prev_evolution'] != null) {
      prevEvolution = <PrevEvolution>[];
      json['prev_evolution'].forEach((v) {
        prevEvolution!.add(PrevEvolution.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['num'] = num;
    data['name'] = name;
    data['img'] = img;
    data['type'] = type;
    data['height'] = height;
    data['weight'] = weight;
    data['candy'] = candy;
    data['egg'] = egg;

    if (nextEvolution != null) {
      data['next_evolution'] = nextEvolution!.map((v) => v.toJson()).toList();
    }
    if (prevEvolution != null) {
      data['prev_evolution'] = prevEvolution!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
