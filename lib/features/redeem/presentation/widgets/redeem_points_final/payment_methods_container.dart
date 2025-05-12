import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_assets.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/types/payment_methods.dart';

class PaymentMethodscontainer extends StatefulWidget {
  const PaymentMethodscontainer({
    super.key,
  });

  @override
  State<PaymentMethodscontainer> createState() =>
      _PaymentMethodscontainerState();
}

class _PaymentMethodscontainerState extends State<PaymentMethodscontainer> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConst.paddingBig, vertical: AppConst.paddingSmall),
          child: Text(
            localeLang(context).redeemWays,
            style: context.textTheme.titleLarge?.copyWith(
              
            ),
          ),
        ),
        Container(
          height: 120,
          alignment: Alignment.center,
          child: ListView.separated(
              itemCount: options.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              separatorBuilder: (context, index) =>
                  const SizedBox(width: AppConst.paddingSmall),
              itemBuilder: (_, index) {
                final isSelected = selectedIndex == index;
                return Column(
                  children: [
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(AppConst.radiusDefault),
                            boxShadow: [
                              BoxShadow(
                                color: isSelected ? Colors.black : Colors.grey,
                                blurRadius: isSelected ? 0 : 10,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Image.asset(
                            options[index].image,
                            width: 200,
                          ),
                        ),
                      ),
                    ),
                    Text(options[index].title),
                  ],
                );
              }),
        ),
      ],
    );
  }
}

List<PaymentMethod> get options => [
      InstabayPayment(
        image: AppAssets.instaBay,
        title: localeLang().transferToInstaBay,
      ),
      WalletsPayment(
        image: AppAssets.wallet,
        title: localeLang().wallets,
      ),
    ];
