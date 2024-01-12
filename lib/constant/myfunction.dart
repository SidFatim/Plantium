import 'package:flutter/material.dart';

callNext( var context,var className,) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => className),
  );
}

callNextReplacement(var context,var className, ) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => className),
  );
}

back(var context) {
  Navigator.pop(context);
}

void finish(context) {
  Navigator.pop(context);
}