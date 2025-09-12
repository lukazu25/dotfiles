static const char col_gray1[]   = "#000000"; // black
static const char col_gray2[]   = "#1a1a1a"; // dark gray
static const char col_gray3[]   = "#ffffff"; // white (foreground/text)
static const char col_gray4[]   = "#000000"; // black (used as bg again)
static const char col_accent[]  = "#ffffff"; // white (accent)


static const char *colors[][3]      = {

/*               fg         bg         border   */
        [SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
        [SchemeSel]  = { col_gray4, col_accent,  col_accent  },
        [SchemeHid]  = { col_accent,  col_gray1, col_accent  },
};
