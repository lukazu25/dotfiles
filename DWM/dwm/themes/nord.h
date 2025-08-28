static const char normbordercolor[]           = "#3B4252";
static const char normbgcolor[]               = "#2E3440";
static const char normfgcolor[]               = "#D8DEE9";
static const char selbordercolor[]            = "#434C5E";
static const char selbgcolor[]                = "#434C5E";
static const char selfgcolor[]                = "#ECEFF4";

static const char *colors[][3] = {

   /*               fg                    bg           border   */
    [SchemeNorm] = { normfgcolor,     normbgcolor,   normbordercolor },
    [SchemeSel]  = { selfgcolor,      selbgcolor,    selbordercolor },
    [SchemeHid]  = { selbordercolor,  normbgcolor,   selbordercolor  },
};

/* For nord  theme use this dmenu */
/* static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL }; */
