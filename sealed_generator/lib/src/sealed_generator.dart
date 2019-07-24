import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:recase/recase.dart';
import 'package:source_gen/source_gen.dart';

class SealedClassGenerator extends Generator {
  var relationsMap = Map<Element, List<Element>>();

  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {
    var buffer = new StringBuffer();

    library.allElements.forEach(buildRelations);

    print(relationsMap);

    relationsMap.keys.forEach((sealed) => {
          buffer.write("class ${sealed.name}Sealed { "),
          if (relationsMap[sealed].isNotEmpty)
            {
              buffer.write("R when<R>("),
              relationsMap[sealed].asMap().forEach((index, child) => {
                    buffer.write(
                        "R Function(${child.name}) ${ReCase(child.name).camelCase}"),
                    if (index < relationsMap[sealed].length) {buffer.write(",")}
                  }),
              buffer.write(") {"),
              relationsMap[sealed].forEach((child) => {
                    buffer.write("if(this is ${child.name}) {"),
                    buffer.write(
                        "return ${ReCase(child.name).camelCase}(this as ${child.name}); }")
                  }),
              buffer.write(
                  """throw new Exception('If you got here, probably you forgot to regenerate the classes? Try running flutter packages pub run build_runner build');}"""),
            },
          buffer.write("}")
        });

    return "${buffer.toString()}";
  }

  buildRelations(Element element) {
    if (element.hasSealed) {
      relationsMap.putIfAbsent(element, () => List());
    } else {
      if (relationsMap.keys
          .any((value) => value.enclosingElement == element.enclosingElement)) {
        var hasRelation = relationsMap.keys.where(
            (sealed) => element.toString().contains("extends ${sealed.name}"));

        hasRelation.forEach((value) => relationsMap[value].add(element));
      }
    }
  }
}
