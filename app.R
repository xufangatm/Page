#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(readtext)
library(leaflet)

# styles 
style_name = ("font-family: Impact, Charcoal, sans-serif;font-size: 40px; font-weight:100; line-height:1.5 ;color: MediumTurquoise;")
style_title = ("font-family: Tahoma, Geneva, font-size: 50px; sans-serif; font-weight:1000; line-height:0.5; color:black;")
style_info = ("font-family: Times New Roman; font-size: 20px; align:center; font-weight:500; line-height:1.5 ;color: black;")
style_school = ("font-family: Times New Roman; font-size: 30px;  font-weight:500; line-height:1.5 ;color: black;")
style_time = ("font-family: Times New Roman; font-size: 15px;  font-weight:500; line-height:1.5 ;color: black;")
style_degree = ("font-family: Times New Roman; font-size: 20px; font-type:li;font-style: italic; font-weight:500; line-height:1.5 ;color: black;")

style_work_dep = ("font-family: Times New Roman; font-size: 23px; font-weight:500; line-height:1.5 ;color: DeepSkyBlue;")
style_work_fac = ("font-family: Times New Roman; font-size: 23px;font-weight:10000; line-height:1.5 ;color: DodgerBlue;")
style_work_title = ("font-family: Times New Roman; font-size: 17px; font-style: italic; font-weight:500; line-height:1.5 ;color: black;")
style_work_ind = ("font-family: Times New Roman; font-size: 18px; font-weight:500; line-height:1;color: black;")

style_project_name = ("font-family: Times New Roman; font-size: 23px; font-weight:500; line-height:1.5 ;color: DarkCyan;")
style_project_time = ("font-family: Times New Roman; font-size: 17px; font-style: italic; font-weight:500; line-height:1.5 ;color: black;")
style_project_ind = ("font-family: Times New Roman; font-size: 17px; font-weight:500; line-height:1.5 ;color: black;")

style_datatype = ("font-family: Times New Roman; font-size: 20px; font-weight:500; line-height:1.5 ;color: black;")
style_Pulication = ("font-family: Times New Roman; font-size: 18px; font-weight:500; line-height:1.5 ;color: black;")

header_my<-dashboardHeader(title = h4("Xufang Zheng",
                                      style = ("font-family: Arial, Helvetica, sans-serif; font-weight:500; line-height:1.5 ;color: MediumTurquoise;")), titleWidth = 230)
dashboardSidebar_my <- dashboardSidebar(width = 230, sidebarMenu(id = "tabs",
                                                    menuItem("HOME", tabName = "home", icon = icon("home")),
                                                    menuItem("ABOUT ME", icon = icon("bars"), tabName = "aboutme"),
                                                    menuItem("RESEARCH BLOG",tabName = "researchblog",icon = icon("plane"),
                                                             menuSubItem("Direct Share", tabName = "directShare"),
                                                             menuSubItem("Schedule Connection Stability", tabName = "stability"),
                                                             menuSubItem("Data Visualization ", tabName = "Visualization"))))

