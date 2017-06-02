#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import sys,mpd,os,socket,shutil

musiclocation = '/home/oli/stuff/Music' #location of music       
artlocation = '/home/oli/.mpd/covers' #where you want albumart storing
tmp_path = '/home/oli/.cache/mpd.jpg' #location for temporary file so conky can find it

musiclocation = os.path.expanduser(musiclocation)
artlocation = os.path.expanduser(artlocation)

client = mpd.MPDClient()  
try:
    client.connect("localhost", 6600)    
except socket.error:
    sys.exit(1)
    
song = client.currentsong() 
artist = song['artist']
album = song['album']

covername = os.path.join( artlocation, artist+'-'+album+'.jpg')
covername = covername.replace(' ',' ')
fullmusiclocation = os.path.split(os.path.join(musiclocation, song['file']))[0]

try:
    os.remove(tmp_path)    
except OSError: pass

if os.path.exists(os.path.join(fullmusiclocation, 'cover.jpg')):
    #print 'cover.jpg exists, symlinking...'
    os.symlink(os.path.join(fullmusiclocation, 'cover.jpg'), tmp_path)
    shutil.copy(os.path.join(fullmusiclocation, 'cover.jpg'), covername)
    sys.exit(0)
if os.path.exists(os.path.join(fullmusiclocation, 'folder.jpg')):
    #print 'folder.jpg exists, symlinking...'
    os.symlink(os.path.join(fullmusiclocation, 'folder.jpg'), tmp_path)
    shutil.copy(os.path.join(fullmusiclocation, 'folder.jpg'), covername)
    sys.exit(0)
    
