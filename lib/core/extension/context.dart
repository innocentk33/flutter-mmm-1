import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


extension ContextParsing on BuildContext {
  AppLocalizations get l1On => AppLocalizations.of(this)!;
}