#! /usr/bin/env python2

import subprocess

def mailpasswd():
    path = "/home/oli/.gnupg/offlineimap-olivers.gpg"
    args = ["gpg", "--use-agent", "--quiet", "--batch", "-d", path]
    proc = subprocess.Popen(args, stdout=subprocess.PIPE)
    output = proc.communicate()[0].strip()
    retcode = proc.wait()
    if retcode == 0:
        return output
    else:
        return ''