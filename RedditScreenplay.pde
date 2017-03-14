/* 
Writing passages generated from all Reddit comments from August 2015
that will be performed by random people: VIMEO LINK HERE

By Shawna Cheng
Dataset by github.com/DennyBritz
Rita library for compiling computational literature.
*/

import rita.*;

RiMarkov markov;
String line = "click to (re)generate!";
String[] files = { "reddit.rtf" };
int x = 160, y = 240;

void setup()
{
  size(500, 500);

  fill(0);
  textFont(createFont("times", 16));

  // create a markov model w' n=3 from the files
  markov = new RiMarkov(4
  );
  markov.loadFrom(files, this);
  
}

void draw()
{
  background(250);
  text(line, x, y, 400, 400);
}

void mouseClicked()
{
  if (!markov.ready()) return;

  x = y = 50;
  String[] lines = markov.generateSentences(5);
  
  line = RiTa.join(lines, " ");
} 