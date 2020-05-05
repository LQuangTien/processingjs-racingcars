  size(1000, 500);
drawCar = function(posX, posY, width, height){
   rect(posX, posY, width, height);
   rect(posX - width/6, posY + height*4/7, width*4/3, height*3/7);
   fill(0, 0, 0);
   ellipse(posX + width/6, posY + height, height*3/5 , height*3/5);
   ellipse(posX + width*5/6, posY + height, height*3/5, height*3/5);
}
drawStone = function(posX, posY, width, height){
    ellipse(posX, posY, width, height);
}
run = function(car){
  if(!car[4]){
    car[0] += random(0, 8);
    car[1] += random(-8, 8);
    if(car[1] <= 20 ){
      car[1] += random(0, 10);
    } else if (car[1] >= 450){
      car[1] += random(-10, 0);
    }
    if(car[0] + car[2] >= 1000){
      println("End!!!!");
      noLoop();
    }
  }
}

objSpace = function(posX, posY, width, height){
  return [posX, posX+width, posY, posY+height]
}

isCollision = function(firstObj, secondObj){
  const first = objSpace(...firstObj);
  const second = objSpace(...secondObj); 

  if(first[0] >second[0] && first[0] < second[1]){
    if(first[2] > second[2] && first[2] < second[3]){
      return true
    }
  }
  
  if(first[0] >second[0] && first[0] < second[1]){
    if(first[3] > second[2] && first[3] < second[3]){
      return true
    }
  }

  if(first[1] >second[0] && first[1] < second[1]){
    if(first[2] > second[2] && first[2] < second[3]){
      return true
    }
  }

  if(first[1] >second[0] && first[1] < second[1]){
    if(first[3] > second[2] && first[3] < second[3]){
      return true
    }
  }

  //

  if(second[0] > first[0] && second[0] < first[1]){
    if(second[2] > first[2] && second[2] < first[3]){
    return true
    }
  }

  if(second[0] > first[0] && second[0] < first[1]){
    if(second[3] > first[2] && second[3] < first[3]){
    return true
    }
  }

  if(second[1] > first[0] && second[1] < first[1]){
    if(second[2] > first[2] && second[2] < first[3]){
    return true
    }
  }

  if(second[1] > first[0] && second[1] < first[1]){
    if(second[3] > first[2] && second[3] < first[3]){
    return true
    }
  }
}

checkCollision = function(listObj){
  for(let i = 0; i<listObj.length-1; i++){
    for(let j = i +1; j < listObj.length; j++){
      if(isCollision(listObj[i], listObj[j])){
        listObj[i][4] = true;
        listObj[j][4] = true;
      }
    }
  }
}
createCar = function(){
  return [random(50, 150), random(50, 450), random(50, 80), random(50, 80), false];
}
createStone = function(){
 return [random(300,900), random(50, 450), random(30,60), random(30,60), true];

}
const carA = createCar();
const carB = createCar();
const carC = createCar();
const stoneA = createStone();
const stoneB = createStone();
const stoneC = createStone();
const listObj =[carA, carB, carC, stoneA, stoneB, stoneC];
draw = function() {
  background(150,150,150);

  drawCar(...carA, fill(255, 50, 50));
  drawCar(...carB, fill(50, 255, 50));
  drawCar(...carC, fill(50, 50, 255));

  drawStone(...stoneB);
  drawStone(...stoneA);
  drawStone(...stoneC);

  run(carA);
  run(carB);
  run(carC);

  checkCollision(listObj);
};


