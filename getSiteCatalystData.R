############
# Script to connect to Adobe Site Catalyst and pull reports
# Author: Shavar Beckford
############

# Install 'RSiteCatalyst' package
# Load 'RSiteCatalyst' library
install.packages("RSiteCatalyst") 
library("RSiteCatalyst")

# Authorize your account and paste the accesstoken 
# Authenticate on Site Cat
SCAuth("<yourusername>:<yourcompanyname>", "<accesstoken>")

# Get Report Suites
report.suites <- GetReportSuites()
# Get Elements
elements <- GetElements('<yourreportsuiteid>')
# Get eVars
evars <- GetEvars('<yourreportsuiteid>')
# Get Props
props <- GetProps('<yourreportsuiteid>')
# Get Metrics
metrics <- GetMetrics('<yourreportsuiteid>')
# Get Segments
segments <- GetSegments('<yourreportsuiteid>')

# Get a trended pageviews report overtime
daily.pageview.report <- QueueOvertime(reportsuite.id ="<yourreportsuiteid>",
                                       date.from ="2014-09-01",
                                       date.to = "2014-09-05",
                                       metrics = "pageviews")

# Get a trended kpi report overtime by day
daily.kpi.report <- QueueOvertime(reportsuite.id = "<yourreportsuiteid>",
                                  date.from = "2013-06-01",
                                  date.to = "2013-06-18",
                                  metrics = c("pageviews","visits","bounces"), 
                                  date.granularity = "day")

# Get a trended kpi report overtime with segment
daily.kpi.mobile.report <- QueueOvertime(reportsuite.id = "<yourreportsuiteid>",
                                         date.from = "2014-09-01",
                                         date.to = "2014-09-05",
                                         metrics = c('pageviews','visits'),
                                         segment.id = '<yoursegmentid>')

# Get ranked data on an eVar
site.version.kpi.report <- QueueRanked(reportsuite.id = "<yourreportsuiteid>",
                                       date.from = "2014-09-01",
                                       date.to = "2014-09-05",
                                       elements = 'evar25',
                                       metrics = c('pageviews','visits','[orders] / [visits]'))

# View Reports
head(daily.pageview.report)
head(daily.kpi.report)
head(daily.kpi.mobile.report)
head(site.version.kpi.report)




