// To parse this JSON data, do
//
//     final roomEntity = roomEntityFromJson(jsonString);

import 'dart:convert';

RoomEntity roomEntityFromJson(String str) => RoomEntity.fromJson(json.decode(str));

String roomEntityToJson(RoomEntity data) => json.encode(data.toJson());

class RoomEntity {
    RoomEntity({
        required this.completedAt,
        required this.createdAt,
        this.error,
        required this.id,
        required this.input,
        required this.logs,
        required this.metrics,
        required this.output,
        required this.startedAt,
        required this.status,
        required this.urls,
        required this.version,
        this.webhookCompleted,
    });

    DateTime completedAt;
    DateTime createdAt;
    dynamic error;
    String id;
    Input input;
    String logs;
    Metrics metrics;
    List<String> output;
    DateTime startedAt;
    String status;
    Urls urls;
    String version;
    dynamic webhookCompleted;

    factory RoomEntity.fromJson(Map<String, dynamic> json) => RoomEntity(
        completedAt: DateTime.parse(json["completed_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        error: json["error"],
        id: json["id"],
        input: Input.fromJson(json["input"]),
        logs: json["logs"],
        metrics: Metrics.fromJson(json["metrics"]),
        output: List<String>.from(json["output"].map((x) => x)),
        startedAt: DateTime.parse(json["started_at"]),
        status: json["status"],
        urls: Urls.fromJson(json["urls"]),
        version: json["version"],
        webhookCompleted: json["webhook_completed"],
    );

    Map<String, dynamic> toJson() => {
        "completed_at": completedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "error": error,
        "id": id,
        "input": input.toJson(),
        "logs": logs,
        "metrics": metrics.toJson(),
        "output": List<dynamic>.from(output.map((x) => x)),
        "started_at": startedAt.toIso8601String(),
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
    Metrics({
        required this.predictTime,
    });

    double predictTime;

    factory Metrics.fromJson(Map<String, dynamic> json) => Metrics(
        predictTime: json["predict_time"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "predict_time": predictTime,
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
