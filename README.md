# TinyGPS
A compact Arduino NMEA (GPS) parsing library

This version of TinyGPS is based on version 13 of Mikal's TinyGPS library including a mod by Brett Hagman to parse GPGSA and GPGSV sentences from the GPS to get the number of visible and used satellites even if there is no fix yet.

You can check out a detailed description of the mod here: http://home.roguerobotics.com/code/arduino_tinygps_satellite_count_mod.html .
However, Brett Hagman's mod was based on version 9 of TinyGPS. This is why I updated the mod to the latest TinyGPS version.

# Changes
A small change had to be made to the parsing logic.

Mikal makes the library only parse other GPS sentences when a fix has been obtained ((Technically, Mikal checks the GPRMC sentence to see if the Data Status field is reporting a valid position.)). To be able to report the data from the GPGSV sentences (satellites in view, among other things), data had to be available even when a fix was not available.

The change means that you can now check the number of satellites that are in view (i.e. satsinview()) anytime.

As a result of the changes, another function that you can use to check the current fix type (i.e. no fix, 2D or 3D) is called fixtype(). It returns one of:

TinyGPS::GPS_FIX_NO_FIX (== 1) - No GPS fix.

TinyGPS::GPS_FIX_2D (== 2) - 2D GPS fix.

TinyGPS::GPS_FIX_3D (== 3) - 3D GPS fix. This means altitude data is valid.

