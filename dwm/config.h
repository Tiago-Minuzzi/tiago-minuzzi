/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>
#include "movestack.c"

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 0;        /* 0 means bottom bar */
static const char *fonts[]          = { "Noto Sans Mono:style=Bold:size=11","Font Awesome 5 Free Solid:size=10" };
static const char dmenufont[]       = "Noto Sans Mono:style=Bold:size=11";
#include "/home/tiago/.cache/wal/colors-wal-dwm.h"
//static const char col_gray1[]       = "#171a1f";
//static const char col_gray2[]       = "#444444";
//static const char col_gray3[]       = "#bbbbbb";
//static const char col_gray4[]       = "#eeeeee";
//static const char col_cyan[]        = "#4877b1";
//static const char *colors[][3]      = {
	/*               fg         bg         border   */
//	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
//	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
//};

/* tagging */
static const char *tags[] = { "", "", "", "", "", "爵", "龎" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class                instance    title       tags mask     isfloating   monitor */
	
    /* Floating apps */
    { "Galculator",             NULL,       NULL,       0,            1,           -1 },
    { "Gpick",                  NULL,       NULL,       0,            1,           -1 },
    { "Lxappearance",           NULL,       NULL,       0,            1,           -1 },
    { "Org.gnome.DejaDup",      NULL,       NULL,       0,            1,           -1 },
    { "Pavucontrol",            NULL,       NULL,       0,            1,           -1 },
    { "Ristretto",              NULL,       NULL,       0,            1,           -1 },
    { "Timeshift",              NULL,       NULL,       0,            1,           -1 },
    { "SimpleScreenRecorder",   NULL,       NULL,       0,            1,           -1 },
	{ "Xfce4-terminal",         NULL,       NULL,       0,            1,           -1 },
    
    /* Open apps on tags*/
	{ "firefox",                NULL,       NULL,       1 << 0,       0,           -1 },
	{ "Alacritty",              NULL,       NULL,       1 << 1,       0,           -1 },
	{ "Thunar",                 NULL,       NULL,       1 << 2,       0,           -1 },
	{ "SimpleScreenRecorder",   NULL,       NULL,       1 << 3,       0,           -1 },
	{ "Virt-manager",           NULL,       NULL,       1 << 3,       0,           -1 },
	{ "Spotify",                NULL,       NULL,       1 << 4,       0,           -1 },
	{ "Vivaldi-stable",         NULL,       NULL,       1 << 5,       0,           -1 },
	{ "qutebrowser",            NULL,       NULL,       1 << 5,       0,           -1 },
	{ "Zathura",                NULL,       NULL,       1 << 6,       0,           -1 },
	{ "libreoffice-writer",     NULL,       NULL,       1 << 7,       0,           -1 },
	{ "libreoffice-calc",       NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },
/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *logout[]     = { "killall", "xinit", NULL };
static const char *clipmenu[]   = { "bash", "copyToClip", NULL };
static const char *dmenucmd[]   = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, NULL };
static const char *firefox[]    = { "firefox", NULL };
static const char *vivaldi[]    = { "vivaldi-stable", "--incognito", NULL };
static const char *qutebro[]    = { "qutebrowser", NULL };
static const char *fmgui[]      = { "thunar", NULL };
static const char *flameshot[]  = { "flameshot", "gui", NULL };
static const char *fmtui[]      = { "xfce4-terminal", "-e", "ranger", NULL };
static const char *mutecmd[]    = { "pactl", "set-sink-mute", "1", "toggle", NULL };
static const char *suslock[]    = { "bash", "susLocker.sh", NULL };
static const char *displaysel[] = { "bash", "dwmDisplay", NULL };
static const char *emojis[]     = { "bash", "emoji-select", NULL };
static const char *nextcmd[]    = { "playerctl", "next", NULL };
static const char *playcmd[]    = { "playerctl", "play-pause", NULL };
static const char *prevcmd[]    = { "playerctl", "previous", NULL };
static const char *voldowncmd[] = { "pactl", "set-sink-volume", "1", "-5%", NULL };
static const char *volupcmd[]   = { "pactl", "set-sink-volume", "1", "+5%", NULL };
static const char *termcmd[]    = { "alacritty", NULL };
static const char *xfce4term[]  = { "xfce4-terminal", NULL };
static const char *xkill[]      = { "xkill", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_d,      spawn,          {.v = clipmenu } },
	{ MODKEY|ControlMask,           XK_d,      spawn,          {.v = displaysel } },
	{ MODKEY|Mod1Mask,              XK_e,      spawn,          {.v = emojis } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ Mod1Mask|ControlMask,         XK_t,      spawn,          {.v = xfce4term } },
	{ MODKEY,                       XK_n,      spawn,          {.v = fmgui } },
	{ MODKEY|ShiftMask,             XK_p,      spawn,          {.v = flameshot } },
	{ MODKEY|ShiftMask,             XK_n,      spawn,          {.v = fmtui } },
	{ MODKEY,                       XK_b,      spawn,          {.v = firefox } },
	{ MODKEY|ShiftMask|ControlMask, XK_b,      spawn,          {.v = vivaldi } },
	{ MODKEY|ControlMask,           XK_b,      spawn,          {.v = qutebro } },
	{ MODKEY|ShiftMask,             XK_s,      spawn,          {.v = suslock } },
	{ MODKEY|ControlMask,           XK_space,  togglebar,      {0} },
	{ MODKEY|ShiftMask,             XK_j,      movestack,      {.i = +1 } },
    { MODKEY|ShiftMask,             XK_k,      movestack,      {.i = -1 } },
    { MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_p,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    shiftviewclients,           { .i = +1 } },
	{ MODKEY|ShiftMask,             XK_Tab,    shiftviewclients,           { .i = -1 } },
	{ MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_e,      quit,           {0} },
	{ MODKEY|ShiftMask|ControlMask, XK_e,      spawn,          {.v = logout } },
	{ MODKEY|ShiftMask|ControlMask, XK_k,      spawn,          {.v = xkill } },
    { 0,                            XF86XK_AudioPlay, spawn, {.v = playcmd } },
    { 0,                            XF86XK_AudioPrev, spawn, {.v = prevcmd } },
    { 0,                            XF86XK_AudioNext, spawn, {.v = nextcmd } },
    { 0,                            XF86XK_AudioMute, spawn, {.v = mutecmd } },
    { 0,                            XF86XK_AudioLowerVolume, spawn, {.v = voldowncmd } },
    { 0,                            XF86XK_AudioRaiseVolume, spawn, {.v = volupcmd } },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

