/*
 * Various configurable variables.
 */
// How long do you want the pegs to be? Set this to be in the middle of the
// range of spool widths you wish to accommodate.
peg_height = 70;
// Set this thicker to make beefier pegs. Affects the radius of all pegs.
peg_thickness = 15;
// How thick should the frame be?
frame_thickness = 3;
// Set width and height of the overall bracket here.
width = 130;
// Set width and height of the overall bracket here.
height = 130;

/* [Hidden] */

// Set tube thickness to be at least a milimeter or two.
tube_thickness = 3;
// Clearance is the space between parts.
clearance = 1;

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
      peg_thickness - tube_thickness - clearance,
      peg_thickness - tube_thickness - clearance
    );
    cylinder(
      peg_height + 1,
      peg_thickness - tube_thickness - clearance - tube_thickness,
      peg_thickness - tube_thickness - clearance - tube_thickness
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
    cylinder(peg_height + 1, peg_thickness - tube_thickness, peg_thickness - tube_thickness);
    translate([-clearance, -max, 0]) cube(max * 2);
  }
}
