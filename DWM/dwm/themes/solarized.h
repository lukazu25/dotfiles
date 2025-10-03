static const char col_gray1[]       = "#002b36";
static const char col_gray2[]       = "#073642";
static const char col_gray3[]       = "#839496";
static const char col_gray4[]       = "#93a1a1";
static const char col_accent[]        = "#174956";

static const char *colors[][3]      = {
    /*               fg         bg         border   */
    [SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
    [SchemeSel]  = { col_gray4, col_accent,  col_accent  },
    [SchemeHid]  = { col_accent,  col_gray1, col_accent  },
};
