--awesome3 theme

--{{{ Main
require("awful.util")

green = "#7fb219"
cyan  = "#7f4de6"
red   = "#e04613"
lblue = "#6c9eab"
dblue = "#00ccff"
black = "#3f3f3f"
lgrey = "#d2d2d2"
dgrey = "#333333"
white = "#ffffff"

theme = {}

home          = os.getenv("HOME")
config        = awful.util.getdir("config")
shared        = "/usr/share/awesome"
if not awful.util.file_readable(shared .. "/icons/awesome16.png") then
    shared    = "/usr/share/awesome"
end
sharedicons   = shared .. "/icons"
sharedthemes  = shared .. "/themes"
themes        = config .. "/themes"
themename     = "/kopri"
if not awful.util.file_readable(themes .. themename .. "/theme.lua") then
       themes = sharedthemes
end
themedir      = themes .. themename

wallpaper1    = themedir .. "/background.png"
wallpaper2    = themedir .. "/background.jpg"


if awful.util.file_readable(wallpaper1) then
	theme.wallpaper_cmd = { "awsetbg " .. wallpaper1 }
elseif awful.util.file_readable(wallpaper2) then
	theme.wallpaper_cmd = { "awsetbg " .. wallpaper2 }

end

if awful.util.file_readable(config .. "/vain/init.lua") then
    theme.useless_gap_width  = "5"
end
--}}}

theme.font          = "limey 9"

theme.bg_normal     = "#151515"
theme.bg_focus      = "#BF1E2D"
theme.bg_urgent     = "#DDDAC6"
theme.bg_minimize   = "#333333"

theme.fg_normal     = "#EBEBEB"
theme.fg_focus      = "#000000"
theme.fg_urgent     = "#000000"
theme.fg_minimize   = "#F7F7FF"

theme.border_width  = "4"
theme.border_width2 = "1"
theme.border_normal = "#333333" 
theme.border_focus  = "#BF1E2D"
theme.border_marked = "#CC6666"
theme.border_wibox  = "#EBEBEB"

theme.notify_font_color_1                   = green
theme.notify_font_color_2                   = dblue
theme.notify_font_color_3                   = black
theme.notify_font_color_4                   = white
theme.notify_font                           = "GohuFontMod 9"
theme.notify_fg                             = theme.fg_normal
theme.notify_bg                             = theme.bg_normal
theme.notify_border                         = theme.border_focus





-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = themedir .. "/taglist/squarefw.png"
theme.taglist_squares_unsel = themedir .. "/taglist/squareza.png"



theme.tasklist_floating_icon = themedir .. "/tasklist/floatingw.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themedir .. "/submenu.png"
theme.menu_height = "12"
theme.menu_width  = "100"




theme.layout_fair        = os.getenv("HOME") .. "/.config/awesome/themes/kopri/layouts/fair.png"
theme.layout_fairh = sharedthemes .. "/default/layouts/fairvw.png"
theme.layout_floating  = themedir .. "/layouts/floating.png"
theme.layout_magnifier = sharedthemes .. "/default/layouts/magnifierw.png"
theme.layout_max = sharedthemes .. "/default/layouts/maxw.png"
theme.layout_fullscreen = sharedthemes .. "/default/layouts/fullscreenw.png"
theme.layout_tilebottom = themedir .. "/layouts/tilebottom.png"
theme.layout_tileleft   = themedir .. "/layouts/tileleft.png"
theme.layout_tile = themedir .. "/layouts/tile.png"
theme.layout_tiletop = themedir .. "/layouts/tiletop.png"
theme.layout_spiral  = sharedthemes .. "/default/layouts/spiralw.png"
theme.layout_dwindle = sharedthemes .. "/default/layouts/dwindlew.png"
theme.debianicon = themedir .. "/debian.png"
theme.terminalicon = themedir .. "/terminal.png"
theme.logofficon = themedir .. "/logoff.png"
theme.clockicon = themedir .. "/clock.png"
theme.iceweaselicon = themedir .. "/iceweasel.png"
theme.spacefmicon = themedir .. "/spacefm.png"
theme.widget_net = themedir .. "/net.png"
theme.arrow3 = themedir .. "/arrow3.png"
theme.arrow3b = themedir .. "/arrow3b.png"
theme.widget_hdd = themedir .. "/hdd.png"
theme.widget_cal = themedir .. "/cal.png"
theme.accept = themedir .. "/accept.png"
theme.cancel = themedir .. "/cancel.png"
theme.usb = themedir .. "/usb.png"
theme.cdrom = themedir .. "/cdrom.png"
theme.spacertag = themedir .. "/spacertag.png"
theme.layout_browse        = os.getenv("HOME") .. "/.config/awesome/themes/kopri/layouts/browsew.png"
theme.layout_centerwork    = os.getenv("HOME") .. "/.config/awesome/themes/kopri/layouts/centerwork.png"
theme.widget_cpu = themedir .. "/cpu.png"
theme.layout_termfair    = os.getenv("HOME") .. "/.config/awesome/themes/kopri/layouts/uselessfair.png"
theme.widget_temp = themedir .. "/temp.png"
theme.arr1 = themedir .. "/arr1.png"
theme.arr2 = themedir .. "/arr2.png"
theme.widget_mem = themedir .. "/mem.png"
theme.volicon = themedir .. "/vol.png"
theme.awesome_icon = themedir .. "/fox.png"

return theme

