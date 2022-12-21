package invoke

import dsl4cc.DSLparse.DSLParser

class RunParser {
  static void main(String[] args) {
    String workingDirectory = System.getProperty("user.dir")
    DSLParser parser = new DSLParser("$workingDirectory/src/main/groovy/mandelbrotDSLfiles/mandelbrot1n12w")
    assert parser.parse() :"Parsing failed"
  }

}
