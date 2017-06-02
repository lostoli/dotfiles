#! /usr/bin/env python2

import os
import subprocess

def mailpasswd(acct):
    acct = os.path.basename(acct)
    path = "/home/oli/.offlineimap-%s.gpg" % acct
    args = ["gpg", "--use-agent", "--quiet", "--batch", "-d", path]
    proc = subprocess.Popen(args, stdout=subprocess.PIPE)
    output = proc.communicate()[0].strip()
    retcode = proc.wait()
    if retcode == 0:
        return output
    else:
        return ''
