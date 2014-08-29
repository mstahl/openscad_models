/*
 * Various configurable variables.
 */
peg_height = 70;
peg_thickness = 15;
frame_thickness = 20;
width = 130;
height = 130;
tube_thickness = 5;

/*******************************************************************************/

max = (width / 2) - peg_thickness;

linear_extrude(frame_thickness) {
  union() {
    hull() {
      translate([-max, -max, 0]) circle(peg_thickness);
      translate([0, max, 0]) circle(peg_thickness);
    }
    hull() {
      translate([0, max, 0]) circle(peg_thickness);
      translate([max, -max, 0]) circle(peg_thickness);
    }
  };
}

// Inner cylinder, bottom
translate([-max, -max, 0]) {
  difference() {
    cylinder(
      peg_height,
      peg_thickness - tube_thickness - 1,
      peg_thickness - tube_thickness - 1
    );
    cylinder(
      peg_height + 1,
      peg_thickness - tube_thickness - 1 - tube_thickness,
      peg_thickness - tube_thickness - 1 - tube_thickness
    );
  }
}
// Outer sleeve, bottom
translate([max, -max, 0]) {
  difference() {
    cylinder(peg_height, peg_thickness, peg_thickness);
    cylinder(peg_height + 1, peg_thickness - tube_thickness, peg_thickness - tube_thickness);
  }
}
/*
  Top half-cylinder. Two of these brackets slide together to make the axle
  upon which the spool of filament spins.
*/
translate([0, max, 0]) {
  difference() {
    cylinder(peg_height, peg_thickness, peg_thickness);
    translate([-1, -max, 0]) cube(max * 2);
  }
}
