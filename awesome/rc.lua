require("awful")
require("awful.autofocus")
require("awful.rules")
require("beautiful")
require("naughty")
require("debian.menu")
require("vicious")
require('couth.couth')
require('couth.alsa')
require("blingbling")
require("vain")
vain.widgets.terminal = "urxvtc"

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("/home/kopri/.config/awesome/themes/kopri/theme.lua")


-- This is used later as the default terminal and editor to run.
terminal    = "urxvtc"
editor      = os.getenv("EDITOR") or "nano"
editor_cmd  = terminal .. " -e " .. editor
web         = "iceweasel"
spacefm     = "spacefm"


-- Programs and Names
--web = "google-chrome"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    vain.layout.browse,
    vain.layout.centerwork,
    vain.layout.termfair
    
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.max,
    --awful.layout.suit.magnifier
}
naughty.config.default_preset.font         = beautiful.notify_font
naughty.config.default_preset.fg           = beautiful.notify_fg
naughty.config.default_preset.bg           = beautiful.notify_bg
naughty.config.presets.normal.border_color = beautiful.notify_border
naughty.config.presets.normal.opacity      = 0.8
naughty.config.presets.low.opacity         = 0.8
naughty.config.presets.critical.opacity    = 0.8
-- }}}
vain.layout.browse.extra_padding = 5
-- {{{ Tags
 -- Define a tag table which will hold all screen tags.
 tags = {
   names = { "main", "term", "code", "www", "media" },
   layout = { layouts[1], layouts[1], layouts[6], layouts[8], layouts[1],
              }}
 for s = 1, screen.count() do
     
     awful.screen.padding(screen[s], { top = 1 })
     
     tags[s] = awful.tag(tags.names, s, tags.layout)
     
 end
 -- }}}
awful.tag.setncol(1, tags[4])
-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", terminal .. " -e nano /home/kopri/.config/awesome/rc.lua" },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "debian", debian.menu.Debian_menu.Debian, beautiful.debianicon },                                    
                                    { "interweb", web, beautiful.iceweaselicon },
                                    { "spaceFM", spacefm, beautiful.spacefmicon },
                                    { "terminal", terminal, beautiful.terminalicon },                                    
                                    { "logoff", '/home/kopri/scripts/shutdown_dialog.sh', beautiful.logofficon }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })
-- }}}

-- widgets where here




-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if not c:isvisible() then
                                                  awful.tag.viewonly(c:tags()[1])
                                              end
                                              client.focus = c
                                              c:raise()
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ 
                 position = "top", screen = s, height = "14", 
                -- border_width = beautiful.border_width2,  
                -- border_color = beautiful.border_wibox 
    })
    
    
