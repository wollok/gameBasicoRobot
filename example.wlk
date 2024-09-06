object juegoDeManzanas{

  method iniciar(){
    game.height(9)
	  game.width(9)
    game.addVisual(manzana)
    game.addVisual(robot)

    game.addVisualCharacter(mario)
   
    keyboard.enter().onPressDo({mario.irAlBorde()})
    game.onCollideDo(mario, {algo=>algo.agarrar()})
    game.onTick(1000, "moverse", {robot.moverseSolo()})
  }


}



object robot {
  var position = game.at(2,2)
  method position() = position
  method image() = "robot.png"
  method agarrar() {
    game.removeVisual(robot)
  }
  method moverseSolo() {
    position = game.at(0.randomUpTo(8),0.randomUpTo(8) )
  }
}

object manzana {
  method position() = game.center()
  method image() = "moneda.jpg"

  method agarrar() {
    mario.irAlBorde()

  }
}

object mario{
 
  var dondeEsta = game.origin()

  method position() = dondeEsta
  
  method image() = if (dondeEsta.x() == 8) "vegeta.jpg" else "mario.png"
  
  method position(nueva) {
    dondeEsta = nueva
  }

  method irAlBorde() {
    dondeEsta = game.at(8,dondeEsta.y())
    game.schedule(300, {dondeEsta = dondeEsta.up(1)})

  }


}