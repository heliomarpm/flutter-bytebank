import 'package:flutter/material.dart';

class TileButton extends StatelessWidget {
  final String _label;
  final IconData _icon;
  final Function onClick;

  const TileButton(this._label, this._icon, {Key? key, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: const EdgeInsets.all(2),
    child: 
    
      Material(
      child: InkWell(
        onTap: () => onClick(),
        child: Container(
          width: 150,
          padding: const EdgeInsets.all(8.0),
          color: Theme.of(context).primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(_icon, size: 24.0, color: Colors.white),
              Text(_label,
                  style: const TextStyle(fontSize: 18, color: Colors.white)),
            ],
          ),
        ),
      ),
    ),);
  }
}
