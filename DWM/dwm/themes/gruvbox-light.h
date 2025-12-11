static const char col_gray1[]   = "#ebdbb2";  // fg
static const char col_gray2[]   = "#3c3836";  // bg
static const char col_gray3[]   = "#282828";  // bg_alt
static const char col_gray4[]   = "#fe8819";  // fg_alt
static const char col_accent[]  = "#fabd2f";  // border

static const char *colors[][3]      = {

/*               fg         bg         border   */
        [SchemeNorm] = { col_gray1, col_gray2, col_gray2 },
        [SchemeSel]  = { col_gray4, col_gray3,  col_accent  },
        [SchemeHid]  = { col_gray4,  col_gray3, col_accent  },
};

/* For gruvbox-light use this dmenu */
/* static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray2, "-nf", col_gray1, "-sb", col_gray4, "-sf", col_gray1, NULL }; */
