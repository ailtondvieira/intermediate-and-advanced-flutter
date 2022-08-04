class MovieModel {
  String id;
  String title;
  String originalTitle;
  String originalTitleRomanised;
  String image;
  String movieBanner;
  String description;
  String director;
  String producer;
  String releaseDate;
  String runningTime;
  String rtScore;

  MovieModel({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.originalTitleRomanised,
    required this.image,
    required this.movieBanner,
    required this.description,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.runningTime,
    required this.rtScore,
  });

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'],
      title: map['title'],
      originalTitle: map['original_title'],
      originalTitleRomanised: map['original_title_romanised'],
      image: map['image'],
      movieBanner: map['movie_banner'],
      description: map['description'],
      director: map['director'],
      producer: map['producer'],
      releaseDate: map['release_date'],
      runningTime: map['running_time'],
      rtScore: map['rt_score'],
    );
  }

  @override
  String toString() {
    return 'MovieModel(id: $id, title: $title, originalTitle: $originalTitle, originalTitleRomanised: $originalTitleRomanised, image: $image, movieBanner: $movieBanner, description: $description, director: $director, producer: $producer, releaseDate: $releaseDate, runningTime: $runningTime, rtScore: $rtScore)';
  }
}
