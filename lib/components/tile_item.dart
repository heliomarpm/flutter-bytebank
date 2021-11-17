
import 'package:flutter/material.dart';

class TileItem extends StatelessWidget {
  final String _label;
  final IconData _icon;

  const TileItem(this._label, this._icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 80,
      width: 120,
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            _icon,
            size: 24.0,
          ),
          Text(
            _label,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}