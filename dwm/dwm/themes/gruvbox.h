static const char col_gray1[]   = "#1d2021";  // dark0_hard - background
static const char col_gray2[]   = "#282828";  // dark1 - slightly lighter background
static const char col_gray3[]   = "#ebdbb2";  // light1 - main foreground (text)
static const char col_gray4[]   = "#3c3836";  // dark2 - subtle contrast for borders or highlights
static const char col_accent[]  = "#fe8019";  // bright orange - accent color


static const char *colors[][3]      = {

/*               fg         bg         border   */
        [SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
        [SchemeSel]  = { col_gray4, col_accent,  col_accent  },
        [SchemeHid]  = { col_accent,  col_gray1, col_accent  },
};
