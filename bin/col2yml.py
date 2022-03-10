#!/bin/python

import sys
import re
import yaml
from yaml import Loader

# Opening JSON file
# with open(sys.argv[1]) as json_file:
#     jsoncols = json.load(json_file)


file = open(sys.argv[1], "r")

alacritty = open("/home/oli/.config/alacritty/alacritty.yml", "r+")

v1 = {
    "colors": {
        "primary": {"background": "background", "foreground": "foreground"},
        "normal": {
            "black": "color0",
            "red": "color1",
            "green": "color2",
            "yellow": "color3",
            "blue": "color4",
            "magenta": "color5",
            "cyan": "color6",
            "white": "color7",
        },
        "bright": {
            "black": "color8",
            "red": "color9",
            "green": "color10",
            "yellow": "color11",
            "blue": "color12",
            "magenta": "color13",
            "cyan": "color14",
            "white": "color15",
        },
    }
}

v2 = {
    "colors": {
        "primary": {"background": "bg", "foreground": "fg"},
        "normal": {
            "black": "blk",
            "red": "red",
            "green": "grn",
            "yellow": "ylw",
            "blue": "blu",
            "magenta": "mag",
            "cyan": "cyn",
            "white": "wht",
        },
        "bright": {
            "black": "bblk",
            "red": "bred",
            "green": "bgrn",
            "yellow": "bylw",
            "blue": "bblu",
            "magenta": "bmag",
            "cyan": "bcyn",
            "white": "bwht",
        },
    }
}
v = v1


def f(line):
    t = v["colors"]
    for i in t.keys():
        ti = t[i]
        for k in ti.keys():
            if re.search(ti[k], line):
                col = re.search("(?!#define)(#[\d\w]{6})", line)[0]
                ti[k] = col


for line in file:
    f(line)


def g(key):
    t = v["colors"]
    if key in jsoncols["special"].keys():
        j = jsoncols["special"]
    else:
        j = jsoncols["colors"]
    for i in t.keys():
        ti = t[i]
        for k in ti.keys():
            if ti[k] == key:
                ti[k] = j[key]


# for key in (list(jsoncols['special']) + list(jsoncols['colors'])):
#     g(key)

loaded = yaml.load(alacritty, Loader=Loader)

loaded.update(v)

output = open("/home/oli/.config/alacritty/alacritty.yml", "w+")
yaml.dump(loaded, output, allow_unicode=True)
