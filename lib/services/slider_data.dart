import 'package:flutter_news_app/model/slider_model.dart';

List<SliderModel> getSliders() {
  List<SliderModel> slider = [];
  SliderModel categoryModel = new SliderModel();

  categoryModel.image = "assets/images/business.jpg";
  categoryModel.name = "Bow To Authority of Silencforce";
  slider.add(categoryModel);
  categoryModel = new SliderModel();

  categoryModel.image = "assets/images/entertainment.jpg";
  categoryModel.name = "Bow To Authority of Silencforce";
  slider.add(categoryModel);
  categoryModel = new SliderModel();

  categoryModel.image = "assets/images/health.jpg";
  categoryModel.name = "Bow To Authority of Silencforce";
  slider.add(categoryModel);
  categoryModel = new SliderModel();

  return slider;
}
