/*
|| @author         Brett Hagman <bhagman@wiring.org.co>
|| @url            http://wiring.org.co/
||
|| @description
|| |
|| | This is an example sketch using the MillisTimer Wiring Library.
|| |
|| #
||
|| @license Please see the accompanying LICENSE file for this project.
||
*/

#include "MillisTimer.h"


MillisTimer timer1 = MillisTimer(1000);

void myTimerFunction(MillisTimer &mt)
{
  Serial.print(Constant("Repeat: "));
  Serial.println(mt.getRemainingRepeats());
}


void setup()
{
  Serial.begin(9600);

  timer1.setInterval(1000);
  timer1.expiredHandler(myTimerFunction);
  timer1.setRepeats(5);
  timer1.start();
}


void loop()
{
  timer1.run();

  if (!timer1.isRunning())
  {
    Serial.println(Constant("Timer finished!"));
    for (;;);
  }
  
  delay(10);
}
