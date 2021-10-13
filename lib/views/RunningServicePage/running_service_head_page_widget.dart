import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../helpers/enum.dart';
import '../../viewModels/running_service_view_model.dart';
import '../../views/RunningServicePage/running_service_body_page-widget.dart';
import 'package:provider/provider.dart';

import '../../config.dart';

class RunningServiceHeadPageWidget extends StatelessWidget {
  const RunningServiceHeadPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<RunningServiceViewModel>(context, listen: false).fetchList();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: AppConfig().secondary,
          leading: IconButton(
            icon: Icon(CupertinoIcons.back, color: AppConfig().primary),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Running Services',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ),
      body: Consumer<RunningServiceViewModel>(
        builder: (con, runningServiceModel, _) {
          return runningServiceModel.status == Status.loading
              ? SizedBox(
            child: Center(child: CircularProgressIndicator()),
          )
              : runningServiceModel.status == Status.error
              ? SizedBox(
            child: Center(
              child: Text(
                runningServiceModel.error.message,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          )
              : runningServiceModel.status == Status.success &&
              runningServiceModel.serviceDetails.isEmpty
              ? const SizedBox(
            child: Center(
              child: Text(
                'No Running Service.',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          )
              : runningServiceModel.status == Status.success
              ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: RunningServiceBodyPageWidget(
                context: con,
                runningServiceModel: runningServiceModel,
              ))
              : SizedBox();
        },
      ),
    );
  }
}
