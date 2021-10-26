import 'package:flutter/material.dart';
import 'package:khalti_flutter/localization/khalti_localizations.dart';
import 'package:khalti_flutter/src/widget/color.dart';

class PayButton extends StatelessWidget {
  const PayButton({
    Key? key,
    required this.amount,
    required this.onPressed,
  }) : super(key: key);

  final int amount;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _AmountWidget(amount: amount),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: onPressed,
          child: Text(context.loc.pay.toUpperCase()),
        ),
      ],
    );
  }
}

class _AmountWidget extends StatelessWidget {
  const _AmountWidget({Key? key, required this.amount}) : super(key: key);

  final int amount;

  @override
  Widget build(BuildContext context) {
    final headline6 = Theme.of(context).textTheme.headline6?.copyWith(
          fontWeight: FontWeight.w600,
        );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.loc.amount,
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(color: KhaltiColor.of(context).surface.shade50),
        ),
        const SizedBox(height: 4),
        Text(context.loc.rupee(amount / 100), style: headline6),
      ],
    );
  }
}
