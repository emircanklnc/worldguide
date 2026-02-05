class GeminiResponse {
  late List<Candidate> candidates;

  GeminiResponse({required this.candidates});

  factory GeminiResponse.fromJson(Map<String, dynamic> json) {
    return GeminiResponse(
      candidates: List<Candidate>.from(
        (json["candidates"] ?? []).map(
              (e) => Candidate.fromJson(e),
        ),
      ),
    );
  }
}


class Candidate {
  late Content content;

  Candidate({required this.content});

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      content: Content.fromJson(json["content"]),
    );
  }
}
class Content {
  late List<Part> parts;

  Content({required this.parts});

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      parts: List<Part>.from(
        (json["parts"] ?? []).map(
              (e) => Part.fromJson(e),
        ),
      ),
    );
  }
}




class Part {
  late String text;

  Part(this.text);

  factory Part.fromJson(Map<String, dynamic> json) {
    return Part(
      json["text"] ?? "",
    );
  }
}
