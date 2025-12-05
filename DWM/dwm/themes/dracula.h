static char normbgcolor[]     = "#282a36";
static char normbordercolor[] = "#282a36"; 
static char normfgcolor[]     = "#f8f8f2";
static char selfgcolor[]      = "#519f50"; 
static char selbgcolor[]      = "#282a36";
static char selbordercolor[]  = "#519f50"; 

static const char *colors[][3] = {
       /*               fg           bg           border   */
       [SchemeNorm] = { normfgcolor,     normbgcolor,  normbordercolor },
       [SchemeSel]  = { selfgcolor,      selbgcolor,   selbordercolor  },
       [SchemeHid]  = { selbordercolor,  normbgcolor,  selbordercolor  },
};

/* For dracula  theme use this dmenu */
/* static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL }; */


