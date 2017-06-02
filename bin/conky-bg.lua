require 'cairo'

corner_r = 0
bg_color = 0xececec
bg_alpha = 0.4
border_color = 0x1a1614
border_alpha = 0.7
border_width = 8.0

function rgb_to_r_g_b(color, alpha)
  return ((color / 0x10000) % 0x100) / 255., ((color / 0x100) % 0x100) / 255., (color % 0x100) / 255., alpha
end

function conky_draw_bg()
    if conky_window == nil then return end
    local w = conky_window.width
    local h = conky_window.height

    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, w, h)
    local cr = cairo_create(cs)
    
    cairo_move_to(cr, corner_r, 0)
    cairo_line_to(cr, w - corner_r, 0)
    cairo_curve_to(cr, w, 0, w, 0, w, corner_r)
    cairo_line_to(cr, w, h - corner_r)
    cairo_curve_to(cr, w, h, w, h, w - corner_r, h)
    cairo_line_to(cr, corner_r, h)
    cairo_curve_to(cr, 0, h, 0, h, 0, h - corner_r)
    cairo_line_to(cr, 0, corner_r)
    cairo_curve_to(cr, 0, 0, 0, 0, corner_r, 0)
    cairo_close_path(cr)
    
    cairo_set_source_rgba(cr, rgb_to_r_g_b(bg_color, bg_alpha))
    cairo_fill_preserve(cr)

    cairo_set_line_width(cr, border_width)
    cairo_set_source_rgba(cr, rgb_to_r_g_b(border_color, border_alpha))
    cairo_stroke(cr)

    cairo_destroy(cr)
    cairo_surface_destroy(cs)
end
