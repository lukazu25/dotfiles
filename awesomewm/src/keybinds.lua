local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")

local modkey = "Mod4"

local globalkeys = gears.table.join(
    awful.key(
        { modkey }, "s", hotkeys_popup.show_help,
        { description="Show Help", group="awesome" }
    ),
    awful.key(
        { modkey }, "Left", awful.tag.viewprev,
        { description = "View Previous", group = "tag" }
    ),
    awful.key(
        { modkey }, "Right", awful.tag.viewnext,
        { description = "View Next", group = "tag" }
    ),
    awful.key(
        { modkey }, "Escape", awful.tag.history.restore,
        { description = "Go Back", group = "tag" }
    ),

    awful.key(
        { modkey }, "j", function()
            awful.client.focus.byidx(1)
        end,
        { description = "Focus Next By Index", group = "client" }
    ),
    awful.key(
        { modkey }, "k", function()
            awful.client.focus.byidx(-1)
        end,
        { description = "Focus Previous By Index", group = "client" }
    ),

    -- Layout manipulation
    awful.key(
        { modkey, "Shift" }, "j", function()
            awful.client.swap.byidx(1)
        end,
        { description = "Swap With Next Client By Index", group = "client" }
    ),
    awful.key(
        { modkey, "Shift" }, "k", function()
            awful.client.swap.byidx(-1)
        end,
        { description = "Swap With Previous Client By Index", group = "client" }
    ),
    awful.key(
        { modkey, "Control" }, "j", function()
            awful.screen.focus_relative(1)
        end,
        { description = "Focus The Next Screen", group = "screen" }
    ),
    awful.key(
        { modkey, "Control" }, "k", function()
            awful.screen.focus_relative(-1)
        end,
        { description = "Focus The Previous Screen", group = "screen" }
    ),
    awful.key(
        { modkey }, "u", awful.client.urgent.jumpto,
        { description = "Jump To Urgent Client", group = "client" }
    ),
    awful.key(
        { modkey }, "Tab", function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        { description = "Go Back", group = "client" }
    ),

    -- Standard program
    awful.key(
        { modkey }, "Return", function()
            awful.spawn(terminal)
        end,
        { description = "Open New Terminal", group = "launcher" }
    ),
    awful.key(
        { modkey, "Control" }, "r", awesome.restart,
        { description = "Reload Awesome", group = "awesome" }
    ),

    awful.key(
        { modkey }, "l", function()
            awful.tag.incmwfact(0.05)
        end,
        { description = "Increase Master Width Factor", group = "layout" }
    ),
    awful.key(
        { modkey }, "h", function()
            awful.tag.incmwfact(-0.05)
        end,
        { description = "Decrease Master Width Factor", group = "layout" }
    ),
    awful.key(
        { modkey, "Shift" }, "h", function()
            awful.tag.incnmaster(1, nil, true)
        end,
        { description = "Increase The Number of Master Clients", group = "layout" }
    ),
    awful.key(
        { modkey, "Shift" }, "l", function()
            awful.tag.incnmaster(-1, nil, true)
        end,
        { description = "Decrease The Number of Master Clients", group = "layout" }
    ),
    awful.key(
        { modkey, "Control" }, "h", function()
            awful.tag.incncol( 1, nil, true)
        end,
        { description = "Increase The Number of Columns", group = "layout" }
    ),
    awful.key(
        { modkey, "Control" }, "l", function()
            awful.tag.incncol(-1, nil, true)
        end,
        { description = "Decrease The Number of Columns", group = "layout" }
    ),

    awful.key(
        { modkey, "Control" }, "n", function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                c:emit_signal(
                    "request::activate", "key.unminimize", { raise = true }
                )
            end
        end,
        { description = "Restore Minimized", group = "client" }
    ),

    -- Prompt
    awful.key(
        { modkey, "Shift" }, "space", function()
            awful.screen.focused().mypromptbox:run()
        end,
        { description = "Run Prompt", group = "launcher" }
    ),

    awful.key(
        { modkey }, "x", function()
            awful.prompt.run {
                prompt       = "Run Lua code: ",
                textbox      = awful.screen.focused().mypromptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval"
            }
        end,
        { description = "Lua Execute Prompt", group = "awesome" }
    ),
    -- Menubar
    awful.key(
        { modkey }, "space", function()
            menubar.show()
        end,
        { description = "Show The Menubar", group = "launcher" }
    )
)

clientkeys = gears.table.join(
    awful.key(
        { modkey, "Shift" }, "f", function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        { description = "Toggle Fullscreen", group = "client" }
    ),
    awful.key(
        { modkey }, "f", function(c)
            c.floating = not c.floating
            c:raise()
        end,
        { description = "Toggle Floating", group = "client" }
    ),
    awful.key(
        { modkey }, "q", function(c)
            c:kill()
        end,
        { description = "Close", group = "client" }
    ),
    awful.key(
        { modkey, "Control" }, "space", awful.client.floating.toggle,
        { description = "Toggle Floating", group = "client" }
    ),
    awful.key(
        { modkey, "Control" }, "Return", function(c)
            c:swap(awful.client.getmaster())
        end,
        { description = "Move to Master", group = "client" }
    ),
    awful.key(
        { modkey }, "o", function(c)
            c:move_to_screen()
        end,
        { description = "Move to Screen", group = "client" }
    ),
    awful.key(
        { modkey }, "t", function(c)
            c.ontop = not c.ontop
        end,
        { description = "Toggle Keep on Top of Other Windows", group = "client" }
    ),
    awful.key(
        { modkey }, "n", function(c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end,
        { description = "Minimize", group = "client" }
    ),
    awful.key(
        { modkey }, "m", function(c)
            c.maximized = not c.maximized
            c:raise()
        end,
        { description = "Maximize/Unmaximize", group = "client" }
    )
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    local tagkey = "#" .. i + 9

    globalkeys = gears.table.join(
        globalkeys,
        -- View tag only.
        awful.key(
            { modkey }, tagkey, function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            { description = "View Tag #" .. i, group = "tag" }
        ),
        -- Toggle tag display.
        awful.key(
            { modkey, "Control" }, tagkey, function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            { description = "Toggle Tag #" .. i, group = "tag" }
        ),
        -- Move client to tag.
        awful.key(
            { modkey, "Shift" }, tagkey, function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            { description = "Move Focused Client To Tag #" .. i, group = "tag" }
        ),
        -- Toggle tag on focused client.
        awful.key(
            { modkey, "Control", "Shift" }, tagkey, function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            { description = "Toggle Focused Client on Tag #" .. i, group = "tag" }
        )
    )
end

clientbuttons = gears.table.join(
    awful.button(
        { }, 1, function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
        end
    ),
    awful.button(
        { modkey }, 1, function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
            awful.mouse.client.move(c)
        end
    ),
    awful.button(
        { modkey }, 3, function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
            awful.mouse.client.resize(c)
        end
    )
)

local data_out = {}

data_out.globalkeys = globalkeys
data_out.modkey = modkey

return data_out
