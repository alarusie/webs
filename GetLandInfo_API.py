# -*- coding: utf-8 -*-

import requests
import time


def test_performance():
        START = time.time()
        r = requests.get("http://api.landpotential.org/query?version=0.1&action=get&object=landinfo&type=get_by_afterdate?after_date=2014-12-12")
        END = time.time()
        elapased = END - START
        tmsg = (("%s %d bit/%d sec" % (r.url, len(r.content), elapased)))
        print tmsg

if __name__ == '__main__':
	test_performance()
