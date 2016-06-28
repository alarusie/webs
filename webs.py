import os #, os.path
import random
import string

from subprocess import call
import cherrypy
import shutil


class WebServer(object):
    @cherrypy.expose
    def index(self):
        return open('/root/workspace/code/myweb/index.html')
    
    def report_html(self):
        return open('/root/workspace/code/myweb/output/report.html')
    
    def log_html(self):
        return open('/root/workspace/code/myweb/output/log.html')

    def chart(self):
        htmlpage = """<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'Expenses'],
          ['2004',  1000,      400],
          ['2005',  1170,      460],
          ['2006',  660,       1120],
          ['2007',  1030,      540]
        ]);

        var options = {
          title: 'Company Performance',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="curve_chart" style="width: 900px; height: 500px"></div>
  </body>
</html>
"""
        return htmlpage

    #public /log
    log_html.exposed = True
    #Public /report
    report_html.exposed = True
    #Public /chart
    chart.exposed = True

class WebService(object):
     exposed = True

     @cherrypy.tools.accept(media='text/plain')
     def GET(self):
         return cherrypy.session['mystring']

     def POST(self, url):
         url = "/root/workspace/code/myweb/output /root/workspace/code/myweb/robotframework-scripts/" + url
        # call(["pybot --outputdir output1 ", url])
         os.system("pybot --outputdir " + url)
         #shutil.copy2('/report.html', '/root/workspace/code/myweb/report.html')
         #shutil.copy2('/log.html', '/root/workspace/code/myweb/log.html')
         return "DONE!"

     def PUT(self, another_string):
         cherrypy.session['mystring'] = another_string

     def DELETE(self):
         cherrypy.session.pop('mystring', None)

if __name__ == '__main__':
     conf = {
         '/': {
             'tools.sessions.on': True,
         },
         '/luncher': {
             'request.dispatch': cherrypy.dispatch.MethodDispatcher(),
             'tools.response_headers.on': True,
             'tools.response_headers.headers': [('Content-Type', 'text/plain')],
         }
     }
     webapp = WebServer()
     webapp.luncher = WebService()
     cherrypy.config.update({'server.socket_host': 'essa.landpotential.org',
                            'server.socket_port': 7070
                          })
     cherrypy.quickstart(webapp, '/', conf)
