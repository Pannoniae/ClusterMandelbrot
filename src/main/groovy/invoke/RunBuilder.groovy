package invoke


import dsl4cc.DSLbuild.DSLBuilder
import mandelbrot.MandelbrotCollect
import mandelbrot.MandelbrotData

class RunBuilder {
  static void main(String[] args) {
    String workingDirectory = System.getProperty("user.dir")
    DSLBuilder builder = new DSLBuilder("$workingDirectory/src/main/groovy/mandelbrotDSLfiles/mandelbrot1n12w", MandelbrotData, MandelbrotCollect)
    assert builder.builder() : " Build Failed"
  }
}
