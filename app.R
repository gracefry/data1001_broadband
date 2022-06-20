# Load libraries, data
library(shiny)
library(tidyverse)
library(shinythemes)
library(plotly)
# UI
ui <- navbarPage("Project 3",
                 
                 theme = shinytheme("sandstone"),
                 windowTitle = "Project 3",
                 
                 # Recommendation max 40 words
                 
                 # Evidence 400 words
                 
                 tabPanel("Report",
                          mainPanel(width = 12,
                            
                            # Header
                            HTML("<img src=\"https://images.squarespace-cdn.com/content/v1/5b97691a710699158dad8613/1538195803532-JWIVDU80S32GZWRF9EV5/internet.jpg\" width=\"100%\" height=\"auto\" />"),
                            h1("Broadband: Bang for your Buck", align = "center"),
                            h5("By", strong("520351277,"), "DABC Investigations", align ="center"), 
                            h6("DATA1001 | University of Sydney", align = "center"),
                            h6("20 May 2022", align ="center"),
                            hr(),
                            
                            HTML("<p><span style=\"float: left; width: 0.8em; font-size: 600%; font-family: algerian, courier; line-height: 80%;\">I</span>nternet plans are expensive. Yet 2017 investigations by the Australian Competition and Consumer Commission (ACCC) revealed that Retail Service Providers (RSPs) weren't delivering the speeds they claimed (ACCC, 2021a). Telstra, Optus, TPG and MyRepublic were forced to pay fines (ACCC, 2018) and compensation (ACCC, 2017a; ACCC, 2017b) to customers who were never able to clock speeds that their plan promised.<p>Choosing the broadband plan that meets your needs is still tricky business. Using ACCC data collected from thousands of households around Australia, let us do the math on where you can find the best bang for your buck.</p>"),
                            
                            # First plot
                            h3("Evidence", align = "left"),
                            p("The vast majority (55.6%) of Australians in 2022 are choosing the high-speed 50/20Mbps plan. Furthermore, 38.4% of households have a Fibre to the Node (FTTN) connection type. (ACCC, 2022). We will be focusing on these in particular across different RSPs, to capture what the average consumer might expect."),
                            p("Use this interactive chart below to compare eleven different RSPs in New South Wales on their real-life performance. Not sure what you want in an Internet connection? We have provided a glossary in the Acknowledgements section."),
                            selectInput("parameter", width = "100%", "Point of Comparison:",
                                        choices = c("Download Speed (All Hour Average) (Mbps)" = "All.hour.trimmed.mean.download.speed",
                                                    "Download Speed (Busy Hours Average) (Mbps)" = "Busy.hour.trimmed.mean.download.speed",
                                                    "Upload Speed (All Hour Average) (Mbps)" = "All.hour.trimmed.mean.upload.speed",
                                                    "Upload Speed (Busy Hour Average) (Mbps)" = "Busy.hour.trimmed.mean.upload.speed",
                                                    "Lag (All Hour Average) (ms)" = "All.hour.trimmed.mean.latency",
                                                    "Lag (Busy Hour Average) (ms)" = "Busy.hour.trimmed.mean.latency",
                                                    "Average Daily Outages over 30 seconds (count)" = "Average.daily.outages"),
                                        ), #selectinput
                            plotlyOutput("boxplot"),
                            br(),
                            p("The chart compares the", strong("spread"), "of the data, and the red dots indicated the", strong("mean."), "But what does that mean for you?"),
                            p("Because the data from the ACCC covers many measurements from different households, the red dot on the plot can help you see an 'average of the averges'. This could tell you, for example, that iiNet delivers a busy hour download speed of 49.6 Mbps, which is on average, faster than Telstra that delivers speeds of 47.3 Mbps."),
                            p("But we can also examine the median. The median is the middle number in the data, and represents the point between the higher 50% of results and the lower 50% of results. Why might one care about the median instead of the mean (average)? In this data, we have used \"trimmed\" data that excludes the most extreme 1% of the data. However, the black dots on the chart are also outliers. They are all 1.5 times the upper (Q1) or lower bounds (Q3) of the middle 50% of data (Q3-Q1, known as the IQR). But they are important to let you see the full picture. The average can be made significantly higher or lower, just because one household had very bad service. The median, on the other hand, is more robust to outliers and won't go too far up or down despite there being extreme data points."),
                            
                            
                            h3("Recommendations"),
                            p("Compare", a("Exetel's", href="https://www.exetel.com.au/broadband/nbn?gclid=Cj0KCQjwm6KUBhC3ARIsACIwxBiu3MzwHl4qldb1xkxJPAe4K2CmLGr53qxF2R2bGYL6iyYk8Y1XAZ8aAvsuEALw_wcB)", "and", a("Superloop's", href = "https://www.superloop.com/consumer/home-broadband/nbn.html"), "Unlimited 50/20 Mbps plans, both retailing at $69.95 per month. Then use our tool to compare their download speeds, lag and more. Things you would have never been able to compare, now you can."),
                            br(),
                            br()
                            ))
                          ), #tabpanel
tabPanel("Acknowledgements",
h3("Acknowledgements"),
h4("Bibliography"),
p("Australian Competition and Consumer Commission. (2021a). Telstra, Optus and TPG allegedly misled consumers over NBN maximum speeds. Australian Competition and Consumer Commission. Retrieved May 20, 2022, from https://www.accc.gov.au/media-release/telstra-optus-and-tpg-allegedly-misled-consumers-over-nbn-maximum-speeds"),
p("Australian Competition and Consumer Commission. (2021b). More consumers take up faster NBN plans. Retrieved 20 May 2022, from https://www.accc.gov.au/media-release/more-consumers-take-up-faster-nbn-plans"),
p("Australian Competition and Consumer Commission. (2017a). Telstra offers to compensate 42,000 customers for slow NBN speeds. Retrieved 20 May 2022, from https://www.accc.gov.au/media-release/telstra-offers-to-compensate-42000-customers-for-slow-nbn-speeds"),
p("Australian Competition and Consumer Commission. (2017b). Optus to compensate customers for slow NBN speeds. Retrieved 20 May 2022, from https://www.accc.gov.au/media-release/optus-to-compensate-customers-for-slow-nbn-speeds"),
p("Australian Competition and Consumer Commission. (2018). MyRepublic pays penalties for NBN speed claims. Retrieved 20 May 2022, from https://www.accc.gov.au/media-release/myrepublic-pays-penalties-for-nbn-speed-claims"),
p("Australian Competition and Consumer Commission. (2022). March quarter 2022 report. Retrieved 20 May 2022, from https://www.accc.gov.au/regulated-infrastructure/communications/national-broadband-network-nbn/nbn-wholesale-market-indicators-report/march-quarter-2022-report"),
h4("Raw data"),
p("The ACCC data used for the figures in this report can be retrieved from", a("this link", href="https://data.gov.au/data/dataset/measuring-broadband-australia-report-15-dataset-release")),
p("The ACCC Data Glossary and other information can be found in its", a("Guide to the Data", href="https://data.gov.au/data/dataset/measuring-broadband-australia-report-15-dataset-release/resource/100c12b6-eee1-434d-b62a-720cb1533a7a")),
h4("Glossary"),
                              HTML("<table border=\"1\">
                                  <tbody>
                                  <tr>
                                  <td><h6>Term</h6></td>
                                  <td><h6>Definition</h6></td>
                                  </tr>
                                  <tr>
                                  <td>Download Speed</td>
                                  <td>How quickly you can receive content from the Internet to your device. Generally, the higher the better.</td>
                                  </tr>
                                  <tr>
                                  <td>Download Speed</td>
                                  <td>How quickly you can download content between the busy hours of 7PM to 12AM Monday to Friday, on average, measured in megabits per second.</td>
                                  </tr>
                                  <tr>
                                  <td>Upload Speed</td>
                                  <td>How quickly you can send content from your device to the Internet. Generally, the higher the better.</td>
                                  </tr>
                                  <tr>
                                  <td>Lag</td>
                                  <td>How much delay there is for your device to send and receive requests. Also known as 'ping' or 'latency', it can be important if you play online games. Generally, the lower the better.</td>
                                  </tr>
                                  <tr>
                                  <td>Outage</td>
                                  <td>When the Internet connection drops, measured at any time except for between 12am and 6am when scheduled maintenance is expected to cause dropouts.</td>
                                  </tr>
                                  <tr>
                                  <td>All Hour Average</td>
                                  <td>Measured at any time, any day, as an average.</td>
                                  </tr>
                                  <tr>
                                  <td>Busy Hours Average</td>
                                  <td>An average measured between 7pm to 12am Monday to Friday, when the most people use the Internet and demand increases.</td>
                                  </tr>
                                  <tr>
                                  <td>Mbps</td>
                                  <td>Megabits per second (how much data can be send/received per second)</td>
                                  </tr>
                                  <tr>
                                  <td>Ms</td>
                                  <td>Milliseconds</td>
                                  </tr>
                                  </tbody>
                                  </table><p>")) 
                            )
                          
 #navbar

# Server
server <- function(input, output, session){
  
  # Load data
  broadband = read.csv("http://www.maths.usyd.edu.au/u/UG/JM/DATA1001/r/current/projects/2022data/broadband.csv")
  
  # Clean data
  bb <- broadband %>%
    filter(tier == "50/20 Mbps",
           state_or_territory == "NSW",
           technology == "Fibre to the Node")%>%
    dplyr::select(rsp, 
           All.hour.trimmed.mean.download.speed, 
           Busy.hour.trimmed.mean.download.speed, 
           All.hour.trimmed.mean.upload.speed, 
           Busy.hour.trimmed.mean.upload.speed,
           All.hour.trimmed.mean.latency,
           Busy.hour.trimmed.mean.latency,
           Average.daily.outages)
  
  # First plot 
  output$boxplot <- renderPlotly({
    boxplot <- ggplot(bb, aes(x = rsp, y = get(input$parameter), fill = rsp)) + geom_boxplot() + stat_summary(fun=mean, geom="point", shape=20, size=2, color="red", fill="red") + ggtitle("title") + theme(legend.position = "none") 
    boxplot <- ggplotly(boxplot)%>%
      layout(title = "Comparing FTTN 50/20Mbps plans of different NSW RSPs by chosen Point of Comparison", xaxis = list(title="Retail Service Provider (RSP)"), yaxis = list(title="Point of Comparison"))
    boxplot})

}
  


# Run
shinyApp(ui = ui, server = server)
