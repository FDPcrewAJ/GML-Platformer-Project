/// @desc
draw_set_halign(fa_center)
draw_set_font(txt_counter_text);
draw_set_color(#1F6C26)

var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var cw = camera_get_view_width(view_camera[0]);

draw_text(cx + (cw / 2), cy + 35, string("loops = " + string(loops)));