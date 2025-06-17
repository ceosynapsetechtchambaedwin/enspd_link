import 'package:flutter/material.dart';

class IconTextButtonP extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const IconTextButtonP({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(children: [Icon(icon, size: 18, color: Colors.grey[700]),const SizedBox(width: 4,),Text(label,style: TextStyle(color: Colors.grey[700],fontSize: 13),)]),
      
    );
  }
}
