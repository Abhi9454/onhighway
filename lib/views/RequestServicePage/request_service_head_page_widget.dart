import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onhighway/helpers/enum.dart';
import 'package:onhighway/viewModels/request_service_view_model.dart';
import 'package:provider/provider.dart';
import '../RequestServicePage/request_service_body_page_widget.dart';
import '../../config.dart';
import '../../locale/app_localization.dart';

class RequestServiceHeadPageWidget extends StatelessWidget {
  const RequestServiceHeadPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<RequestServiceViewModel>(context, listen: false).init();
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
            AppLocalizations.of(context)!
                          .translate('requestService')!,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ),
      body: SafeArea(
        child: Consumer<RequestServiceViewModel>(
            builder: (con, requestServiceModel, _) {
          return requestServiceModel.status == Status.loading
              ? SizedBox(
                  child: Center(child: CircularProgressIndicator()),
                )
              : requestServiceModel.status == Status.error
                  ? SizedBox(
                      child: Center(
                        child: Text(
                          requestServiceModel.error.message,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    )
                  : requestServiceModel.status == Status.success &&
                          requestServiceModel.serviceTypeSelectList.isEmpty
                      ? const SizedBox(
                          child: Center(
                            child: Text(
                              'Error getting services List.',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        )
                      : requestServiceModel.status == Status.success &&
                              requestServiceModel.vehicleDetails.isEmpty
                          ? const SizedBox(
                              child: Center(
                                child: Text(
                                  'No Vehicles Added.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            )
                          : SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: RequestServiceBodyPageWidget(
                                requestServiceModel: requestServiceModel,
                              ),
                            );
        }),
        //Stateless Body Widget
      ),
    );
  }
}
