import processing.sound.*;

//Font
PFont title, sub;

//Import Image
PImage ellipse, scene14, scene19;

//Import Sound
SoundFile bg;

float x = 0;  // X position of the person
float y = 0;  // Y position of the person
int legAngle;  // Angle of the person's legs
int legDirection = 1;  // Direction of leg movement
int legSpeed = 1;  // Speed of leg movement
int bodyHeight = 100;  // Height of the person's body
float personX = 0;
float width = 1080;
boolean isFlipped = false;
float cloudX;

// Arsa
// Declare expressioin
boolean isNormal = false;
boolean isSleeping = false;
boolean isConfused = false;
boolean isVeryConfused = false;
boolean isTalking = false;
boolean isSmiling = false;
boolean isVeryHappy = false;

// Declare POV
boolean isFront = false;
boolean isBack = false;

//Hand
boolean isRaising = false;

// Supri
// Declare expressioin
boolean isNormal1 = false;
boolean isConfused1 = false;
boolean isTalking1 = false;
boolean isSmiling1 = false;

boolean isFlipped1 = false;

//Hand
boolean isRaising1 = false;

// Sugeng
// Declare expressioin
boolean isNormal2 = false;
boolean isTalking2 = false;
boolean isSmiling2 = false;


// Gundukan village
float gundukanKiriX = 200;
float gundukanKananX = 1600;
color gundukanColor = #A3AC51;
color gundukanShadowColor = #72844A;

// Zoom factor
float zoom = 1.0;


