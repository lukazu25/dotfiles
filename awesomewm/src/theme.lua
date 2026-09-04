local beautiful = require("beautiful")
local theme_assets = require("beautiful.theme_assets")
local gears = require("gears")

local themes_dir = gears.filesystem.get_themes_dir()

local dpi = beautiful.xresources.apply_dpi

local theme = dofile(themes_dir .. "default/theme.lua")

local theme_font = "JetBrainsMono Nerd Font"

-- The fields in here are named after the Gruvbox (Dark) image names.
-- https://github.com/morhetz/gruvbox <- In README file.
-- When there is a conflict in the names, there will be subtle change.
local gruvbox_dark = {
    bg0 = "#282828",
    fg1 = "#ebdbb2",
    blue_dark = "#458588",
    blue_light = "#83a598",
    red_dark = "#cc241d",
    red_light = "#fb4934",
}

local color_accent_light = gruvbox_dark.blue_light
local color_accent_dark = gruvbox_dark.blue_dark

-- SET COLORS --
local colors = {
    border_normal = gruvbox_dark.bg0,
    border_focus = color_accent_light,
    border_marked = gruvbox_dark.red_light,

    titlebar_bg_normal = gruvbox_dark.bg0,
    titlebar_fg_normal = gruvbox_dark.fg1,
    titlebar_bg_focus = gruvbox_dark.bg0,
    titlebar_fg_focus = gruvbox_dark.fg1,

    bg_normal = gruvbox_dark.bg0,
    fg_normal = gruvbox_dark.fg1,

    bg_focus = color_accent_light,
    fg_focus = gruvbox_dark.bg0,

    bg_urgent = gruvbox_dark.red_light,
    fg_urgent = gruvbox_dark.bg0,

    notification_bg = gruvbox_dark.bg0,
    notification_fg = gruvbox_dark.fg1,
    notification_border = color_accent_light,

    menu_border = color_accent_light,
}

function font_string(family, size)
    return family .. " " .. size
end

theme.wallpaper = os.getenv("HOME") .. "/.config/awesome/wallpaper.png"

theme.font = font_string(theme_font, 10)

theme.corner_radius = dpi(1)

theme.useless_gap = dpi(2)

theme.border_width = dpi(1)
theme.border_normal = colors.border_normal
theme.border_focus = colors.border_focus
theme.border_marked = colors.border_marked

theme.menu_width = dpi(210)
theme.menu_height = dpi(25)
theme.menu_font = theme.font
theme.menu_submenu_icon = os.getenv("HOME") .. "/.config/awesome/theme_assets/submenu.png"
theme.menu_border_width = dpi(2)
theme.menu_border_color = colors.menu_border

theme.notification_width = dpi(350)
theme.notification_title_font = font_string(theme_font, 17)
theme.notification_message_font = font_string(theme_font, 13)
theme.notification_border_width = dpi(6)
theme.notification_border_color = colors.notification_border
theme.notification_bg = colors.notification_bg
theme.notification_fg = colors.notification_fg

theme.titlebar_bg_normal = colors.titlebar_bg_normal
theme.titlebar_bg_focus = colors.titlebar_bg_focus
theme.titlebar_fg_normal = colors.titlebar_fg_normal
theme.titlebar_fg_focus = colors.titlebar_fg_focus

theme.bg_normal = colors.bg_normal
theme.fg_normal = colors.fg_normal
theme.bg_focus = colors.bg_focus
theme.fg_focus = colors.fg_focus
theme.bg_urgent = colors.bg_urgent
theme.fg_urgent = colors.fg_urgent

theme.bg_systray = theme.bg_normal

theme.mouse_finder_color = "#ff0000"

theme.awesome_icon = os.getenv("HOME") .. "/.config/awesome/theme_assets/awesome_icon.png"

theme.layout_tile       = os.getenv("HOME") .. "/.config/awesome/theme_assets/layouts/tilew.png"
theme.layout_tileleft   = os.getenv("HOME") .. "/.config/awesome/theme_assets/layouts/tileleftw.png"
theme.layout_tilebottom = os.getenv("HOME") .. "/.config/awesome/theme_assets/layouts/tilebottomw.png"
theme.layout_tiletop    = os.getenv("HOME") .. "/.config/awesome/theme_assets/layouts/tiletopw.png"
theme.layout_fairv      = os.getenv("HOME") .. "/.config/awesome/theme_assets/layouts/fairvw.png"
theme.layout_fairh      = os.getenv("HOME") .. "/.config/awesome/theme_assets/layouts/fairhw.png"
theme.layout_spiral     = os.getenv("HOME") .. "/.config/awesome/theme_assets/layouts/spiralw.png"
theme.layout_dwindle    = os.getenv("HOME") .. "/.config/awesome/theme_assets/layouts/dwindlew.png"
theme.layout_max        = os.getenv("HOME") .. "/.config/awesome/theme_assets/layouts/maxw.png"
theme.layout_fullscreen = os.getenv("HOME") .. "/.config/awesome/theme_assets/layouts/fullscreenw.png"
theme.layout_magnifier  = os.getenv("HOME") .. "/.config/awesome/theme_assets/layouts/magnifierw.png"
theme.layout_floating   = os.getenv("HOME") .. "/.config/awesome/theme_assets/layouts/floatingw.png"
theme.layout_cornernw   = os.getenv("HOME") .. "/.config/awesome/theme_assets/layouts/cornernww.png"
theme.layout_cornerne   = os.getenv("HOME") .. "/.config/awesome/theme_assets/layouts/cornernew.png"
theme.layout_cornersw   = os.getenv("HOME") .. "/.config/awesome/theme_assets/layouts/cornersww.png"
theme.layout_cornerse   = os.getenv("HOME") .. "/.config/awesome/theme_assets/layouts/cornersew.png"

theme.titlebar_close_button_focus               = os.getenv("HOME") .. "/.config/awesome/theme_assets/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = os.getenv("HOME") .. "/.config/awesome/theme_assets/titlebar/close_normal.png"
theme.titlebar_minimize_button_normal           = os.getenv("HOME") .. "/.config/awesome/theme_assets/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = os.getenv("HOME") .. "/.config/awesome/theme_assets/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_focus_active        = os.getenv("HOME") .. "/.config/awesome/theme_assets/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = os.getenv("HOME") .. "/.config/awesome/theme_assets/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = os.getenv("HOME") .. "/.config/awesome/theme_assets/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = os.getenv("HOME") .. "/.config/awesome/theme_assets/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = os.getenv("HOME") .. "/.config/awesome/theme_assets/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = os.getenv("HOME") .. "/.config/awesome/theme_assets/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = os.getenv("HOME") .. "/.config/awesome/theme_assets/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = os.getenv("HOME") .. "/.config/awesome/theme_assets/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = os.getenv("HOME") .. "/.config/awesome/theme_assets/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = os.getenv("HOME") .. "/.config/awesome/theme_assets/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = os.getenv("HOME") .. "/.config/awesome/theme_assets/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = os.getenv("HOME") .. "/.config/awesome/theme_assets/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = os.getenv("HOME") .. "/.config/awesome/theme_assets/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = os.getenv("HOME") .. "/.config/awesome/theme_assets/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = os.getenv("HOME") .. "/.config/awesome/theme_assets/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = os.getenv("HOME") .. "/.config/awesome/theme_assets/titlebar/maximized_normal_inactive.png"

return theme
