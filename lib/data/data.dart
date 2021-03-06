import 'package:memory_game/model/tile_model.dart';

int points = 0;
bool selected = true;
String selectedTile = "";
int selectedIndex;

List<TileModel> pairs = <TileModel>[];
List<bool> clicked = <bool>[];

List<bool> getClicked() {
  List<bool> yoClicked = <bool>[];
  List<TileModel> myairs = <TileModel>[];
  myairs = getPairs();
  for (int i = 0; i < myairs.length; i++) {
    yoClicked[i] = false;
  }

  return yoClicked;
}

List<TileModel> getPairs() {
  List<TileModel> pairs = <TileModel>[];
  TileModel tileModel = TileModel();

// 1
  tileModel.setImageAssetPath("images/balloon.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();
  // 2
  tileModel.setImageAssetPath("images/calendar.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();
  // 3
  tileModel.setImageAssetPath("images/camera.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();
  // 4
  tileModel.setImageAssetPath("images/car.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();
  // 5
  tileModel.setImageAssetPath("images/clock.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();
// 6
  tileModel.setImageAssetPath("images/gift.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();
  // 7
  tileModel.setImageAssetPath("images/house.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();
// 8
  tileModel.setImageAssetPath("images/sunglasses.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  return pairs;
}

List<TileModel> getQuestions() {
  List<TileModel> pairs = <TileModel>[];
  TileModel tileModel = TileModel();

// 1
  tileModel.setImageAssetPath("images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();
  // 2
  tileModel.setImageAssetPath("images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();
  // 3
  tileModel.setImageAssetPath("images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();
  // 4
  tileModel.setImageAssetPath("images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();
  // 5
  tileModel.setImageAssetPath("images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();
// 6
  tileModel.setImageAssetPath("images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();
  // 7
  tileModel.setImageAssetPath("images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();
// 8
  tileModel.setImageAssetPath("images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel();

  return pairs;
}
