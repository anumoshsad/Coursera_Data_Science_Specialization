library(shiny)
library(markdown)

shinyUI(fluidPage(
  
    titlePanel("Text Prediction App"),
    sidebarLayout(
        sidebarPanel(
            textInput("text.input", "Enter your text:", ""),
            #actionButton("text.input", "Predict my next word!"),
            radioButtons("model", "Select Model:",
                   c("Simple N-gram Model" = 1,
                     "Katz Back-off Model" = 2)),
        
            submitButton("Predict My Word!")    
        ),
        
        mainPanel(
            h3("Predicted Next Word:"),
            h3(verbatimTextOutput("next_word")),
            
            hr(),
            h4("Reference:"),
            helpText(a("1. Milestone Report", href="http://rpubs.com/anumoshsad/253342",
                                          target="_blank")
                    ),
            
            helpText(a("2. Katz Back-off Model", href="http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.129.7219",
                                          target="_blank")
                     ),
           
            helpText(a("3. N-gram", href="https://en.wikipedia.org/wiki/N-gram",
                                          target="_blank")
                     ),
            
            hr(),
            img(src = "coursera_logo.png"),
            hr()
        )
    )
)
)
