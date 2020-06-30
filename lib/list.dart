import 'package:flutter/material.dart';
import 'package:charcode/html_entity.dart';

const url = 'assets/produits/';

List labels = [
  {'text':'Mes ventes', 'icon':Icons.label_outline},
  {'text':'Bons plans', 'icon':Icons.flash_on},
  {'text':'Catégories', 'icon':Icons.category},
  {'text':'Favoris', 'icon':Icons.favorite_border},
];

List products = [
  {'text':'Barbecue au charbon de bois grill fumoir bbq wagon 115 x 65 x 107 ...', 'image':url+'bbq.png',
   'prix':'129,99 EUR', 'réduction':TextSpan(children:<TextSpan>[TextSpan(text: ' ')])},
  {'text':'PHILIPS OneBlade Pro QP6510/64 Rasoir Tondeuse à Barbe Etan...', 'image':url+'tondeuse.jpg',
   'prix':'47,99 EUR', 'réduction':TextSpan(children:<TextSpan>[TextSpan(text: '84,99 EUR', style: TextStyle(decoration:TextDecoration.lineThrough)),
   TextSpan(text: ' '+String.fromCharCode($bull)), TextSpan(text:' 44 % de réduction', style: TextStyle(fontWeight:FontWeight.bold))])},
  {'text':'Apple Iphone 11 128 Go rouge (Etat Comme neuf)', 'image':url+'recondi.png', 'prix':'769,00 EUR', 'réduction':TextSpan(children:<TextSpan>[TextSpan(text: ' ')])},
  {'text':'Barbecue au charbon de bois grill fumoir bbq wagon 115 x 65 x 107 ...', 'image':url+'bbq.png',
   'prix':'129,99 EUR', 'réduction':TextSpan(children:<TextSpan>[TextSpan(text: ' ')])},
  {'text':'PHILIPS OneBlade Pro QP6510/64 Rasoir Tondeuse à Barbe Etan...', 'image':url+'tondeuse.jpg',
   'prix':'47,99 EUR', 'réduction':TextSpan(children:<TextSpan>[TextSpan(text: '84,99 EUR', style: TextStyle(decoration:TextDecoration.lineThrough)),
   TextSpan(text: ' '+String.fromCharCode($bull)), TextSpan(text:' 44 % de réduction', style: TextStyle(fontWeight:FontWeight.bold))])},
  {'text':'Apple Iphone 11 128 Go rouge (Etat Comme neuf)', 'image':url+'recondi.png', 'prix':'769,00 EUR', 'réduction':TextSpan(children:<TextSpan>[TextSpan(text: ' ')])},
  {'text':'Barbecue au charbon de bois grill fumoir bbq wagon 115 x 65 x 107 ...', 'image':url+'bbq.png',
   'prix':'129,99 EUR', 'réduction':TextSpan(children:<TextSpan>[TextSpan(text: ' ')])},
  {'text':'PHILIPS OneBlade Pro QP6510/64 Rasoir Tondeuse à Barbe Etan...', 'image':url+'tondeuse.jpg',
   'prix':'47,99 EUR', 'réduction':TextSpan(children:<TextSpan>[TextSpan(text: '84,99 EUR', style: TextStyle(decoration:TextDecoration.lineThrough)),
   TextSpan(text: ' '+String.fromCharCode($bull)), TextSpan(text:' 44 % de réduction', style: TextStyle(fontWeight:FontWeight.bold))])},
  {'text':'Apple Iphone 11 128 Go rouge (Etat Comme neuf)', 'image':url+'recondi.png', 'prix':'769,00 EUR', 'réduction':TextSpan(children:<TextSpan>[TextSpan(text: ' ')])},
  {'text':'Barbecue au charbon de bois grill fumoir bbq wagon 115 x 65 x 107 ...', 'image':url+'bbq.png',
   'prix':'129,99 EUR', 'réduction':TextSpan(children:<TextSpan>[TextSpan(text: ' ')])},
];

List grid = [
  {'text':'High-Tech', 'image':url+'pc.png', 'color':Colors.deepOrange[400]},
  {'text':'Reconditionné', 'image':url+'recondi.png', 'color':Colors.deepOrange[100]},
  {'text':'#eBayAvecVous', 'image':'assets/5.png', 'color':Colors.grey[400]},
  {'text':'Maison & Jardin', 'image':url+'perceuse.png', 'color':Colors.deepOrange[100]},
  {'text':'Loisirs', 'image':url+'trotti.png', 'color':Colors.deepOrange[400]},
  {'text':'Pièces Auto & Moto', 'image':url+'roue.png', 'color':Colors.orange[900]},
];