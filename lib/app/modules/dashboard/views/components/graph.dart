import 'dart:math';

import 'package:attendance_system/app/components/responsive.dart';
import 'package:attendance_system/app/model/graph_data.dart';
import 'package:attendance_system/app/theme/constant.dart';
import 'package:attendance_system/app/theme/extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraph extends StatelessWidget {
  final List graph_data;
  final List graph_tittle;
  const BarGraph(
      {Key? key, required this.graph_data, required this.graph_tittle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        firstWeek: graph_data[0],
        secondWeek: graph_data[1],
        thirdWeek: graph_data[2],
       );
    myBarData.initializedBarData();
    return Container(
        height: 470,
        padding: const EdgeInsets.all(defaultPadding),
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Text(
              "Graph Recapitulation",
              style: Theme.of(context).textTheme.headline6,
            ),
            Expanded(
              // height: 450,
              child: BarChart(BarChartData(

                  maxY: 14,
                  minY: 0,
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                      show: true,
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      leftTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: true,interval: 2)),
                      rightTitles: AxisTitles(
                          sideTitles:
                              SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: getBottomGraphBarValue,
                              reservedSize: 30))),
                  barGroups: Responsive.isMobile(context)
                      ? myBarData.graph_datas_mobile
                          .map((data) => BarChartGroupData(x: data.x, barRods: [
                                BarChartRodData(
                                    toY: data.y,
                                    color: primaryColor,
                                    width: 15,
                                    borderRadius: BorderRadius.circular(2),
                                    backDrawRodData: BackgroundBarChartRodData(
                                        show: false,
                                        toY: 14,
                                        color: Colors.grey[200])),
                              ]))
                          .toList()
                      : myBarData.graph_datas
                          .map((data) => BarChartGroupData(
                            
                            x: data.x, barRods: [
                                BarChartRodData(

                                    toY: data.y,
                                    color: primaryColor,
                                    width: 15,
                                    borderRadius: BorderRadius.circular(2),
                                    backDrawRodData: BackgroundBarChartRodData(
                                        show: false,
                                        toY: 14,
                                        color: Colors.grey[200])),
                              ]))
                          .toList())),
            ),
          ],
        )).addGlassmorphism();
  }

  Widget getBottomGraphBarValue(double y, TitleMeta tittle) {
    Widget text;
    switch (y.toInt()) {
      case 0:
        text = Text(graph_tittle[0]);
        break;
      case 1:
        text = Text(graph_tittle[1]);
        break;
      case 2:
        text = Text(graph_tittle[2]);
        break;
      case 3:
        text = Text(graph_tittle[0]);
        break;
     

      default:
        text = const Text(" ");
    }

    return Transform.translate(
        offset: const Offset(0.0, 10.0),
        child: Transform.rotate(
            angle: -pi / 4,
            child: SideTitleWidget(
                child: text, axisSide: tittle.axisSide, space: 4)));
  }
}
