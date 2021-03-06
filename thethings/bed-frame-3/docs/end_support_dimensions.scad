/**
 * @file end_support_dimensions.scad
 * @brief TODO.
 *
 */

DOC_SCALING_FACTOR = 30;

include <dimlines/dimlines.scad>
include <titleblocks/titleblock1.scad>
include <../parts/bed_frame.scad>

PART_DETAILS = [
        "End Support",        // title
        "Pine (wood)",        // material
        "Planed",             // finish
        " ",                  // weight
        "1"];                 // part no

PART_REVISIONS = [
        ["0.1", "28 FEB 18", "jl"]];

DOC_DETAILS = [
        "1-1",              // drawing number
        "Lambo",            // created by
        " ",                // reviewed by
        "28 FEB 2018"];     // date of issue

ORG_DETAILS = [
        " ",
        "Stuff I Build",
        "units: centimeter (cm)"];

PART_LENGTH = END_SUPPORT_BOARD_LENGTH;
PART_WIDTH = END_SUPPORT_BOARD_WIDTH;
PART_THICKNESS = END_SUPPORT_BOARD_THICKNESS;

ROTATION2 = [-90, 0, 0];
ROTATION3 = [0, 90, 90];
ROTATION4 = [-65, 25, 10];

ROT2_VIEW = [0, -237 * 0.7, 0];
ROT3_VIEW = [PART_LENGTH * 1.8, -237 * 0.5, 0];
ROT4_VIEW = [PART_LENGTH * 1.4, 0, 0];

DOC_HEIGHT = PART_THICKNESS + 0.5;

DIM_LINE_WIDTH = 0.03 * DOC_SCALING_FACTOR;
DIM_SPACE = 0.1 * DOC_SCALING_FACTOR;
DIM_HEIGHT = 0.01;
DIM_FONTSCALE = DIM_LINE_WIDTH * 0.9;

module show_part()
{
    offset_t = [
            0,
            PART_THICKNESS,
            0];

    color("SandyBrown")
        translate(offset_t)
            rotate([0, 0, -90])
                end_support();
}

module show_view1()
{
    translate([0, 0, -PART_WIDTH])
        show_part();

    color("Black")
        translate([0, 0, DOC_HEIGHT])
            union()
            {
                translate([0, PART_THICKNESS + (3 * DIM_SPACE), 0])
                    dimensions(PART_LENGTH, DIM_LINE_WIDTH);

                rotate([0, 0, 90])
                union()
                {
                    translate([PART_THICKNESS + DIM_SPACE, 0, 0])
                        line(
                                length = (3 * DIM_SPACE),
                                width = DIM_LINE_WIDTH,
                                height = 0.01,
                                left_arrow = false,
                                right_arrow = false);

                    translate([PART_THICKNESS + DIM_SPACE, -PART_LENGTH, 0])
                        line(
                                length = (3 * DIM_SPACE),
                                width = DIM_LINE_WIDTH,
                                height = 0.01,
                                left_arrow = false,
                                right_arrow = false);
                }
            }
}

module show_docs2()
{
    dist =
            SUPPORT_BOARD_OVERRUN
            + (POST_BOARD_WIDTH / 2)
            - (END_SUPPORT_BOARD_THICKNESS / 2);

    inner_dist =
            PART_LENGTH
            - (2 * dist)
            - (2 * END_SUPPORT_BOARD_THICKNESS);

    union()
    {
        translate([0, PART_WIDTH + (2 * DIM_SPACE), 0])
            dimensions(dist, DIM_LINE_WIDTH, DIM_LEFT);

        rotate([0, 0, 90])
            union()
            {
                translate([PART_WIDTH + DIM_SPACE, 0, DIM_HEIGHT])
                    line(
                            length = (2 * DIM_SPACE),
                            width = DIM_LINE_WIDTH,
                            height = 0.01,
                            left_arrow = false,
                            right_arrow = false);

                translate([PART_WIDTH + DIM_SPACE, -dist, DIM_HEIGHT])
                    line(
                            length = (2 * DIM_SPACE),
                            width = DIM_LINE_WIDTH,
                            height = 0.01,
                            left_arrow = false,
                            right_arrow = false);
            }

