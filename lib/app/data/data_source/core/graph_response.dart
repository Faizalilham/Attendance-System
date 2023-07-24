class Graph {
  String name;
  int count;

  Graph({required this.name, required this.count});

  factory Graph.fromMap(Map<String, dynamic> json) {
    return Graph(name: json["name"], count: json["count"]);
  }
}

class GraphResponse {
  String message;
  List<Graph> data;

  GraphResponse({required this.message, required this.data});

  factory GraphResponse.fromMap(Map<String, dynamic> json) {
    return GraphResponse(
        message: json["message"],
        data: List<Graph>.from((json["data"] as List).map((e) => Graph.fromMap(e))));
  }
}
