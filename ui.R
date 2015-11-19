library(shiny)
shinyUI(fluidPage(
  titlePanel(h1("Exploring Titanic")),
  
  sidebarLayout(
    sidebarPanel(
      #"Sidebar Panel"
      
      fluidRow(
        
        column(5,
               h3("Analyzing Survival in Titanic Disaster"),
               helpText("Filter the Dataset based on Crew, Sex and Age."))
        
      ),
      
      fluidRow(
        
        column(5,
               radioButtons("rbtnFilterData", label = h3("Filter Data?"),
                            choices = list("No" = "No", "Yes" = "Yes"),
                            selected = "No"))
        
        
      ),
      
      fluidRow(
        
        column(5,
               radioButtons("rbtnClass", label = h3("Class"),
                            choices = list("Crew" = "Crew", "1st" = "1st",
                                           "2nd" = "2nd", "3rd" = "3rd"),
                            selected = "Crew"))
        
        
      ),
      
      fluidRow(
        
        column(5,
               selectInput("ddSex", label = h3("Sex"),
                           choices = list("Male" = "Male", "Female" = "Female"),
                           selected = "Male"))
        
      ),
      
      fluidRow(
        
        column(5,
               selectInput("ddAge", label = h3("Age"),
                           choices = list("Adult" = "Adult", "Child" = "Child"),
                           selected = "Adult"))
        
      ),
      
      fluidRow(
        
        column(5,
               h3(""),
               #actionButton("action", label = "Action"),
               #br(),
               #br(),
               submitButton("Submit"))
        
      )
      
      
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Documentation", htmlOutput("help1")),
        tabPanel("Selected Values", htmlOutput("selected1")),        
        tabPanel("Data Grid", dataTableOutput("table1")),
        tabPanel("Plot", plotOutput("plot1"))
      )
    )
  )
  
  
))