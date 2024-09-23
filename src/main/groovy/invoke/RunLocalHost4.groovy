package invoke

import cluster_cli.run.HostRun
import mandelbrot.MandelbrotCollect
import mandelbrot.MandelbrotData

class RunLocalHost4 {
  static void main(String[] args) {
    String structureFile = System.getProperty("user.dir") + "/src/main/groovy/mandelbrotDSLfiles/mandelbrot1n4w512"
    Class  emitClass = MandelbrotData
    Class collectClass = MandelbrotCollect
    new HostRun(structureFile, emitClass, collectClass, "Local").invoke()
  }

}