-- {{{ Wibox
-- widgets panel
--mytextclock = awful.widget.textclock({ align = "right"}, "%I:%M %p")
mytextclock = awful.widget.textclock({ align = "right" }, "%b %d, %I:%M:%S", 1)


-- Initialize widget
timewidget = widget({ type = "textbox" })
-- Register widget
vicious.register(timewidget, vicious.widgets.date, '<span foreground="#435d75" background="#151515"></span><span foreground="#435d75" font="limey 9"> %b %d, %I:%M:%S </span>')
timewidget.bg = "#151515"
clockicon = widget({type = "imagebox"})
clockicon.image = image(beautiful.clockicon)

--{{---| Net widget |-------------------------------------------------------------------------------

netwidget = widget({ type = "textbox" })
vicious.register(netwidget, 
vicious.widgets.net,
'<span background="#151515" font="Terminus 12"> <span font="limey 9" color="#B7416E">${eth0 down_kb} ↓↑ ${eth0 up_kb}</span> </span>', 3)
neticon = widget ({type = "imagebox" })
neticon.image = image(beautiful.widget_net)
netwidget:buttons(awful.util.table.join(awful.button({ }, 1,
function () awful.util.spawn_with_shell(iptraf) end)))


--{{---| FS's widget / udisks-glue menu |-----------------------------------------------------------

fswidget = widget({ type = "textbox" })
vicious.register(fswidget, vicious.widgets.fs,
'<span background="#151515" font="Terminus 12"> <span font="limey 9" color="#d0d26b">${/media/Data avail_gb} GB </span></span>', 8)
udisks_glue = blingbling.udisks_glue.new(beautiful.widget_hdd)
udisks_glue:set_mount_icon(beautiful.accept)
udisks_glue:set_umount_icon(beautiful.cancel)
udisks_glue:set_detach_icon(beautiful.cancel)
udisks_glue:set_Usb_icon(beautiful.usb)
udisks_glue:set_Cdrom_icon(beautiful.cdrom)
awful.widget.layout.margins[udisks_glue.widget] = { top = 0}
udisks_glue.widget.resize = true

fshwidget = widget({ type = "textbox" })
vicious.register(fshwidget, vicious.widgets.fs,
'<span background="#151515" font="Terminus 12"> <span font="limey 9" color="#d0d26b">/home ${/home avail_gb} GB </span></span>', 8)

cpuwidget = widget({ type = "textbox" })
vicious.register(cpuwidget, vicious.widgets.cpu,
'<span background="#151515" font="Terminus 12"> <span font="limey 9" color="#6d9cbe">$2% <span color="#BF1E2D">·</span> $3% </span></span>', 3)
cpuicon = widget ({type = "imagebox" })
cpuicon.image = image(beautiful.widget_cpu)
sensors = widget({ type = "textbox" })
vicious.register(sensors, vicious.widgets.sensors, '<span foreground="#9DBA3A" background="#151515"></span>')
tempicon = widget ({type = "imagebox" })
tempicon.image = image(beautiful.widget_temp)
--blingbling.popups.htop(cpuwidget,
--{ title_color = beautiful.notify_font_color_1, 
--user_color = beautiful.notify_font_color_2, 
--root_color = beautiful.notify_font_color_3, 
--terminal   = "terminal --geometry=130x56-10+26"})

memwidget = widget({ type = "textbox" })
vicious.register(memwidget, vicious.widgets.mem, '<span background="#151515" font="Terminus 12"> <span font="limey 9" color="#BF1E2D" background="#151515">$2 MB </span></span>', 13)
memicon = widget ({type = "imagebox" })
memicon.image = image(beautiful.widget_mem)

oswidget = widget ({ type = "textbox"})
vicious.register(oswidget, vicious.widgets.os,'<span font="limey 9" color="#313131">$2</span>')

volwidget = widget({ type = "textbox", align = "right" })
vicious.register(volwidget, vicious.widgets.volume, '<span font="limey 9" color="#E7212A">$1</span>', 1, "Master")
volicon = widget ({type = "imagebox" })
volicon.image = image(beautiful.volicon)

upgradewidget = widget({type = "textbox"})

upgradewidget_t = awful.tooltip({ objects = { upgradewidget},})

vicious.register(upgradewidget, vicious.widgets.pkg,'<span font="limey 9" color="#BF1E2D">$1</span>', 1801, "Debian")

upgradeicon = widget({type = "imagebox" })
upgradeicon.image = image(beautiful.debianicon)




-- Create a spacer widget
spacer = widget({ type = "textbox" })
spacer.width = 1

spacer2 = widget({ type = "textbox"})
spacer2.width = 2

spacer6 = widget({ type = "textbox"})
spacer6.width = 6

fsicon = widget ({type = "imagebox" })
fsicon.image = image(beautiful.widget_hdd)

arr1 = widget ({type = "imagebox" })
arr1.image = image(beautiful.arr1)
arr2 = widget ({type = "imagebox" })
arr2.image = image(beautiful.arr2)

loltext = widget({ type = "textbox" })
loltext.text = "::"



spr3f = widget({ type = "textbox" })
spr3f.text = '<span background="#313131" font="Terminus 12"> </span>'


spacertag = widget({type = "imagebox"})
spacertag.image = image(beautiful.spacertag)

voltext = widget({type = "textbox"})
voltext.text = " vol. "

caltext = widget({type = "textbox"})
caltext.text = " cal."

upgradetext = widget({type = "textbox"}) 
upgradetext.text = "apt. "

nettext = widget({type = "textbox"})
nettext.text = " net."

hddtext = widget({type = "textbox"})
hddtext.text = " hdd."

cputext = widget({type = "textbox"})
cputext.text = " cpu."

sentext = widget({type = "textbox"})
sentext.text = " sen."

memtext = widget({type = "textbox"})
memtext.text = " mem."






    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
            --mylauncher,
            --spacer2,
            spacertag,
            mytaglist[s],                        
            arr2,
            --arr1,
            spacer6,            
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
         
        spacertag,
        mylayoutbox[s], 
        loltext,
        spacer6,
        --arr1,
        --arr2,
        volwidget,
        voltext,
       -- volicon,
        
        loltext,
       -- arr1,
        --arr2,        
        timewidget,
        caltext,
       -- clockicon,
         loltext,
       -- arr1,
        --arr2,
       -- spacer6,
       -- upgradewidget,
       -- upgradetext,
       -- spacer2,
       -- upgradeicon,
       -- spacer2,
        --loltext,
       -- arr1,
        --arr2,
        netwidget,
        nettext,
       -- neticon,
         loltext,
       -- arr1,
        --arr2,        
        fswidget,
        hddtext,
        loltext,
       -- udisks_glue.widget,
       -- arr1,        
        --arr2,
        cpuwidget,
        cputext,
        loltext,
       -- cpuicon,
       -- arr1,
        --arr2,
        sensors,
        sentext,
        loltext,
       -- tempicon,
       -- arr1,
        --arr2,
        memwidget,
        memtext,
        loltext,
       -- memicon,
        spacer6,
        arr1,        
        --arr2,
        spacer6,


        s == 1 and mysystray or nil,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end)
    --awful.button({ }, 4, awful.tag.viewnext),
    --awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    awful.key({ modkey            }, "m",  function ()
        awful.util.spawn("dmenu_run -i -b -p 'run teh:' -nb '" ..
                   beautiful.bg_normal .. "' -nf '" .. beautiful.fg_normal ..
                   "' -sb '" .. beautiful.bg_focus ..
                   "' -sf '" .. beautiful.fg_focus .. "'") 
               end),       

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

local oldspawn = awful.util.spawn
awful.util.spawn = function (s)
  oldspawn(s, false)
end 

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
