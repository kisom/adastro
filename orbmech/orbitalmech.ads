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

-- OrbitalMech contains common constants and code for solving orbital
-- mechanics problems. Altitudes are typically represented in kilometres,
-- while orbital radii are represented in metres. This is due to their
-- representation in the appropriate problems.

with Ada.Text_IO;
with Ada.Numerics.Generic_Elementary_Functions;

package OrbitalMech is

   type Float16 is digits 16 range Float'First .. Float'Last;

   -- Generate a new package for inputting and outputting the
   -- Float16 type.
   package Float16_IO is new Ada.Text_IO.Float_IO (Float16);

   -- Generate a new package to employ the Float16 type.
   package Float16Math is
      new Ada.Numerics.Generic_Elementary_Functions (Float16);
   use Float16Math;

   Radius_of_Earth : constant Float16 := 6378.14; -- in kilometres
   GM  : constant Float16 := 3.986005E+14;         -- in m^3 / s^2
   PI  : constant Float16 := 3.141592653589793;
   TAU : constant Float16 := 6.283185307179586;

   -- Altitude_to_Radius converts an altitude above the Earth (in
   -- kilometres) to an orbital radius (in metres).
   function Altitude_to_Radius (r : in Float16) return Float16;

   -- Radius_to_Altitude converts an orbital radius (in metres) to
   -- an altitude above the Earth (in kilometres).
   function Radius_to_Altitude (r : in Float16) return Float16;

   -- Circular_Period computes the period of a circular orbit from an
   -- orbital radius (in metres).
   function Circular_Period (r : in Float16) return Float16;

   -- Circular_Velocity computes the velocity of a body in a circular
   -- orbit around the earth (in metres per second) from the body's
   -- orbital radius (in metres).
   function Circular_Velocity (r : in Float16) return Float16;

   -- Circular_Radius_from_Period computes the orbital radius (in metres)
   -- of a body in a circular orbit around the earth from its period
   -- (in seconds).
   function Circular_Radius_from_Period (p : in Float16) return Float16;

   -- Eccentricity_from_VR computes the eccentricity of an orbit from
   -- its velocity and orbital radius.
   function Eccentricity_from_VR (v, r : in Float16) return Float16;

   -- GetAltitude requests an altitude (in kilometres) of an object
   -- in orbit above the Earth, and returns its orbital radius (in
   -- metres).
   function GetAltitude return Float16;

   -- GetVelocity requests a velocity (in metres / second) of an
   -- object, returning the velocity. This is a convenience method
   -- for quickly inputting a velocity.
   function GetVelocity return Float16;

   -- Velocity_Perigee computes the velocity of an object in orbit
   -- above the Earth (in metres / second) at perigee from its perigee
   -- and apogee radii (in metres).
   function Velocity_Perigee (p, a : in Float16) return Float16;

   -- Velocity_Apogee computes the velocity of an object in orbit
   -- above the Earth (in metres / second) at apogee from its perigee and
   -- apogee radii (in metres).
   function Velocity_Apogee (p, a : in Float16) return Float16;

   -- Degrees and Radians are constrained Float16 values that only
   -- accept a degree value inside a circle; both negative and positive
   -- values are accepted.
   subtype Degrees is Float16 range -360.0 .. 360.0;
   subtype Radians is Float16 range -Tau .. Tau;

   -- Degrees_to_Radians is a utility function that accepts an input
   -- of Degrees and returns the corresponding value in Radians. This
   -- should be used for angles that must fall within a circle.
   function Degrees_to_Radians (degs : in Degrees) return Radians;

   -- Radians_to_Degrees is a utility function that accepts an input
   -- of Radians and returns the corresponding value in Degrees. This
   -- should be used for angles that must fall within a circle.
   function Radians_to_Degrees (rads : in Radians) return Degrees;

end OrbitalMech;
