package sequential

import mandelbrot.MandelbrotCollect
import mandelbrot.MandelbrotData


int maxIterations, widthPoints
long startTime, endTime
widthPoints = 4096
maxIterations = 2048


startTime = System.currentTimeMillis()
MandelbrotData mandelbrotBase = new MandelbrotData([widthPoints, maxIterations])
MandelbrotCollect mandelbrotCollect = new MandelbrotCollect()

MandelbrotData mandelbrotInstance
mandelbrotInstance = mandelbrotBase.create()
while (mandelbrotInstance != null){
  mandelbrotInstance.calculateColour()
  mandelbrotCollect.collate(mandelbrotInstance, [])
  mandelbrotInstance = mandelbrotBase.create()
}
mandelbrotCollect.finalise([])
endTime = System.currentTimeMillis()
println "Elapsed time = ${endTime-startTime} milliseconds"
