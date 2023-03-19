// To parse this JSON data, do
//
//     final roomPostEntity = roomPostEntityFromJson(jsonString);

import 'dart:convert';

RoomPostEntity roomPostEntityFromJson(String str) => RoomPostEntity.fromJson(json.decode(str));

String roomPostEntityToJson(RoomPostEntity data) => json.encode(data.toJson());

class RoomPostEntity {
    RoomPostEntity({
        this.completedAt,
        required this.createdAt,
        this.error,
        required this.id,
        required this.input,
        this.logs,
        required this.metrics,
        this.output,
        this.startedAt,
        required this.status,
        required this.urls,
        required this.version,
        this.webhookCompleted,
    });

    dynamic completedAt;
    DateTime createdAt;
    dynamic error;
    String id;
    Input input;
    dynamic logs;
    Metrics metrics;
    dynamic output;
    dynamic startedAt;
    String status;
    Urls urls;
    String version;
    dynamic webhookCompleted;

    factory RoomPostEntity.fromJson(Map<String, dynamic> json) => RoomPostEntity(
        completedAt: json["completed_at"],
        createdAt: DateTime.parse(json["created_at"]),
        error: json["error"],
        id: json["id"],
        input: Input.fromJson(json["input"]),
        logs: json["logs"],
        metrics: Metrics.fromJson(json["metrics"]),
        output: json["output"],
        startedAt: json["started_at"],
        status: json["status"],
        urls: Urls.fromJson(json["urls"]),
        version: json["version"],
        webhookCompleted: json["webhook_completed"],
    );

    Map<String, dynamic> toJson() => {
        "completed_at": completedAt,
        "created_at": createdAt.toIso8601String(),
        "error": error,
        "id": id,
        "input": input.toJson(),
        "logs": logs,
        "metrics": metrics.toJson(),
        "output": output,
        "started_at": startedAt,
        "status": status,
        "urls": urls.toJson(),
        "version": version,
        "webhook_completed": webhookCompleted,
    };
}

class Input {
    Input({
        required this.image,
        required this.prompt,
        required this.aPrompt,
        required this.nPrompt,
    });

    String image;
    String prompt;
    String aPrompt;
    String nPrompt;

    factory Input.fromJson(Map<String, dynamic> json) => Input(
        image: json["image"],
        prompt: json["prompt"],
        aPrompt: json["a_prompt"],
        nPrompt: json["n_prompt"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "prompt": prompt,
        "a_prompt": aPrompt,
        "n_prompt": nPrompt,
    };
}

class Metrics {
    Metrics();

    factory Metrics.fromJson(Map<String, dynamic> json) => Metrics(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Urls {
    Urls({
        required this.urlsGet,
        required this.cancel,
    });

    String urlsGet;
    String cancel;

    factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        urlsGet: json["get"],
        cancel: json["cancel"],
    );

    Map<String, dynamic> toJson() => {
        "get": urlsGet,
        "cancel": cancel,
    };
}
