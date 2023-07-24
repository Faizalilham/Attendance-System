class IndividualBar {
  int x;
  double y;

  IndividualBar({required this.x, required this.y});
}

class BarData {
  final double firstWeek;
  final double secondWeek;
  final double thirdWeek;


  BarData({
    required this.firstWeek,
    required this.secondWeek,
    required this.thirdWeek,
   
  });

  List<IndividualBar> graph_datas = [];
   List<IndividualBar> graph_datas_mobile = [];

  void initializedBarData() {
    graph_datas = [
      IndividualBar(x: 1, y: firstWeek),
      IndividualBar(x: 2, y: secondWeek),
      IndividualBar(x: 3, y: thirdWeek),
    
    ];
    graph_datas_mobile = [
      IndividualBar(x: 1, y: firstWeek),
      IndividualBar(x: 2, y: secondWeek),
      IndividualBar(x: 3, y: thirdWeek),
    
    ];
  }
}

List<double> graph_datas = [
  5.0,
  10.0,
  12.0,
  12.0,
  8.0,
  4.0,
  7.0,
  13.0,
];


List<String> graph_tittle = [
  "5.0",
  "10.0",
  "18.0",
  "14.0",
  "8.0",
  "4.0",
  "7.0",
  "13.0",
];
