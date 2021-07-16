from java.lang import System
System.setProperty("jogl.disable.openglcore", "false")


def setup():
    size(1080, 1080, P3D)
    background(0)


toggleStroke = True


def draw():
    background(0)

    # lights()
    ambientLight(50, 50, 50)
    spotLight(255, 0, 0, mouseX, mouseY, 800, 0, 0, -1, PI/8, 2)

    pushMatrix()
    translate(width/2, height/2, 0)
    rotateY(1.25+float(frameCount)/100)
    rotateX(-PI/8)
    # noStroke()

    if toggleStroke:
        stroke(0)
    else:
        noStroke()

    fill(255, 255, 255)
    sphere(450)
    popMatrix()


def keyPressed():
    global toggleStroke
    if key == 'a':
        toggleStroke = not toggleStroke
