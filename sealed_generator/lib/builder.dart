library sealed_generator;

import 'package:build/build.dart';
import 'package:sealed_generator/src/sealed_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder sealedBuilder(BuilderOptions options) =>
    SharedPartBuilder([SealedClassGenerator()], 'sealed');
