class BookModel {
  String? message;
  int? total;
  int? currentPage;
  List<Books>? books;

  BookModel({this.message, this.total, this.currentPage, this.books});

  BookModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    total = json['total'];
    currentPage = json['currentPage'];
    if (json['books'] != null) {
      books = <Books>[];
      json['books'].forEach((v) {
        books!.add(new Books.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['total'] = this.total;
    data['currentPage'] = this.currentPage;
    if (this.books != null) {
      data['books'] = this.books!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Books {
  String? sId;
  String? title;
  String? author;
  String? category;
  int? publishedYear;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Books({
    this.sId,
    this.title,
    this.author,
    this.category,
    this.publishedYear,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  Books.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    author = json['author'];
    category = json['category'];
    publishedYear = json['publishedYear'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['author'] = this.author;
    data['category'] = this.category;
    data['publishedYear'] = this.publishedYear;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
