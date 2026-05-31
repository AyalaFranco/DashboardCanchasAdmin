import 'package:reserva_cancha/model/url_repository.dart';

class SupabaseUrlRepository implements UrlRepository {
  final String _bucketUrlCancha =
      "https://qqyywtlistoirjpbkeyx.supabase.co/storage/v1/object/public/images_cancha/";

  final String _bucketUrlComplejo =
      "https://qqyywtlistoirjpbkeyx.supabase.co/storage/v1/object/public/images_predio/";

  @override
  String canchaImageUrl(String relativeUrl) => _bucketUrlCancha + relativeUrl;

  @override
  String complejoImageUrl(String relativeUrl) => _bucketUrlComplejo + relativeUrl;
  
}