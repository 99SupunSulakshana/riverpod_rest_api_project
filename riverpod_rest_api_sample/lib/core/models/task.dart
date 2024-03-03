import 'dart:convert';

List<Task> taskFromJson(String str) => List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String taskToJson(List<Task> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Task {
    String name;
    String description;
    bool done;
    int createdAt;
    String id;

    Task({
        required this.name,
        required this.description,
        required this.done,
        required this.createdAt,
        required this.id,
    });

    Task copyWith({
        String? name,
        String? description,
        bool? done,
        int? createdAt,
        String? id,
    }) => 
        Task(
            name: name ?? this.name,
            description: description ?? this.description,
            done: done ?? this.done,
            createdAt: createdAt ?? this.createdAt,
            id: id ?? this.id,
        );

    factory Task.fromJson(Map<String, dynamic> json) => Task(
        name: json["name"],
        description: json["description"],
        done: json["done"],
        createdAt: json["createdAt"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "done": done,
        "createdAt": createdAt,
        "id": id,
    };
}