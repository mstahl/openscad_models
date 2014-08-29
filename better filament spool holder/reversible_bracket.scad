peg_height = 70;

linear_extrude(10) {
  union() {
    hull() {
      translate([-60, -60, 0]) circle(5);
      translate([0, 60, 0]) circle(5);
    }
    hull() {
      translate([0, 60, 0]) circle(5);
      translate([60, -60, 0]) circle(5);
    }
  };
}

// Inner cylinder, bottom
translate([-60, -60, 0]) {
  difference() {
    cylinder(peg_height, 3.5, 3.5);
    cylinder(peg_height + 1, 2.5, 2.5);
  }
}
// Outer sleeve, bottom
translate([60, -60, 0]) {
  difference() {
    cylinder(peg_height, 5, 5);
    cylinder(peg_height + 1, 4, 4);
  }
}
/*
  Top half-cylinder. Two of these brackets slide together to make the axle
  upon which the spool of filament spins.
*/
translate([0, 60, 0]) {
  difference() {
    cylinder(peg_height, 5, 5);
    translate([-1, -50, 0]) cube(100);
  }
}
