
class Source {
	final dynamic id;
	final String? name;

	const Source({this.id, this.name});

	factory Source.fromJson(Map<String, dynamic> json) => Source(
				id: json['id'] as dynamic,
				name: json['name'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
			};
}
