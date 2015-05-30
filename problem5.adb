-- PROBLEM 5
-- 
-- A satellite in Earth orbit passes through its perigee point at an altitude
-- of 200 km above the Earth's surface and at a velocity of 7,850 m/s.
-- Calculate the apogee altitude of the satellite.

with Ada.Text_IO;
use  Ada.Text_IO;

with OrbitalMech;
use  OrbitalMech, OrbitalMech.Float16_IO, OrbitalMech.Float16Math;

procedure Problem5 is
   velocity, perigee, apogee : Float16;
begin
   Put ("Perigee ");
   velocity := GetVelocity;

   Put ("Perigee ");
   perigee := GetAltitude;

   apogee := perigee / ((2.0 * GM) / (perigee * (velocity * velocity)) - 1.0);
   apogee := Radius_to_Altitude (apogee);

   Put ("Apogee altitude: ");
   Put(apogee, Exp =>  0, Aft => 0);
   Put_Line (" km");
end Problem5;
