static const char col_gray1[]   = "#282c34"; // bg (DoomOne background)
static const char col_gray2[]   = "#1c1f24"; // color01 (DoomOne darker color)
static const char col_gray3[]   = "#bbc2cf"; // fg (DoomOne foreground)
static const char col_gray4[]   = "#282c34"; // bg (DoomOne background)
static const char col_accent[]  = "#46d9ff"; // color02 (DoomOne accent color)

/* SchemeNorm uses background and foreground colors for normal state */
static const char *colors[][3] = {
    /*               fg         bg         border   */
    [SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
    [SchemeSel]  = { col_gray4, col_accent, col_accent },
    [SchemeHid]  = { col_accent, col_gray1, col_accent },
};