int[] colorPalette = {#F6AB94, #E19077, #D86177, #562F32, #626D8B, #C59356, #AA773E, #F5C2B2,
                      #864448, #CF5A51, #606B89, #4F576F, #8E474C, #733B3F, #552D2F, #A2525F, #79626A, #5A4B52, #FAEED6,
                      #E7DBC3, #D6C7B0, #B7A692, #595E74, #D18670, #80331F, #FFFFFF, #BED3F2, #FFBA42, #859F56, #FFE1A1,
                      #D48B3E, #DA3D2E, #71BFBF, #67ADAB, #CCEBED, #FDD06B, #A3AC51, #7E944D, #72844A, #9D5F4B, #6F4538,
                      #EDE6CC, #24272C, #D9D9D9, #DFCF30, #386029, #B2EF71, #99D15F, #83BE46};

// Frame
int counter = 0; //Total frame dari awal
int width2 = 1920;
int height2 = 1080;

String[] credits = {
  "Zheka (21523195)",
  "Saarah Muthiah Yasmin (21523252)",
  "Nadia Reva Salsabila Ramadhani (21523175)",
  "Muhammad Ibnu Wardhana (21523227)",
  "Jihan Syahira Putri Adnanda (21523232)",
  "Diva Ivani Arista Pangastuti (21523217)",
  "Team UHUY",
};

int yPos;           // Initial y-position of the credits
int speed2 = 2;      // Speed at which the credits move upwards

// Sound
//float soundVolume = 1.0;  // Initial volume value
//float fadeOutSpeed = 0.01;  // Speed at which the sound fades out

void setup(){
  background(#C4B59E);
  size(1920, 1080);
    bg = new SoundFile(this, "Sound/Audio.wav");
    bg.play();
  //s_crowded = new SoundFile(this, "Sound/s_crowded.wav");
    yPos = height;  // Start from the bottom
}

void draw(){
  counter++; // Increment the frame counter
  //  if (frameToSec(counter) >= 1) {
  //   bg.play();
  //}
  
  // Determine the current scene based on the second
  if (frameToSec(counter) >= 0 && frameToSec(counter) < 8) {
    drawScene1 (0, 8);
  } else if (frameToSec(counter) >= 8 && frameToSec(counter) < 20) {
    drawScene2(8, 20);
  } else if (frameToSec(counter) >= 20 && frameToSec(counter) < 25) {
    drawScene3(20, 25);
  } else if (frameToSec(counter) >= 25 && frameToSec(counter) < 34) {
    drawScene4(25, 34);
  } else if (frameToSec(counter) >= 34 && frameToSec(counter) < 50) {
    drawScene5(34, 50);
  } else if (frameToSec(counter) >= 50 && frameToSec(counter) < 57) {
    drawScene6(50, 57);
  } else if (frameToSec(counter) >= 57 && frameToSec(counter) < 66) {
    drawScene7(57, 66);
  }  else if (frameToSec(counter) >= 66 && frameToSec(counter) < 67) {
    drawScene8(66, 67);
  } else if (frameToSec(counter) >= 67 && frameToSec(counter) < 75) {
    drawScene9(67, 75);
  } else if (frameToSec(counter) >= 75 && frameToSec(counter) < 83) {
    drawScene10 (75, 83);
  } else if (frameToSec(counter) >= 83 && frameToSec(counter) < 87) {
    drawScene11 (83, 87);
  } else if (frameToSec(counter) >= 87 && frameToSec(counter) < 88) {
    drawScene12 (87, 88);
  } else if (frameToSec(counter) >= 88 && frameToSec(counter) < 93) {
    drawScene13 (88, 93);
  } else if (frameToSec(counter) >= 93 && frameToSec(counter) < 100) {
    drawScene14 (93, 100);
  }else if (frameToSec(counter) >= 100 && frameToSec(counter) < 106) {
    drawScene15 (100, 106);
  }else if(frameToSec(counter) >= 106 && frameToSec(counter) < 110) {
    drawScene16 (106, 112);
  } else if(frameToSec(counter) >= 110 && frameToSec(counter) < 116) {
    drawScene17 (110, 116);
  }  
  else if(frameToSec(counter) >= 116 && frameToSec(counter) < 129) {
    drawCredits (116, 129);
  } 
}

// ================================== credits =========================================
void drawCredits (float start, float end){
  background(0);

  fill(255);
  textSize(50);
  textAlign(CENTER);

  for (int i = 0; i < credits.length; i++) {
    text(credits[i], width2/2, yPos - i * 70 + credits.length * 70);
  }

  yPos -= speed;  // Move the credits upwards

  // Restart the credits once they have moved off the screen
  if (yPos < -credits.length * 70) {
    yPos = height2;
  }
}

// ================================== scene 1 =========================================
void drawScene1(float start, float end) { 
  background(#C4B59E);
  //frameRate(200);
  personX += 4;  // Move the person to the right
  
  //roof
  noStroke();
  fill(colorPalette[20]);
  rect(0, 0, 1920, 280);
  
  //roof's shadow
  fill(colorPalette[21]);
  rect(0, 280, 1920, 100);
  
  //pillar1
  fill(colorPalette[20]);
  rect(0, 280, 100, 75);
  fill(#E9DAC3);
  rect(0, 299, 100, 56);
  fill(colorPalette[20]);
  rect(0, 355, 71, 454);
  fill(colorPalette[19]);
  rect(0, 406, 71, 402);
  fill(#FAEED6);
  rect(0, 469, 53, 322, 100);
  
  //pillar2
  fill(colorPalette[20]);
  rect(266, 280, 200, 75);
  fill(#E9DAC3);
  rect(323, 299, 143, 56);
  fill(colorPalette[20]);
  rect(295, 355, 142, 454);
  fill(colorPalette[19]);
  rect(336, 406, 101, 402);
  fill(#FAEED6);
  rect(360, 469, 53, 322, 100);
  
  //pillar3
  fill(colorPalette[20]);
  rect(647, 280, 200, 75);
  fill(#E9DAC3);
  rect(705, 299, 143, 56);
  fill(colorPalette[20]);
  rect(676, 355, 142, 454);
  fill(colorPalette[19]);
  rect(717, 406, 101, 402);
  fill(#FAEED6);
  rect(747, 469, 53, 322, 100);
  
  //pillar4
  fill(colorPalette[20]);
  rect(1040, 280, 200, 75); //+100
  fill(#E9DAC3);
  rect(1097, 299, 143, 56); //+100
  fill(colorPalette[20]);
  rect(1069, 355, 142, 454); //+71
  fill(colorPalette[19]);
  rect(1110, 406, 101, 402); //+71
  fill(#FAEED6);
  rect(1140, 469, 53, 322, 100); //+53
  
  //pillar5
  fill(colorPalette[20]);
  rect(1433, 280, 200, 75); //+100
  fill(#E9DAC3);
  rect(1490, 299, 143, 56); //+100
  fill(colorPalette[20]);
  rect(1462, 355, 142, 454); //+71
  fill(colorPalette[19]);
  rect(1503, 406, 101, 402); //+71
  fill(#FAEED6);
  rect(1533, 469, 53, 322, 100); //+53
  
  //pillar6
  fill(colorPalette[20]);
  rect(1791, 280, 125, 75);
  fill(#E9DAC3);
  rect(1848, 299, 68, 56); //+100
  fill(colorPalette[20]);
  rect(1820, 355, 142, 454); //+71
  fill(colorPalette[19]);
  rect(1861, 406, 101, 402); //+71
  fill(#FAEED6);
  rect(1891, 469, 53, 322, 100); //+53
  
  //door1
  fill(#E9DAC3);
  rect(106, 570, 158, 238); 
  fill(#595E74);
  rect(118, 584, 134, 224);
  
  //door2
  fill(#E9DAC3);
  rect(480, 570, 158, 238); //+71
  fill(#595E74);
  rect(492, 584, 134, 224); //+83
  
  //door3
  fill(#E9DAC3);
  rect(865, 570, 158, 238); //+71
  fill(#595E74);
  rect(877, 584, 134, 224); //+83
  
  //door4
  fill(#E9DAC3);
  rect(1258, 570, 158, 238); //+71
  fill(#595E74);
  rect(1270, 584, 134, 224); //+83
  
  //door5
  fill(#E9DAC3);
  rect(1634, 570, 158, 238); //+71
  fill(#595E74);
  rect(1646, 584, 134, 224); //+83
  
  //tangga
  fill(#B7A692);
  rect(0, 810, 1920, 302);
  fill(#E7DBC3);
  rect(0, 853, 1920, 47);
  rect(0, 937, 1920, 47);
  
  if (frameToSec(counter) >= start && frameToSec(counter) < end) {
    isFlipped = false;
    drawArsa(personX);
  }
}

// ================================== scene 2 =========================================
void drawScene2(float start, float end) { 
   if (frameToSec(counter) == start) {
    personX = 0;
  }
  
  background(colorPalette[18]);
  noStroke();
  
  //lantai
  fill(colorPalette[23]);
  rect(0, 920, 1920, 252);
  
  //bingkai lukisan 1
  fill(#80331F);
  rect(126, 115, 1034, 691);
  //lukisan
  fill(colorPalette[26]);
  rect(164, 153, 954, 615);
  //awan
  fill(#FFFFFF);
  rect(164, 170, 100, 50, 0, 100, 100, 0);
  fill(#FFFFFF);
  rect(164, 210, 150, 50, 0, 100, 100, 0);
  //matahari
  fill(#FDD06B);
  ellipse(840, 210, 50, 50);
  //gunung
  fill(#71BFBF);
  triangle(164, 526.779, 641, 200, 1118, 526.779);
  //tanah
  fill(#7E944D);
  rect(164, 526.779, 954, 85.221);
  fill(#72844A);
  rect(164, 612, 954, 156);
  //rumah
  fill(#DA3D2E);
  triangle(300, 400, 410, 300, 520, 400); //atap
  fill(#FFE1A1);
  rect(320, 400, 180, 150); //tembok
  fill(#D48B3E);
  rect(340, 450, 40, 60); //jendela
  fill(#D48B3E);
  rect(400, 450, 50, 100); //pintu
  //pohon
  fill(#9D5F4B);
  rect(910, 153, 210, 615);
  fill(#6F4538);
  rect(978, 153, 20, 130, 100);
  fill(#6F4538);
  rect(1040, 260, 20, 130, 100);
  fill(#6F4538);
  rect(1090, 390, 20, 130, 100);
  fill(#6F4538);
  rect(978, 520, 20, 130, 100);
  fill(#6F4538);
  rect(1040, 620, 20, 130, 100);
  
  //bingkai lukisan 2
  fill(#80331F);
  rect(1229, 264, 783, 542);
  //lukisan
  fill(colorPalette[26]);
  rect(1271.26, 302.26, 709.503, 457.384); //langit
  fill(#FFBA42);
  rect(1271.26, 612, 709.503, 148); //pasir
  fill(#FFFFFF);
  ellipse(1800, 390, 93, 93);
  fill(#859F56);
  rect(1400, 458, 111, 302, 100, 100, 0, 0); //kaktus besar
  pushMatrix();
  rotate(radians(79));
  fill(#859F56);
  rect(850, -1470, 77.274, 145, 100, 100, 0, 0); //kaktus kecil
  popMatrix();
  //personX = 0;  // Reset the person's X position to 0
  

  if (frameToSec(counter) >= start && frameToSec(counter) < end) {
    if (frameToSec(counter) >= start && frameToSec(counter) <= 13) {
      personX += 4;  // Move the person to the right

      isFlipped = true;
      drawArsa(personX);
    } else if (frameToSec(counter) > 13 && frameToSec(counter) <= 14) {
      isFront = true;
      isNormal = true;
      isFlipped = false;
      drawStoppedArsa(personX);
    }  else if (frameToSec(counter) > 14 && frameToSec(counter) <= 15){
      isFront = false;
          isBack = true;
          isFlipped = false;
          drawStoppedArsa(personX);
          
    } else if (frameToSec(counter) > 15 && frameToSec(counter) <= 16) {
          PImage ellipseImage = loadImage("Img/Blurred_Ellipse.png");
          image(ellipseImage, 100, 140);
          
          isFront = false;
          isBack = true;
                    isFlipped = false;
          drawStoppedArsa(personX);
    } else if (frameToSec(counter) > 16 && frameToSec(counter) <= 17) {
        PImage ellipseImage = loadImage("Img/Blurred_Ellipse.png");
        image(ellipseImage, 100, 140);
  }
}
}

// ================================== scene 3 =========================================
void drawScene3(float start, float end){
    if (frameToSec(counter) == start) {
      zoom = 1.0;
    }
  
    // Clear the canvas
    background(#CCEBED);
  
    // Update the positions of gundukan kiri and gundukan kanan
    gundukanKiriX -= 1.5;  // Move gundukan kiri to the left
    gundukanKananX += 1.5; // Move gundukan kanan to the right
  
    // Update the zoom factor
    zoom += 0.002; // Increase the zoom factor gradually
  
    // Apply zooming transformations
    translate(width / 2, height / 2); // Translate to the center of the canvas
    scale(zoom); // Apply the zoom factor
    translate(-width / 2, -height / 2); // Translate back to the original position
  
    // Draw the scene
    // sun
    fill(#ffba42);
    ellipse(781, 165, 141, 141);
  
    // awan kiri
    fill(#ffffff);
    rect(-80, 160, 200, 40, 200);
    rect(-20, 200, 200, 40, 200);
  
    // awan kanan
    fill(#ffffff);
    rect(1800, 100, 200, 40, 200);
    rect(1740, 140, 200, 40, 200);
  
    // tanah
    fill(#7E944D);
    rect(0, 660, 1920, 45);
    fill(#72844A);
    rect(0, 702, 1920, 352);
  
    // gunung
    fill(#67ADAB);
    triangle(1300, 340, 952, 660, 1720, 660);
    fill(#71BFBF);
    triangle(600, 220, 57, 660, 1230, 660);
    
    // Title
    title = createFont("Fonts/Grandstander-Medium.ttf", 48);
    textFont(title);
    fill(#FFFFFF);
    text("Brushes Across Time:", width/2-100, height/2+100);
    
    title = createFont("Fonts/Grandstander-Regular.ttf", 28);
    textFont(title);
    text("Arsa's Journey through History", width/2+395, height/2+100);
  
    // rumah
    // rumah1
    fill(#ffe1a1);
    rect(405, 725, 82, 49);
    fill(#D48B3E);
    rect(437, 741, 19, 33);
    fill(#DA3D2E);
    triangle(386, 725, 446, 665, 507, 725);
  
    // rumah2
    fill(#ffe1a1);
    rect(741, 763, 116, 69);
    fill(#D48B3E);
    rect(786, 785, 27, 47);
    fill(#DA3D2E);
    triangle(713, 763, 798, 678, 884, 763);
  
    // rumah3
    fill(#ffe1a1);
    rect(1014, 713, 92, 55);
    fill(#D48B3E);
    rect(1050, 731, 21, 37);
    fill(#DA3D2E);
    triangle(991, 713, 1059, 645, 1128, 713);
  
    // rumah4
    fill(#ffe1a1);
    rect(1600, 725, 82, 49);
    fill(#D48B3E);
    rect(1632, 741, 19, 33);
    fill(#DA3D2E);
    triangle(1580, 725, 1640, 665, 1701, 725);
  
    // gundukan kiri
    fill(gundukanColor);
    ellipse(gundukanKiriX, 1100, 1000, 1000);
    fill(gundukanShadowColor);
    ellipse(gundukanKiriX - 110, 1150, 1000, 1000);
  
    // gundukan kanan
    fill(gundukanColor);
    ellipse(gundukanKananX, 1200, 1200, 1332);
    fill(gundukanShadowColor);
    ellipse(gundukanKananX + 300, 1250, 1520, 1332);
}

// ================================== scene 4 =========================================
void drawScene4(float start, float end){
  frameRate = 60;
  background(#CCEBED);  // Set the background color
  noStroke();
          //sun
  fill(#ffba42);
  ellipse(1422, 130, 141, 141);
  //awan kiri
  fill(#ffffff);
  rect(-80, 60, 200, 40, 200);
  rect(-20, 100, 200, 40, 200);
  //tanah
   fill(#7E944D);
  rect(0, 815, 1920, 45);
  fill(#72844A);
  rect(0, 855, 1920, 200);
  
  //gunung
   fill(#67ADAB);
  triangle(800, 20, -130, 815, 1730, 815);

  //batang
  fill(#9D5F4B);
  rect(1611, 0, 395, 1157);
  //pola
  fill(#6F4538);
  rect(1679, 0, 45, 231, 100);
  rect(1803, 135, 45, 231, 100);
  rect(1889, 444, 45, 231, 100);
  rect(1749, 776, 45, 231, 100);
  rect(1844, 949, 45, 231, 100);
  
   //rumah
  //tembok
  fill(#ffe1a1);
  rect(142, 473, 713, 424);
  //pintu
  fill(#D48B3E);
  rect(418, 608, 166, 289);
  //jendela
  fill(#D48B3E);
  rect(212, 627, 122, 179);
  //atap
  fill(#DA3D2E);
  triangle(505, 49, 80, 473, 935, 473);
  
  isNormal = false;
  
  if (frameToSec(counter) >= start && frameToSec(counter) < end) {
      if (frameToSec(counter) >= start && frameToSec(counter) < start+3) {
          isFront = true;
          isBack = false;
          isNormal = false;
          isSleeping = true;
      } else if (frameToSec(counter) >= start+3 && frameToSec(counter) < start+6) {
          isFront = true;
          isSleeping = false;
          isConfused = true;
          isBack = false;
      } 
      else if (frameToSec(counter) >= start+6 && frameToSec(counter) < start+7) {
          isFront = false;
          isBack = true;
      } else if (frameToSec(counter) >= start+7 && frameToSec(counter) < start+12) {
          isFront = true;
          isBack = false;
      }
      
      //Arsa
        if (isFront){
          scale(1.3);
          scale(-1, 1);
          translate(-width, 0);
          
          if (frameToSec(counter) >= start && frameToSec(counter) < start+5) {
            translate(-500,-5);
            rotate(radians(-10));
          } else if (frameToSec(counter) >= start+5 && frameToSec(counter) < end) {
            translate(-250,-100);
            rotate(radians(-2));
          }
                    
          //Left Hand
          fill (colorPalette[0]);
          pushMatrix();  // Save the current transformation matrix
          translate(224, 720);  // Move the coordinate system to the right hand position
          rotate(radians(-10));  // Rotate the coordinate system for the right hand
          ellipse(20, 170, 50, 50);
          // Pergelangan tangan
          rect(10, 4, 28, 177);
          // Lengan
          fill (colorPalette[4]);
          rect(0, 0, 45, 88, 30, 30, 0, 0); 
          popMatrix();
          
          // Left Leg
          fill (colorPalette[0]);
          rect(234, 843, 38, 237);
          fill (colorPalette[6]);
          rect (190, 828, 93, 110, 30, 30, 0, 0);
          
          // Right Leg
          fill (colorPalette[0]);
          rect(165, 843, 38, 237);
          fill (colorPalette[5]);
          rect (136, 828, 93, 110, 30, 30, 0, 0);
          
          // Draw the Neck
          fill (colorPalette[1]);
          rect(214, 660, 37, 75);
          arc (220, 694, 55, 86, radians(45), radians(180));
          
          // Shirt
          fill (colorPalette[4]);
          beginShape();
          vertex(285, 843);
          vertex(136, 843);
          bezierVertex(135, 779, 136, 773, 135, 752);
          bezierVertex(145, 728, 155, 704, 183, 695);
          bezierVertex(210, 690, 225, 720, 238, 720);
          bezierVertex(249, 721, 249, 708, 251, 701);
          bezierVertex(252, 701, 263, 700, 270, 711);
          bezierVertex(277, 721, 278, 700, 285, 843);
          endShape();
          
          // Right Hand
          // Telapak
          fill (colorPalette[0]);
          ellipse(116, 905, 50, 50);
          pushMatrix(); 
          translate(145, 722);  // Move the coordinate system to the right hand position
          rotate(radians(17));  // Rotate the coordinate system for the right hand
          // Pergelangan tangan
          rect(10, 4, 28, 177);
          // Lengan
          fill (colorPalette[4]);
          rect(0, 0, 45, 88, 30, 30, 0, 0);  // Draw the right hand with rounded corners
          popMatrix();
          
          // Draw the Hair
          fill (colorPalette[3]);
          ellipse(186, 625, 95, 95);
          ellipse(150, 575, 93, 93);
          ellipse(158, 511, 112, 112);
          ellipse(196, 467, 123, 123);
          ellipse(282, 453, 150, 150);
          ellipse(365, 507, 90, 90);
          ellipse(350, 570, 71, 71);
          
          // Draw the Ear
          fill (colorPalette[0]);
          ellipse(160, 575, 61, 61);
          
          // Draw the face
          beginShape();
          vertex(173, 572);
          vertex(196, 542);
          vertex(196, 520);
          bezierVertex(203, 521, 219, 523, 226, 518);
          bezierVertex(233, 512, 243, 499, 247, 493);
          bezierVertex(255, 499, 274, 512, 290, 516);
          bezierVertex(306, 519, 346, 517, 364, 512);
          bezierVertex(364, 558, 360, 645, 341, 661);
          bezierVertex(317, 681, 284, 684, 266, 684);
          bezierVertex(248, 684, 194, 662, 180, 639);
          bezierVertex(168, 620, 165, 608, 165, 605);
          endShape();
          
          // Blush
          fill (colorPalette[2]);
          ellipse (210, 600, 17, 17);
          ellipse (345, 610, 16, 16);
          
          // Expression
          if (isNormal) {
            // Right Eyebrow
            noFill();
            stroke (colorPalette[3]);
            strokeWeight(4);
            beginShape();
            vertex(230, 547);
            bezierVertex(234, 545, 243, 539, 245, 539);
            bezierVertex(255, 539, 261, 542, 263, 543);
            endShape();
            // Left Eyebrow
            beginShape();
            vertex(313, 549);
            bezierVertex(318, 548, 329, 546, 334, 549);
            bezierVertex(340, 551, 344, 556, 346, 558);
            endShape();
            // Lip
            beginShape();
            vertex(263, 627);
            bezierVertex(268, 631, 282, 639, 291, 638);
            bezierVertex(301, 637, 307, 632, 309, 630);
            endShape();
            // Eye
            noStroke();
            fill (colorPalette[3]);
            ellipse (250, 580, 14, 18);
            ellipse (325, 585, 14, 18);
          }
          
          else if (isSleeping){
            // Sleep
            // Right Eyebrow
            noFill();
            stroke (colorPalette[3]);
            strokeWeight(4);
            beginShape();
            vertex(230, 547);
            bezierVertex(234, 545, 243, 539, 245, 539);
            bezierVertex(255, 539, 261, 542, 263, 543);
            endShape();
            // Left Eyebrow
            beginShape();
            vertex(313, 549);
            bezierVertex(318, 548, 329, 546, 334, 549);
            bezierVertex(340, 551, 344, 556, 346, 558);
            endShape();
            // Lip
            beginShape();
            vertex(267, 643);
            bezierVertex(272, 641, 281, 640, 287, 641);
            bezierVertex(294, 642, 300, 643, 302, 644);
            endShape();
            // Eye
            line(314, 576, 342, 581);
            line(235, 576, 263, 574);
          }
          
          else if (isConfused) {
            // Right Eyebrow
            noFill();
            stroke (colorPalette[3]);
            strokeWeight(4);
            beginShape();
            vertex(230, 547);
            bezierVertex(234, 545, 243, 539, 245, 539);
            bezierVertex(255, 539, 261, 542, 263, 543);
            endShape();
            // Left Eyebrow
            beginShape();
            vertex(313, 549);
            bezierVertex(318, 548, 329, 546, 334, 549);
            bezierVertex(340, 551, 344, 556, 346, 558);
            endShape();
            // Lip
            beginShape();
            vertex(267, 643);
            bezierVertex(272, 641, 281, 640, 287, 641);
            bezierVertex(294, 642, 300, 643, 302, 644);
            endShape();
            // Eye
            noStroke();
            fill (colorPalette[3]);
            ellipse (250, 580, 14, 18);
            ellipse (325, 585, 14, 18);
          }
          
          else if (isVeryConfused) {
            // Right Eyebrow
            noFill();
            stroke (colorPalette[3]);
            strokeWeight(4);
            beginShape();
            vertex(230, 547);
            bezierVertex(234, 545, 243, 539, 245, 539);
            bezierVertex(255, 539, 261, 542, 263, 543);
            endShape();
            // Left Eyebrow
            beginShape();
            vertex(313, 546);
            bezierVertex(315, 547, 322, 549, 328, 548);
            bezierVertex(335, 548, 343, 541, 346, 537);
            endShape();
            // Lip
            beginShape();
            vertex(267, 643);
            bezierVertex(272, 641, 281, 640, 287, 641);
            bezierVertex(294, 642, 300, 643, 302, 644);
            endShape();
            // Eye
            noStroke();
            fill (colorPalette[3]);
            ellipse (250, 580, 14, 18);
            ellipse (325, 585, 14, 18);
          }
          
          else if (isTalking) {
            // Right Eyebrow
            noFill();
            stroke (colorPalette[3]);
            strokeWeight(4);
            beginShape();
            vertex(230, 547);
            bezierVertex(234, 545, 243, 539, 245, 539);
            bezierVertex(255, 539, 261, 542, 263, 543);
            endShape();
            // Left Eyebrow
            beginShape();
            vertex(313, 549);
            bezierVertex(318, 548, 329, 546, 334, 549);
            bezierVertex(340, 551, 344, 556, 346, 558);
            endShape();
            // Lip
            noStroke();
            fill (colorPalette[3]);
            ellipse(280, 640, 14, 18);
            // Eye
            ellipse (250, 580, 14, 18);
            ellipse (325, 585, 14, 18);
          }
          
          else if (isSmiling) {
            // Right Eyebrow
            noFill();
            stroke (colorPalette[3]);
            strokeWeight(4);
            beginShape();
            vertex(230, 547);
            bezierVertex(234, 545, 243, 539, 245, 539);
            bezierVertex(255, 539, 261, 542, 263, 543);
            endShape();
            // Left Eyebrow
            beginShape();
            vertex(313, 549);
            bezierVertex(318, 548, 329, 546, 334, 549);
            bezierVertex(340, 551, 344, 556, 346, 558);
            endShape();
            // Lip
            noStroke();
            fill (colorPalette[3]);
            beginShape();
            vertex(302, 634);
            vertex(294, 642);
            bezierVertex(292, 644, 288, 648, 279, 648);
            bezierVertex(272, 648, 261, 634, 257, 626);
            bezierVertex(264, 630, 278, 636, 282, 636);
            bezierVertex(286, 637, 298, 636, 302, 634);
            endShape();
            // Eye
            ellipse (250, 580, 14, 18);
            ellipse (325, 585, 14, 18);
          }
          
          else if (isVeryHappy) {
            // Right Eyebrow
            noFill();
            stroke (colorPalette[3]);
            strokeWeight(4);
            beginShape();
            vertex(230, 547);
            bezierVertex(234, 545, 243, 539, 245, 539);
            bezierVertex(255, 539, 261, 542, 263, 543);
            endShape();
            // Left Eyebrow
            beginShape();
            vertex(313, 549);
            bezierVertex(318, 548, 329, 546, 334, 549);
            bezierVertex(340, 551, 344, 556, 346, 558);
            endShape();
            // Eye
            strokeWeight(3);
            beginShape();
            vertex(236, 571);
            bezierVertex(238, 569, 240, 565, 247, 564);
            bezierVertex(254, 563, 264, 568, 268, 570);
            endShape();
            beginShape();
            vertex(308, 573);
            bezierVertex(311, 572, 318, 571, 324, 573);
            bezierVertex(331, 574, 335, 578, 338, 582);
            endShape();
            // Lip
            noStroke();
            fill (colorPalette[3]);
            beginShape();
            vertex(302, 634);
            vertex(294, 642);
            bezierVertex(292, 644, 288, 648, 279, 648);
            bezierVertex(272, 648, 261, 634, 257, 626);
            bezierVertex(264, 630, 278, 636, 282, 636);
            bezierVertex(286, 637, 298, 636, 302, 634);
            endShape();
          }
        }
        
        else if (isBack) {
          scale(1.3);
          scale(-1, 1);
          translate(-width, 0);
          
          if (frameToSec(counter) >= start && frameToSec(counter) < start+5) {
            translate(-500,-5);
            rotate(radians(-10));
          } else if (frameToSec(counter) >= start+5 && frameToSec(counter) < end) {
            translate(-250,-100);
            rotate(radians(-3));
          }
          
          // Arsa  
          //Left Hand
          fill (colorPalette[0]);
          pushMatrix();
          translate(224, 720);
          rotate(radians(-10));
          ellipse(20, 170, 50, 50);
          // Pergelangan tangan
          rect(10, 4, 28, 177);
          // Lengan
          fill (colorPalette[4]);
          rect(0, 0, 45, 88, 30, 30, 0, 0); 
          popMatrix();
          
          // Left Leg
          fill (colorPalette[0]);
          rect(234, 843, 38, 237);
          fill (colorPalette[6]);
          rect (190, 828, 93, 110, 30, 30, 0, 0);
          
          // Right Leg
          fill (colorPalette[0]);
          rect(165, 843, 38, 237);
          fill (colorPalette[5]);
          rect (136, 828, 93, 110, 30, 30, 0, 0);
          
          // Draw the Neck
          fill (colorPalette[1]);
          rect(214, 660, 37, 75);
          arc (220, 694, 55, 86, radians(45), radians(180));
          
          // Shirt
          fill (colorPalette[4]);
          beginShape();
          vertex(285, 843);
          vertex(136, 843);
          bezierVertex(135, 779, 136, 773, 135, 752);
          bezierVertex(145, 728, 155, 704, 183, 695);
          bezierVertex(210, 690, 225, 720, 238, 720);
          bezierVertex(249, 721, 249, 708, 251, 701);
          bezierVertex(252, 701, 263, 700, 270, 711);
          bezierVertex(277, 721, 278, 700, 285, 843);
          endShape();
          
          // Right Hand
          // Telapak
          fill (colorPalette[0]);
          ellipse(116, 905, 50, 50);
          pushMatrix(); 
          translate(145, 722);
          rotate(radians(17));
          // Pergelangan tangan
          rect(10, 4, 28, 177);
          // Lengan
          fill (colorPalette[4]);
          rect(0, 0, 45, 88, 30, 30, 0, 0);
          popMatrix();
          
          // Draw the Hair
          pushMatrix(); 
          translate(0, 20);
          fill (colorPalette[3]);
          ellipse(186, 625, 95, 95);
          ellipse(150, 575, 93, 93);
          ellipse(158, 511, 112, 112);
          ellipse(196, 467, 123, 123);
          ellipse(282, 463, 140, 140);
          ellipse(345, 507, 90, 90);
          ellipse(350, 570, 71, 71);
          ellipse(225, 575, 166, 176);
          ellipse(340, 580, 92, 98);
          ellipse(320, 550, 112, 119);
          ellipse(250, 630, 92, 98);
          ellipse(300, 620, 84, 88);
          popMatrix();
        }
  }
}

// ================================== scene 5 =========================================
void drawScene5(float start, float end){
  background(#CCEBED);
  noStroke();
  
    // Move the cloud to the right
  cloudX += 1;

  // Reset the cloud's position once it moves off-screen
  if (cloudX > width2 + 332) {
    cloudX = -332;
  }

  // Draw the cloud
  drawCloud(cloudX, 49);
  drawCloud(cloudX + 81, 123);
  
  fill(#7E944D);
  rect(0, 767, 3636, 666);
  fill(#72844A);
  rect(0, 847, 3636, 666);
  fill(#9D5F4B);
  rect(0, 0, 602, 1798);
  fill(#6F4538);
  rect(250, -260, 69, 352, 100);
  rect(384, 207, 69, 352, 100);
  rect(170, 713, 69, 352, 100);
  rect(315, 976, 69, 352, 100);
  
  sub = createFont("Fonts/LucidaGrande.ttf", 32);
  isNormal = false;

  // Character Arsa
  if (frameToSec(counter) >= start && frameToSec(counter) < start+4) {
    isNormal = false;
    isFront = true;
    isBack = false;
    isConfused = true;
  } else if (frameToSec(counter) >= start+4 && frameToSec(counter) < start+8.5) {
    isConfused = false;
    isVeryConfused = true;
  } else if (frameToSec(counter) >= start+8.5 && frameToSec(counter) < start+10) {
    isConfused = false;
    isVeryConfused = false;
    isTalking = true;
    isRaising = true;
  } else if (frameToSec(counter) >= start+10 && frameToSec(counter) < start+11) {
    isConfused = true;
    isVeryConfused = false;
    isTalking = false;
    isRaising = false;
  } else if (frameToSec(counter) >= start+11 && frameToSec(counter) < start+11.5) {
    isConfused = false;
    isVeryConfused = false;
    isTalking = true;
    isRaising = true;

  } else if (frameToSec(counter) >= start+11.5 && frameToSec(counter) < start+15) {
    isConfused = true;
    isVeryConfused = false;
    isTalking = false;
    isRaising = false;
  }
  
   // Arsa  
  translate(200, -335);
  scale(1.7);
  
  //Left Hand
  noStroke();
  fill (colorPalette[0]);
  pushMatrix();
     if (isRaising){
     translate(228, 920);
      rotate(radians(-135));
   } else {
     translate(224, 720);  // Move the coordinate system to the right hand position
      rotate(radians(-10));  // Rotate the coordinate system for the right hand
   }
  ellipse(20, 170, 50, 50);
  // Pergelangan tangan
  rect(10, 4, 28, 177);
  // Lengan
  fill (colorPalette[4]);
  rect(0, 0, 45, 88, 30, 30, 0, 0); 
  popMatrix();
  
  // Left Leg
  fill (colorPalette[0]);
  rect(234, 843, 38, 237);
  fill (colorPalette[6]);
  rect (190, 828, 93, 110, 30, 30, 0, 0);
  
  // Right Leg
  fill (colorPalette[0]);
  rect(165, 843, 38, 237);
  fill (colorPalette[5]);
  rect (136, 828, 93, 110, 30, 30, 0, 0);
  
  // Draw the Neck
  fill (colorPalette[1]);
  rect(214, 660, 37, 75);
  arc (220, 694, 55, 86, radians(45), radians(180));
  
  // Shirt
  fill (colorPalette[4]);
  beginShape();
  vertex(285, 843);
  vertex(136, 843);
  bezierVertex(135, 779, 136, 773, 135, 752);
  bezierVertex(145, 728, 155, 704, 183, 695);
  bezierVertex(210, 690, 225, 720, 238, 720);
  bezierVertex(249, 721, 249, 708, 251, 701);
  bezierVertex(252, 701, 263, 700, 270, 711);
  bezierVertex(277, 721, 278, 700, 285, 843);
  endShape();
  
  // Right Hand
  // Telapak
  fill (colorPalette[0]);
  ellipse(116, 905, 50, 50);
  pushMatrix(); 
  translate(145, 722);
  rotate(radians(17));
  // Pergelangan tangan
  rect(10, 4, 28, 177);
  // Lengan
  fill (colorPalette[4]);
  rect(0, 0, 45, 88, 30, 30, 0, 0);
  popMatrix();
  
  // Draw the Hair
  fill (colorPalette[3]);
  ellipse(186, 625, 95, 95);
  ellipse(150, 575, 93, 93);
  ellipse(158, 511, 112, 112);
  ellipse(196, 467, 123, 123);
  ellipse(282, 453, 150, 150);
  ellipse(365, 507, 90, 90);
  ellipse(350, 570, 71, 71);
  
  // Draw the Ear
  fill (colorPalette[0]);
  ellipse(160, 575, 61, 61);
  
  // Draw the face
  beginShape();
  vertex(173, 572);
  vertex(196, 542);
  vertex(196, 520);
  bezierVertex(203, 521, 219, 523, 226, 518);
  bezierVertex(233, 512, 243, 499, 247, 493);
  bezierVertex(255, 499, 274, 512, 290, 516);
  bezierVertex(306, 519, 346, 517, 364, 512);
  bezierVertex(364, 558, 360, 645, 341, 661);
  bezierVertex(317, 681, 284, 684, 266, 684);
  bezierVertex(248, 684, 194, 662, 180, 639);
  bezierVertex(168, 620, 165, 608, 165, 605);
  endShape();
  
  // Blush
  fill (colorPalette[2]);
  ellipse (210, 600, 17, 17);
  ellipse (345, 610, 16, 16);
  
  // Expression
  if (isNormal) {
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(230, 547);
    bezierVertex(234, 545, 243, 539, 245, 539);
    bezierVertex(255, 539, 261, 542, 263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(313, 549);
    bezierVertex(318, 548, 329, 546, 334, 549);
    bezierVertex(340, 551, 344, 556, 346, 558);
    endShape();
    // Lip
    beginShape();
    vertex(263, 627);
    bezierVertex(268, 631, 282, 639, 291, 638);
    bezierVertex(301, 637, 307, 632, 309, 630);
    endShape();
    // Eye
    noStroke();
    fill (colorPalette[3]);
    ellipse (250, 580, 14, 18);
    ellipse (325, 585, 14, 18);
  }
  
  else if (isSleeping){
    // Sleep
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(230, 547);
    bezierVertex(234, 545, 243, 539, 245, 539);
    bezierVertex(255, 539, 261, 542, 263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(313, 549);
    bezierVertex(318, 548, 329, 546, 334, 549);
    bezierVertex(340, 551, 344, 556, 346, 558);
    endShape();
    // Lip
    beginShape();
    vertex(267, 643);
    bezierVertex(272, 641, 281, 640, 287, 641);
    bezierVertex(294, 642, 300, 643, 302, 644);
    endShape();
    // Eye
    line(314, 576, 342, 581);
    line(235, 576, 263, 574);
  }
  
  else if (isConfused) {
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(230, 547);
    bezierVertex(234, 545, 243, 539, 245, 539);
    bezierVertex(255, 539, 261, 542, 263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(313, 549);
    bezierVertex(318, 548, 329, 546, 334, 549);
    bezierVertex(340, 551, 344, 556, 346, 558);
    endShape();
    // Lip
    beginShape();
    vertex(267, 643);
    bezierVertex(272, 641, 281, 640, 287, 641);
    bezierVertex(294, 642, 300, 643, 302, 644);
    endShape();
    // Eye
    noStroke();
    fill (colorPalette[3]);
    ellipse (250, 580, 14, 18);
    ellipse (325, 585, 14, 18);
  }
  
  else if (isVeryConfused) {
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(230, 547);
    bezierVertex(234, 545, 243, 539, 245, 539);
    bezierVertex(255, 539, 261, 542, 263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(313, 546);
    bezierVertex(315, 547, 322, 549, 328, 548);
    bezierVertex(335, 548, 343, 541, 346, 537);
    endShape();
    // Lip
    beginShape();
    vertex(267, 643);
    bezierVertex(272, 641, 281, 640, 287, 641);
    bezierVertex(294, 642, 300, 643, 302, 644);
    endShape();
    // Eye
    noStroke();
    fill (colorPalette[3]);
    ellipse (250, 580, 14, 18);
    ellipse (325, 585, 14, 18);
  }
  
  else if (isTalking) {
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(230, 547);
    bezierVertex(234, 545, 243, 539, 245, 539);
    bezierVertex(255, 539, 261, 542, 263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(313, 549);
    bezierVertex(318, 548, 329, 546, 334, 549);
    bezierVertex(340, 551, 344, 556, 346, 558);
    endShape();
    // Lip
    noStroke();
    fill (colorPalette[3]);
    ellipse(280, 640, 14, 18);
    // Eye
    ellipse (250, 580, 14, 18);
    ellipse (325, 585, 14, 18);
  }
  
  else if (isSmiling) {
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(230, 547);
    bezierVertex(234, 545, 243, 539, 245, 539);
    bezierVertex(255, 539, 261, 542, 263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(313, 549);
    bezierVertex(318, 548, 329, 546, 334, 549);
    bezierVertex(340, 551, 344, 556, 346, 558);
    endShape();
    // Lip
    noStroke();
    fill (colorPalette[3]);
    beginShape();
    vertex(302, 634);
    vertex(294, 642);
    bezierVertex(292, 644, 288, 648, 279, 648);
    bezierVertex(272, 648, 261, 634, 257, 626);
    bezierVertex(264, 630, 278, 636, 282, 636);
    bezierVertex(286, 637, 298, 636, 302, 634);
    endShape();
    // Eye
    ellipse (250, 580, 14, 18);
    ellipse (325, 585, 14, 18);
  }
  
  else if (isVeryHappy) {
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(230, 547);
    bezierVertex(234, 545, 243, 539, 245, 539);
    bezierVertex(255, 539, 261, 542, 263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(313, 549);
    bezierVertex(318, 548, 329, 546, 334, 549);
    bezierVertex(340, 551, 344, 556, 346, 558);
    endShape();
    // Eye
    strokeWeight(3);
    beginShape();
    vertex(236, 571);
    bezierVertex(238, 569, 240, 565, 247, 564);
    bezierVertex(254, 563, 264, 568, 268, 570);
    endShape();
    beginShape();
    vertex(308, 573);
    bezierVertex(311, 572, 318, 571, 324, 573);
    bezierVertex(331, 574, 335, 578, 338, 582);
    endShape();
    // Lip
    noStroke();
    fill (colorPalette[3]);
    beginShape();
    vertex(302, 634);
    vertex(294, 642);
    bezierVertex(292, 644, 288, 648, 279, 648);
    bezierVertex(272, 648, 261, 634, 257, 626);
    bezierVertex(264, 630, 278, 636, 282, 636);
    bezierVertex(286, 637, 298, 636, 302, 634);
    endShape();
  }
  
    if (frameToSec(counter) == start) {
    personX = 0;
  }
  
  // Character Supri
  if (frameToSec(counter) >= start && frameToSec(counter) < end) {    
    if (frameToSec(counter) >= start+1.25 && frameToSec(counter) < start+5.5) {
      isConfused1 = true;
      personX += 4;  // Move the person to the right
      isFlipped = true;
      drawSupri(personX);
    } else if (frameToSec(counter) >= start+5.5 && frameToSec(counter) < start+7.5) {
      isConfused1 = false;
      isTalking1 = true;
      isFlipped1 = true;
      drawStoppedSupri(personX);
      isRaising1 = true;
    } else if (frameToSec(counter) >= start+7.5 && frameToSec(counter) < start+13) {
      isConfused1 = true;
      isTalking1 = false;
            isFlipped1 = true;
      drawStoppedSupri(personX);
      isRaising1 = false;
  } else if (frameToSec(counter) >= start+13 && frameToSec(counter) < start+15) {
      isConfused1 = false;
      isTalking1 = true;
            isFlipped1 = true;
      drawStoppedSupri(personX);
      isRaising1 = true;
    } else if (frameToSec(counter) >= start+15 && frameToSec(counter) < end) {
      isConfused1 = true;
      isTalking1 = false;
            isFlipped1 = true;
      drawStoppedSupri(personX);
      isRaising1 = false;
  } 
}

// subtitle
    scale(-1, 1);
    translate(-width, 0);
    translate(-1000,0);
    textFont(sub);
    fill(#FFFFFF);
    stroke(#000000);
    strokeWeight(0);
    textAlign(CENTER);
    
 // Sub Arsa
  if (frameToSec(counter) >= start+8.5 && frameToSec(counter) < start+10) {
    text("Huh, my name is Arsa", (1920/2)-500, (1080/2+350)-120); 
    
  } else if (frameToSec(counter) >= start+11 && frameToSec(counter) < start+11.5) {
      text("What is your name",(1920/2)-500, (1080/2+350)-120);
  } 
  
 // Supri
    if (frameToSec(counter) >= start+5.5 && frameToSec(counter) < start+7.5) {
      text("Who are you mas?", (1920/2)-500, (1080/2+350)-120); // 2 detik
    } else if (frameToSec(counter) >= start+13 && frameToSec(counter) < start+15) {
      text("My name is Supri, nice to meet you mas Arsa", (1920/2)-500, (1080/2+350)-120);
    }
}

// ================================== scene 6 =========================================
void drawScene6(float start, float end){
      if (frameToSec(counter) == start) {
      zoom = 1.0;
    }
    
  background(#CCEBED);
  
  fill(#67ADAB);
  strokeWeight(0.1);
  stroke(#67ADAB);
  strokeWeight(20);
  triangle(57, 440, -182, 652, 320, 652);
  
  noStroke();  
  fill(#7E944D);
  rect(0, 660, 1920, 45);
  fill(#72844A);
  rect(0, 702, 1920, 352);
  
    // Move the cloud to the right
  cloudX += 1;

  // Reset the cloud's position once it moves off-screen
  if (cloudX > width2 + 332) {
    cloudX = -332;
  }

  // Draw the cloud
  drawCloud(cloudX, 49);
  drawCloud(cloudX + 81, 123);
  
  fill(#FFFFFF);
  ellipse(980, 1000, 22, 22);
  
  fill(#6F4538);
  ellipse (1060, 1000, 95, 25);

  
  //Sugeng
  if (frameToSec(counter) >= start && frameToSec(counter) < start+1) {
      isNormal2 = true;
  } else if (frameToSec(counter) >= start+1 && frameToSec(counter) < start+3) {
    isNormal2 = false;
    isTalking2 = true;
  } else if (frameToSec(counter) >= start+3 && frameToSec(counter) < end) {
      isNormal2 = true;
      isTalking2 = false;
  }
  
  noStroke();
  translate(210, 135);
  scale(0.9);
    //Left Hand
    fill (colorPalette[12]);
    pushMatrix();  // Save the current transformation matrix
    translate(224, 720);  // Move the coordinate system to the right hand position
    rotate(radians(-10));  // Rotate the coordinate system for the right hand
    ellipse(20, 170, 50, 50);
    // Pergelangan tangan
    rect(10, 4, 28, 177);
    // Lengan
    fill (#A2525F);
    rect(0, 0, 45, 88, 30, 30, 0, 0); 
    popMatrix();
    
    // Left Leg
    fill (colorPalette[12]);
    rect(234, 843, 38, 237);
    fill (colorPalette[17]);
    rect (190, 828, 93, 110, 30, 30, 0, 0);
    
    // Right Leg
    fill (colorPalette[12]);
    rect(165, 843, 38, 237);
    fill (colorPalette[16]);
    rect (136, 828, 93, 110, 30, 30, 0, 0);
    
    // Draw the Neck
    fill (colorPalette[13]);
    rect(214, 660, 37, 75);
    arc (220, 694, 55, 86, radians(45), radians(180));
    
    // Shirt
    fill (#A2525F);
    beginShape();
    vertex(285, 843);
    vertex(136, 843);
    bezierVertex(135, 779, 136, 773, 135, 752);
    bezierVertex(145, 728, 155, 704, 183, 695);
    bezierVertex(210, 690, 225, 720, 238, 720);
    bezierVertex(249, 721, 249, 708, 251, 701);
    bezierVertex(252, 701, 263, 700, 270, 711);
    bezierVertex(277, 721, 278, 700, 285, 843);
    endShape();
    
    // Right Hand
    // Telapak
    fill (colorPalette[12]);
    ellipse(116, 905, 50, 50);
    pushMatrix(); 
    translate(145, 722);  // Move the coordinate system to the right hand position
    rotate(radians(17));  // Rotate the coordinate system for the right hand
    // Pergelangan tangan
    rect(10, 4, 28, 177);
    // Lengan
    fill (colorPalette[15]);
    rect(0, 0, 45, 88, 30, 30, 0, 0);  // Draw the right hand with rounded corners
    popMatrix();
    
    // Draw the Hair
    fill (colorPalette[14]);
    ellipse(186, 600, 95, 95);
    ellipse(150, 560, 93, 93);
    ellipse(158, 511, 112, 112);
    ellipse(196, 467, 123, 123);
    ellipse(282, 463, 150, 150);
    ellipse(365, 507, 90, 90);
    //ellipse(350, 570, 71, 71);
    
    // Draw the Ear
    fill (colorPalette[12]);
    ellipse(160, 575, 61, 61);
    
    // Draw the face
    beginShape();
    vertex(173, 572);
    vertex(196, 542);
    vertex(196, 520);
    bezierVertex(203, 521, 219, 523, 226, 518);
    bezierVertex(233, 512, 243, 499, 247, 493);
    bezierVertex(255, 499, 274, 512, 290, 516);
    bezierVertex(306, 519, 346, 517, 364, 512);
    bezierVertex(364, 558, 360, 645, 341, 661);
    bezierVertex(317, 681, 284, 684, 266, 684);
    bezierVertex(248, 684, 194, 662, 180, 639);
    bezierVertex(168, 620, 165, 608, 165, 605);
    endShape();
    
    // Blush
    fill (colorPalette[2]);
    ellipse (210, 600, 17, 17);
    ellipse (345, 610, 16, 16);
    
    // Expression
    if (isNormal2) {
      // Right Eyebrow
      noFill();
      stroke (colorPalette[14]);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      beginShape();
      vertex(263, 627);
      bezierVertex(268, 631, 282, 639, 291, 638);
      bezierVertex(301, 637, 307, 632, 309, 630);
      endShape();
      // Eye
      noStroke();
      fill (colorPalette[14]);
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    else if (isTalking2) {
      // Right Eyebrow
      noFill();
      stroke (colorPalette[14]);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      noStroke();
      fill (colorPalette[14]);
      ellipse(280, 640, 14, 18);
      // Eye
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    else if (isSmiling2) {
      // Right Eyebrow
      noFill();
      stroke (colorPalette[14]);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      noStroke();
      fill (colorPalette[14]);
      beginShape();
      vertex(302, 634);
      vertex(294, 642);
      bezierVertex(292, 644, 288, 648, 279, 648);
      bezierVertex(272, 648, 261, 634, 257, 626);
      bezierVertex(264, 630, 278, 636, 282, 636);
      bezierVertex(286, 637, 298, 636, 302, 634);
      endShape();
      // Eye
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    scale (1.4);
    translate (0, -200);
    
    // Supri
    if (frameToSec(counter) >= start && frameToSec(counter) < start+4) {
      isNormal1 = true;
      isFlipped1 = true;
      drawStoppedSupri(900);
  }
    else if (frameToSec(counter) >= start+4 && frameToSec(counter) < start+6) {
      isNormal1 = false;
      isConfused1 = false;
      isTalking1 = false;
      isSmiling1 = true;
      isFlipped1 = true;
      drawStoppedSupri(900);
  } else if (frameToSec(counter) >= start+6 && frameToSec(counter) < end) {
      isNormal1 = true;
      isFlipped1 = true;
      drawStoppedSupri(900);
  } 
  
  // sub
  sub = createFont("Fonts/LucidaGrande.ttf", 40);
    scale(-1, 1);
    translate(-width + 140, 100);
    translate(-1000,0);
  textFont(sub);
  stroke(#000000);
  strokeWeight(1);
  fill(#FFFFFF);
  textAlign(CENTER);
  
  //sugeng
  if (frameToSec(counter) >= start+1 && frameToSec(counter) < start+3) {
    text("Hey, Supri! C'mon let's continue to play!", (1920/2)-500, (1080/2+350)-120);
  } else if (frameToSec(counter) >= start+4 && frameToSec(counter) < start+6){
      text("Mas Arsa do you want to join us?", (1920/2)-500, (1080/2+350)-120);
  }
}

// ================================== scene 7 =========================================

void drawScene7(float start, float end){
  background(#CCEBED);
  noStroke();
  
    // Move the cloud to the right
  cloudX += 1;

  // Reset the cloud's position once it moves off-screen
  if (cloudX > width2 + 332) {
    cloudX = -332;
  }

  // Draw the cloud
  drawCloud(cloudX, 49);
  drawCloud(cloudX + 81, 123);
  
  fill(#7E944D);
  rect(0, 767, 3636, 666);
  fill(#72844A);
  rect(0, 847, 3636, 666);
  fill(#9D5F4B);
  rect(0, 0, 602, 1798);
  fill(#6F4538);
  rect(250, -260, 69, 352, 100);
  rect(384, 207, 69, 352, 100);
  rect(170, 713, 69, 352, 100);
  rect(315, 976, 69, 352, 100);
  
  sub = createFont("Fonts/LucidaGrande.ttf", 32);
  
  // Character Arsa
  if (frameToSec(counter) >= start && frameToSec(counter) < start+1) {
    isFront = true;
    isBack = false;
    isConfused = false;
    isNormal = true;
  } else if (frameToSec(counter) >= start+1 && frameToSec(counter) < start+4) {
    isNormal = false;
    isTalking = true;
    isRaising = true;
  } else if (frameToSec(counter) >= start+4 && frameToSec(counter) < end) {
    isNormal = true;
    isVeryConfused = false;
    isTalking = false;
    isRaising = false;
  } 
  
   // Arsa  
  translate(200, -335);
  scale(1.7);
  
  //Left Hand
  noStroke();
  fill (colorPalette[0]);
  pushMatrix();
     if (isRaising){
     translate(228, 920);
      rotate(radians(-135));
   } else {
     translate(224, 720);  // Move the coordinate system to the right hand position
      rotate(radians(-10));  // Rotate the coordinate system for the right hand
   }
  ellipse(20, 170, 50, 50);
  // Pergelangan tangan
  rect(10, 4, 28, 177);
  // Lengan
  fill (colorPalette[4]);
  rect(0, 0, 45, 88, 30, 30, 0, 0); 
  popMatrix();
  
  // Left Leg
  fill (colorPalette[0]);
  rect(234, 843, 38, 237);
  fill (colorPalette[6]);
  rect (190, 828, 93, 110, 30, 30, 0, 0);
  
  // Right Leg
  fill (colorPalette[0]);
  rect(165, 843, 38, 237);
  fill (colorPalette[5]);
  rect (136, 828, 93, 110, 30, 30, 0, 0);
  
  // Draw the Neck
  fill (colorPalette[1]);
  rect(214, 660, 37, 75);
  arc (220, 694, 55, 86, radians(45), radians(180));
  
  // Shirt
  fill (colorPalette[4]);
  beginShape();
  vertex(285, 843);
  vertex(136, 843);
  bezierVertex(135, 779, 136, 773, 135, 752);
  bezierVertex(145, 728, 155, 704, 183, 695);
  bezierVertex(210, 690, 225, 720, 238, 720);
  bezierVertex(249, 721, 249, 708, 251, 701);
  bezierVertex(252, 701, 263, 700, 270, 711);
  bezierVertex(277, 721, 278, 700, 285, 843);
  endShape();
  
  // Right Hand
  // Telapak
  fill (colorPalette[0]);
  ellipse(116, 905, 50, 50);
  pushMatrix(); 
  translate(145, 722);
  rotate(radians(17));
  // Pergelangan tangan
  rect(10, 4, 28, 177);
  // Lengan
  fill (colorPalette[4]);
  rect(0, 0, 45, 88, 30, 30, 0, 0);
  popMatrix();
  
  // Draw the Hair
  fill (colorPalette[3]);
  ellipse(186, 625, 95, 95);
  ellipse(150, 575, 93, 93);
  ellipse(158, 511, 112, 112);
  ellipse(196, 467, 123, 123);
  ellipse(282, 453, 150, 150);
  ellipse(365, 507, 90, 90);
  ellipse(350, 570, 71, 71);
  
  // Draw the Ear
  fill (colorPalette[0]);
  ellipse(160, 575, 61, 61);
  
  // Draw the face
  beginShape();
  vertex(173, 572);
  vertex(196, 542);
  vertex(196, 520);
  bezierVertex(203, 521, 219, 523, 226, 518);
  bezierVertex(233, 512, 243, 499, 247, 493);
  bezierVertex(255, 499, 274, 512, 290, 516);
  bezierVertex(306, 519, 346, 517, 364, 512);
  bezierVertex(364, 558, 360, 645, 341, 661);
  bezierVertex(317, 681, 284, 684, 266, 684);
  bezierVertex(248, 684, 194, 662, 180, 639);
  bezierVertex(168, 620, 165, 608, 165, 605);
  endShape();
  
  // Blush
  fill (colorPalette[2]);
  ellipse (210, 600, 17, 17);
  ellipse (345, 610, 16, 16);
  
  // Expression
  if (isNormal) {
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(230, 547);
    bezierVertex(234, 545, 243, 539, 245, 539);
    bezierVertex(255, 539, 261, 542, 263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(313, 549);
    bezierVertex(318, 548, 329, 546, 334, 549);
    bezierVertex(340, 551, 344, 556, 346, 558);
    endShape();
    // Lip
    beginShape();
    vertex(263, 627);
    bezierVertex(268, 631, 282, 639, 291, 638);
    bezierVertex(301, 637, 307, 632, 309, 630);
    endShape();
    // Eye
    noStroke();
    fill (colorPalette[3]);
    ellipse (250, 580, 14, 18);
    ellipse (325, 585, 14, 18);
  }
  
  else if (isSleeping){
    // Sleep
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(230, 547);
    bezierVertex(234, 545, 243, 539, 245, 539);
    bezierVertex(255, 539, 261, 542, 263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(313, 549);
    bezierVertex(318, 548, 329, 546, 334, 549);
    bezierVertex(340, 551, 344, 556, 346, 558);
    endShape();
    // Lip
    beginShape();
    vertex(267, 643);
    bezierVertex(272, 641, 281, 640, 287, 641);
    bezierVertex(294, 642, 300, 643, 302, 644);
    endShape();
    // Eye
    line(314, 576, 342, 581);
    line(235, 576, 263, 574);
  }
  
  else if (isConfused) {
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(230, 547);
    bezierVertex(234, 545, 243, 539, 245, 539);
    bezierVertex(255, 539, 261, 542, 263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(313, 549);
    bezierVertex(318, 548, 329, 546, 334, 549);
    bezierVertex(340, 551, 344, 556, 346, 558);
    endShape();
    // Lip
    beginShape();
    vertex(267, 643);
    bezierVertex(272, 641, 281, 640, 287, 641);
    bezierVertex(294, 642, 300, 643, 302, 644);
    endShape();
    // Eye
    noStroke();
    fill (colorPalette[3]);
    ellipse (250, 580, 14, 18);
    ellipse (325, 585, 14, 18);
  }
  
  else if (isVeryConfused) {
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(230, 547);
    bezierVertex(234, 545, 243, 539, 245, 539);
    bezierVertex(255, 539, 261, 542, 263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(313, 546);
    bezierVertex(315, 547, 322, 549, 328, 548);
    bezierVertex(335, 548, 343, 541, 346, 537);
    endShape();
    // Lip
    beginShape();
    vertex(267, 643);
    bezierVertex(272, 641, 281, 640, 287, 641);
    bezierVertex(294, 642, 300, 643, 302, 644);
    endShape();
    // Eye
    noStroke();
    fill (colorPalette[3]);
    ellipse (250, 580, 14, 18);
    ellipse (325, 585, 14, 18);
  }
  
  else if (isTalking) {
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(230, 547);
    bezierVertex(234, 545, 243, 539, 245, 539);
    bezierVertex(255, 539, 261, 542, 263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(313, 549);
    bezierVertex(318, 548, 329, 546, 334, 549);
    bezierVertex(340, 551, 344, 556, 346, 558);
    endShape();
    // Lip
    noStroke();
    fill (colorPalette[3]);
    ellipse(280, 640, 14, 18);
    // Eye
    ellipse (250, 580, 14, 18);
    ellipse (325, 585, 14, 18);
  }
  
  else if (isSmiling) {
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(230, 547);
    bezierVertex(234, 545, 243, 539, 245, 539);
    bezierVertex(255, 539, 261, 542, 263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(313, 549);
    bezierVertex(318, 548, 329, 546, 334, 549);
    bezierVertex(340, 551, 344, 556, 346, 558);
    endShape();
    // Lip
    noStroke();
    fill (colorPalette[3]);
    beginShape();
    vertex(302, 634);
    vertex(294, 642);
    bezierVertex(292, 644, 288, 648, 279, 648);
    bezierVertex(272, 648, 261, 634, 257, 626);
    bezierVertex(264, 630, 278, 636, 282, 636);
    bezierVertex(286, 637, 298, 636, 302, 634);
    endShape();
    // Eye
    ellipse (250, 580, 14, 18);
    ellipse (325, 585, 14, 18);
  }
  
  else if (isVeryHappy) {
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(230, 547);
    bezierVertex(234, 545, 243, 539, 245, 539);
    bezierVertex(255, 539, 261, 542, 263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(313, 549);
    bezierVertex(318, 548, 329, 546, 334, 549);
    bezierVertex(340, 551, 344, 556, 346, 558);
    endShape();
    // Eye
    strokeWeight(3);
    beginShape();
    vertex(236, 571);
    bezierVertex(238, 569, 240, 565, 247, 564);
    bezierVertex(254, 563, 264, 568, 268, 570);
    endShape();
    beginShape();
    vertex(308, 573);
    bezierVertex(311, 572, 318, 571, 324, 573);
    bezierVertex(331, 574, 335, 578, 338, 582);
    endShape();
    // Lip
    noStroke();
    fill (colorPalette[3]);
    beginShape();
    vertex(302, 634);
    vertex(294, 642);
    bezierVertex(292, 644, 288, 648, 279, 648);
    bezierVertex(272, 648, 261, 634, 257, 626);
    bezierVertex(264, 630, 278, 636, 282, 636);
    bezierVertex(286, 637, 298, 636, 302, 634);
    endShape();
  }
  
  // Character Supri
  if (frameToSec(counter) >= start && frameToSec(counter) < start+5) {
      isConfused1 = false;
      isTalking1 = false;
      isNormal1 = true;
      drawStoppedSupri(1000);
      isRaising1 = false;
    } else if (frameToSec(counter) >= start+5 && frameToSec(counter) < start+7) {
      isSmiling1 = true;
      isNormal1 = false;
      drawStoppedSupri(1000);
      isRaising1 = false;
  } else if (frameToSec(counter) >= start+7 && frameToSec(counter) < end) {
      isConfused1 = false;
      isTalking1 = false;
      isNormal1 = true;
      drawStoppedSupri(1000);
      isRaising1 = false;
    } 


// subtitle
    scale(-1, 1);
    translate(-width, 0);
    translate(-1000,0);
    textFont(sub);
    fill(#FFFFFF);
    stroke(#000000);
    strokeWeight(0);
    textAlign(CENTER);
    
 // Sub Arsa
  if (frameToSec(counter) >= start+1 && frameToSec(counter) < start+4) {
    text("I want to... but I don't know how to play it", (1920/2)-500, (1080/2+350)-120);
  }
  
 // Supri
    if (frameToSec(counter) >= start+5 && frameToSec(counter) < start+7) {
      text("Oh it's fine, I will teach you. Let's go!", (1920/2)-500, (1080/2+350)-120); // 2 detik
    } 
}

// ================================== scene 8 =========================================
void drawScene8(float start, float end){
  PImage scene14 = loadImage("Img/scene14.png");
  image(scene14, 0, 0);
}

float y1 = 430; // Initial y position of the first ellipse
float y2 = 790; // Initial y position of the second ellipse
float speed = 2;

// ================================== scene 9 =========================================

void drawScene9(float start, float end){
  background(#EDE6CC);
  
  noStroke();
  fill(#7E944D);
  rect(0, 0, 1920, 95);
  fill(#72844A);
  rect(0, 95, 1920, 1000);
  
  fill(#5C4033); 
  ellipse(900, 300, 500, 100);
  
  fill(255); 
  arc(900, 350, 100, 100, PI, TWO_PI);
  arc(830, 350, 100, 100, radians(185), TWO_PI);
  
  fill(255);
  ellipse(950, y1, 100, 100);
  ellipse(950, y2, 100, 100);
  
  y1 -= speed;
  y2 -= speed;
  
  // Stop the circles at y = 350
  if (y1 < 352) {
    y1 = 350;
  }
  if (y2 < 352) {
    y2 = 350;
    y1 = 340;
  }
}

// ================================== scene 10 =========================================
void drawScene10 (float start, float end){
      if (frameToSec(counter) == start) {
      zoom = 1.0;
    }
    
  background(#EDE6CC);
  
  fill(#67ADAB);
  strokeWeight(0.1);
  stroke(#67ADAB);
  strokeWeight(20);
  triangle(57, 440, -182, 652, 320, 652);
  
  noStroke();  
  fill(#7E944D);
  rect(0, 660, 1920, 45);
  fill(#72844A);
  rect(0, 702, 1920, 352);
  
    // Move the cloud to the right
  cloudX += 1;

  // Reset the cloud's position once it moves off-screen
  if (cloudX > width2 + 332) {
    cloudX = -332;
  }

  // Draw the cloud
  drawCloud(cloudX, 49);
  drawCloud(cloudX + 81, 123);
  
  fill(#6F4538);
  ellipse (1060, 1000, 95, 25);
  
  fill(#FFFFFF);
  ellipse(1060, 1000, 22, 22);
  

  
  // arsa
  if (frameToSec(counter) >= start && frameToSec(counter) < start+1) {
      isNormal = true;
      drawStoppedArsa(500);
  } else if (frameToSec(counter) >= start+1 && frameToSec(counter) < start+3) {
    isNormal = false;
    isVeryHappy = true;
    drawStoppedArsa(500);
  } else if (frameToSec(counter) >= start+3 && frameToSec(counter) < end) {
      isNormal = true;
      drawStoppedArsa(500);
  }

  //Sugeng  
  isSmiling2 = true;
  
  noStroke();
    //Left Hand
    fill (colorPalette[12]);
    pushMatrix();  // Save the current transformation matrix
    translate(224, 720);  // Move the coordinate system to the right hand position
    rotate(radians(-10));  // Rotate the coordinate system for the right hand
    ellipse(20, 170, 50, 50);
    // Pergelangan tangan
    rect(10, 4, 28, 177);
    // Lengan
    fill (#A2525F);
    rect(0, 0, 45, 88, 30, 30, 0, 0); 
    popMatrix();
    
    // Left Leg
    fill (colorPalette[12]);
    rect(234, 843, 38, 237);
    fill (colorPalette[17]);
    rect (190, 828, 93, 110, 30, 30, 0, 0);
    
    // Right Leg
    fill (colorPalette[12]);
    rect(165, 843, 38, 237);
    fill (colorPalette[16]);
    rect (136, 828, 93, 110, 30, 30, 0, 0);
    
    // Draw the Neck
    fill (colorPalette[13]);
    rect(214, 660, 37, 75);
    arc (220, 694, 55, 86, radians(45), radians(180));
    
    // Shirt
    fill (#A2525F);
    beginShape();
    vertex(285, 843);
    vertex(136, 843);
    bezierVertex(135, 779, 136, 773, 135, 752);
    bezierVertex(145, 728, 155, 704, 183, 695);
    bezierVertex(210, 690, 225, 720, 238, 720);
    bezierVertex(249, 721, 249, 708, 251, 701);
    bezierVertex(252, 701, 263, 700, 270, 711);
    bezierVertex(277, 721, 278, 700, 285, 843);
    endShape();
    
    // Right Hand
    // Telapak
    fill (colorPalette[12]);
    ellipse(116, 905, 50, 50);
    pushMatrix(); 
    translate(145, 722);  // Move the coordinate system to the right hand position
    rotate(radians(17));  // Rotate the coordinate system for the right hand
    // Pergelangan tangan
    rect(10, 4, 28, 177);
    // Lengan
    fill (colorPalette[15]);
    rect(0, 0, 45, 88, 30, 30, 0, 0);  // Draw the right hand with rounded corners
    popMatrix();
    
    // Draw the Hair
    fill (colorPalette[14]);
    ellipse(186, 600, 95, 95);
    ellipse(150, 560, 93, 93);
    ellipse(158, 511, 112, 112);
    ellipse(196, 467, 123, 123);
    ellipse(282, 463, 150, 150);
    ellipse(365, 507, 90, 90);
    //ellipse(350, 570, 71, 71);
    
    // Draw the Ear
    fill (colorPalette[12]);
    ellipse(160, 575, 61, 61);
    
    // Draw the face
    beginShape();
    vertex(173, 572);
    vertex(196, 542);
    vertex(196, 520);
    bezierVertex(203, 521, 219, 523, 226, 518);
    bezierVertex(233, 512, 243, 499, 247, 493);
    bezierVertex(255, 499, 274, 512, 290, 516);
    bezierVertex(306, 519, 346, 517, 364, 512);
    bezierVertex(364, 558, 360, 645, 341, 661);
    bezierVertex(317, 681, 284, 684, 266, 684);
    bezierVertex(248, 684, 194, 662, 180, 639);
    bezierVertex(168, 620, 165, 608, 165, 605);
    endShape();
    
    // Blush
    fill (colorPalette[2]);
    ellipse (210, 600, 17, 17);
    ellipse (345, 610, 16, 16);
    
    // Expression
    if (isNormal2) {
      // Right Eyebrow
      noFill();
      stroke (colorPalette[14]);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      beginShape();
      vertex(263, 627);
      bezierVertex(268, 631, 282, 639, 291, 638);
      bezierVertex(301, 637, 307, 632, 309, 630);
      endShape();
      // Eye
      noStroke();
      fill (colorPalette[14]);
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    else if (isTalking2) {
      // Right Eyebrow
      noFill();
      stroke (colorPalette[14]);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      noStroke();
      fill (colorPalette[14]);
      ellipse(280, 640, 14, 18);
      // Eye
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    else if (isSmiling2) {
      // Right Eyebrow
      noFill();
      stroke (colorPalette[14]);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      noStroke();
      fill (colorPalette[14]);
      beginShape();
      vertex(302, 634);
      vertex(294, 642);
      bezierVertex(292, 644, 288, 648, 279, 648);
      bezierVertex(272, 648, 261, 634, 257, 626);
      bezierVertex(264, 630, 278, 636, 282, 636);
      bezierVertex(286, 637, 298, 636, 302, 634);
      endShape();
      // Eye
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    scale (1.4);
    translate (200, -200);
    
    // Supri
    if (frameToSec(counter) >= start && frameToSec(counter) < start+4) {
      isNormal1 = true;
      isFlipped1 = true;
      drawStoppedSupri(900);
  }
    else if (frameToSec(counter) >= start+4 && frameToSec(counter) < start+6) {
      isNormal1 = false;
      isConfused1 = false;
      isTalking1 = false;
      isSmiling1 = true;
      isFlipped1 = true;
      drawStoppedSupri(900);
  } else if (frameToSec(counter) >= start+6 && frameToSec(counter) < end) {
      isNormal1 = true;
      isFlipped1 = true;
      drawStoppedSupri(900);
  } 
  
  // sub
  sub = createFont("Fonts/LucidaGrande.ttf", 40);
  scale(-1, 1);
  translate(-width + 60, 100);
  translate(-1000,0);
  //translate(-1000,0);
  //translate(-1000,0);
  textFont(sub);
  stroke(#000000);
  strokeWeight(1);
  fill(#FFFFFF);
  textAlign(CENTER);
  
  //sugeng
  if (frameToSec(counter) >= start+1 && frameToSec(counter) < start+3) {
    text("Woaaah my marbles got in! Yeayyy!", (1920/2)-500, (1080/2+350)-120);
  } else if (frameToSec(counter) >= start+4 && frameToSec(counter) < start+6){
      text("Oh its getting late, we should probably go home", (1920/2)-500, (1080/2+350)-120);
  }
}

// ================================== scene 11 =========================================
int sunY = 230;  // Initial vertical position of the sun
color sunColor = #FDB16B;  // Color of the sun (orange)

void drawScene11(float start, float end){
  noStroke();
    // Update the vertical position of the sun
  sunY += 1.2;  // Increase the position by 1 pixel in each frame
  
  // Clear the background with a new drawing each frame
  background(#EDE6CC);
  
  //sun
  fill(sunColor);  // Use the color variable for the sun
  ellipse(1050, sunY, 141, 141);  // Use the variable for vertical position
  
  //awan kiri
  fill(#ffffff);
  rect(-80, 160, 200, 40, 200);
  rect(-20, 200, 200, 40, 200);
  
  //awan kanan
  fill(#ffffff);
  rect(1800, 100, 200, 40, 200);
  rect(1740, 140, 200, 40, 200);
  
  //tanah
  fill(#7E944D);
  rect(0, 660, 1920, 45);
  fill(#72844A);
  rect(0, 702, 1920, 352);
  

  
  //gunung
  fill(#67ADAB);
  triangle(1300, 340, 952, 660, 1720, 660);
  fill(#71BFBF);
  triangle(600, 220, 57, 660, 1230, 660);
  
    //rumah1
  fill(#ffe1a1);
  rect(405, 725, 82, 49);
  fill(#D48B3E);
  rect(437, 741, 19, 33);
  fill(#DA3D2E);
  triangle(386, 725, 446, 665, 507, 725);
  
  //rumah2
  fill(#ffe1a1);
  rect(741, 763, 116, 69);
  fill(#D48B3E);
  rect(786, 785, 27, 47);
  fill(#DA3D2E);
  triangle(713, 763, 798, 678, 884, 763);
  
  //rumah3
  fill(#ffe1a1);
  rect(1014, 713, 92, 55);
  fill(#D48B3E);
  rect(1050, 731, 21, 37);
  fill(#DA3D2E);
  triangle(991, 713, 1059, 645, 1128, 713);
  
  //rumah4
  fill(#ffe1a1);
  rect(1600, 725, 82, 49);
  fill(#D48B3E);
  rect(1632, 741, 19, 33);
  fill(#DA3D2E);
  triangle(1580, 725, 1640, 665, 1701, 725);
  
  //gundukan kiri
  fill(#A3AC51);
  ellipse(200, 1100, 1000, 1000);
  fill(#72844A);
  ellipse(90, 1150, 1000, 1000);
  
  //gundukankanan
  fill(#A3AC51);
  ellipse(1600, 1200, 1200, 1332);
  fill(#72844A);
  ellipse(1900, 1250, 1520, 1332);
  
  // Check if the sun has reached the bottom of the screen
  if (sunY >= height) {
    sunY = 200;  // Reset the vertical position of the sun to the top
  }
}

// ================================== scene 12 =========================================
void drawScene12(float start, float end){
  if (frameToSec(counter) == start) {
  zoom = 1.0;
  }
  
  zoom += 0.002;
  
  // Apply zooming transformations
  translate(width / 2, height / 2); // Translate to the center of the canvas
  scale(zoom); // Apply the zoom factor
  translate(-width / 2, -height / 2); // Translate back to the original position
  
  PImage scene19 = loadImage("Img/scene19.jpg");
  image(scene19, 0, 0);
}
// ================================== scene 13 =========================================
void drawScene13 (float start, float end){
  zoom = 1.0;
  //scale(-1, 1);
  //translate(-width-1000, 0);
  background(#FAEED6);
  noStroke();
  
  isNormal1 = true;
  if (frameToSec(counter) >= start && frameToSec(counter) < start+1) {
    isNormal = true;
  } else if (frameToSec(counter) >= start+1 && frameToSec(counter) < start+3) {
    isNormal = false;
    isSmiling = true;
  } else {
    isNormal = true;
  }
    
  // Arsa
  pushMatrix(); // Save the current transformation matrix
  scale(-1, 1); // Flip horizontally
  translate(-width-500, -100); // Translate to the left edge
  scale (1.2);
  // Left Hand
  fill(colorPalette[0]);
  pushMatrix();
  translate(224, 720);
  rotate(radians(-10));
  ellipse(20, 170, 50, 50);
  rect(10, 4, 28, 177);
  fill(colorPalette[4]);
  rect(0, 0, 45, 88, 30, 30, 0, 0);
  popMatrix();
  
  // Left Leg
  fill(colorPalette[0]);
  rect(234, 843, 38, 237);
  fill(colorPalette[6]);
  rect(190, 828, 93, 110, 30, 30, 0, 0);
  
  // Right Leg
  fill(colorPalette[0]);
  rect(165, 843, 38, 237);
  fill(colorPalette[5]);
  rect(136, 828, 93, 110, 30, 30, 0, 0);
  
  // Draw the Neck
  fill(colorPalette[1]);
  rect(214, 660, 37, 75);
  arc(220, 694, 55, 86, radians(45), radians(180));
  
  // Shirt
  fill(colorPalette[4]);
  beginShape();
  vertex(285, 843);
  vertex(136, 843);
  bezierVertex(135, 779, 136, 773, 135, 752);
  bezierVertex(145, 728, 155, 704, 183, 695);
  bezierVertex(210, 690, 225, 720, 238, 720);
  bezierVertex(249, 721, 249, 708, 251, 701);
  bezierVertex(252, 701, 263, 700, 270, 711);
  bezierVertex(277, 721, 278, 700, 285, 843);
  endShape();
  
  // Right Hand
  fill(colorPalette[0]);
  ellipse(116, 905, 50, 50);
  pushMatrix();
  translate(145, 722);
  rotate(radians(17));
  rect(10, 4, 28, 177);
  fill(colorPalette[4]);
  rect(0, 0, 45, 88, 30, 30, 0, 0);
  popMatrix();
  
  // Draw the Hair
  fill(colorPalette[3]);
  ellipse(186, 625, 95, 95);
  ellipse(150, 575, 93, 93);
  ellipse(158, 511, 112, 112);
  ellipse(196, 467, 123, 123);
  ellipse(282, 453, 150, 150);
  ellipse(365, 507, 90, 90);
  ellipse(350, 570, 71, 71);
  
  // Draw the Ear
  fill(colorPalette[0]);
  ellipse(160, 575, 61, 61);
  
  // Draw the face
  beginShape();
  vertex(173, 572);
  vertex(196, 542);
  vertex(196, 520);
  bezierVertex(203, 521, 219, 523, 226, 518);
  bezierVertex(233, 512, 243, 499, 247, 493);
  bezierVertex(255, 499, 274, 512, 290, 516);
  bezierVertex(306, 519, 346, 517, 364, 512);
  bezierVertex(364, 558, 360, 645, 341, 661);
  bezierVertex(317, 681, 284, 684, 266, 684);
  bezierVertex(248, 684, 194, 662, 180, 639);
  bezierVertex(168, 620, 165, 608, 165, 605);
  endShape();
  
  // Blush
  fill(colorPalette[2]);
  ellipse(210, 600, 17, 17);
  ellipse(345, 610, 16, 16);
  
  // Expression
 // Expression
    if (isNormal) {
      // Right Eyebrow
      noFill();
      stroke (colorPalette[3]);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      beginShape();
      vertex(263, 627);
      bezierVertex(268, 631, 282, 639, 291, 638);
      bezierVertex(301, 637, 307, 632, 309, 630);
      endShape();
      // Eye
      noStroke();
      fill (colorPalette[3]);
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    else if (isSleeping){
      // Sleep
      // Right Eyebrow
      noFill();
      stroke (colorPalette[3]);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      beginShape();
      vertex(267, 643);
      bezierVertex(272, 641, 281, 640, 287, 641);
      bezierVertex(294, 642, 300, 643, 302, 644);
      endShape();
      // Eye
      line(314, 576, 342, 581);
      line(235, 576, 263, 574);
    }
    
    else if (isConfused) {
      // Right Eyebrow
      noFill();
      stroke (colorPalette[3]);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      beginShape();
      vertex(267, 643);
      bezierVertex(272, 641, 281, 640, 287, 641);
      bezierVertex(294, 642, 300, 643, 302, 644);
      endShape();
      // Eye
      noStroke();
      fill (colorPalette[3]);
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    else if (isVeryConfused) {
      // Right Eyebrow
      noFill();
      stroke (colorPalette[3]);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 546);
      bezierVertex(315, 547, 322, 549, 328, 548);
      bezierVertex(335, 548, 343, 541, 346, 537);
      endShape();
      // Lip
      beginShape();
      vertex(267, 643);
      bezierVertex(272, 641, 281, 640, 287, 641);
      bezierVertex(294, 642, 300, 643, 302, 644);
      endShape();
      // Eye
      noStroke();
      fill (colorPalette[3]);
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    else if (isTalking) {
      // Right Eyebrow
      noFill();
      stroke (colorPalette[3]);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      noStroke();
      fill (colorPalette[3]);
      ellipse(280, 640, 14, 18);
      // Eye
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    else if (isSmiling) {
      // Right Eyebrow
      noFill();
      stroke (colorPalette[3]);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      noStroke();
      fill (colorPalette[3]);
      beginShape();
      vertex(302, 634);
      vertex(294, 642);
      bezierVertex(292, 644, 288, 648, 279, 648);
      bezierVertex(272, 648, 261, 634, 257, 626);
      bezierVertex(264, 630, 278, 636, 282, 636);
      bezierVertex(286, 637, 298, 636, 302, 634);
      endShape();
      // Eye
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    else if (isVeryHappy) {
      // Right Eyebrow
      noFill();
      stroke (colorPalette[3]);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Eye
      strokeWeight(3);
      beginShape();
      vertex(236, 571);
      bezierVertex(238, 569, 240, 565, 247, 564);
      bezierVertex(254, 563, 264, 568, 268, 570);
      endShape();
      beginShape();
      vertex(308, 573);
      bezierVertex(311, 572, 318, 571, 324, 573);
      bezierVertex(331, 574, 335, 578, 338, 582);
      endShape();
      // Lip
      noStroke();
      fill (colorPalette[3]);
      beginShape();
      vertex(302, 634);
      vertex(294, 642);
      bezierVertex(292, 644, 288, 648, 279, 648);
      bezierVertex(272, 648, 261, 634, 257, 626);
      bezierVertex(264, 630, 278, 636, 282, 636);
      bezierVertex(286, 637, 298, 636, 302, 634);
      endShape();
    }
  
  popMatrix();
  
  // Supri
    pushMatrix();
    //Left Hand
    translate(0, -100);
    scale (1.2);
    fill (colorPalette[7]);
    pushMatrix();  // Save the current transformation matrix
    translate(224, 720);  // Move the coordinate system to the right hand position
    rotate(radians(-10));  // Rotate the coordinate system for the right hand
    ellipse(20, 170, 50, 50);
    // Pergelangan tangan
    rect(10, 4, 28, 177);
    // Lengan
    fill (#CF5A51);
    rect(0, 0, 45, 88, 30, 30, 0, 0); 
    popMatrix();
    
    // Left Leg
    fill (colorPalette[7]);
    rect(234, 843, 38, 237);
    fill (#4F576F);
    rect (190, 828, 93, 110, 30, 30, 0, 0);
    
    // Right Leg
    fill (colorPalette[7]);
    rect(165, 843, 38, 237);
    fill (#606B89);
    rect (136, 828, 93, 110, 30, 30, 0, 0);
    
    // Draw the Neck
    fill (colorPalette[0]);
    
    rect(214, 660, 37, 75);
    arc (220, 694, 55, 86, radians(45), radians(180));
    
    // Shirt
    fill (#CF5A51);
    beginShape();
    
    vertex(285, 843);
    vertex(136, 843);
    bezierVertex(135, 779, 136, 773, 135, 752);
    bezierVertex(145, 728, 155, 704, 183, 695);
    bezierVertex(210, 690, 225, 720, 238, 720);
    bezierVertex(249, 721, 249, 708, 251, 701);
    bezierVertex(252, 701, 263, 700, 270, 711);
    bezierVertex(277, 721, 278, 700, 285, 843);
    endShape();
    
    // Right Hand
    // Telapak
    fill (colorPalette[7]);
    ellipse(116, 905, 50, 50);
    pushMatrix(); 
    translate(145, 722);  // Move the coordinate system to the right hand position
    rotate(radians(17));  // Rotate the coordinate system for the right hand
    // Pergelangan tangan
    rect(10, 4, 28, 177);
    // Lengan
    fill (#CF5A51);
    rect(0, 0, 45, 88, 30, 30, 0, 0);  // Draw the right hand with rounded corners
    popMatrix();
    
    // Draw the hair
    fill (#864448);
    beginShape();
    vertex(185, 645);
    bezierVertex(152, 628, 144, 595, 129, 525);
    bezierVertex(130, 503, 132, 477, 137, 464);
    bezierVertex(144, 455, 150, 448, 169, 449);
    bezierVertex(177, 451, 177, 448, 179, 440);
    bezierVertex(185, 427, 191, 414, 217, 412);
    bezierVertex(229, 413, 253, 415, 303, 417);
    bezierVertex(310, 413, 316, 410, 318, 388);
    bezierVertex(318, 382, 323, 383, 334, 397);
    bezierVertex(341, 401, 348, 405, 354, 423);
    vertex(356, 432);
    bezierVertex(365, 402, 368, 406, 377, 419);
    bezierVertex(386, 441, 395, 464, 383, 495);
    vertex(376, 508);
    vertex(185, 645);
    endShape();
    
    // Draw the Ear
    fill (colorPalette[7]);
    ellipse(160, 575, 61, 61);
    
    // Draw the face
    beginShape();
    vertex(173, 572);
    vertex(196, 542);
    vertex(196, 520);
    bezierVertex(203, 521, 219, 523, 226, 518);
    bezierVertex(233, 512, 243, 499, 247, 493);
    bezierVertex(255, 499, 274, 512, 290, 516);
    bezierVertex(306, 519, 346, 517, 364, 512);
    bezierVertex(364, 558, 360, 645, 341, 661);
    bezierVertex(317, 681, 284, 684, 266, 684);
    bezierVertex(248, 684, 194, 662, 180, 639);
    bezierVertex(168, 620, 165, 608, 165, 605);
    endShape();
    
    // Blush
    fill (colorPalette[2]);
    ellipse (210, 600, 17, 17);
    ellipse (345, 610, 16, 16);
    
      // Expression
    if (isNormal1) {
      // Right Eyebrow
      noFill();
      stroke (#864448);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      beginShape();
      vertex(263, 627);
      bezierVertex(268, 631, 282, 639, 291, 638);
      bezierVertex(301, 637, 307, 632, 309, 630);
      endShape();
      // Eye
      noStroke();
      fill (#864448);
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    else if (isConfused1) {
      // Right Eyebrow
      noFill();
      stroke (#864448);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      beginShape();
      vertex(267, 643);
      bezierVertex(272, 641, 281, 640, 287, 641);
      bezierVertex(294, 642, 300, 643, 302, 644);
      endShape();
      // Eye
      noStroke();
      fill (#864448);
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    else if (isTalking1) {
      // Right Eyebrow
      noFill();
      stroke (#864448);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      noStroke();
      fill (#864448);
      ellipse(280, 640, 14, 18);
      // Eye
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    else if (isSmiling1) {
      // Right Eyebrow
      noFill();
      stroke (#864448);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      noStroke();
      fill (#864448);
      beginShape();
      vertex(302, 634);
      vertex(294, 642);
      bezierVertex(292, 644, 288, 648, 279, 648);
      bezierVertex(272, 648, 261, 634, 257, 626);
      bezierVertex(264, 630, 278, 636, 282, 636);
      bezierVertex(286, 637, 298, 636, 302, 634);
      endShape();
      // Eye
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
  popMatrix();
  
  // Rectangle 15
  fill(209, 134, 112);
  rect(1684, 108, 472.4, 626);
  
  
  fill(#D18670); // Set the fill color for the rectangle
  rect(0, 896, 1920, 189);
  
  // Rectangle 16
  fill(36, 39, 44);
  rect(1720, height/2 - 535/2 - 118.5, 418, 535);
  
  
  // Ellipse 15
  fill(255, 186, 66);
  ellipse(1781, 231, 88, 88);

  // Ellipse 37
  pushMatrix();
  translate(241, 1000);
  fill(#D9D9D9);
  ellipse(0, 0, 275, 121);
  popMatrix();
  
  // Ellipse 38
  pushMatrix();
  translate(243.1, 1000);
  fill(#BBBBBB);
  ellipse(0, 0, 208.8, 91.87);
  popMatrix();

  // Ellipse 39
  float ellipse39Width = 275;
  float ellipse39Height = 121;
  float ellipse39X = 1285;
  float ellipse39Y = 1000;
  color ellipse39Color = color(#D9D9D9);

  // Ellipse 40
  float ellipse40Width = 208.8;
  float ellipse40Height = 91.87;
  float ellipse40X = 1286;
  float ellipse40Y = 1000;
  color ellipse40Color = color(#BBBBBB);

  fill(ellipse39Color); // Set the fill color for Ellipse 39
  noStroke(); // Disable stroke
  ellipse(ellipse39X, ellipse39Y, ellipse39Width, ellipse39Height); // Draw Ellipse 39

  fill(ellipse40Color); // Set the fill color for Ellipse 40
  ellipse(ellipse40X, ellipse40Y, ellipse40Width, ellipse40Height);

  // Tumpeng
  fill (#DFCF30);
  strokeWeight(0.1);
  stroke(#DFCF30);
  strokeWeight(20);
  strokeJoin(ROUND);
  triangle (875, 725, 675, 1100, 1090, 1100);
  
  stroke(#386029);
  fill (#386029);
  triangle (875, 725, 770, 900, 980, 900);
  
  //Sub
  sub = createFont("Fonts/LucidaGrande.ttf", 48);
  //scale(-1, 1);
  translate(500, 200);
  //translate(-1000,0);
  //translate(-1000,0);
  //translate(-1000,0);
  textFont(sub);
  stroke(#000000);
  strokeWeight(1);
  fill(#FFFFFF);
  textAlign(CENTER);
  
  if (frameToSec(counter) >= start+1 && frameToSec(counter) < start+3) {
    text("Wow, what kind of food is this?", (1920/2)-500, (1080/2+350)-120);
  }
}

// ================================== scene 14 =========================================
void drawScene14 (float start, float end){
  background(#FAEED6);
  noStroke();
  
  //text
  //scene 21
  pushMatrix();
  scale(1.4);
  translate (-400, 20);
  sub = createFont("Fonts/LucidaGrandeBold.ttf", 56);
  textFont(sub);
  stroke(#000000);
  strokeWeight(1);
  fill(#566658);
  textAlign(RIGHT);
  text("Tumpeng", 1250, 300);
  
  textAlign(LEFT);
  sub = createFont("Fonts/LucidaGrande.ttf", 40);
  textFont(sub);
  stroke(#000000);
  strokeWeight(1);
  text("This is called tumpeng. Tumpeng", 980, 360);
  text("is a traditional food, usually", 980, 405);
  text("consist of yellow rice, tempeh,", 980, 450);
  text("fried chicken, boiled eggs, and", 980, 495);
  text("some vegetable that is called lalapan.", 980, 540);
  popMatrix();
  
  noStroke();
  //piring
  fill (#FFFFFF);
  ellipse(80, 800, 1186, 137);
  
  
  // Tumpeng
  translate(-800,-500);
  fill (#DFCF30);
  strokeWeight(0.1);
  stroke(#DFCF30);
  strokeWeight(20);
  strokeJoin(ROUND);
  triangle (875, 725, 675, 1300, 1200, 1300);
  
  stroke(#386029);
  fill (#386029);
  triangle (875, 725, 770, 900, 980, 900);
}
// ================================== scene 15 =========================================
void drawScene15 (float start, float end) {
  zoom = 1.0;
  //scale(-1, 1);
  //translate(-width-1000, 0);
  background(#FAEED6);
  noStroke();
  
  if (frameToSec(counter) >= start && frameToSec(counter) < start+2) {
    isNormal = false;
    isVeryHappy = true;
    isNormal1 = true;
  } else if (frameToSec(counter) >= start+2 && frameToSec(counter) < start+5) {
    isNormal = true;
    isNormal1 = false;
    isSmiling1 = true;
  } else {
    isNormal = true;
    isNormal1 = true;
  }
    
  // Arsa
  pushMatrix(); // Save the current transformation matrix
  scale(-1, 1); // Flip horizontally
  translate(-width-500, -100); // Translate to the left edge
  scale (1.2);
  // Left Hand
  fill(colorPalette[0]);
  pushMatrix();
  translate(224, 720);
  rotate(radians(-10));
  ellipse(20, 170, 50, 50);
  rect(10, 4, 28, 177);
  fill(colorPalette[4]);
  rect(0, 0, 45, 88, 30, 30, 0, 0);
  popMatrix();
  
  // Left Leg
  fill(colorPalette[0]);
  rect(234, 843, 38, 237);
  fill(colorPalette[6]);
  rect(190, 828, 93, 110, 30, 30, 0, 0);
  
  // Right Leg
  fill(colorPalette[0]);
  rect(165, 843, 38, 237);
  fill(colorPalette[5]);
  rect(136, 828, 93, 110, 30, 30, 0, 0);
  
  // Draw the Neck
  fill(colorPalette[1]);
  rect(214, 660, 37, 75);
  arc(220, 694, 55, 86, radians(45), radians(180));
  
  // Shirt
  fill(colorPalette[4]);
  beginShape();
  vertex(285, 843);
  vertex(136, 843);
  bezierVertex(135, 779, 136, 773, 135, 752);
  bezierVertex(145, 728, 155, 704, 183, 695);
  bezierVertex(210, 690, 225, 720, 238, 720);
  bezierVertex(249, 721, 249, 708, 251, 701);
  bezierVertex(252, 701, 263, 700, 270, 711);
  bezierVertex(277, 721, 278, 700, 285, 843);
  endShape();
  
  // Right Hand
  fill(colorPalette[0]);
  ellipse(116, 905, 50, 50);
  pushMatrix();
  translate(145, 722);
  rotate(radians(17));
  rect(10, 4, 28, 177);
  fill(colorPalette[4]);
  rect(0, 0, 45, 88, 30, 30, 0, 0);
  popMatrix();
  
  // Draw the Hair
  fill(colorPalette[3]);
  ellipse(186, 625, 95, 95);
  ellipse(150, 575, 93, 93);
  ellipse(158, 511, 112, 112);
  ellipse(196, 467, 123, 123);
  ellipse(282, 453, 150, 150);
  ellipse(365, 507, 90, 90);
  ellipse(350, 570, 71, 71);
  
  // Draw the Ear
  fill(colorPalette[0]);
  ellipse(160, 575, 61, 61);
  
  // Draw the face
  beginShape();
  vertex(173, 572);
  vertex(196, 542);
  vertex(196, 520);
  bezierVertex(203, 521, 219, 523, 226, 518);
  bezierVertex(233, 512, 243, 499, 247, 493);
  bezierVertex(255, 499, 274, 512, 290, 516);
  bezierVertex(306, 519, 346, 517, 364, 512);
  bezierVertex(364, 558, 360, 645, 341, 661);
  bezierVertex(317, 681, 284, 684, 266, 684);
  bezierVertex(248, 684, 194, 662, 180, 639);
  bezierVertex(168, 620, 165, 608, 165, 605);
  endShape();
  
  // Blush
  fill(colorPalette[2]);
  ellipse(210, 600, 17, 17);
  ellipse(345, 610, 16, 16);
  
  // Expression
 // Expression
    if (isNormal) {
      // Right Eyebrow
      noFill();
      stroke (colorPalette[3]);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      beginShape();
      vertex(263, 627);
      bezierVertex(268, 631, 282, 639, 291, 638);
      bezierVertex(301, 637, 307, 632, 309, 630);
      endShape();
      // Eye
      noStroke();
      fill (colorPalette[3]);
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    else if (isSleeping){
      // Sleep
      // Right Eyebrow
      noFill();
      stroke (colorPalette[3]);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      beginShape();
      vertex(267, 643);
      bezierVertex(272, 641, 281, 640, 287, 641);
      bezierVertex(294, 642, 300, 643, 302, 644);
      endShape();
      // Eye
      line(314, 576, 342, 581);
      line(235, 576, 263, 574);
    }
    
    else if (isConfused) {
      // Right Eyebrow
      noFill();
      stroke (colorPalette[3]);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      beginShape();
      vertex(267, 643);
      bezierVertex(272, 641, 281, 640, 287, 641);
      bezierVertex(294, 642, 300, 643, 302, 644);
      endShape();
      // Eye
      noStroke();
      fill (colorPalette[3]);
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    else if (isVeryConfused) {
      // Right Eyebrow
      noFill();
      stroke (colorPalette[3]);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 546);
      bezierVertex(315, 547, 322, 549, 328, 548);
      bezierVertex(335, 548, 343, 541, 346, 537);
      endShape();
      // Lip
      beginShape();
      vertex(267, 643);
      bezierVertex(272, 641, 281, 640, 287, 641);
      bezierVertex(294, 642, 300, 643, 302, 644);
      endShape();
      // Eye
      noStroke();
      fill (colorPalette[3]);
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    else if (isTalking) {
      // Right Eyebrow
      noFill();
      stroke (colorPalette[3]);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      noStroke();
      fill (colorPalette[3]);
      ellipse(280, 640, 14, 18);
      // Eye
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    else if (isSmiling) {
      // Right Eyebrow
      noFill();
      stroke (colorPalette[3]);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      noStroke();
      fill (colorPalette[3]);
      beginShape();
      vertex(302, 634);
      vertex(294, 642);
      bezierVertex(292, 644, 288, 648, 279, 648);
      bezierVertex(272, 648, 261, 634, 257, 626);
      bezierVertex(264, 630, 278, 636, 282, 636);
      bezierVertex(286, 637, 298, 636, 302, 634);
      endShape();
      // Eye
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    else if (isVeryHappy) {
      // Right Eyebrow
      noFill();
      stroke (colorPalette[3]);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Eye
      strokeWeight(3);
      beginShape();
      vertex(236, 571);
      bezierVertex(238, 569, 240, 565, 247, 564);
      bezierVertex(254, 563, 264, 568, 268, 570);
      endShape();
      beginShape();
      vertex(308, 573);
      bezierVertex(311, 572, 318, 571, 324, 573);
      bezierVertex(331, 574, 335, 578, 338, 582);
      endShape();
      // Lip
      noStroke();
      fill (colorPalette[3]);
      beginShape();
      vertex(302, 634);
      vertex(294, 642);
      bezierVertex(292, 644, 288, 648, 279, 648);
      bezierVertex(272, 648, 261, 634, 257, 626);
      bezierVertex(264, 630, 278, 636, 282, 636);
      bezierVertex(286, 637, 298, 636, 302, 634);
      endShape();
    }
  
  popMatrix();
  
  // Supri
    pushMatrix();
    //Left Hand
    translate(0, -100);
    scale (1.2);
    fill (colorPalette[7]);
    pushMatrix();  // Save the current transformation matrix
    translate(224, 720);  // Move the coordinate system to the right hand position
    rotate(radians(-10));  // Rotate the coordinate system for the right hand
    ellipse(20, 170, 50, 50);
    // Pergelangan tangan
    rect(10, 4, 28, 177);
    // Lengan
    fill (#CF5A51);
    rect(0, 0, 45, 88, 30, 30, 0, 0); 
    popMatrix();
    
    // Left Leg
    fill (colorPalette[7]);
    rect(234, 843, 38, 237);
    fill (#4F576F);
    rect (190, 828, 93, 110, 30, 30, 0, 0);
    
    // Right Leg
    fill (colorPalette[7]);
    rect(165, 843, 38, 237);
    fill (#606B89);
    rect (136, 828, 93, 110, 30, 30, 0, 0);
    
    // Draw the Neck
    fill (colorPalette[0]);
    
    rect(214, 660, 37, 75);
    arc (220, 694, 55, 86, radians(45), radians(180));
    
    // Shirt
    fill (#CF5A51);
    beginShape();
    
    vertex(285, 843);
    vertex(136, 843);
    bezierVertex(135, 779, 136, 773, 135, 752);
    bezierVertex(145, 728, 155, 704, 183, 695);
    bezierVertex(210, 690, 225, 720, 238, 720);
    bezierVertex(249, 721, 249, 708, 251, 701);
    bezierVertex(252, 701, 263, 700, 270, 711);
    bezierVertex(277, 721, 278, 700, 285, 843);
    endShape();
    
    // Right Hand
    // Telapak
    fill (colorPalette[7]);
    ellipse(116, 905, 50, 50);
    pushMatrix(); 
    translate(145, 722);  // Move the coordinate system to the right hand position
    rotate(radians(17));  // Rotate the coordinate system for the right hand
    // Pergelangan tangan
    rect(10, 4, 28, 177);
    // Lengan
    fill (#CF5A51);
    rect(0, 0, 45, 88, 30, 30, 0, 0);  // Draw the right hand with rounded corners
    popMatrix();
    
    // Draw the hair
    fill (#864448);
    beginShape();
    vertex(185, 645);
    bezierVertex(152, 628, 144, 595, 129, 525);
    bezierVertex(130, 503, 132, 477, 137, 464);
    bezierVertex(144, 455, 150, 448, 169, 449);
    bezierVertex(177, 451, 177, 448, 179, 440);
    bezierVertex(185, 427, 191, 414, 217, 412);
    bezierVertex(229, 413, 253, 415, 303, 417);
    bezierVertex(310, 413, 316, 410, 318, 388);
    bezierVertex(318, 382, 323, 383, 334, 397);
    bezierVertex(341, 401, 348, 405, 354, 423);
    vertex(356, 432);
    bezierVertex(365, 402, 368, 406, 377, 419);
    bezierVertex(386, 441, 395, 464, 383, 495);
    vertex(376, 508);
    vertex(185, 645);
    endShape();
    
    // Draw the Ear
    fill (colorPalette[7]);
    ellipse(160, 575, 61, 61);
    
    // Draw the face
    beginShape();
    vertex(173, 572);
    vertex(196, 542);
    vertex(196, 520);
    bezierVertex(203, 521, 219, 523, 226, 518);
    bezierVertex(233, 512, 243, 499, 247, 493);
    bezierVertex(255, 499, 274, 512, 290, 516);
    bezierVertex(306, 519, 346, 517, 364, 512);
    bezierVertex(364, 558, 360, 645, 341, 661);
    bezierVertex(317, 681, 284, 684, 266, 684);
    bezierVertex(248, 684, 194, 662, 180, 639);
    bezierVertex(168, 620, 165, 608, 165, 605);
    endShape();
    
    // Blush
    fill (colorPalette[2]);
    ellipse (210, 600, 17, 17);
    ellipse (345, 610, 16, 16);
    
      // Expression
    if (isNormal1) {
      // Right Eyebrow
      noFill();
      stroke (#864448);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      beginShape();
      vertex(263, 627);
      bezierVertex(268, 631, 282, 639, 291, 638);
      bezierVertex(301, 637, 307, 632, 309, 630);
      endShape();
      // Eye
      noStroke();
      fill (#864448);
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    else if (isConfused1) {
      // Right Eyebrow
      noFill();
      stroke (#864448);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      beginShape();
      vertex(267, 643);
      bezierVertex(272, 641, 281, 640, 287, 641);
      bezierVertex(294, 642, 300, 643, 302, 644);
      endShape();
      // Eye
      noStroke();
      fill (#864448);
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    else if (isTalking1) {
      // Right Eyebrow
      noFill();
      stroke (#864448);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      noStroke();
      fill (#864448);
      ellipse(280, 640, 14, 18);
      // Eye
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
    
    else if (isSmiling1) {
      // Right Eyebrow
      noFill();
      stroke (#864448);
      strokeWeight(4);
      beginShape();
      vertex(230, 547);
      bezierVertex(234, 545, 243, 539, 245, 539);
      bezierVertex(255, 539, 261, 542, 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(313, 549);
      bezierVertex(318, 548, 329, 546, 334, 549);
      bezierVertex(340, 551, 344, 556, 346, 558);
      endShape();
      // Lip
      noStroke();
      fill (#864448);
      beginShape();
      vertex(302, 634);
      vertex(294, 642);
      bezierVertex(292, 644, 288, 648, 279, 648);
      bezierVertex(272, 648, 261, 634, 257, 626);
      bezierVertex(264, 630, 278, 636, 282, 636);
      bezierVertex(286, 637, 298, 636, 302, 634);
      endShape();
      // Eye
      ellipse (250, 580, 14, 18);
      ellipse (325, 585, 14, 18);
    }
  popMatrix();
  
  // Rectangle 15
  fill(209, 134, 112);
  rect(1684, 108, 472.4, 626);
  
  
  fill(#D18670); // Set the fill color for the rectangle
  rect(0, 896, 1920, 189);
  
  // Rectangle 16
  fill(36, 39, 44);
  rect(1720, height/2 - 535/2 - 118.5, 418, 535);
  
  
  // Ellipse 15
  fill(255, 186, 66);
  ellipse(1781, 231, 88, 88);

  // Ellipse 37
  pushMatrix();
  translate(241, 1000);
  fill(#D9D9D9);
  ellipse(0, 0, 275, 121);
  popMatrix();
  
  // Ellipse 38
  pushMatrix();
  translate(243.1, 1000);
  fill(#BBBBBB);
  ellipse(0, 0, 208.8, 91.87);
  popMatrix();

  // Ellipse 39
  float ellipse39Width = 275;
  float ellipse39Height = 121;
  float ellipse39X = 1285;
  float ellipse39Y = 1000;
  color ellipse39Color = color(#D9D9D9);

  // Ellipse 40
  float ellipse40Width = 208.8;
  float ellipse40Height = 91.87;
  float ellipse40X = 1286;
  float ellipse40Y = 1000;
  color ellipse40Color = color(#BBBBBB);

  fill(ellipse39Color); // Set the fill color for Ellipse 39
  noStroke(); // Disable stroke
  ellipse(ellipse39X, ellipse39Y, ellipse39Width, ellipse39Height); // Draw Ellipse 39

  fill(ellipse40Color); // Set the fill color for Ellipse 40
  ellipse(ellipse40X, ellipse40Y, ellipse40Width, ellipse40Height);
  
  //Sub
  sub = createFont("Fonts/LucidaGrande.ttf", 48);
  //scale(-1, 1);
  translate(500, 200);
  //translate(-1000,0);
  //translate(-1000,0);
  //translate(-1000,0);
  textFont(sub);
  stroke(#000000);
  strokeWeight(1);
  fill(#FFFFFF);
  textAlign(CENTER);
  
  if (frameToSec(counter) >= start && frameToSec(counter) < start+2) {
    text("I'm soo full, this food taste soo good", (1920/2)-500, (1080/2+350)-120);
  } else if (frameToSec(counter) >= start+2 && frameToSec(counter) < start+5) {
    text("Well, I am glad you like it. Now, we should probably go to sleep", (1920/2)-500, (1080/2+350)-120);
  }
}

// ================================== scene 16 =========================================
void drawScene16 (float start, float end) {
  background(#FAEED6);
  
    noStroke();
    pushMatrix();
    translate(451, 650);
    rotate(radians(-80));
    fill(#CF5A51);
    rect(0, 0, 589, 907, 100);
    popMatrix();
    
    frameRate = 60;
  
   if (frameToSec(counter) >= start+2 && frameToSec(counter) < start+3.5)  {
     pushMatrix();
    scale (1.4);
    PImage ellipseImage = loadImage("Img/Blurred_Ellipse.png");
    image(ellipseImage, 100,-100);
    popMatrix();
    }
  
  if (frameToSec(counter) >= start && frameToSec(counter) < start+3) { 
    isFront = true;
    isNormal = false;
    isFlipped = false;
    isBack = false;
    isSleeping = true;
    
    scale(2.0);
    //scale(-1, 1);
    translate(-width-200, -600);
    //translate(1320,450);
    rotate(radians(10));
    drawStoppedArsa(0);
  }  
}

// ================================== scene 17 =========================================
void drawScene17 (float start, float end){
 background(colorPalette[18]);
  noStroke();
  
  //lantai
  fill(colorPalette[23]);
  rect(0, 920, 1920, 252);
  
  //bingkai lukisan 1
  fill(#80331F);
  rect(126, 115, 1034, 691);
  //lukisan
  fill(colorPalette[26]);
  rect(164, 153, 954, 615);
  //awan
  fill(#FFFFFF);
  rect(164, 170, 100, 50, 0, 100, 100, 0);
  fill(#FFFFFF);
  rect(164, 210, 150, 50, 0, 100, 100, 0);
  //matahari
  fill(#FDD06B);
  ellipse(840, 210, 50, 50);
  //gunung
  fill(#71BFBF);
  triangle(164, 526.779, 641, 200, 1118, 526.779);
  //tanah
  fill(#7E944D);
  rect(164, 526.779, 954, 85.221);
  fill(#72844A);
  rect(164, 612, 954, 156);
  //rumah
  fill(#DA3D2E);
  triangle(300, 400, 410, 300, 520, 400); //atap
  fill(#FFE1A1);
  rect(320, 400, 180, 150); //tembok
  fill(#D48B3E);
  rect(340, 450, 40, 60); //jendela
  fill(#D48B3E);
  rect(400, 450, 50, 100); //pintu
  //pohon
  fill(#9D5F4B);
  rect(910, 153, 210, 615);
  fill(#6F4538);
  rect(978, 153, 20, 130, 100);
  fill(#6F4538);
  rect(1040, 260, 20, 130, 100);
  fill(#6F4538);
  rect(1090, 390, 20, 130, 100);
  fill(#6F4538);
  rect(978, 520, 20, 130, 100);
  fill(#6F4538);
  rect(1040, 620, 20, 130, 100);
  
  //bingkai lukisan 2
  fill(#80331F);
  rect(1229, 264, 783, 542);
  //lukisan
  fill(colorPalette[26]);
  rect(1271.26, 302.26, 709.503, 457.384); //langit
  fill(#FFBA42);
  rect(1271.26, 612, 709.503, 148); //pasir
  fill(#FFFFFF);
  ellipse(1800, 390, 93, 93);
  fill(#859F56);
  rect(1400, 458, 111, 302, 100, 100, 0, 0); //kaktus besar
  pushMatrix();
  rotate(radians(79));
  fill(#859F56);
  rect(850, -1470, 77.274, 145, 100, 100, 0, 0); //kaktus kecil
  popMatrix();
  //personX = 0;  // Reset the person's X position to 0

 //Arsa  
  if (frameToSec(counter) >= start+1 && frameToSec(counter) < start+2.5) {
    PImage ellipseImage = loadImage("Img/Blurred_Ellipse.png");
    image(ellipseImage, 100,100);
}  
  
if (frameToSec(counter) >= start+2 && frameToSec(counter) < end){
  if (frameToSec(counter) >= start+2 && frameToSec(counter) < start+3) {
    isNormal = false;
    isConfused = true;
    isSleeping = false;
    isFlipped = false;
}  else if (frameToSec(counter) >= start+3 && frameToSec(counter) < start+5) {
    isNormal = false;
    isSleeping = false;
    isConfused = false;
    isTalking = false;
    isSmiling = false;
    isVeryHappy = true;
    isFlipped = true;
} else {
    isNormal = true;
    isTalking = false;
    isFlipped = true;
}
      scale(1.0);
      scale(-1, 1);
      translate(-width+300, 100);
      translate(-250,-100);
      rotate(radians(0));
                
      //Left Hand
      fill (colorPalette[0]);
      pushMatrix();  // Save the current transformation matrix
      translate(224, 720);  // Move the coordinate system to the right hand position
      rotate(radians(-10));  // Rotate the coordinate system for the right hand
      ellipse(20, 170, 50, 50);
      // Pergelangan tangan
      rect(10, 4, 28, 177);
      // Lengan
      fill (colorPalette[4]);
      rect(0, 0, 45, 88, 30, 30, 0, 0); 
      popMatrix();
      
      // Left Leg
      fill (colorPalette[0]);
      rect(234, 843, 38, 237);
      fill (colorPalette[6]);
      rect (190, 828, 93, 110, 30, 30, 0, 0);
      
      // Right Leg
      fill (colorPalette[0]);
      rect(165, 843, 38, 237);
      fill (colorPalette[5]);
      rect (136, 828, 93, 110, 30, 30, 0, 0);
      
      // Draw the Neck
      fill (colorPalette[1]);
      rect(214, 660, 37, 75);
      arc (220, 694, 55, 86, radians(45), radians(180));
      
      // Shirt
      fill (colorPalette[4]);
      beginShape();
      vertex(285, 843);
      vertex(136, 843);
      bezierVertex(135, 779, 136, 773, 135, 752);
      bezierVertex(145, 728, 155, 704, 183, 695);
      bezierVertex(210, 690, 225, 720, 238, 720);
      bezierVertex(249, 721, 249, 708, 251, 701);
      bezierVertex(252, 701, 263, 700, 270, 711);
      bezierVertex(277, 721, 278, 700, 285, 843);
      endShape();
      
      // Right Hand
      // Telapak
      fill (colorPalette[0]);
      ellipse(116, 905, 50, 50);
      pushMatrix(); 
      translate(145, 722);  // Move the coordinate system to the right hand position
      rotate(radians(17));  // Rotate the coordinate system for the right hand
      // Pergelangan tangan
      rect(10, 4, 28, 177);
      // Lengan
      fill (colorPalette[4]);
      rect(0, 0, 45, 88, 30, 30, 0, 0);  // Draw the right hand with rounded corners
      popMatrix();
      
      // Draw the Hair
      fill (colorPalette[3]);
      ellipse(186, 625, 95, 95);
      ellipse(150, 575, 93, 93);
      ellipse(158, 511, 112, 112);
      ellipse(196, 467, 123, 123);
      ellipse(282, 453, 150, 150);
      ellipse(365, 507, 90, 90);
      ellipse(350, 570, 71, 71);
      
      // Draw the Ear
      fill (colorPalette[0]);
      ellipse(160, 575, 61, 61);
      
      // Draw the face
      beginShape();
      vertex(173, 572);
      vertex(196, 542);
      vertex(196, 520);
      bezierVertex(203, 521, 219, 523, 226, 518);
      bezierVertex(233, 512, 243, 499, 247, 493);
      bezierVertex(255, 499, 274, 512, 290, 516);
      bezierVertex(306, 519, 346, 517, 364, 512);
      bezierVertex(364, 558, 360, 645, 341, 661);
      bezierVertex(317, 681, 284, 684, 266, 684);
      bezierVertex(248, 684, 194, 662, 180, 639);
      bezierVertex(168, 620, 165, 608, 165, 605);
      endShape();
      
      // Blush
      fill (colorPalette[2]);
      ellipse (210, 600, 17, 17);
      ellipse (345, 610, 16, 16);
      
      // Expression
      if (isNormal) {
        // Right Eyebrow
        noFill();
        stroke (colorPalette[3]);
        strokeWeight(4);
        beginShape();
        vertex(230, 547);
        bezierVertex(234, 545, 243, 539, 245, 539);
        bezierVertex(255, 539, 261, 542, 263, 543);
        endShape();
        // Left Eyebrow
        beginShape();
        vertex(313, 549);
        bezierVertex(318, 548, 329, 546, 334, 549);
        bezierVertex(340, 551, 344, 556, 346, 558);
        endShape();
        // Lip
        beginShape();
        vertex(263, 627);
        bezierVertex(268, 631, 282, 639, 291, 638);
        bezierVertex(301, 637, 307, 632, 309, 630);
        endShape();
        // Eye
        noStroke();
        fill (colorPalette[3]);
        ellipse (250, 580, 14, 18);
        ellipse (325, 585, 14, 18);
      }
      
      else if (isSleeping){
        // Sleep
        // Right Eyebrow
        noFill();
        stroke (colorPalette[3]);
        strokeWeight(4);
        beginShape();
        vertex(230, 547);
        bezierVertex(234, 545, 243, 539, 245, 539);
        bezierVertex(255, 539, 261, 542, 263, 543);
        endShape();
        // Left Eyebrow
        beginShape();
        vertex(313, 549);
        bezierVertex(318, 548, 329, 546, 334, 549);
        bezierVertex(340, 551, 344, 556, 346, 558);
        endShape();
        // Lip
        beginShape();
        vertex(267, 643);
        bezierVertex(272, 641, 281, 640, 287, 641);
        bezierVertex(294, 642, 300, 643, 302, 644);
        endShape();
        // Eye
        line(314, 576, 342, 581);
        line(235, 576, 263, 574);
      }
      
      else if (isConfused) {
        // Right Eyebrow
        noFill();
        stroke (colorPalette[3]);
        strokeWeight(4);
        beginShape();
        vertex(230, 547);
        bezierVertex(234, 545, 243, 539, 245, 539);
        bezierVertex(255, 539, 261, 542, 263, 543);
        endShape();
        // Left Eyebrow
        beginShape();
        vertex(313, 549);
        bezierVertex(318, 548, 329, 546, 334, 549);
        bezierVertex(340, 551, 344, 556, 346, 558);
        endShape();
        // Lip
        beginShape();
        vertex(267, 643);
        bezierVertex(272, 641, 281, 640, 287, 641);
        bezierVertex(294, 642, 300, 643, 302, 644);
        endShape();
        // Eye
        noStroke();
        fill (colorPalette[3]);
        ellipse (250, 580, 14, 18);
        ellipse (325, 585, 14, 18);
      }
      
      else if (isVeryConfused) {
        // Right Eyebrow
        noFill();
        stroke (colorPalette[3]);
        strokeWeight(4);
        beginShape();
        vertex(230, 547);
        bezierVertex(234, 545, 243, 539, 245, 539);
        bezierVertex(255, 539, 261, 542, 263, 543);
        endShape();
        // Left Eyebrow
        beginShape();
        vertex(313, 546);
        bezierVertex(315, 547, 322, 549, 328, 548);
        bezierVertex(335, 548, 343, 541, 346, 537);
        endShape();
        // Lip
        beginShape();
        vertex(267, 643);
        bezierVertex(272, 641, 281, 640, 287, 641);
        bezierVertex(294, 642, 300, 643, 302, 644);
        endShape();
        // Eye
        noStroke();
        fill (colorPalette[3]);
        ellipse (250, 580, 14, 18);
        ellipse (325, 585, 14, 18);
      }
      
      else if (isTalking) {
        // Right Eyebrow
        noFill();
        stroke (colorPalette[3]);
        strokeWeight(4);
        beginShape();
        vertex(230, 547);
        bezierVertex(234, 545, 243, 539, 245, 539);
        bezierVertex(255, 539, 261, 542, 263, 543);
        endShape();
        // Left Eyebrow
        beginShape();
        vertex(313, 549);
        bezierVertex(318, 548, 329, 546, 334, 549);
        bezierVertex(340, 551, 344, 556, 346, 558);
        endShape();
        // Lip
        noStroke();
        fill (colorPalette[3]);
        ellipse(280, 640, 14, 18);
        // Eye
        ellipse (250, 580, 14, 18);
        ellipse (325, 585, 14, 18);
      }
      
      else if (isSmiling) {
        // Right Eyebrow
        noFill();
        stroke (colorPalette[3]);
        strokeWeight(4);
        beginShape();
        vertex(230, 547);
        bezierVertex(234, 545, 243, 539, 245, 539);
        bezierVertex(255, 539, 261, 542, 263, 543);
        endShape();
        // Left Eyebrow
        beginShape();
        vertex(313, 549);
        bezierVertex(318, 548, 329, 546, 334, 549);
        bezierVertex(340, 551, 344, 556, 346, 558);
        endShape();
        // Lip
        noStroke();
        fill (colorPalette[3]);
        beginShape();
        vertex(302, 634);
        vertex(294, 642);
        bezierVertex(292, 644, 288, 648, 279, 648);
        bezierVertex(272, 648, 261, 634, 257, 626);
        bezierVertex(264, 630, 278, 636, 282, 636);
        bezierVertex(286, 637, 298, 636, 302, 634);
        endShape();
        // Eye
        ellipse (250, 580, 14, 18);
        ellipse (325, 585, 14, 18);
      }
      
      else if (isVeryHappy) {
        // Right Eyebrow
        noFill();
        stroke (colorPalette[3]);
        strokeWeight(4);
        beginShape();
        vertex(230, 547);
        bezierVertex(234, 545, 243, 539, 245, 539);
        bezierVertex(255, 539, 261, 542, 263, 543);
        endShape();
        // Left Eyebrow
        beginShape();
        vertex(313, 549);
        bezierVertex(318, 548, 329, 546, 334, 549);
        bezierVertex(340, 551, 344, 556, 346, 558);
        endShape();
        // Eye
        strokeWeight(3);
        beginShape();
        vertex(236, 571);
        bezierVertex(238, 569, 240, 565, 247, 564);
        bezierVertex(254, 563, 264, 568, 268, 570);
        endShape();
        beginShape();
        vertex(308, 573);
        bezierVertex(311, 572, 318, 571, 324, 573);
        bezierVertex(331, 574, 335, 578, 338, 582);
        endShape();
        // Lip
        noStroke();
        fill (colorPalette[3]);
        beginShape();
        vertex(302, 634);
        vertex(294, 642);
        bezierVertex(292, 644, 288, 648, 279, 648);
        bezierVertex(272, 648, 261, 634, 257, 626);
        bezierVertex(264, 630, 278, 636, 282, 636);
        bezierVertex(286, 637, 298, 636, 302, 634);
        endShape();
      }
}
}

















// Function Arsa
void drawArsa(float x) {
  if (isFlipped) {
    //scale(1.3); 
    scale(-1, 1);
    translate(-width, 0);
    translate(-1000,0);
    //rotate(radians(-18));
    
    legAngle += legSpeed * legDirection;
  
    // Check if the leg swing angle reaches the limits
    if (legAngle >= 20 || legAngle <= -20) {
      legDirection *= -1;  // Reverse the leg swing direction
    }
    
    // Person's drawing code here
    //Left Hand
    fill (colorPalette[0]);
    pushMatrix();  // Save the current transformation matrix
    translate(x + 224, 720);  // Move the coordinate system to the right hand position
    rotate(radians(-10));  // Rotate the coordinate system for the right hand
    ellipse(20, 170, 50, 50);
    // Pergelangan tangan
    rect(10, 4, 28, 177);
    // Lengan
    fill (colorPalette[4]);
    rect(0, 0, 45, 88, 30, 30, 0, 0); 
    popMatrix();
    
    // Left Leg
    pushMatrix();
    translate(x + 234, 843);
    rotate(radians(legAngle));  // Rotate the leg based on the legAngle
    fill(colorPalette[0]);
    rect(-20, 0, 38, 237);
    fill(colorPalette[6]);
    rect(-44, -15, 93, 110, 30, 30, 0, 0);
    popMatrix();
  
    // Right Leg
    pushMatrix();
    translate(x + 165, 843);
    rotate(radians(-legAngle));  // Rotate the leg based on the legAngle
    fill(colorPalette[0]);
    rect(0, 0, 38, 237);
    fill(colorPalette[5]);
    rect(-37, -15, 93, 110, 30, 30, 0, 0);
    popMatrix();
    
    // Draw the Neck
    fill (colorPalette[1]);
    rect(x + 214, 660, 37, 75);
    arc (x + 220, 694, 55, 86, radians(45), radians(180));
    
    // Shirt
    fill (colorPalette[4]);
    beginShape();
    vertex(x + 285, 843);
    vertex(x + 136, 843);
    bezierVertex(x + 135, 779, x + 136, 773, x + 135, 752);
    bezierVertex(x + 145, 728, x + 155, 704, x + 183, 695);
    bezierVertex(x + 210, 690, x + 225, 720, x + 238, 720);
    bezierVertex(x + 249, 721, x + 249, 708, x + 251, 701);
    bezierVertex(x + 252, 701, x + 263, 700, x + 270, 711);
    bezierVertex(x + 277, 721, x + 278, 700, x + 285, 843);
    endShape();
    
    // Right Hand
    // Telapak
    fill (colorPalette[0]);
    ellipse(x + 116, 905, 50, 50);
    pushMatrix(); 
    translate(x + 145, 722);  // Move the coordinate system to the right hand position
    rotate(radians(17));  // Rotate the coordinate system for the right hand
    // Pergelangan tangan
    rect(10, 4, 28, 177);
    // Lengan
    fill (colorPalette[4]);
    rect(0, 0, 45, 88, 30, 30, 0, 0);  // Draw the right hand with rounded corners
    popMatrix();
    
    // Draw the Hair
    fill (colorPalette[3]);
    ellipse(x + 186, 625, 95, 95);
    ellipse(x + 150, 575, 93, 93);
    ellipse(x + 158, 511, 112, 112);
    ellipse(x + 196, 467, 123, 123);
    ellipse(x + 282, 453, 150, 150);
    ellipse(x + 365, 507, 90, 90);
    ellipse(x + 350, 570, 71, 71);
    
    // Draw the Ear
    fill (colorPalette[0]);
    ellipse(x + 160, 575, 61, 61);
    
    // Draw the face
    beginShape();
    vertex(x + 173, 572);
    vertex(x + 196, 542);
    vertex(x + 196, 520);
    bezierVertex(x + 203, 521, x + 219, 523, x + 226, 518);
    bezierVertex(x + 233, 512, x + 243, 499, x + 247, 493);
    bezierVertex(x + 255, 499, x + 274, 512, x + 290, 516);
    bezierVertex(x + 306, 519, x + 346, 517, x + 364, 512);
    bezierVertex(x + 364, 558, x + 360, 645, x + 341, 661);
    bezierVertex(x + 317, 681, x + 284, 684, x + 266, 684);
    bezierVertex(x + 248, 684, x + 194, 662, x + 180, 639);
    bezierVertex(x + 168, 620, x + 165, 608, x + 165, 605);
    endShape();
    
    // Blush
    fill (colorPalette[2]);
    ellipse (x + 210, 600, 17, 17);
    ellipse (x + 345, 610, 16, 16);
    
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(x + 230, 547);
    bezierVertex(x + 234, 545, x + 243, 539, x + 245, 539);
    bezierVertex(x + 255, 539, x + 261, 542, x + 263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(x + 313, 549);
    bezierVertex(x + 318, 548, x + 329, 546, x + 334, 549);
    bezierVertex(x + 340, 551, x + 344, 556, x + 346, 558);
    endShape();
    // Lip
    beginShape();
    vertex(x + 263, 627);
    bezierVertex(x + 268, 631, x + 282, 639, x + 291, 638);
    bezierVertex(x + 301, 637, x + 307, 632, x + 309, 630);
    endShape();
    // Eye
    noStroke();
    fill (colorPalette[3]);
    ellipse (x + 250, 580, 14, 18);
    ellipse (x + 325, 585, 14, 18);
  }
    else {
      legAngle += legSpeed * legDirection;
    
      // Check if the leg swing angle reaches the limits
      if (legAngle >= 20 || legAngle <= -20) {
        legDirection *= -1;  // Reverse the leg swing direction
      }
      
      // Person's drawing code here
      //Left Hand
      fill (colorPalette[0]);
      pushMatrix();  // Save the current transformation matrix
      translate(x + 224, 720);  // Move the coordinate system to the right hand position
      rotate(radians(-10));  // Rotate the coordinate system for the right hand
      ellipse(20, 170, 50, 50);
      // Pergelangan tangan
      rect(10, 4, 28, 177);
      // Lengan
      fill (colorPalette[4]);
      rect(0, 0, 45, 88, 30, 30, 0, 0); 
      popMatrix();
      
      // Left Leg
      pushMatrix();
      translate(x + 234, 843);
      rotate(radians(legAngle));  // Rotate the leg based on the legAngle
      fill(colorPalette[0]);
      rect(-20, 0, 38, 237);
      fill(colorPalette[6]);
      rect(-44, -15, 93, 110, 30, 30, 0, 0);
      popMatrix();
    
      // Right Leg
      pushMatrix();
      translate(x + 165, 843);
      rotate(radians(-legAngle));  // Rotate the leg based on the legAngle
      fill(colorPalette[0]);
      rect(0, 0, 38, 237);
      fill(colorPalette[5]);
      rect(-37, -15, 93, 110, 30, 30, 0, 0);
      popMatrix();
      
      // Draw the Neck
      fill (colorPalette[1]);
      rect(x + 214, 660, 37, 75);
      arc (x + 220, 694, 55, 86, radians(45), radians(180));
      
      // Shirt
      fill (colorPalette[4]);
      beginShape();
      vertex(x + 285, 843);
      vertex(x + 136, 843);
      bezierVertex(x + 135, 779, x + 136, 773, x + 135, 752);
      bezierVertex(x + 145, 728, x + 155, 704, x + 183, 695);
      bezierVertex(x + 210, 690, x + 225, 720, x + 238, 720);
      bezierVertex(x + 249, 721, x + 249, 708, x + 251, 701);
      bezierVertex(x + 252, 701, x + 263, 700, x + 270, 711);
      bezierVertex(x + 277, 721, x + 278, 700, x + 285, 843);
      endShape();
      
      // Right Hand
      // Telapak
      fill (colorPalette[0]);
      ellipse(x + 116, 905, 50, 50);
      pushMatrix(); 
      translate(x + 145, 722);  // Move the coordinate system to the right hand position
      rotate(radians(17));  // Rotate the coordinate system for the right hand
      // Pergelangan tangan
      rect(10, 4, 28, 177);
      // Lengan
      fill (colorPalette[4]);
      rect(0, 0, 45, 88, 30, 30, 0, 0);  // Draw the right hand with rounded corners
      popMatrix();
      
      // Draw the Hair
      fill (colorPalette[3]);
      ellipse(x + 186, 625, 95, 95);
      ellipse(x + 150, 575, 93, 93);
      ellipse(x + 158, 511, 112, 112);
      ellipse(x + 196, 467, 123, 123);
      ellipse(x + 282, 453, 150, 150);
      ellipse(x + 365, 507, 90, 90);
      ellipse(x + 350, 570, 71, 71);
      
      // Draw the Ear
      fill (colorPalette[0]);
      ellipse(x + 160, 575, 61, 61);
      
      // Draw the face
      beginShape();
      vertex(x + 173, 572);
      vertex(x + 196, 542);
      vertex(x + 196, 520);
      bezierVertex(x + 203, 521, x + 219, 523, x + 226, 518);
      bezierVertex(x + 233, 512, x + 243, 499, x + 247, 493);
      bezierVertex(x + 255, 499, x + 274, 512, x + 290, 516);
      bezierVertex(x + 306, 519, x + 346, 517, x + 364, 512);
      bezierVertex(x + 364, 558, x + 360, 645, x + 341, 661);
      bezierVertex(x + 317, 681, x + 284, 684, x + 266, 684);
      bezierVertex(x + 248, 684, x + 194, 662, x + 180, 639);
      bezierVertex(x + 168, 620, x + 165, 608, x + 165, 605);
      endShape();
      
      // Blush
      fill (colorPalette[2]);
      ellipse (x + 210, 600, 17, 17);
      ellipse (x + 345, 610, 16, 16);
      
      // Right Eyebrow
      noFill();
      stroke (colorPalette[3]);
      strokeWeight(4);
      beginShape();
      vertex(x + 230, 547);
      bezierVertex(x + 234, 545, x + 243, 539, x + 245, 539);
      bezierVertex(x + 255, 539, x + 261, 542, x + 263, 543);
      endShape();
      // Left Eyebrow
      beginShape();
      vertex(x + 313, 549);
      bezierVertex(x + 318, 548, x + 329, 546, x + 334, 549);
      bezierVertex(x + 340, 551, x + 344, 556, x + 346, 558);
      endShape();
      // Lip
      beginShape();
      vertex(x + 263, 627);
      bezierVertex(x + 268, 631, x + 282, 639, x + 291, 638);
      bezierVertex(x + 301, 637, x + 307, 632, x + 309, 630);
      endShape();
      // Eye
      noStroke();
      fill (colorPalette[3]);
      ellipse (x + 250, 580, 14, 18);
      ellipse (x + 325, 585, 14, 18);
  }
  
}

void drawStoppedArsa(float x) {
  if (isFlipped) { 
  scale(-1, 1);
  translate(-width, 0);
  translate(-1000,0);
  }
  
  if (isFront){
    scale(-1, 1);
    translate(-width, 0);
    translate(-1000,0);
     // Person's drawing code here
    //Left Hand
    pushMatrix();
    fill (colorPalette[0]);
     if (isRaising){
       translate(x+228, 920);
        rotate(radians(-135));
     } else {
       translate(x + 224, 720);  // Move the coordinate system to the right hand position
        rotate(radians(-10));  // Rotate the coordinate system for the right hand
     }
    ellipse(20, 170, 50, 50);
    // Pergelangan tangan
    rect(10, 4, 28, 177);
    // Lengan
    fill (colorPalette[4]);
    rect(0, 0, 45, 88, 30, 30, 0, 0); 
    popMatrix();
    
    // Left Leg
    pushMatrix();
    translate(x + 234, 843);
    //rotate(radians(legAngle));  // Rotate the leg based on the legAngle
    fill(colorPalette[0]);
    rect(-20, 0, 38, 237);
    fill(colorPalette[6]);
    rect(-44, -15, 93, 110, 30, 30, 0, 0);
    popMatrix();
  
    // Right Leg
    pushMatrix();
    translate(x + 165, 843);
    //rotate(radians(-legAngle));  // Rotate the leg based on the legAngle
    fill(colorPalette[0]);
    rect(0, 0, 38, 237);
    fill(colorPalette[5]);
    rect(-37, -15, 93, 110, 30, 30, 0, 0);
    popMatrix();
    
    // Draw the Neck
    fill (colorPalette[1]);
    rect(x + 214, 660, 37, 75);
    arc (x + 220, 694, 55, 86, radians(45), radians(180));
    
    // Shirt
    fill (colorPalette[4]);
    beginShape();
    vertex(x + 285, 843);
    vertex(x + 136, 843);
    bezierVertex(x + 135, 779, x + 136, 773, x + 135, 752);
    bezierVertex(x + 145, 728, x + 155, 704, x + 183, 695);
    bezierVertex(x + 210, 690, x + 225, 720, x + 238, 720);
    bezierVertex(x + 249, 721, x + 249, 708, x + 251, 701);
    bezierVertex(x + 252, 701, x + 263, 700, x + 270, 711);
    bezierVertex(x + 277, 721, x + 278, 700, x + 285, 843);
    endShape();
    
    // Right Hand
    // Telapak
    fill (colorPalette[0]);
    ellipse(x + 116, 905, 50, 50);
    pushMatrix(); 
    translate(x + 145, 722);  // Move the coordinate system to the right hand position
    rotate(radians(17));  // Rotate the coordinate system for the right hand
    // Pergelangan tangan
    rect(10, 4, 28, 177);
    // Lengan
    fill (colorPalette[4]);
    rect(0, 0, 45, 88, 30, 30, 0, 0);  // Draw the right hand with rounded corners
    popMatrix();
    
    // Draw the Hair
    fill (colorPalette[3]);
    ellipse(x + 186, 625, 95, 95);
    ellipse(x + 150, 575, 93, 93);
    ellipse(x + 158, 511, 112, 112);
    ellipse(x + 196, 467, 123, 123);
    ellipse(x + 282, 453, 150, 150);
    ellipse(x + 365, 507, 90, 90);
    ellipse(x + 350, 570, 71, 71);
    
    // Draw the Ear
    fill (colorPalette[0]);
    ellipse(x + 160, 575, 61, 61);
    
    // Draw the face
    beginShape();
    vertex(x + 173, 572);
    vertex(x + 196, 542);
    vertex(x + 196, 520);
    bezierVertex(x + 203, 521, x + 219, 523, x + 226, 518);
    bezierVertex(x + 233, 512, x + 243, 499, x + 247, 493);
    bezierVertex(x + 255, 499, x + 274, 512, x + 290, 516);
    bezierVertex(x + 306, 519, x + 346, 517, x + 364, 512);
    bezierVertex(x + 364, 558, x + 360, 645, x + 341, 661);
    bezierVertex(x + 317, 681, x + 284, 684, x + 266, 684);
    bezierVertex(x + 248, 684, x + 194, 662, x + 180, 639);
    bezierVertex(x + 168, 620, x + 165, 608, x + 165, 605);
    endShape();
    
    // Blush
    fill (colorPalette[2]);
    ellipse (x + 210, 600, 17, 17);
    ellipse (x + 345, 610, 16, 16);
    
    // Expression
  if (isNormal) {
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(x+230, 547);
    bezierVertex(x+234, 545, x+243, 539, x+245, 539);
    bezierVertex(x+255, 539, x+261, 542, x+263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(x+313, 549);
    bezierVertex(x+318, 548, x+329, 546, x+334, 549);
    bezierVertex(x+340, 551, x+344, 556, x+346, 558);
    endShape();
    // Lip
    beginShape();
    vertex(x+263, 627);
    bezierVertex(x+268, 631, x+282, 639, x+291, 638);
    bezierVertex(x+301, 637, x+307, 632, x+309, 630);
    endShape();
    // Eye
    noStroke();
    fill (colorPalette[3]);
    ellipse (x+250, 580, 14, 18);
    ellipse (x+325, 585, 14, 18);
  }
  
  else if (isSleeping){
    // Sleep
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(x+230, 547);
    bezierVertex(x+234, 545, x+243, 539, x+245, 539);
    bezierVertex(x+255, 539, x+261, 542, x+263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(x+313, 549);
    bezierVertex(x+318, 548, x+329, 546, x+334, 549);
    bezierVertex(x+340, 551, x+344, 556,x+ 346, 558);
    endShape();
    // Lip
    beginShape();
    vertex(x+267, 643);
    bezierVertex(x+272, 641, x+281, 640,x+ 287, 641);
    bezierVertex(x+294, 642, x+300, 643,x+ 302, 644);
    endShape();
    // Eye
    line(x+314, 576, x+342, 581);
    line(x+235, 576, x+263, 574);
  }
  
  else if (isConfused) {
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(x+230, 547);
    bezierVertex(x+234, 545, x+243, 539, x+245, 539);
    bezierVertex(x+255, 539, x+261, 542, x+263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(x+313, 549);
    bezierVertex(x+318, 548,x+ 329, 546, x+334, 549);
    bezierVertex(x+340, 551, x+344, 556, x+346, 558);
    endShape();
    // Lip
    beginShape();
    vertex(x+267, 643);
    bezierVertex(x+272, 641, x+281, 640, x+287, 641);
    bezierVertex(x+294, 642, x+300, 643, x+302, 644);
    endShape();
    // Eye
    noStroke();
    fill (colorPalette[3]);
    ellipse (x+250, 580, 14, 18);
    ellipse (x+325, 585, 14, 18);
  }
  
  else if (isVeryConfused) {
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(x+230, 547);
    bezierVertex(x+234, 545, x+243, 539, x+245, 539);
    bezierVertex(x+255, 539,x+ 261, 542,x+ 263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(x+313, 546);
    bezierVertex(x+315, 547, x+322, 549, x+328, 548);
    bezierVertex(x+335, 548,x+ 343, 541, x+346, 537);
    endShape();
    // Lip
    beginShape();
    vertex(x+267, 643);
    bezierVertex(x+272, 641,x+ 281, 640,x+ 287, 641);
    bezierVertex(x+294, 642, x+300, 643, x+302, 644);
    endShape();
    // Eye
    noStroke();
    fill (colorPalette[3]);
    ellipse (x+250, 580, 14, 18);
    ellipse (x+325, 585, 14, 18);
  }
  
  else if (isTalking) {
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(x+230, 547);
    bezierVertex(x+234, 545, x+243, 539, x+245, 539);
    bezierVertex(x+255, 539, x+261, 542, x+263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(x+313, 549);
    bezierVertex(x+318, 548,x+ 329, 546, x+334, 549);
    bezierVertex(x+340, 551, x+344, 556, x+346, 558);
    endShape();
    // Lip
    noStroke();
    fill (colorPalette[3]);
    ellipse(x+280, 640, 14, 18);
    // Eye
    ellipse (x+250, 580, 14, 18);
    ellipse (x+325, 585, 14, 18);
  }
  
  else if (isSmiling) {
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(x+230, 547);
    bezierVertex(x+234, 545,x+ 243, 539,x+ 245, 539);
    bezierVertex(x+255, 539, x+261, 542, x+263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(x+313, 549);
    bezierVertex(x+318, 548,x+ 329, 546,x+ 334, 549);
    bezierVertex(x+340, 551, x+344, 556, x+346, 558);
    endShape();
    // Lip
    noStroke();
    fill (colorPalette[3]);
    beginShape();
    vertex(x+302, 634);
    vertex(x+294, 642);
    bezierVertex(x+292, 644, x+288, 648, x+279, 648);
    bezierVertex(x+272, 648, x+261, 634, x+257, 626);
    bezierVertex(x+264, 630, x+278, 636, x+282, 636);
    bezierVertex(x+286, 637, x+298, 636, x+302, 634);
    endShape();
    // Eye
    ellipse (x+250, 580, 14, 18);
    ellipse (x+325, 585, 14, 18);
  }
  
  else if (isVeryHappy) {
    // Right Eyebrow
    noFill();
    stroke (colorPalette[3]);
    strokeWeight(4);
    beginShape();
    vertex(x+230, 547);
    bezierVertex(x+234, 545,x+ 243, 539, x+245, 539);
    bezierVertex(x+255, 539, x+261, 542, x+263, 543);
    endShape();
    // Left Eyebrow
    beginShape();
    vertex(x+313, 549);
    bezierVertex(x+318, 548, x+329, 546, x+334, 549);
    bezierVertex(x+340, 551, x+344, 556, x+346, 558);
    endShape();
    // Eye
    strokeWeight(3);
    beginShape();
    vertex(x+236, 571);
    bezierVertex(x+238, 569, x+240, 565, x+247, 564);
    bezierVertex(x+254, 563, x+264, 568, x+268, 570);
    endShape();
    beginShape();
    vertex(x+308, 573);
    bezierVertex(x+311, 572, x+318, 571, x+324, 573);
    bezierVertex(x+331, 574, x+335, 578, x+338, 582);
    endShape();
    // Lip
    noStroke();
    fill (colorPalette[3]);
    beginShape();
    vertex(x+302, 634);
    vertex(x+294, 642);
    bezierVertex(x+292, 644, x+288, 648,x+ 279, 648);
    bezierVertex(x+272, 648, x+261, 634,x+ 257, 626);
    bezierVertex(x+264, 630, x+278, 636, x+282, 636);
    bezierVertex(x+286, 637, x+298, 636, x+302, 634);
    endShape();
  }
  }
  
  else if (isBack) {
    scale(-1, 1);
    translate(-width, 0);
    translate(-1000,0);
     // Person's drawing code here
    //Left Hand
    fill (colorPalette[0]);
    pushMatrix();  // Save the current transformation matrix
    translate(x + 224, 720);  // Move the coordinate system to the right hand position
    rotate(radians(-10));  // Rotate the coordinate system for the right hand
    ellipse(20, 170, 50, 50);
    // Pergelangan tangan
    rect(10, 4, 28, 177);
    // Lengan
    fill (colorPalette[4]);
    rect(0, 0, 45, 88, 30, 30, 0, 0); 
    popMatrix();
    
    // Left Leg
    pushMatrix();
    translate(x + 234, 843);
    //rotate(radians(legAngle));  // Rotate the leg based on the legAngle
    fill(colorPalette[0]);
    rect(-20, 0, 38, 237);
    fill(colorPalette[6]);
    rect(-44, -15, 93, 110, 30, 30, 0, 0);
    popMatrix();
  
    // Right Leg
    pushMatrix();
    translate(x + 165, 843);
    //rotate(radians(-legAngle));  // Rotate the leg based on the legAngle
    fill(colorPalette[0]);
    rect(0, 0, 38, 237);
    fill(colorPalette[5]);
    rect(-37, -15, 93, 110, 30, 30, 0, 0);
    popMatrix();
    
    // Draw the Neck
    fill (colorPalette[1]);
    rect(x + 214, 660, 37, 75);
    arc (x + 220, 694, 55, 86, radians(45), radians(180));
    
    // Shirt
    fill (colorPalette[4]);
    beginShape();
    vertex(x + 285, 843);
    vertex(x + 136, 843);
    bezierVertex(x + 135, 779, x + 136, 773, x + 135, 752);
    bezierVertex(x + 145, 728, x + 155, 704, x + 183, 695);
    bezierVertex(x + 210, 690, x + 225, 720, x + 238, 720);
    bezierVertex(x + 249, 721, x + 249, 708, x + 251, 701);
    bezierVertex(x + 252, 701, x + 263, 700, x + 270, 711);
    bezierVertex(x + 277, 721, x + 278, 700, x + 285, 843);
    endShape();
    
    // Right Hand
    // Telapak
    fill (colorPalette[0]);
    ellipse(x + 116, 905, 50, 50);
    pushMatrix(); 
    translate(x + 145, 722);  // Move the coordinate system to the right hand position
    rotate(radians(17));  // Rotate the coordinate system for the right hand
    // Pergelangan tangan
    rect(10, 4, 28, 177);
    // Lengan
    fill (colorPalette[4]);
    rect(0, 0, 45, 88, 30, 30, 0, 0);  // Draw the right hand with rounded corners
    popMatrix();
    
    // Draw the Hair
    pushMatrix(); 
    translate(0, 20);
    fill (colorPalette[3]);
    ellipse(x+186, 625, 95, 95);
    ellipse(x+150, 575, 93, 93);
    ellipse(x+158, 511, 112, 112);
    ellipse(x+196, 467, 123, 123);
    ellipse(x+282, 463, 140, 140);
    ellipse(x+345, 507, 90, 90);
    ellipse(x+350, 570, 71, 71);
    ellipse(x+225, 575, 166, 176);
    ellipse(x+340, 580, 92, 98);
    ellipse(x+320, 550, 112, 119);
    ellipse(x+250, 630, 92, 98);
    ellipse(x+300, 620, 84, 88);
    popMatrix();   
  }  
}

// Function Supri
void drawSupri(float x) {
  if (isFlipped) {
    //scale(1.3); 
    scale(-1, 1);
    translate(-width, 0);
    translate(-1000,0);
    //rotate(radians(-18));
    
    legAngle += legSpeed * legDirection;
  
    // Check if the leg swing angle reaches the limits
    if (legAngle >= 20 || legAngle <= -20) {
      legDirection *= -1;  // Reverse the leg swing direction
    }
    
    // Person's drawing code here
    //Left Hand
    fill (colorPalette[7]);
    pushMatrix();  // Save the current transformation matrix
    translate(x + 224, 720);  // Move the coordinate system to the right hand position
    rotate(radians(-10));  // Rotate the coordinate system for the right hand
    ellipse(20, 170, 50, 50);
    // Pergelangan tangan
    rect(10, 4, 28, 177);
    // Lengan
    fill (#CF5A51);
    rect(0, 0, 45, 88, 30, 30, 0, 0); 
    popMatrix();
    
    // Left Leg
    pushMatrix();
    translate(x + 234, 843);
    rotate(radians(legAngle));  // Rotate the leg based on the legAngle
    fill(colorPalette[7]);
    rect(-20, 0, 38, 237);
    fill(#4F576F);
    rect(-44, -15, 93, 110, 30, 30, 0, 0);
    popMatrix();
  
    // Right Leg
    pushMatrix();
    translate(x + 165, 843);
    rotate(radians(-legAngle));  // Rotate the leg based on the legAngle
    fill(colorPalette[7]);
    rect(0, 0, 38, 237);
    fill(#606B89);
    rect(-37, -15, 93, 110, 30, 30, 0, 0);
    popMatrix();
    
    // Draw the Neck
    fill (colorPalette[0]);
    rect(x + 214, 660, 37, 75);
    arc (x + 220, 694, 55, 86, radians(45), radians(180));
    
    // Shirt
    fill (#CF5A51);
    beginShape();
    vertex(x + 285, 843);
    vertex(x + 136, 843);
    bezierVertex(x + 135, 779, x + 136, 773, x + 135, 752);
    bezierVertex(x + 145, 728, x + 155, 704, x + 183, 695);
    bezierVertex(x + 210, 690, x + 225, 720, x + 238, 720);
    bezierVertex(x + 249, 721, x + 249, 708, x + 251, 701);
    bezierVertex(x + 252, 701, x + 263, 700, x + 270, 711);
    bezierVertex(x + 277, 721, x + 278, 700, x + 285, 843);
    endShape();
    
    // Right Hand
    // Telapak
    fill (colorPalette[7]);
    ellipse(x + 116, 905, 50, 50);
    pushMatrix(); 
    translate(x + 145, 722);  // Move the coordinate system to the right hand position
    rotate(radians(17));  // Rotate the coordinate system for the right hand
    // Pergelangan tangan
    rect(10, 4, 28, 177);
    // Lengan
    fill (#CF5A51);
    rect(0, 0, 45, 88, 30, 30, 0, 0);  // Draw the right hand with rounded corners
    popMatrix();
    
    // Draw the hair
    fill (#864448);
    beginShape();
    vertex(x+185, 645);
    bezierVertex(x+152, 628, x+144, 595, x+129, 525);
    bezierVertex(x+130, 503, x+132, 477, x+137, 464);
    bezierVertex(x+144, 455, x+150, 448, x+169, 449);
    bezierVertex(x+177, 451, x+177, 448, x+179, 440);
    bezierVertex(x+185, 427, x+191, 414, x+217, 412);
    bezierVertex(x+229, 413, x+253, 415, x+303, 417);
    bezierVertex(x+310, 413, x+316, 410, x+318, 388);
    bezierVertex(x+318, 382, x+323, 383, x+334, 397);
    bezierVertex(x+341, 401, x+348, 405, x+354, 423);
    vertex(x+356, 432);
    bezierVertex(x+365, 402, x+368, 406, x+377, 419);
    bezierVertex(x+386, 441, x+395, 464, x+383, 495);
    vertex(x+376, 508);
    vertex(x+185, 645);
    endShape();
    
    // Draw the Ear
    fill (colorPalette[7]);
    ellipse(x + 160, 575, 61, 61);
    
    // Draw the face
    beginShape();
    vertex(x + 173, 572);
    vertex(x + 196, 542);
    vertex(x + 196, 520);
    bezierVertex(x + 203, 521, x + 219, 523, x + 226, 518);
    bezierVertex(x + 233, 512, x + 243, 499, x + 247, 493);
    bezierVertex(x + 255, 499, x + 274, 512, x + 290, 516);
    bezierVertex(x + 306, 519, x + 346, 517, x + 364, 512);
    bezierVertex(x + 364, 558, x + 360, 645, x + 341, 661);
    bezierVertex(x + 317, 681, x + 284, 684, x + 266, 684);
    bezierVertex(x + 248, 684, x + 194, 662, x + 180, 639);
    bezierVertex(x + 168, 620, x + 165, 608, x + 165, 605);
    endShape();
    
    // Blush
    fill (colorPalette[2]);
    ellipse (x + 210, 600, 17, 17);
    ellipse (x + 345, 610, 16, 16);
    
        // Expression
          if (isNormal1) {
            // Right Eyebrow
            noFill();
            stroke (#864448);
            strokeWeight(4);
            beginShape();
            vertex(x+230, 547);
            bezierVertex(x+234, 545, x+243, 539, x+245, 539);
            bezierVertex(x+255, 539, x+261, 542, x+263, 543);
            endShape();
            // Left Eyebrow
            beginShape();
            vertex(x+313, 549);
            bezierVertex(x+318, 548, x+329, 546, x+334, 549);
            bezierVertex(x+340, 551, x+344, 556, x+346, 558);
            endShape();
            // Lip
            beginShape();
            vertex(x+263, 627);
            bezierVertex(x+268, 631, x+282, 639, x+291, 638);
            bezierVertex(x+301, 637, x+307, 632, x+309, 630);
            endShape();
            // Eye
            noStroke();
            fill (#864448);
            ellipse (x+250, 580, 14, 18);
            ellipse (x+325, 585, 14, 18);
          }
          
          else if (isConfused1) {
            // Right Eyebrow
            noFill();
            stroke (#864448);
            strokeWeight(4);
            beginShape();
            vertex(x+230, 547);
            bezierVertex(x+234, 545, x+243, 539, x+245, 539);
            bezierVertex(x+255, 539, x+261, 542, x+263, 543);
            endShape();
            // Left Eyebrow
            beginShape();
            vertex(x+313, 549);
            bezierVertex(x+318, 548, x+329, 546, x+334, 549);
            bezierVertex(x+340, 551, x+344, 556, x+346, 558);
            endShape();
            // Lip
            beginShape();
            vertex(x+267, 643);
            bezierVertex(x+272, 641, x+281, 640, x+287, 641);
            bezierVertex(x+294, 642, x+300, 643, x+302, 644);
            endShape();
            // Eye
            noStroke();
            fill (#864448);
            ellipse (x+250, 580, 14, 18);
            ellipse (x+325, 585, 14, 18);
          }
          
          else if (isTalking1) {
            // Right Eyebrow
            noFill();
            stroke (#864448);
            strokeWeight(4);
            beginShape();
            vertex(x+230, 547);
            bezierVertex(x+234, 545, x+243, 539, x+245, 539);
            bezierVertex(x+255, 539, x+261, 542, x+263, 543);
            endShape();
            // Left Eyebrow
            beginShape();
            vertex(x+313, 549);
            bezierVertex(x+318, 548, x+329, 546, x+334, 549);
            bezierVertex(x+340, 551, x+344, 556, x+346, 558);
            endShape();
            // Lip
            noStroke();
            fill (#864448);
            ellipse(x+280, 640, 14, 18);
            // Eye
            ellipse (x+250, 580, 14, 18);
            ellipse (x+325, 585, 14, 18);
          }
          
          else if (isSmiling1) {
            // Right Eyebrow
            noFill();
            stroke (#864448);
            strokeWeight(4);
            beginShape();
            vertex(x+230, 547);
            bezierVertex(x+234, 545, x+243, 539, x+245, 539);
            bezierVertex(x+255, 539, x+261, 542, x+263, 543);
            endShape();
            // Left Eyebrow
            beginShape();
            vertex(x+313, 549);
            bezierVertex(x+318, 548, x+329, 546, x+334, 549);
            bezierVertex(x+340, 551, x+344, 556, x+346, 558);
            endShape();
            // Lip
            noStroke();
            fill (#864448);
            beginShape();
            vertex(x+302, 634);
            vertex(x+294, 642);
            bezierVertex(x+292, 644, x+288, 648, x+279, 648);
            bezierVertex(x+272, 648, x+261, 634, x+257, 626);
            bezierVertex(x+264, 630, x+278, 636, x+282, 636);
            bezierVertex(x+286, 637, x+298, 636, x+302, 634);
            endShape();
            // Eye
            ellipse (x+250, 580, 14, 18);
            ellipse (x+325, 585, 14, 18);
          }
  }
    else {
      legAngle += legSpeed * legDirection;
    
      // Check if the leg swing angle reaches the limits
      if (legAngle >= 20 || legAngle <= -20) {
        legDirection *= -1;  // Reverse the leg swing direction
      }
      
      // Person's drawing code here
      //Left Hand
      fill (colorPalette[0]);
      pushMatrix();  // Save the current transformation matrix
      translate(x + 224, 720);  // Move the coordinate system to the right hand position
      rotate(radians(-10));  // Rotate the coordinate system for the right hand
      ellipse(20, 170, 50, 50);
      // Pergelangan tangan
      rect(10, 4, 28, 177);
      // Lengan
      fill (colorPalette[4]);
      rect(0, 0, 45, 88, 30, 30, 0, 0); 
      popMatrix();
      
      // Left Leg
      pushMatrix();
      translate(x + 234, 843);
      rotate(radians(legAngle));  // Rotate the leg based on the legAngle
      fill(colorPalette[0]);
      rect(-20, 0, 38, 237);
      fill(colorPalette[6]);
      rect(-44, -15, 93, 110, 30, 30, 0, 0);
      popMatrix();
    
      // Right Leg
      pushMatrix();
      translate(x + 165, 843);
      rotate(radians(-legAngle));  // Rotate the leg based on the legAngle
      fill(colorPalette[0]);
      rect(0, 0, 38, 237);
      fill(colorPalette[5]);
      rect(-37, -15, 93, 110, 30, 30, 0, 0);
      popMatrix();
      
      // Draw the Neck
      fill (colorPalette[1]);
      rect(x + 214, 660, 37, 75);
      arc (x + 220, 694, 55, 86, radians(45), radians(180));
      
      // Shirt
      fill (colorPalette[4]);
      beginShape();
      vertex(x + 285, 843);
      vertex(x + 136, 843);
      bezierVertex(x + 135, 779, x + 136, 773, x + 135, 752);
      bezierVertex(x + 145, 728, x + 155, 704, x + 183, 695);
      bezierVertex(x + 210, 690, x + 225, 720, x + 238, 720);
      bezierVertex(x + 249, 721, x + 249, 708, x + 251, 701);
      bezierVertex(x + 252, 701, x + 263, 700, x + 270, 711);
      bezierVertex(x + 277, 721, x + 278, 700, x + 285, 843);
      endShape();
      
      // Right Hand
      // Telapak
      fill (colorPalette[0]);
      ellipse(x + 116, 905, 50, 50);
      pushMatrix(); 
      translate(x + 145, 722);  // Move the coordinate system to the right hand position
      rotate(radians(17));  // Rotate the coordinate system for the right hand
      // Pergelangan tangan
      rect(10, 4, 28, 177);
      // Lengan
      fill (colorPalette[4]);
      rect(0, 0, 45, 88, 30, 30, 0, 0);  // Draw the right hand with rounded corners
      popMatrix();
      
      // Draw the hair
      fill (#864448);
      beginShape();
      vertex(x+185, 645);
      bezierVertex(x+152, 628, x+144, 595, x+129, 525);
      bezierVertex(x+130, 503, x+132, 477, x+137, 464);
      bezierVertex(x+144, 455, x+150, 448, x+169, 449);
      bezierVertex(x+177, 451, x+177, 448, x+179, 440);
      bezierVertex(x+185, 427, x+191, 414, x+217, 412);
      bezierVertex(x+229, 413, x+253, 415, x+303, 417);
      bezierVertex(x+310, 413, x+316, 410, x+318, 388);
      bezierVertex(x+318, 382, x+323, 383, x+334, 397);
      bezierVertex(x+341, 401, x+348, 405, x+354, 423);
      vertex(x+356, 432);
      bezierVertex(x+365, 402, x+368, 406, x+377, 419);
      bezierVertex(x+386, 441, x+395, 464, x+383, 495);
      vertex(x+376, 508);
      vertex(x+185, 645);
      endShape();
      
      // Draw the Ear
      fill (colorPalette[0]);
      ellipse(x + 160, 575, 61, 61);
      
      // Draw the face
      beginShape();
      vertex(x + 173, 572);
      vertex(x + 196, 542);
      vertex(x + 196, 520);
      bezierVertex(x + 203, 521, x + 219, 523, x + 226, 518);
      bezierVertex(x + 233, 512, x + 243, 499, x + 247, 493);
      bezierVertex(x + 255, 499, x + 274, 512, x + 290, 516);
      bezierVertex(x + 306, 519, x + 346, 517, x + 364, 512);
      bezierVertex(x + 364, 558, x + 360, 645, x + 341, 661);
      bezierVertex(x + 317, 681, x + 284, 684, x + 266, 684);
      bezierVertex(x + 248, 684, x + 194, 662, x + 180, 639);
      bezierVertex(x + 168, 620, x + 165, 608, x + 165, 605);
      endShape();
      
      // Blush
      fill (colorPalette[2]);
      ellipse (x + 210, 600, 17, 17);
      ellipse (x + 345, 610, 16, 16);
      
          // Expression
          if (isNormal1) {
            // Right Eyebrow
            noFill();
            stroke (#864448);
            strokeWeight(4);
            beginShape();
            vertex(x+230, 547);
            bezierVertex(x+234, 545, x+243, 539, x+245, 539);
            bezierVertex(x+255, 539, x+261, 542, x+263, 543);
            endShape();
            // Left Eyebrow
            beginShape();
            vertex(x+313, 549);
            bezierVertex(x+318, 548, x+329, 546, x+334, 549);
            bezierVertex(x+340, 551, x+344, 556, x+346, 558);
            endShape();
            // Lip
            beginShape();
            vertex(x+263, 627);
            bezierVertex(x+268, 631, x+282, 639, x+291, 638);
            bezierVertex(x+301, 637, x+307, 632, x+309, 630);
            endShape();
            // Eye
            noStroke();
            fill (#864448);
            ellipse (x+250, 580, 14, 18);
            ellipse (x+325, 585, 14, 18);
          }
          
          else if (isConfused1) {
            // Right Eyebrow
            noFill();
            stroke (#864448);
            strokeWeight(4);
            beginShape();
            vertex(x+230, 547);
            bezierVertex(x+234, 545, x+243, 539, x+245, 539);
            bezierVertex(x+255, 539, x+261, 542, x+263, 543);
            endShape();
            // Left Eyebrow
            beginShape();
            vertex(x+313, 549);
            bezierVertex(x+318, 548, x+329, 546, x+334, 549);
            bezierVertex(x+340, 551, x+344, 556, x+346, 558);
            endShape();
            // Lip
            beginShape();
            vertex(x+267, 643);
            bezierVertex(x+272, 641, x+281, 640, x+287, 641);
            bezierVertex(x+294, 642, x+300, 643, x+302, 644);
            endShape();
            // Eye
            noStroke();
            fill (#864448);
            ellipse (x+250, 580, 14, 18);
            ellipse (x+325, 585, 14, 18);
          }
          
          else if (isTalking1) {
            // Right Eyebrow
            noFill();
            stroke (#864448);
            strokeWeight(4);
            beginShape();
            vertex(x+230, 547);
            bezierVertex(x+234, 545, x+243, 539, x+245, 539);
            bezierVertex(x+255, 539, x+261, 542, x+263, 543);
            endShape();
            // Left Eyebrow
            beginShape();
            vertex(x+313, 549);
            bezierVertex(x+318, 548, x+329, 546, x+334, 549);
            bezierVertex(x+340, 551, x+344, 556, x+346, 558);
            endShape();
            // Lip
            noStroke();
            fill (#864448);
            ellipse(x+280, 640, 14, 18);
            // Eye
            ellipse (x+250, 580, 14, 18);
            ellipse (x+325, 585, 14, 18);
          }
          
          else if (isSmiling1) {
            // Right Eyebrow
            noFill();
            stroke (#864448);
            strokeWeight(4);
            beginShape();
            vertex(x+230, 547);
            bezierVertex(x+234, 545, x+243, 539, x+245, 539);
            bezierVertex(x+255, 539, x+261, 542, x+263, 543);
            endShape();
            // Left Eyebrow
            beginShape();
            vertex(x+313, 549);
            bezierVertex(x+318, 548, x+329, 546, x+334, 549);
            bezierVertex(x+340, 551, x+344, 556, x+346, 558);
            endShape();
            // Lip
            noStroke();
            fill (#864448);
            beginShape();
            vertex(x+302, 634);
            vertex(x+294, 642);
            bezierVertex(x+292, 644, x+288, 648, x+279, 648);
            bezierVertex(x+272, 648, x+261, 634, x+257, 626);
            bezierVertex(x+264, 630, x+278, 636, x+282, 636);
            bezierVertex(x+286, 637, x+298, 636, x+302, 634);
            endShape();
            // Eye
            ellipse (x+250, 580, 14, 18);
            ellipse (x+325, 585, 14, 18);
          }
  }
}

void drawStoppedSupri(float x) {
    if (isFlipped1) {
      scale(-1, 1);
      translate(-width, 0);
      translate(-1000,0);
    }
    
     // Person's drawing code here
    //Left Hand
    fill (colorPalette[7]);
    pushMatrix();  // Save the current transformation matrix
     if (isRaising1){
       translate(x+228, 920);
        rotate(radians(-135));
     } else {
       translate(x + 224, 720);  // Move the coordinate system to the right hand position
        rotate(radians(-10));  // Rotate the coordinate system for the right hand
     }
    ellipse(20, 170, 50, 50);
    // Pergelangan tangan
    rect(10, 4, 28, 177);
    // Lengan
    fill (#CF5A51);
    rect(0, 0, 45, 88, 30, 30, 0, 0); 
    popMatrix();
    
    // Left Leg
    pushMatrix();
    translate(x + 234, 843);
    //rotate(radians(legAngle));  // Rotate the leg based on the legAngle
    fill(colorPalette[7]);
    rect(-20, 0, 38, 237);
    fill(#4F576F);
    rect(-44, -15, 93, 110, 30, 30, 0, 0);
    popMatrix();
  
    // Right Leg
    pushMatrix();
    translate(x + 165, 843);
    //rotate(radians(-legAngle));  // Rotate the leg based on the legAngle
    fill(colorPalette[7]);
    rect(0, 0, 38, 237);
    fill(#606B89);
    rect(-37, -15, 93, 110, 30, 30, 0, 0);
    popMatrix();
    
    // Draw the Neck
    fill (colorPalette[0]);
    rect(x + 214, 660, 37, 75);
    arc (x + 220, 694, 55, 86, radians(45), radians(180));
    
    // Shirt
    fill (#CF5A51);
    beginShape();
    vertex(x + 285, 843);
    vertex(x + 136, 843);
    bezierVertex(x + 135, 779, x + 136, 773, x + 135, 752);
    bezierVertex(x + 145, 728, x + 155, 704, x + 183, 695);
    bezierVertex(x + 210, 690, x + 225, 720, x + 238, 720);
    bezierVertex(x + 249, 721, x + 249, 708, x + 251, 701);
    bezierVertex(x + 252, 701, x + 263, 700, x + 270, 711);
    bezierVertex(x + 277, 721, x + 278, 700, x + 285, 843);
    endShape();
    
    // Right Hand
    // Telapak
    fill (colorPalette[7]);
    ellipse(x + 116, 905, 50, 50);
    pushMatrix(); 
    translate(x + 145, 722);  // Move the coordinate system to the right hand position
    rotate(radians(17));  // Rotate the coordinate system for the right hand
    // Pergelangan tangan
    rect(10, 4, 28, 177);
    // Lengan
    fill (#CF5A51);
    rect(0, 0, 45, 88, 30, 30, 0, 0);  // Draw the right hand with rounded corners
    popMatrix();
    
    // Draw the hair
    fill (#864448);
    beginShape();
    vertex(x+185, 645);
    bezierVertex(x+152, 628, x+144, 595, x+129, 525);
    bezierVertex(x+130, 503, x+132, 477, x+137, 464);
    bezierVertex(x+144, 455, x+150, 448, x+169, 449);
    bezierVertex(x+177, 451, x+177, 448, x+179, 440);
    bezierVertex(x+185, 427, x+191, 414, x+217, 412);
    bezierVertex(x+229, 413, x+253, 415, x+303, 417);
    bezierVertex(x+310, 413, x+316, 410, x+318, 388);
    bezierVertex(x+318, 382, x+323, 383, x+334, 397);
    bezierVertex(x+341, 401, x+348, 405, x+354, 423);
    vertex(x+356, 432);
    bezierVertex(x+365, 402, x+368, 406, x+377, 419);
    bezierVertex(x+386, 441, x+395, 464, x+383, 495);
    vertex(x+376, 508);
    vertex(x+185, 645);
    endShape();
    
    // Draw the Ear
    fill (colorPalette[7]);
    ellipse(x + 160, 575, 61, 61);
    
    // Draw the face
    beginShape();
    vertex(x + 173, 572);
    vertex(x + 196, 542);
    vertex(x + 196, 520);
    bezierVertex(x + 203, 521, x + 219, 523, x + 226, 518);
    bezierVertex(x + 233, 512, x + 243, 499, x + 247, 493);
    bezierVertex(x + 255, 499, x + 274, 512, x + 290, 516);
    bezierVertex(x + 306, 519, x + 346, 517, x + 364, 512);
    bezierVertex(x + 364, 558, x + 360, 645, x + 341, 661);
    bezierVertex(x + 317, 681, x + 284, 684, x + 266, 684);
    bezierVertex(x + 248, 684, x + 194, 662, x + 180, 639);
    bezierVertex(x + 168, 620, x + 165, 608, x + 165, 605);
    endShape();
    
    // Blush
    fill (colorPalette[2]);
    ellipse (x + 210, 600, 17, 17);
    ellipse (x + 345, 610, 16, 16);
    
    // Expression
          if (isNormal1) {
            // Right Eyebrow
            noFill();
            stroke (#864448);
            strokeWeight(4);
            beginShape();
            vertex(x+230, 547);
            bezierVertex(x+234, 545, x+243, 539, x+245, 539);
            bezierVertex(x+255, 539, x+261, 542, x+263, 543);
            endShape();
            // Left Eyebrow
            beginShape();
            vertex(x+313, 549);
            bezierVertex(x+318, 548, x+329, 546, x+334, 549);
            bezierVertex(x+340, 551, x+344, 556, x+346, 558);
            endShape();
            // Lip
            beginShape();
            vertex(x+263, 627);
            bezierVertex(x+268, 631, x+282, 639, x+291, 638);
            bezierVertex(x+301, 637, x+307, 632, x+309, 630);
            endShape();
            // Eye
            noStroke();
            fill (#864448);
            ellipse (x+250, 580, 14, 18);
            ellipse (x+325, 585, 14, 18);
          }
          
          else if (isConfused1) {
            // Right Eyebrow
            noFill();
            stroke (#864448);
            strokeWeight(4);
            beginShape();
            vertex(x+230, 547);
            bezierVertex(x+234, 545, x+243, 539, x+245, 539);
            bezierVertex(x+255, 539, x+261, 542, x+263, 543);
            endShape();
            // Left Eyebrow
            beginShape();
            vertex(x+313, 549);
            bezierVertex(x+318, 548, x+329, 546, x+334, 549);
            bezierVertex(x+340, 551, x+344, 556, x+346, 558);
            endShape();
            // Lip
            beginShape();
            vertex(x+267, 643);
            bezierVertex(x+272, 641, x+281, 640, x+287, 641);
            bezierVertex(x+294, 642, x+300, 643, x+302, 644);
            endShape();
            // Eye
            noStroke();
            fill (#864448);
            ellipse (x+250, 580, 14, 18);
            ellipse (x+325, 585, 14, 18);
          }
          
          else if (isTalking1) {
            // Right Eyebrow
            noFill();
            stroke (#864448);
            strokeWeight(4);
            beginShape();
            vertex(x+230, 547);
            bezierVertex(x+234, 545, x+243, 539, x+245, 539);
            bezierVertex(x+255, 539, x+261, 542, x+263, 543);
            endShape();
            // Left Eyebrow
            beginShape();
            vertex(x+313, 549);
            bezierVertex(x+318, 548, x+329, 546, x+334, 549);
            bezierVertex(x+340, 551, x+344, 556, x+346, 558);
            endShape();
            // Lip
            noStroke();
            fill (#864448);
            ellipse(x+280, 640, 14, 18);
            // Eye
            ellipse (x+250, 580, 14, 18);
            ellipse (x+325, 585, 14, 18);
          }
          
          else if (isSmiling1) {
            // Right Eyebrow
            noFill();
            stroke (#864448);
            strokeWeight(4);
            beginShape();
            vertex(x+230, 547);
            bezierVertex(x+234, 545, x+243, 539, x+245, 539);
            bezierVertex(x+255, 539, x+261, 542, x+263, 543);
            endShape();
            // Left Eyebrow
            beginShape();
            vertex(x+313, 549);
            bezierVertex(x+318, 548, x+329, 546, x+334, 549);
            bezierVertex(x+340, 551, x+344, 556, x+346, 558);
            endShape();
            // Lip
            noStroke();
            fill (#864448);
            beginShape();
            vertex(x+302, 634);
            vertex(x+294, 642);
            bezierVertex(x+292, 644, x+288, 648, x+279, 648);
            bezierVertex(x+272, 648, x+261, 634, x+257, 626);
            bezierVertex(x+264, 630, x+278, 636, x+282, 636);
            bezierVertex(x+286, 637, x+298, 636, x+302, 634);
            endShape();
            // Eye
            ellipse (x+250, 580, 14, 18);
            ellipse (x+325, 585, 14, 18);
          }
}

void drawCloud(float x, float y) {
  fill(255);
  rect(x, y, 332, 75, 100);
}

static float frameToSec(float frame)
{
  return frame/60f;
}
