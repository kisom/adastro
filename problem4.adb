-- PROBLEM 4
-- 
-- An artificial Earth satellite is in an elliptical orbit which brings
-- it to an altitude of 250 km at perigee and out to an altitude of 500
-- km at apogee.  Calculate the velocity of the satellite at both perigee
-- and apogee.

with Ada.Text_IO;
use  Ada.Text_IO;

with OrbitalMech;
use  OrbitalMech, OrbitalMech.Float16_IO;

procedure Problem4 is
   apogee, perigee, velocity : Float16;
begin
   Put ("Perigee ");
   perigee := GetAltitude;

   Put (" Apogee ");
   apogee := GetAltitude;

   velocity := Velocity_Perigee (perigee, apogee);
   Put ("Velocity at perigee: ");
   Put (velocity, Exp => 0, Aft => 0);
   Put_Line (" m/s");

   velocity := Velocity_Apogee (perigee, apogee);
   Put ("Velocity at apogee:  ");
   Put (velocity, Exp => 0, Aft => 0);
   Put_Line (" m/s");
end Problem4;
