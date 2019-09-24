library sealed_generator;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/sealed_generator.dart';

Builder sealedBuilder(BuilderOptions options) =>
    SharedPartBuilder([SealedClassGenerator()], 'sealed');
