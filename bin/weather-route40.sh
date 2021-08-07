#!/bin/python

import urllib.request, json

try:
    import httplib
except:
    import http.client as httplib

#city = "293396" #Tel Aviv
#city = "2654675" #Bristol
esq = "3855974" #Esquel (arg)
rio = "3838859" #Rio Gallegos (arg)
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
    weatherR = eval(str(urllib.request.urlopen(
        "http://api.openweathermap.org/data/2.5/weather?id={}&APPID={}".format(rio, api_key)
        ).read())[2:-1]
        )
    weatherE = eval(str(urllib.request.urlopen(
        "http://api.openweathermap.org/data/2.5/weather?id={}&APPID={}".format(esq, api_key)
        ).read())[2:-1]
        )

    #info = weather["weather"][0]["description"].capitalize()
    #temp = int(float(weather["main"]["temp"]) - 272.15)
    print(weatherE['wind'])
    print(str(weatherR['wind']))


