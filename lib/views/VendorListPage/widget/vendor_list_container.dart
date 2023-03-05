import 'package:flutter/material.dart';
import 'package:onhighway/models/vendor_model.dart';


class VendorListContainer extends StatelessWidget {
  const VendorListContainer({required this.vendorModel,Key? key}) : super(key: key);

  final VendorModel vendorModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Name : ${vendorModel.fullname}'),
                  Text(
                    'Distance : ${vendorModel.distanceKm} km',
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text('Address. ${vendorModel.businessaddress}'),
              const SizedBox(
                height: 3,
              ),
              Text(
                'Vehicle Type : ${vendorModel.vehicletype}',
                maxLines: 3,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Service Type : ${vendorModel.servicetype}',
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Phone : ${vendorModel.phoneno}',
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Email : ${vendorModel.emailid}',
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
