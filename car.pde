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
  // if collision is false then run
  if(!car[4]){
    car[0] += random(0, 8);
    car[1] += random(-6, 6);
    //let cars in right land
    if(car[1] <= sizeHeight/4 ){
      car[1] += random(0, 10);
    } else if (car[1] >= sizeHeight*3/4){
      car[1] += random(-10, 0);
    }
    // stop draw if a car run to the finish line
    if(car[0] + car[2] >= sizeWidth){
      println("End!!!!");
      noLoop();
    }
  }
}

objSpace = function(posX, posY, width, height){
  return [posX, posX+width, posY, posY+height]
  // return [left, right, top, bottom]
}

isCollision = function(firstObj, secondObj){
  const first = objSpace(...firstObj);
  const second = objSpace(...secondObj); 

  // size first object < size seccond obj
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

  // size first object > size seccond obj

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

  // size first object = size seccond obj
  if(first[2] === second[2] && first[1] === second[1] && first[3] === second[3]){
  return true;
  }
  return false;
}

checkCollision = function(listObj){
  // check objects is collision or not 
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
  let x = random(sizeHeight/13, sizeHeight*5/13);
  let y = random(sizeWidth*4/25, sizeWidth/3);
  let width = random(sizeWidth/30, sizeWidth/40);
  let height = random(sizeWidth/30, sizeWidth/40);
  return [x, y, width, height , false];
}
createStone = function(){
  let x = random(sizeWidth/6, sizeWidth*11/12);
  let y = random(sizeHeight/3, sizeHeight*5/6);
  let width = random(sizeWidth/60, sizeWidth/24);
  let height = random(sizeWidth/60, sizeWidth/24);
  return [x, y, width, height, true];
}
decorate = function(){
  background(150,150,150);
  noStroke();
  //grass
  fill(0, 255, 0);
  rect(0, sizeHeight*5/6, sizeWidth, sizeHeight/6);
  //sky
  fill(120,120,255);
  rect(0, 0, sizeWidth, sizeHeight/4);
  // cloud
  fill(255,255,255);
  ellipse(sizeWidth/12, sizeHeight/6, sizeWidth/12, sizeHeight/12);
  ellipse(sizeWidth/12, sizeHeight*2/15, sizeWidth/24, sizeHeight/12);
  ellipse(sizeWidth/3, sizeHeight/6, sizeWidth/12, sizeHeight/12);
  ellipse(sizeWidth/3, sizeHeight*2/15, sizeWidth/24, sizeHeight/12);
  ellipse(sizeWidth*7/12, sizeHeight/6, sizeWidth/12, sizeHeight/12);
  ellipse(sizeWidth*7/12, sizeHeight*2/15, sizeWidth/24, sizeHeight/12);
  ellipse(sizeWidth*5/6, sizeHeight/6, sizeWidth/12, sizeHeight/12);
  ellipse(sizeWidth*5/6, sizeHeight*2/15, sizeWidth/24, sizeHeight/12);
}

const sizeHeight = 600;
const sizeWidth = 1200;
const carA = createCar();
const carB = createCar();
const carC = createCar();
const stoneA = createStone();
const stoneB = createStone();
const listObj =[carA, carB, carC, stoneA, stoneB];
setup = function(){
  size(sizeWidth, sizeHeight);
}
draw = function() {
  decorate();

  drawCar(...carA, fill(255, 50, 50));
  drawCar(...carB, fill(50, 255, 50));
  drawCar(...carC, fill(50, 50, 255));

  drawStone(...stoneB);
  drawStone(...stoneA);

  run(carA);
  run(carB);
  run(carC);

  checkCollision(listObj);
};

