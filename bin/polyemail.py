#!/usr/bin/python
import os, sys

foreground = os.environ['Cf']
red = os.environ['C2']
blue = os.environ['C4']

home = os.environ['HOME']

def colorm(num):
  snum = str(num)
  if num > 5:
    return "%{F#" + red + "}" + snum + "%{F-}"
  elif num > 0:
    return "%{F#" + blue + "}" + snum + "%{F-}"
  else:
    return "%{F#" + foreground + "}" + snum + "%{F-}"

sys.path.append(os.path.join(home,'stuff/python/pmail'))

import pmail.server

lo = pmail.server.checkForNewMessages('OS')
og = pmail.server.checkForNewMessages('OG')

prefix = "%{F#" + foreground + "}" + "Mail: " + "%{F-}"

print(prefix + colorm(lo) + "%{F#" + foreground + "}|%{F-}" + colorm(og))
