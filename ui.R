library(shiny)


fluidPage(
  
    titlePanel(" Statistical Inference Class || A Simple Example of Exponential Distribution"),
    
    sidebarLayout(
      sidebarPanel( 
        h5("To begin, select sample,simulation size and Lambda value, by sliding the Slider Bar"),
        h5("Default values have been selected for each variable"),
                    sliderInput(inputId = "num_sample",label = "Select Your Sample Size", value = 10, step = 10, min = 10, max = 100),
                    sliderInput(inputId = "num_sims",label = "Select Your Simulation Size", value = 1000, step = 1000, min = 1000, max = 5000),
                    sliderInput(inputId = "num_lambda",label = "Select Your Lambda Values", value = 0.1, step = 0.1, min = 0.1, max = 0.5)
      ),
      
      mainPanel(
      h4("This app demonstrate examples of Exponential Distribution using Histogram. When the value of sample size increase,the distribution spread wider and the distribution of the sample variance become more concentrate and Gaussian"),
      h5("Please be patient, for first time loading, it will take some time for the histogram to appear "),
      h5("Table Tab shows data of means of exponential data for N sample & simulation size you have selected "),          
      
      tabsetPanel(
        
          tabPanel("Plot", plotOutput("graph")), 
          tabPanel("Table", tableOutput("table"))
        )
      )))