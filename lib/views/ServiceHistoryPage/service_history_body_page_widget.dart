import 'package:flutter/material.dart';
import '../ServiceHistoryPage/Widget/service_history_list_view_container_widget.dart';

import '../../config.dart';

class ServiceHistoryBodyPageWidget extends StatelessWidget {
  const ServiceHistoryBodyPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ServiceHistoryListViewContainerWidget();
        });
  }
}
