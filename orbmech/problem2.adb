-- PROBLEM 2
-- 
-- Calculate the period of revolution for an artificial satellite orbiting
-- the Earth in a circular orbit at an altitude of 200 km above the Earth's
-- surface.

with Ada.Text_IO;
use  Ada.Text_IO;

with OrbitalMech;

procedure Problem2 is
   r, p : OrbitalMech.Float16;
begin
   r := OrbitalMech.GetAltitude;
   p  := OrbitalMech.Circular_Period (r);
   Put("Period: ");
   OrbitalMech.Float16_IO.Put (p, Exp => 0, Aft => 0);
   Put_Line(" s");
end Problem2;