dashboardBody_my <- dashboardBody(tabItems(
  # for home page
  tabItem(tabName = "home", 
          # box of bio photo
          box(width = 12, solidHeader = TRUE, box(width = 3, solidHeader = TRUE, tags$img(src = "bio.jpg", width = "100%")),
              # box of the name & title label
              box(width = 9, solidHeader = TRUE, box(width="100%", solidHeader = TRUE, fluidRow(column(width = 12, p("Xufang Zheng", style = style_name), 
                                                                                                                   p("Ph.D. candidate in Aerospace Engineering", style = style_title)))), 
                                                 # box of info
                                                 box(width = "100%", solidHeader = FALSE, status = "info", 
                                                 p("I am a Ph.D candidate in the Department of Aerospace Engineering at ", a("Iowa State University", href = "www.iastate.edu"), ".",
                                                   "After I got my B.S. in Geographic Information System, I worked as an algorithm and software engineer at a technical company which focusing 
                                                    on air traffic control & manangement, from where I found my passion in the aviation industry, especially in air traffic control & management.
                                                    I pursued my M.S. in Air Traffic Mangement at the ",a("Civil Aviation University of China", href = "http://www.cauc.edu.cn/en/"),".",
                                                  "I have been working at the ", a("Intelligent Aerospace Systems Laboratory (IASL)",href="http://www.aere.iastate.edu/~pwei/lab.html"),
                                                  "leaded by ", a("Prof.Peng Wei", href = "http://www.aere.iastate.edu/~pwei/index.html"), ". My research focuse on data mining, machine learning 
                                                   and statistical learning and their application on air traffic control & management and airline operations."
                                                   ,style = style_info), br(), align = "justify"))
                )
          ),
  tabItem(tabName = "aboutme",
          # tab of resume
          tabsetPanel(id = "bio",
                      # tab of education
                      tabPanel("EDUCATION", box(width = 12, height = 600, solidHeader = TRUE, fluidRow(width = 12, column(width = 1, br(), tags$img(src = "ISU.png", width = 120)), 
                                                                     column(width =11, 
                                                                         br(),
                                                                         div("Iowa State University", style = style_school), 
                                                                         div("August 2016 - Present", style = style_time),
                                                                         div("Ph.D. in Aerospace Engineering, Department of Aerospace Engineering", style = style_degree),
                                                                         div("Minor in Statistics, Department of Statistics", style = style_degree))),
                                                                               br(), br(),
                                                                      fluidRow(width = 12, column(width = 1, br(), tags$img(src = "CAUC.png", width = 120)), 
                                                                       column(width =11, 
                                                                               br(),
                                                                               div("Civil Aviation University of China", style = style_school), 
                                                                               div("September 2013 - May 2016", style = style_time),
                                                                               div("M.S in Air Traffic Management, College of Air Traffic Management", style = style_degree))),br(), br(),
                                                                    fluidRow(width = 12, column(width = 1, br(), tags$img(src = "NUIST.png", width = 120)), 
                                                                      column(width =11, 
                                                                br(),
                                                                div("Nanjing University of Information Science and Technology", style = style_school), 
                                                                div("September 2008 - June 2012", style = style_time),
                                                                div("B.S in Geographic Information System, School of Geographic Science", style = style_degree))),br(), br()
                                                )),
                      # tab of work exprience
                      tabPanel("WORK EXPERIENCE", box(width = 12, height = 1300, solidHeader = TRUE, 
                                                      fluidRow(width = 12,   
                                                                      column(width =12, 
                                                                             br(),
                                                                             div("Department of Aerospace Engineering", style = style_work_dep), 
                                                                             div("Iowa State University", style = style_work_fac),
                                                                             div("Research Assistant, August 2016 - Present", style = style_work_title),
                                                                             p(strong("Methods:"), "Data Mining, Machine Learning, Statistical Learning.", style = style_work_ind),
                                                                             p(strong("Applications:"), "Air Transportation, Air Traffic Control & Management, Airline Operation, Air TrafficModeling and Simulation, Human Factors in Air Traffic Control.", style = style_work_ind))),br(),
                                                      fluidRow(width = 12,   
                                                               column(width =12, 
                                                                      br(),
                                                                      div("Research Development & Human Factors Laboratory", style = style_work_dep), 
                                                                      div("FAA William J. Hughes Technical Center", style = style_work_fac),
                                                                      div("Research Intern, May - August 2018", style = style_work_title),
                                                                      p(strong(strong("ECAMP Maneuver Classifier Test Trajectory Database"), style = style_work_ind),
                                                                      p("- Built simulation scenarios and events in TGF for different maneuvers (holding, turning, deviationand vertical maneuvers).  Built simulation based test trajectories.", style = style_work_ind),
                                                                      p("- Built maneuver identification algorithms for different maneuvers.  Built historical data based testtrajectories.", style = style_work_ind)),
                                                                      p("- Submitted ECAMP Maneuver Classifier Test Trajectory Database user manual.", style = style_work_ind),
                                                                      p(strong("Algorithm for crossing point calculation"), style = style_work_ind),
                                                                      p("- Built the algorithm for crossing point calculation of track and sectors under big data context.", style = style_work_ind))),br(),
                                                      fluidRow(width = 12,   
                                                               column(width =12, 
                                                                      br(),
                                                                      div("Office of Aviation Policy and Plans", style = style_work_dep), 
                                                                      div("FAA Headquarters", style = style_work_fac),
                                                                      div("Research Intern, May - August 2017", style = style_work_title),
                                                                      p(strong("Air Transportation Direct Share Forecast"), style = style_work_ind),
                                                                      p("- BuiltdirectSharedatabase based on data mining on DB1B, T100, Global Insight database.", style = style_work_ind),
                                                                      p("- BuiltdirectShareforecast model based on machine learning techniques.", style = style_work_ind))),br(),
                                                      fluidRow(width = 12,   
                                                               column(width =12, 
                                                                      br(),
                                                                      div("Department of Air Traffic Control", style = style_work_dep), 
                                                                      div("Northwest Regional Administration of CAAC", style = style_work_fac),
                                                                      div("Research Intern, July - August 2014", style = style_work_title),
                                                                      p(strong("Evaluation of Xian Terminal Airspace Planning"), style = style_work_ind),
                                                                      p("- Simulated the air traffic flow in Xi'an terminal airspace based on historical trajectories.", style = style_work_ind),
                                                                      p("- Evaluated the new plan of Xian terminal airspace based on simulation.", style = style_work_ind),
                                                                      p("- Finished chapters of the evaluation report.", style = style_work_ind))),br(), 
                                                      fluidRow(width = 12,   
                                                               column(width =12, 
                                                                      br(),
                                                                      div("Department of New Tech Development", style = style_work_dep), 
                                                                      div("Tian Hang Chuang Li (THCL) Technology Co., Ltd", style = style_work_fac),
                                                                      div("Algorithm & Software Engineer, July 2012 - August 2013", style = style_work_title),
                                                                      p("- In charge of Airspace Information Display Platform building in both 2D and 3D version using OpenGL and EV-Globe.", style = style_work_ind),
                                                                      p("- ADS-B data unpacking algorithm programming and data processing.", style = style_work_ind),
                                                                      p("- Air traffic control simulation software interface programming and testing.", style = style_work_ind))),br(),br()
                      )),
                      # tab of RESERCH EXPERIENCE
                      tabPanel("RESERCH EXPERIENCE", box(width = 12, height = 1600, solidHeader = TRUE, 
                                             fluidRow(width = 12,   
                                                      column(width =12, 
                                                             br(),
                                                             div("Air Transportation Direct Share Forecast", style = style_project_name), 
                                                             div("Collaboration with FAA, September 2016 - April 2018", style = style_project_time),
                                                             div("- Analysis of characteristics of O&DdirectSharebased on data mining on DB1B database, T100 databaseand Global Insight database.", style = style_project_ind),
                                                             div("- DirectShare modeling based on multiple machine learning and and statistical learning methods.", style = style_project_ind),
                                                             div("- DirectShare modeling based on time series models.", style = style_project_ind),
                                                             div("- Category based learning method, which is newly proposed in this research.", style = style_project_ind))),br(),
                                             fluidRow(width = 12,   
                                                      column(width =12, 
                                                             br(),
                                                             div("Schedule Connection Stability", style = style_project_name), 
                                                             div("Collaboration with American Airlines, October 2016 - October 2017", style = style_project_time),
                                                             div("- Definition and modeling of schedule connection stability which can reflect the swapping rate in schedules.", style = style_project_ind),
                                                             div("- DirectShare modeling based on multiple machine learning and and statistical learning methods.", style = style_project_ind),
                                                             div("- Data mining on AOTP database.", style = style_project_ind),
                                                             div("- Operation performance comparison of AA and other airlines based on on-time performance data.", style = style_project_ind))),br(),
                                             fluidRow(width = 12,   
                                                      column(width =12, 
                                                             br(),
                                                             div("Analysis of Air Traffic Controllers Cognitive Load", style = style_project_name), 
                                                             div("October 2015 - March 2016", style = style_project_time),
                                                             div("- Analysis of relation between controllers workload and cognitive load, both of eye ball movement andphysiological features were considered.", style = style_project_ind),
                                                             div("- Human-in-loop experiment design and environment building.", style = style_project_ind),
                                                             div("- Experiment data processing and analysis.", style = style_project_ind))),br(),
                                             fluidRow(width = 12,   
                                                      column(width =12, 
                                                             br(),
                                                             div("Multi-Runway Airport Capacity Evaluation", style = style_project_name), 
                                                             div("Collaboration with Xian Xianyang International Airport, November 2014 - August 2016", style = style_project_time),
                                                             div("- Analysis of air traffic flow time series and modeling of separation margins", style = style_project_ind),
                                                             div("- Modeling  DEP  &  ARR  time  scheme  based  on  multi-runway  plan,  ATC  principles,  and  separationmargins.", style = style_project_ind))),br(),
                                             fluidRow(width = 12,   
                                                      column(width =12, 
                                                             br(),
                                                             div("Nonlinear Characteristics of Air Traffic System", style = style_project_name), 
                                                             div("Masters Thesis, November 2014 - February 2016", style = style_project_time),
                                                             div("- Data mining on radar and ADS-B trajectory data.  Analysis of characteristics of traffic flow at en-routeintersects.", style = style_project_ind),
                                                             div("- Nonlinear time series analysis of converging routes traffic flow.", style = style_project_ind))),br(),
                                             fluidRow(width = 12,   
                                                      column(width =12, 
                                                             br(),
                                                             div("Air Traffic Flow Pattern Recognition", style = style_project_name), 
                                                             div("November 2014 - August 2016", style = style_project_time),
                                                             div("- Spatial pattern recognition of arrival traffic flow in terminal airspace using wavelet clustering method.", style = style_project_ind),
                                                             div("- Temporal  pattern  recognition  of  arrival  traffic  flow  in  terminal  airspace  using  immune  optimizationalgorithm.", style = style_project_ind))),br(),
                                             fluidRow(width = 12,   
                                                      column(width =12, 
                                                             br(),
                                                             div("Functionality Oriented Airspace Sectorization", style = style_project_name), 
                                                             div("November 2014 - August 2016", style = style_project_time),
                                                             div("- Definition of sector functionality.", style = style_project_ind),
                                                             div("- Data mining on radar trajectory data.", style = style_project_ind),
                                                             div("- Airspace sectorization of internal and external sectors using genetic algorithm.", style = style_project_ind))),br(),
                                             fluidRow(width = 12,   
                                                      column(width =12, 
                                                             br(),
                                                             div("Flight Routes Design and Evaluation System", style = style_project_name), 
                                                             div("September 2012 - December 2012", style = style_project_time),
                                                             div("- Flight routes searching and optimization algorithm.", style = style_project_ind),
                                                             div("- Airspace information display platform building in both 2D&3D version using Open GL and EV-Globe.", style = style_project_ind))),br(),
                                             fluidRow(width = 12,   
                                                      column(width =12, 
                                                             br(),
                                                             div("Terminal Airspace Sectors Design and Evaluation System", style = style_project_name), 
                                                             div("July 2012 - December 2012", style = style_project_time),
                                                             div("- Partition algorithm for internal and external sectors.", style = style_project_ind),
                                                             div("- Software programming and testing.", style = style_project_ind))),br())),
                                             
                                             
                      # tab of skills
                      tabPanel("SKILLS", box(width = 12, hight = 12, solidHeader = TRUE, 
                                             fluidRow(width = 12, column(width = 4, box(width = 12, title = "PROGRAMMING", solidHeader = TRUE, status = "primary", 
                                                                                       flowLayout(tags$img(src = "R.png", height = 100 , title = "R"),
                                                                                                  tags$img(src = "python.png", height = 100,  title = "Python"),
                                                                                                  tags$img(src = "MATLAB.png", height = 100,  title = "MATLAB"),
                                                                                                  tags$img(src = "csharp.png", height = 100,  title = "Visual C#"),
                                                                                                  tags$img(src = "JS.png", height = 100, title = "JavaScript")),
                                                                                       br())),
                                                                         column(width =4, box(width = 12,title = "GIS DEVELOPMENT & APPLICATION", solidHeader = TRUE, status = "warning",
                                                                                        flowLayout(tags$img(src = "ARCGIS.png", height = 100 , title = "Arc GIS"),
                                                                                                   tags$img(src = "openGL.png", height = 70,  title = "Openg GL"),
                                                                                                   tags$img(src = "EVGLOBE.png", height = 70,  title = "EV-GLOBE")),
                                                                                        br())),
                                                                         column(width =4, box(width = 12,title = "DATA MINING EXPERIENCE", solidHeader = TRUE, status = "info",
                                                                                              div("radar trajectories, ADS-B trajectories, TGF simulation data, ERAM trajectories", style = style_datatype),
                                                                                              p(a("Airline Origin and Destination Survey (DB1B)", href = "https://www.transtats.bts.gov/DatabaseInfo.asp?DB_ID=125"), style = style_datatype),
                                                                                              p(a("Air Carrier Statistics Database (T-100)", href = "https://www.transtats.bts.gov/DatabaseInfo.asp?DB_ID=125"), style = style_datatype),
                                                                                              p(a("Airline On-Time Performance Data (AOTP)", href = "https://www.transtats.bts.gov/Tables.asp?DB_ID=120"), style = style_datatype)))))),
                      # tab of publications
                      tabPanel("PUBLICATIONS & PRESENTATION", box(width = 12, solidHeader = TRUE, 
                                                   fluidRow(width = 12, box(solidHeader = TRUE, p("PUBLICATION", style = ("font-family: Impact, Charcoal, sans-serif;font-size: 20px; font-weight:100; line-height:1.5 ;color: MediumTurquoise;"))),
                                                                   box(width = 12, solidHeader = FALSE, status = "info",  
                                                                   br(),
                                                                   p("1. Xufang Zheng,  Chia-Mei Liu,  Peng Wei.", em("Air Transportation Direct Share Forecast"),", Under review of AIAA Air Transportation, October 2018", style = style_Pulication), br(),
                                                                   p("2. Chao Wang, Xufang Zheng, Lei Wang.", em("Research on Nonlinear Characteristics of Air Traffic Flows onConverging Air Routes"),", Journal of Southwest Jiaotong University 52(1):171-178", style = style_Pulication), br(),
                                                                   p("3. Chao Wang, Xufang Zheng, Ning Bu.", em("Pattern Recognition of Approach Landing trajectories in Termial Airspace Based on Wavelet Cluster"), ", 33(11):112-116", style = style_Pulication), br(),
                                                                   p("4. Zheng Xufang, Wang Chao.", em("Arrival Pattern Recognition of Terminal Airspace Traffic Flow"),", Aeronau-tical Computing Technique, 2015, 45(3):67-71.", style = style_Pulication), br(),
                                                                   p("5. Wang Chao, Zheng Xufang.", em("Functionality  Oriented  Partitioning  of  Internal  and  External  Sectors  inTerminal Airspace"),", U-China Aeronautical Cooperation Greener Aeronautics International NetworkingII GRAIN2, 2015, Xian China:306-321.", style = style_Pulication), br(),
                                                                   p("6. Lei Wang, Xufang Zheng, Chao Wang.", em("Estimation Method of Air Traffic Fuel Consumption Based on Trajectory Pattern Recognition"),", Aeronau-tical Computing Technique, 2015, 45(6):60-63.", style = style_Pulication), br())),
                                                   fluidRow(width = 12, box(solidHeader = TRUE, p("PRESENTATION", style = ("font-family: Impact, Charcoal, sans-serif;font-size: 20px; font-weight:100; line-height:1.5 ;color: MediumTurquoise;"))),
                                                            box(width = 12, solidHeader = FALSE, status = "info",  
                                                                br(),
                                                                p("Xufang Zheng, ", em("Air Transportation Direct Share Forecast"), ", 2018 INFORMS Annual Meeting, November 2018, Phoenix, AZ."),style = style_Pulication), br())
                                                                
                                                            )))),
  tabItem(tabName = "directShare", sidebarLayout(mainPanel = box(width =8, height = 1000, leafletOutput("directShareMap")),
                                                 sidebarPanel()))))


   


# Define UI for application that draws a histogram
ui <- dashboardPage(
   header = header_my,
   sidebar =  dashboardSidebar_my,
   body = dashboardBody_my,
   title = "Xufang Zheng",
   skin = "black"
   
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$directShareMap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles(providers$Stamen.TonerLite,
                       options = providerTileOptions(noWrap = TRUE)
      )
  })
}


# Run the application 
shinyApp(ui = ui, server = server)

