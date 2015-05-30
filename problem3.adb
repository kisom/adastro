-- PROBLEM 3
-- 
-- Calculate the radius of orbit for a Earth satellite in a geosynchronous
-- orbit, where the Earth's rotational period is 86,164.1 seconds.

with Ada.Text_IO;
use  Ada.Text_IO;

with OrbitalMech;
use  OrbitalMech;

procedure Problem3 is
   r : OrbitalMech.Float16;
   p : OrbitalMech.Float16 := 86164.1;
   alt : OrbitalMech.Float16;
begin
   r := OrbitalMech.Circular_Radius_from_Period (p);
   Put ("Geosynchronous orbital radius: ");
   OrbitalMech.Float16_IO.Put (r, Exp => 0, Aft => 0);
   Put_Line (" m");

   alt := (r / 1000.0) - OrbitalMech.Radius_of_Earth;
   Put ("Geosynchronous orbital altitude: ");
   OrbitalMech.Float16_IO.Put (alt, Exp => 0, Aft => 0);
   Put_Line (" km");

end Problem3;
