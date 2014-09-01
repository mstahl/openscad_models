/* [Gear Settings] */

// Set the number of teeth for this gear.
number_of_teeth = 24;

/* [Hidden] */

// Radius in mm of all the axle holes in all gears generated.
axle_radius = 1.5;

// Tooth pitch is the size of one gear tooth; should be constant across all
// gears.
tooth_pitch = 2.5;

// Width of gear to generate.
width = 2.5;

rim_width = 2.5;

$fn = 360;

module gear(num_teeth) {
  angle = 360 / num_teeth;
  r0 = (0.5 * tooth_pitch) / sin(angle / 2);
  r1 = r0 + sqrt(0.75 * tooth_pitch * tooth_pitch);

  cylinder(width, r0, r0);
  for(i = [0:num_teeth]) {
    linear_extrude(width) polygon(points = [
      [r0 * cos(i * angle), r0 * sin(i * angle)],
      [r1 * cos((i + 0.5) * angle), r1 * sin((i + 0.5) * angle)],
      [r0 * cos((i + 1) * angle), r0 * sin((i + 1) * angle)]
    ]);
    render();
  }
}

gear(number_of_teeth);
