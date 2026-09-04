static const char col_gray1[]   = "#0a0f14"; // very dark blue-gray (background)
static const char col_gray2[]   = "#1c2526"; // slightly lighter gray (secondary elements)
static const char col_gray3[]   = "#c5c8c6"; // light gray (foreground/text)
static const char col_gray4[]   = "#0a0f14"; // very dark blue-gray (background again)
static const char col_accent[]  = "#66cccc"; // cyan (accent)


static const char *colors[][3]      = {

/*               fg         bg         border   */
        [SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
        [SchemeSel]  = { col_gray4, col_accent,  col_accent  },
        [SchemeHid]  = { col_accent,  col_gray1, col_accent  },
};
