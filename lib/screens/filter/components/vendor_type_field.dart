import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


import '../../../stores/filter_store.dart';
import 'section_title.dart';

class VendorTypeField extends StatelessWidget {
  final FilterStore filter;
  const VendorTypeField(this.filter);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionTitle('Tipo de Anunciante'),
        Observer(
          builder: (_) {
            return Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 4,
              children: [
                GestureDetector(
                  onTap: () {
                    if (filter.isTypeParticular) {
                      if (filter.isTypeProfessional) {
                        filter.resetVendorType(VENDOR_TYPE_PARTICULAR);
                      } else {
                        filter.selectVendorType(VENDOR_TYPE_PROFESSIONAL);
                      }
                    } else {
                      filter.setVendorType(VENDOR_TYPE_PARTICULAR);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 130,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: filter.isTypeParticular 
                          ? Colors.purple : Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: filter.isTypeParticular 
                            ? Colors.purple : Colors.grey,
                      ),
                    ),
                    child: Text(
                      'Particular',
                      style: TextStyle(
                        color: filter.isTypeParticular 
                            ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    if (filter.isTypeProfessional) {
                      if (filter.isTypeParticular) {
                        filter.resetVendorType(VENDOR_TYPE_PROFESSIONAL);
                      } else {
                        filter.selectVendorType(VENDOR_TYPE_PARTICULAR);
                      }
                    } else {
                      filter.setVendorType(VENDOR_TYPE_PROFESSIONAL);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 130,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: filter.isTypeProfessional 
                          ? Colors.purple : Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: filter.isTypeProfessional 
                            ? Colors.purple : Colors.grey,
                      ),
                    ),
                    child: Text(
                      'Profissional',
                      style: TextStyle(
                        color: filter.isTypeProfessional 
                            ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
