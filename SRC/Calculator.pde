// Maizie Robson | Sep 25 2025 | Calculator
Button[] buttons = new Button[12];
Button[] numButtons = new Button[10];
float l, r, result;
int num =0;
String dVal;
String op;
boolean left;


void setup() {
  size(720, 380);
  background(30);
  l = 0.0;
  r= 0.0;
  result = 0.0;
  dVal = "0.0";
  op = " ";
  left = true;
  buttons[0] = new Button(230, 310, 180, 60, 'C', #FCFF67, #FDFFA2);
  numButtons[0] = new Button(200, 250, 120, 60, '0', #67B4FF, #93CAFF);
  buttons[1] = new Button(290, 250, 60, 60, '.', #67B4FF, #93CAFF);
  numButtons[1] = new Button(170, 190, 60, 60, '1', #67B4FF, #93CAFF);
  numButtons[2] = new Button(230, 190, 60, 60, '2', #67B4FF, #93CAFF);
  numButtons[3] = new Button(290, 190, 60, 60, '3', #67B4FF, #93CAFF);
  numButtons[4] = new Button(170, 130, 60, 60, '4', #67B4FF, #93CAFF);
  numButtons[5] = new Button(230, 130, 60, 60, '5', #67B4FF, #93CAFF);
  numButtons[6] = new Button(290, 130, 60, 60, '6', #67B4FF, #93CAFF);
  numButtons[7] = new Button(170, 70, 60, 60, '7', #67B4FF, #93CAFF);
  numButtons[8] = new Button(230, 70, 60, 60, '8', #67B4FF, #93CAFF);
  numButtons[9] = new Button(290, 70, 60, 60, '9', #67B4FF, #93CAFF);
  buttons[2] = new Button(60, 70, 60, 60, '±', #FCFF67, #FBFCC9);
  buttons[3] = new Button(60, 130, 60, 60, '^', #FCFF67, #FBFCC9);
  buttons[4] = new Button(60, 190, 60, 60, '√', #FCFF67, #FBFCC9);
  buttons[5] = new Button(60, 250, 60, 60, 'π', #FCFF67, #FBFCC9);
  buttons[6] = new Button(60, 310, 60, 60, 'D', #FCFF67, #FBFCC9);
  buttons[7] = new Button(430, 310, 120, 60, '=', #B94242, #EA8080);
  buttons[8] = new Button(430, 250, 120, 60, '-', #B94242, #EA8080);
  buttons[9] = new Button(400, 160, 60, 120, '÷', #B94242, #EA8080);
  buttons[10] = new Button(460, 160, 60, 120, 'x', #B94242, #EA8080);
  buttons[11] = new Button(430, 70, 120, 60, '+', #B94242, #EA8080);
}

void draw() {
  background(30);
  fill(125);
  rect(width/2, 15, width, 40);
  rect(width/2, 365, width, 40);
  for ( int i =0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  for ( int i =0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void mousePressed() {
  for(int i = 0; i<buttons.length; i++) {
    if(buttons[i].over && buttons[i].val == '+') {
      dVal = "0.0";
      left = false;
      op = "+";
    } else if(buttons[i].over && buttons[i].val == '-') {
      dVal = "0.0";
      left = false;
      op = "-";
    } else if(buttons[i].over && buttons[i].val == 'x') {
      dVal = "0.0";
      left = false;
      op = "*";
    } else if(buttons[i].over && buttons[i].val == '÷') {
      dVal = "0.0";
      left = false;
      op = "/";
    } else if(buttons[i].over && buttons[i].val == '^') {
      dVal = "0.0";
      left = false;
      op = "^";
    } else if(buttons[i].over && buttons[i].val == '√') {
      dVal = "0.0";
      left = false;
      op = "√";
    } else if(buttons[i].over && buttons[i].val == 'C') {
      l = 0.0;
      r = 0.0;
      result = 0.0;
      dVal = "0.0";
      left = true;
      op = "";
    } else if(buttons[i].over && buttons[i].val == '=') {
      performCalculation();
      
    } else if(buttons[i].over && buttons[i].val == '√') {
      if(left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(l);
        dVal = str(l);
      }
     } else if(buttons[i].over && buttons[i].val == '±') {
      if(left) {
        l = l * -1;
        dVal = str(l);
      } else {
        r = r*-1;
        dVal = str(l);
      }
      } else if(buttons[i].over && buttons[i].val == 'π') {
      if(left) {
        l = PI;
        dVal = str(l);
      } else {
        r = PI;
        dVal = str(l);
      }
    } else if(buttons[i].over && buttons[i].val == '.'){
      if (dVal.contains (".") == false) {
        dVal += ".";
      }
    } else if (buttons[i].over && buttons[i].val == 'D') {
    if (left) {
      dVal = dVal.substring(0, dVal.length() - 1);
      l=float(dVal);
    } else {
        dVal = dVal.substring(0, dVal.length() - 1);
      r=float(dVal);
    }
    }
   
  }
  
  
  for (int i = 0; i<numButtons.length; i++) {
    if (dVal.length()<15) {
    if (numButtons[i].over && left == true) {
      if (dVal.equals("0.0")) {
        dVal = str(numButtons[i].val);
        l = float(dVal);
      } else {
      dVal += str(numButtons[i].val);
      l = float(dVal);
      }
    } else  if (numButtons[i].over && left == false) {
      if (dVal.equals("0.0")) {
        dVal = str(numButtons[i].val);
        r = float(dVal);
      } else {
      dVal += str(numButtons[i].val);
      r = float(dVal);
      }
    }
  }
  println("l:"+ l);
  println("r:" + r);
  println("result:" + result);
  println("left:" + left);
  println("op:" + op);
}
}


void updateDisplay() {
  fill(200);
  rect(620, height/2, 160, 310);

  fill(0);
  textAlign(RIGHT);
  textSize(20);
  if (dVal.length()<14) {
    textSize(20);
  } else if (dVal.length()>=90){
    textSize(20);
  }
  text(dVal, width-25, 330);
}

void performCalculation() {
  if(op.equals("+")) {
    result = l + r;
  } else if(op.equals("-")) {
    result = l - r;
  } else if(op.equals("*")) {
    result = l * r;
  } else if(op.equals("/")) {
    result = l / r;
  } else if (op.equals("^")) {
   result = pow(l,r);
  } else if (op.equals("√")) {
    result = sqrt(l);
  }
  dVal = str(result);
  l = result;
}
