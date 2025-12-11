/* TokyoNight colors */
static const char col_gray1[] = "#191425";
static const char col_gray2[] = "#49415f";
static const char col_gray3[] = "#c0c0c0";
static const char col_gray4[] = "#f0f0f0";
static const char col_accent[] = "#a0a0aa";

static const char *colors[][3] = {

    /*               fg         bg         border   */
    [SchemeNorm] = {col_gray3, col_gray1, col_gray2},
    [SchemeSel] = {col_gray4, col_gray2, col_accent},
    [SchemeHid] = {col_accent, col_gray1, col_accent},
};
