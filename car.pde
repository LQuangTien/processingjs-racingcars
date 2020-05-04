size(1000, 500)
drawCar = function(posX, posY, width, height){
  rect(posX, posY, width, height)
  rect(posX - width/6, posY + height*4/7, width*4/3, height*3/7)
  ellipse(posX + width/6, posY + height, height*3/5 , height*3/5)
  ellipse(posX + width*5/6, posY + height, height*3/5, height*3/5)
}
  var xA = 100
  var yA= 100
  var wA = 150
  var hA = 100
  var sA = 1
draw = function(){
  background(150,150,150)
  drawCar(xA,yA,wA,hA)
  xA += sA
  
};

