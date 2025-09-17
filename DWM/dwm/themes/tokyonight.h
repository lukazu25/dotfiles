/* TokyoNight colors */
static const char col_bg[]     = "#1a1b26";  // background
static const char col_fg[]     = "#a9b1d6";  // foreground
static const char col_blk[]    = "#32344a";  // black (normal)
static const char col_red[]    = "#f7768e";  // red
static const char col_grn[]    = "#9ece6a";  // green
static const char col_ylw[]    = "#e0af68";  // yellow
static const char col_blu[]    = "#7aa2f7";  // blue
static const char col_mag[]    = "#ad8ee6";  // magenta
static const char col_cyn[]    = "#0db9d7";  // cyan (highlight)
static const char col_brblk[]  = "#444b6a";  // bright black

static const char *colors[][3] = {
    /*               fg       bg       border */
    [SchemeNorm] = { col_fg,   col_bg,   col_brblk },
    [SchemeSel]  = { col_cyn,  col_bg,   col_cyn   },
    [SchemeHid]  = { col_cyn,  col_bg,   col_cyn  },
};

/* For tokyonight use this dmenu */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_bg, "-nf", col_fg, "-sb", col_cyn, "-sf", col_bg, NULL };
