import random
import string

import cherrypy

class WebService(object):
    
    exposed = True
    @cherrypy.tools.accept(media='text/plain')
    def index(self):
        return """<html>
          <head></head>
          <body>
            <form method="get" action="generate">
              <input type="text" value="8" name="length" />
              <button type="submit">Give it now!</button>
            </form>
          </body>
        </html>"""

    @cherrypy.expose
    def generate(self, length=8):
        return ''.join(random.sample(string.hexdigits, int(length)))

if __name__ == '__main__':
     conf = {
         '/': {
             'request.dispatch': cherrypy.dispatch.MethodDispatcher(),
             'tools.sessions.on': True,
             'tools.response_headers.on': True,
             'tools.response_headers.headers': [('Content-Type', 'text/plain')],
         }
     }
     cherrypy.config.update({'server.socket_host': '128.123.177.103', 'server.socket_port': 7070})
     cherrypy.quickstart(WebService(), '/', conf)




