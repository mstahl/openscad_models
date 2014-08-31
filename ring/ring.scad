translate([0, 0, -5]) rotate([-10,0,0]) {
  difference () {
    /* Ring */
    union() {
      cylinder(15, 10, 10);
      rotate([90, 0, 0]) translate([0, 7.5, 0]) cylinder(10, 10, 10);
    }
    rotate([-10,0,0]) translate([-25, -25, 10]) cube(50);
    rotate([10,0,0]) translate([-25, -25, -45]) cube(50);
    translate([0, 0, -25]) cylinder(50, 8, 8);
  }
}
