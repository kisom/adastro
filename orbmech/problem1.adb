-- PROBLEM 1 
-- 
-- Calculate the velocity of an artificial satellite orbiting the Earth in a
-- circular orbit at an altitude of 200 km above the Earth's surface.

with Ada.Text_IO;
use  Ada.Text_IO;

with OrbitalMech;

procedure Problem1 is
   r, v : OrbitalMech.Float16;
begin
   r := OrbitalMech.GetAltitude;
   v := OrbitalMech.Circular_Velocity (r);

   Put ("Velocity: ");
   OrbitalMech.Float16_IO.Put (v, Exp => 0, Aft => 0);
   Put_Line (" m/s");
end Problem1;
