import 'package:e_commerce_admin/src/config/util/app_constants/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../orders/domain/entities/order_info_entity.dart';
import '../orders/domain/entities/order_entity.dart';

class OrdersPieChart extends StatelessWidget {
  final List<OrderInfoEntity> chartDataList;

  OrdersPieChart({
    super.key,
    required this.chartDataList,
  });

  @override
  Widget build(BuildContext context) {
    // final List<OrderInfoEntity> chartData = [
    //   const OrderInfoEntity(
    //       title: 'Packaging', percentage: 10, color: Colors.green),
    //   const OrderInfoEntity(
    //       title: 'Delivered', percentage: 2, color: Colors.blue),
    //   const OrderInfoEntity(
    //       title: 'Cancelled', percentage: 2, color: Colors.red),
    // ];
    List<OrderInfoEntity> chartData = [];
    chartData.add(chartDataList[1]);
    chartData.add(chartDataList[2]);
    chartData.add(chartDataList[3]);
    return SfCircularChart(
      title: ChartTitle(
        text: 'Orders Status',
        textStyle: AppTextStyles.black14Bold,
      ),
      legend: const Legend(isVisible: true),
      // // tooltipBehavior:
      // //     TooltipBehavior(enable: true, format: 'point.x : point.y%'),
      series: <CircularSeries>[
        // Render pie chart
        PieSeries<OrderInfoEntity, String>(
          explode: true,
          explodeIndex: 1,
          radius: '55%',
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            labelIntersectAction: LabelIntersectAction.shift,
            overflowMode: OverflowMode.shift,
            showZeroValue: true,
            labelPosition: ChartDataLabelPosition.inside,
            connectorLineSettings:
                ConnectorLineSettings(type: ConnectorType.curve),
          ),
          dataSource: chartData,
          pointColorMapper: (OrderInfoEntity data, _) => data.color,
          dataLabelMapper: (OrderInfoEntity data, _) =>
              "${data.title}\n${data.percentage}%",
          xValueMapper: (OrderInfoEntity data, _) => data.title,
          yValueMapper: (OrderInfoEntity data, _) => data.percentage,
          //name: 'Data',
          //dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}
