
import 'package:flutter/material.dart';

import 'generated/l10n.dart';


// ignore: library_private_types_in_public_api
const _LocaleLang localeLang = _LocaleLang();

class _LocaleLang{
  const _LocaleLang();


  S call([BuildContext? context]){
    if(context == null) return S.current;
    return S.of(context);
  }

}