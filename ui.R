#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny) 
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Body Mass Index (BMI) Calculator"),
    
    sidebarPanel(
      numericInput('weight', 'Enter your weight in pounds', 100) ,
      numericInput('height', 'Enter your height in inches', 60, min = 50, max = 100, step = 10),
      submitButton('Calculate BMI')
    ), 
    mainPanel(
      p('The Body mass index (BMI) is a measure of body fat based on height and weight that applies to both men and women between the ages of 18 and 65 years.'),
      p('BMI can be used to indicate if you are overweight, obese, underweight or normal. A healthy BMI score is between 20 and 25.'),
      p('The World Health Organization (WHO) proposes the following classification for BMI Measure:'),
      tags$div(
        tags$ul(
          tags$li('BMI <18.5       : Underweight'),
          tags$li('BMI [18.5-24.9] : Normal weight'),
          tags$li('BMI [25-29.9]   : Overweight'),
          tags$li('BMI >=30        : Obesity')
        )
      ),
      
      h3('Calculating BMI based on values entered:'), 
      p('weight in pounds:'), verbatimTextOutput("inputweightvalue"),
      p('height in inches:'), verbatimTextOutput("inputheightvalue"),
      h4('Your BMI is:'),
      verbatimTextOutput("estimation"),
      p('It means that you are:'),strong(verbatimTextOutput("diagnostic"))
      
      
    )
    
  )   
)