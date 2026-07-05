class GetCourseResponseModel {
  final int count;
  final String? next;
  final String? previous;
  final List<GetCourseModel> results;

  GetCourseResponseModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory GetCourseResponseModel.fromMap(Map<String, dynamic> map) {
    return GetCourseResponseModel(
      count: map['count'],
      next: map['next'],
      previous: map['previous'],
      results: List<GetCourseModel>.from(
        (map['results'] as List).map(
          (e) => GetCourseModel.fromMap(e as Map<String, dynamic>),
        ),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((e) => e.toMap()).toList(),
    };
  }
}

class GetCourseModel {
  final String id;
  final String title;
  final String slug;
  final PriceDetailModel? priceDetail;
  final String trainerName;
  final String? thumbnail;
  final String difficultyLevel;

  GetCourseModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.priceDetail,
    required this.trainerName,
    required this.thumbnail,
    required this.difficultyLevel,
  });

  factory GetCourseModel.fromMap(Map<String, dynamic> map) {
    return GetCourseModel(
      id: map['id'],
      title: map['title'],
      slug: map['slug'],
      priceDetail: map['price_detail'] != null
          ? PriceDetailModel.fromMap(map['price_detail'])
          : null,
      trainerName: map['trainer_name'],
      thumbnail: map['thumbnail'],
      difficultyLevel: map['difficulty_level'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'price_detail': priceDetail?.toMap(),
      'trainer_name': trainerName,
      'thumbnail': thumbnail,
      'difficulty_level': difficultyLevel,
    };
  }
}

class PriceDetailModel {
  final String currency;
  final String amount;
  final String discountAmount;
  final String finalAmount;

  PriceDetailModel({
    required this.currency,
    required this.amount,
    required this.discountAmount,
    required this.finalAmount,
  });

  factory PriceDetailModel.fromMap(Map<String, dynamic> map) {
    return PriceDetailModel(
      currency: map['currency'],
      amount: map['amount'],
      discountAmount: map['discount_amount'],
      finalAmount: map['final_amount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'currency': currency,
      'amount': amount,
      'discount_amount': discountAmount,
      'final_amount': finalAmount,
    };
  }
}
