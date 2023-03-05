import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onhighway/viewModels/vendor_list_view_model.dart';
import 'package:onhighway/views/VendorListPage/widget/vendor_list_container.dart';
import 'package:provider/provider.dart';

import '../../config.dart';
import '../../helpers/enum.dart';
import '../../locale/app_localization.dart';

class VendorListPageWidget extends StatelessWidget {
  const VendorListPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<VendorListViewModel>(context, listen: false).fetchLocation();
    //Provider.of<VendorListViewModel>(context, listen: false).fetchList();
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
            AppLocalizations.of(context)!.translate('serviceProviders')!,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ),
      body: Consumer<VendorListViewModel>(
        builder: (con, vendorList, _) {
          return vendorList.status == Status.loading
              ? SizedBox(
                  child: Center(child: CircularProgressIndicator()),
                )
              : vendorList.status == Status.error
                  ? SizedBox(
                      child: Center(
                        child: Text(
                          vendorList.error.message,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    )
                  : vendorList.status == Status.success &&
                          vendorList.vendorList.isEmpty
                      ? const SizedBox(
                          child: Center(
                            child: Text(
                              'No Service Provider in your area.',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        )
                      : vendorList.status == Status.success
                          ? SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: ListView.builder(
                                  itemCount: vendorList.vendorList.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return VendorListContainer(
                                      vendorModel: vendorList.vendorList[index],
                                    );
                                  }))
                          : SizedBox();
        },
      ),
    );
  }
}
