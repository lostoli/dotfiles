#!/bin/python

import urllib.request, json

try:
    import httplib
except:
    import http.client as httplib

#city = "293396" #Tel Aviv
city = "2654675" #Bristol
#city = "3855974" #Esquel (arg)
#city = "3838859" #Rio Gallegos (arg)
api_key = "2412452cd19fbd5e588235e02df97996" 

#conn = False 
def have_internet():
    conn = httplib.HTTPConnection("www.google.com", timeout=5)
    try:
        conn.request("HEAD", "/")
        conn.close()
        return True
    except:
        conn.close()
        return False

if have_internet() == True:
#    print ("YES!")
    weather = eval(str(urllib.request.urlopen(
        "http://api.openweathermap.org/data/2.5/weather?id={}&APPID={}".format(city, api_key)
        ).read())[2:-1]
        )

    info = weather["weather"][0]["description"].capitalize()
    temp = int(float(weather["main"]["temp"]) - 272.15)
    #print(weather['wind'])

    print("%s, %i °C" % (info, temp))