        translate([PART_LENGTH - dist, PART_WIDTH + (2 * DIM_SPACE), 0])
            dimensions(dist, DIM_LINE_WIDTH, DIM_LEFT);

        rotate([0, 0, 90])
            union()
            {
                translate([PART_WIDTH + DIM_SPACE, -PART_LENGTH + dist, DIM_HEIGHT])
                    line(
                            length = (2 * DIM_SPACE),
                            width = DIM_LINE_WIDTH,
                            height = 0.01,
                            left_arrow = false,
                            right_arrow = false);

                translate([PART_WIDTH + DIM_SPACE, -PART_LENGTH, DIM_HEIGHT])
                    line(
                            length = (2 * DIM_SPACE),
                            width = DIM_LINE_WIDTH,
                            height = 0.01,
                            left_arrow = false,
                            right_arrow = false);
            }

        translate([dist + END_SUPPORT_BOARD_THICKNESS, PART_WIDTH + (5 * DIM_SPACE), 0])
            dimensions(inner_dist, DIM_LINE_WIDTH, DIM_CENTER);

        rotate([0, 0, 90])
            union()
            {
                translate([PART_WIDTH + (4 * DIM_SPACE), -dist - END_SUPPORT_BOARD_THICKNESS, DIM_HEIGHT])
                    line(
                            length = (2 * DIM_SPACE),
                            width = DIM_LINE_WIDTH,
                            height = 0.01,
                            left_arrow = false,
                            right_arrow = false);

                translate([PART_WIDTH + (4 * DIM_SPACE), -dist - END_SUPPORT_BOARD_THICKNESS - inner_dist, DIM_HEIGHT])
                    line(
                            length = (2 * DIM_SPACE),
                            width = DIM_LINE_WIDTH,
                            height = 0.01,
                            left_arrow = false,
                            right_arrow = false);
            }

        translate([(PART_LENGTH / 2) - 3, 20, DIM_HEIGHT])
            leader_line(
                    angle = 220.0,
                    radius = 0,
                    angle_length = 50,
                    horz_line_length = 20,
                    direction = DIM_LEFT,
                    line_width = DIM_LINE_WIDTH,
                    text = str(CENTER_SUPPORT_TENON_WIDTH),
                    do_circle = false);

        translate([PART_LENGTH * 0.89, 20, DIM_HEIGHT])
            leader_line(
                    angle = 220.0,
                    radius = 0,
                    angle_length = 50,
                    horz_line_length = 20,
                    direction = DIM_LEFT,
                    line_width = DIM_LINE_WIDTH,
                    text = str(SUPPORT_BOARD_WIDTH / 2),
                    do_circle = false);
    }
}

module show_view2()
{
    translate(ROT2_VIEW)
        rotate(ROTATION2)
            show_part();

    color("Black")
        translate(ROT2_VIEW)
            translate([0, 0, DOC_HEIGHT])
                show_docs2();
}

module show_view3()
{
    translate(ROT3_VIEW)
        rotate(ROTATION3)
            show_part();
}

module show_view4()
{
    translate(ROT4_VIEW)
        rotate(ROTATION4)
            show_part();
}

module show_frame(
        length,
        height,
        line_width = DIM_LINE_WIDTH)
{
    line(length = length, width = line_width);

    translate([0, height, 0])
        line(length = length, width = line_width);

    translate([line_width / 2, line_width / 2, 0])
        rotate([0, 0, 90])
            line(length = height - line_width, width = line_width);

    translate([length - line_width / 2, line_width / 2, 0])
        rotate([0, 0, 90])
            line(length = height - line_width, width = line_width);
}

module show_documentation()
{
    color("Black")
        translate([-50, -300, DOC_HEIGHT])
            color("Black")
                union()
                {
                    show_frame(
                            length = 650,
                            height = 400,
                            line_width = DIM_LINE_WIDTH * 2);

                    color("Black")
                        translate([395, 135, 0])
                            titleblock1();
                }
}

module show_views()
{
    show_view1();
    show_view2();
    show_view3();
    show_view4();
}

show_views();

show_documentation();
