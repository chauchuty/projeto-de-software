import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Utility {
  static validator(dynamic value, String type, bool opcional) {
    var rules = <String, dynamic>{
      'string': {
        'regex': r'(.*)',
      },
      'number': {
        'regex': r'^[0-9]+([.][0-9]{1,2})?$',
      },
      'date': {
        'regex': r'(.*)',
      },
      'phone': {
        'regex': r'([0-9]{2})\s([0-9])\s([0-9]{4})\s([0-9]{4})',
      },
      'email': {
        'regex': r'([a-z0-9\.\_]+@[a-z]+\.[a-z]+)',
      }
    };

    if (opcional) return null;

    if (value.isEmpty) return 'Campo Vazio!';

    if (!RegExp(rules[type]['regex']).hasMatch(value)) {
      return 'Campo Inválido!';
    }

    return null;
  }

  static mask(String type) {
    var rules = <String, dynamic>{
      'string': {
        'mask': '#' * 50,
        'filter': RegExp(r'(.*)'),
      },
      'number': {
        'mask': '#######',
        'filter': RegExp(r'^[0-9\.]+([.][0-9\.]{1,2})?$'),
      },
      'phone': {
        'mask': '## # #### ####',
        'filter': RegExp(r"[0-9]"),
      },
      'email': {
        'mask': '#' * 125,
        'filter': RegExp(r"[a-z0-9@.]"),
      }
    };

    return MaskTextInputFormatter(
      mask: rules[type]!['mask'],
      filter: {"#": rules[type]!['filter']},
      type: MaskAutoCompletionType.lazy,
    );
  }

  static circularProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
