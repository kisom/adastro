-- Copyright (c) 2015 Kyle Isom <coder@kyleisom.net>
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the "Software"),
-- to deal in the Software without restriction, including without limitation
-- the rights to use, copy, modify, merge, publish, distribute, sublicense,
-- and/or sell copies of the Software, and to permit persons to whom the
-- Software is furnished to do so, subject to the following conditions:
-- 
-- The above copyright notice and this permission notice shall be included
-- in all copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
-- THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
-- OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
-- ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
-- OTHER DEALINGS IN THE SOFTWARE.

with Ada.Text_IO;

package body OrbitalMech is

   use  Ada.Text_IO;
   use  Float16_IO;

   function CubeRoot (n : in Float16) return Float16 is
   begin
      return n ** (1.0 / 3.0);
   end CubeRoot;

   function Altitude_to_Radius(r : in Float16) return Float16 is
   begin
      return (r - Radius_of_Earth) / 1000.0;
   end Altitude_to_Radius;

   function Radius_to_Altitude(r : in Float16) return Float16 is
   begin
      return (r / 1000.0) - Radius_of_Earth;
   end Radius_to_Altitude;

   function Circular_Period (r : in Float16) return Float16 is
   begin
      return Sqrt(4.0 * (PI * PI) * (r * r * r) / GM);
   end Circular_Period;

   function Circular_Velocity (r : in Float16) return Float16 is
   begin
      return Sqrt(GM / r);
   end Circular_Velocity;

   function Circular_Radius_from_Period (p : in Float16) return Float16 is
   begin
      return CubeRoot((GM * (p * p)) / (4.0 * (PI * PI)));
   end Circular_Radius_from_Period;

   function Eccentricity_from_VR (v, r : in Float16) return Float16 is
   begin
      return (r * (v * v)) / GM - 1.0;
   end Eccentricity_from_VR;

   function GetAltitude return Float16 is
      Altitude : Float16;
   begin
      Put("Altitude (km): ");
      Get(Altitude);
      return (Altitude + Radius_of_Earth) * 1000.0;
   end GetAltitude;

   function GetVelocity return Float16 is
      Velocity : Float16;
   begin
      Put("Velocity (m/s): ");
      Get(Velocity);
      return Velocity;
   end GetVelocity;

   function Velocity_Perigee (p, a : in Float16) return Float16 is
   begin
      return Sqrt((2.0 * GM * a) / (p * (p + a)));
   end Velocity_Perigee;

   function Velocity_Apogee (p, a : in Float16) return Float16 is
   begin
      return Sqrt((2.0 * GM * p) / (a * (p + a)));
   end Velocity_Apogee;

   function Radians_to_Degrees (rads : in Radians) return Degrees is
   begin
      return rads * 180.0 / PI;
   end Radians_to_Degrees;

   function Degrees_to_Radians (degs : in Degrees) return Radians is
   begin
      return PI / 180.0 * degs;
   end Degrees_to_Radians;


end OrbitalMech;
