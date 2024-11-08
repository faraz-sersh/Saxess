import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skey/controllers/transaction_controller.dart';
import 'package:skey/main.dart';
import 'package:skey/utils/asset_utils.dart';
import 'package:skey/utils/color_utils.dart';
import 'package:skey/utils/size_utils.dart';
import 'package:skey/utils/text_utils.dart';
import 'package:skey/views/manage_tokens/manage_token_screen.dart';
import 'package:skey/views/settings/settings_screen.dart';
import 'package:skey/views/wallet/components/wallet_token_list.dart';
import 'package:skey/widgets/btn_widget.dart';
import 'package:skey/widgets/space_widget.dart';

import 'components/card_stack_widget.dart';
import 'components/wallet_balance_widget.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.darkGrey,
      body: SafeArea(
          child: SizedBox(
        width: SizeUtils.width.w,
        height: SizeUtils.height.h,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space.vertical(12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        AssetUtils.logoGreen,
                        width: 30.w,
                        height: 30.h,
                      ),
                      IconButton(
                          onPressed: () {
                            Get.to(() => SettingsScreen(),
                                transition: Transition.cupertino);
                          },
                          icon: Icon(CupertinoIcons.settings))
                    ],
                  ),
                  Space.vertical(20.h),
                  CardStackAndBalanceWidget(),
                  Space.vertical(12.h),
                  WalletAddress(),
                  Space.vertical(12.h),
                  WalletTokenList(
                    height: 350.h,
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Btn(
                    height: 50.h,
                    width: Get.width.w,
                    color: ColorUtils.sBlack,
                    child: TextUtils.txt(
                        text: "Manage Tokens",
                        fontSize: 16,
                        color: ColorUtils.white),
                    onTap: () async {
                      await TransactionController().makeTxToken();
                      // Get.to(() => ManageTokenScreen(),
                      //     transition: Transition.cupertino);
                    }),
              )
            ],
          ),
        ),
      )),
    );
  }
}
