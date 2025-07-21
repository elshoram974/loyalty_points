import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/constants/app_constants.dart';
import 'package:loyalty_points/core/utils/extensions/num_ex.dart';
import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/my_network_image.dart';
import '../../../../core/shared/points_builder_widget.dart';
import '../../../../core/utils/config/controller/config_controller.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../domain/entity/order_entity.dart';
import 'package:intl/intl.dart' as intl;

import '../widgets/orders_widgets/details_card.dart';

class OrdersDetailsScreen extends StatelessWidget {
  const OrdersDetailsScreen({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    final Widget orderImage = Hero(
      tag: "${order.imageUrl}",
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: MyNetworkImage(order.imageUrl),
      ),
    );
    return CustomScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          localeLang(context).order_details,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppConst.paddingDefault),
        children: [
          // DateContainerWidget(date: order.date)
          if (order.updatedDate == null) const SizedBox(),
          DetailsCard(
            icon: Icons.update,
            title: localeLang(context).lastUpdate,
            value: intl.DateFormat.yMMMd(
              Get.find<ConfigController>().locale.languageCode,
            ).format(DateTime(order.updatedDate?.year ?? 0,
                order.updatedDate?.month ?? 0, order.updatedDate?.day ?? 0)),
          ),
          DetailsCard(
            icon: Icons.calendar_month_outlined,
            title: localeLang(context).date,
            value: intl.DateFormat.yMMMd(
              Get.find<ConfigController>().locale.languageCode,
            ).format(DateTime(order.createdDate.year, order.createdDate.month,
                order.createdDate.day)),
          ),
          DetailsCard(
            icon: order.orderStatus.icon,
            title: localeLang(context).status,
            value: order.orderStatus.name,
            valueColor: order.orderStatus.color,
          ),
          DetailsCard(
            icon: Icons.star_outline,
            title: localeLang(context).points,
            value: order.points.withSeparator,
          ),
          PointsBuilderWidget(builder: (_, __, helper) {
            return DetailsCard(
              icon: Icons.price_check_outlined,
              title: localeLang(context).price,
              value: "${order.price.withSeparator} ${helper.config?.currency}",
            );
          }),
          DetailsCard(
            icon: Icons.payment_outlined,
            title: localeLang(context).paymentMethod,
            value: order.paymentMethod.name,
          ),
          DetailsCard(
            icon: Icons.phone_outlined,
            title: localeLang(context)
                .paymentMethodNumber(order.paymentMethod.name),
            value: order.phone.toString(),
            valueDirection: TextDirection.ltr,
          ),
          if (order.adminNote != null)
            DetailsCard(
              title: localeLang(context).note,
              value: order.adminNote!,
              icon: Icons.notes_outlined,
            ),

          if (order.imageUrl != null) ...[
            const SizedBox(height: 16),
            Text(
              localeLang(context).image_for_order,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                Get.to(() => _ImageDialog(orderImage), opaque: false);
              },
              child: orderImage,
            ),
          ],
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _ImageDialog extends StatefulWidget {
  const _ImageDialog(this.orderImage, {super.key});

  final Widget orderImage;

  @override
  State<_ImageDialog> createState() => _ImageDialogState();
}

class _ImageDialogState extends State<_ImageDialog>
    with SingleTickerProviderStateMixin {
  final TransformationController _transformationController =
      TransformationController();
  late final AnimationController _animController;
  late Animation<Matrix4> _animation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        _transformationController.value = _animation.value;
      });
  }

  @override
  void dispose() {
    _animController.dispose();
    _transformationController.dispose();
    super.dispose();
  }

  void _animateReset() {
    _animation = Matrix4Tween(
      begin: _transformationController.value,
      end: Matrix4.identity(),
    ).animate(CurveTween(curve: Curves.easeOut).animate(_animController));

    _animController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      transformationController: _transformationController,
      onInteractionEnd: (_) => _animateReset(),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            widget.orderImage,
            Positioned(
              top: 8,
              right: 8,
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
