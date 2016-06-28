'''
@author: Essa Imhmed
'''
import cherrypy
import GetLandInfo_API
import time
import requests
from subprocess import call


class LandPKS_API(object):
    def index(self):
        #return "Server is running. Listening : 128.123.177.103:7070"
	return open('index.html')
    

    def log(self):
	return open('/root/workspace/code/myweb/log.html')
    
    def report(self):
	return open('/root/workspace/code/myweb/report.html')


    def runtest(self):
        call(["pybot", "/root/workspace/code/myweb/robotframework-scripts/get_api_test_suite/get_api_test_suite.robot"])
        return  "DONE!"
   
    def POST(self, length=8):
        return  length
 
    def query(self,**request_data):
   	print('kwargs: %s'%request_data)


    def query(self):
       # message = {'error This version has not suppported yet'}
        message = """<!DOCTYPE html>
                <html>
                        <body>
                                <table style="width:100%">
                                        <tr>
                                                <td>Jill</td>
                                                <td>Smith</td>
                                                 <td>50</td>
                                        </tr>
                                        <tr>
                                                <td>Eve</td>
                                                <td>Jackson</td>
                                                <td>94</td>
                                        </tr>
                                        <tr>
                                                <td>John</td>
                                                <td>Doe</td>
                                                 <td>80</td>
                                        </tr>
                                </table>
                        </body>
                </html>"""
        return message
           
    #Public /index
    index.exposed = True
    #public /log
    log.exposed = True
    #Public /report
    report.exposed = True
    #public /runtest
    runtest.exposed = True
    #public /query
    query.exposed = True
    


if __name__ == '__main__':
    #Configure Server
    conf = {
         '/': {
             'tools.sessions.on': True,
             'tools.sessions.httponly':True,
             'tools.response_headers.on': True
             #'tools.response_headers.headers': [('Content-Type', 'text/plain')],
         }
    }
    cherrypy.config.update({'server.socket_host': '128.123.177.103',
                            'server.socket_port': 7070
                          })
    
    cherrypy.quickstart(LandPKS_API(),"/", conf)
