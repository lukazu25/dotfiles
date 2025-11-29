static const char col_gray1[]   = "#282c34"; 
static const char col_gray2[]   = "#1c1f24"; 
static const char col_gray3[]   = "#bbc2cf"; 
static const char col_gray4[]   = "#282c34"; 
static const char col_accent[]  = "#46d9ff"; 

static const char *colors[][3] = {
    /*               fg         bg         border   */
    [SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
    [SchemeSel]  = { col_accent, col_gray4, col_accent },
    [SchemeHid]  = { col_accent, col_gray1, col_accent },
};

