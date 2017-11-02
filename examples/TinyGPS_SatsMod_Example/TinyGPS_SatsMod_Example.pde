#include <NewSoftSerial.h>
#include <TinyGPS.h>

TinyGPS gps;
NewSoftSerial nss(2, 3);

void setup()
{
  Serial.begin(115200);
  nss.begin(4800);

  Serial.println("TinyGPS Satellite Count Mod Test");
  Serial.println();
}

void loop()
{
  if (nss.available())
  {
    if (gps.encode(nss.read()))
    {
      Serial.print("Satellites in view: ");
      Serial.println(gps.satsinview(), DEC);

      if (gps.fixtype() == TinyGPS::GPS_FIX_NO_FIX)
      {
        Serial.print("No fix.");
      }
      else
      {
        // we have a fix (could be GPS_FIX_2D or GPS_FIX_3D)
        Serial.print("Fix type: ");
        if (gps.fixtype() == TinyGPS::GPS_FIX_2D)
          Serial.println("2D");
        else
          Serial.println("3D");

        Serial.print("Satellites used: ");
        Serial.println(gps.satsused(), DEC);

        // You can do the rest of your coding here - e.g. gpsdump()
      }
    }
  }
}