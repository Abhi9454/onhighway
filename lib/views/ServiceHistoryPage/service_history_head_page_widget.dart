import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../helpers/enum.dart';
import '../../viewModels/service_history_view_model.dart';
import 'package:provider/provider.dart';
import '../ServiceHistoryPage/service_history_body_page_widget.dart';

import '../../config.dart';

class ServiceHistoryHeadPageWidget extends StatelessWidget {
  const ServiceHistoryHeadPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ServiceHistoryViewModel>(context, listen: false).fetchList();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: AppConfig().secondary,
          automaticallyImplyLeading: false,
          title: Text(
            'Service History',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ),
      body: Consumer<ServiceHistoryViewModel>(
        builder: (con, serviceHistoryModel, _) {
          return serviceHistoryModel.status == Status.loading
              ? SizedBox(
                  child: Center(child: CircularProgressIndicator()),
                )
              : serviceHistoryModel.status == Status.error
                  ? SizedBox(
                      child: Center(
                        child: Text(
                          serviceHistoryModel.error.message,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    )
                  : serviceHistoryModel.status == Status.success &&
                          serviceHistoryModel.serviceDetails.isEmpty
                      ? const SizedBox(
                          child: Center(
                            child: Text(
                              'No Service History Added.',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        )
                      : serviceHistoryModel.status == Status.success
                          ? SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: ServiceHistoryBodyPageWidget(
                                serviceHistoryContext: con,
                                serviceHistoryModel: serviceHistoryModel,
                              ))
                          : SizedBox();
        },
      ), //Stateless Body Widget,
    );
  }
}
