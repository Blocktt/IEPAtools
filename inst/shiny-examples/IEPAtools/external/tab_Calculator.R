function(){
  tabPanel("Calculator",
           # SideBar
           sidebarLayout(
             sidebarPanel(
               h3("App Steps")
               , h4("1. Load File")
               , h5("Select file parameters")
               , radioButtons('sep', 'Separator'
                              ,c(Comma=',',
                                 Semicolon=';',
                                 Tab='\t'),
                              ',')
               , radioButtons('quote', 'Quote',
                              c(None='',
                                'Double Quote'='"',
                                'Single Quote'="'"),
                              '"')
               , fileInput('fn_input', 'Choose file to upload',
                           accept = c(
                             'text/csv',
                             'text/comma-separated-values',
                             'text/tab-separated-values',
                             'text/plain',
                             '.csv',
                             '.tsv'
                           )
               )##fileInput~END
               , h4("2. Calculate IBI")
               , h5("IEPA Macroinvertebrate IBI")
               , actionButton("b_Calc", "Calculate Metric Values and Scores")
               , tags$hr()
               , h4("3. Download Results")

               # Button
               , p("Select button to download zip file with input and results.")
               , p("Check 'results_log.txt' for any warnings or messages.")
               , useShinyjs()
               , shinyjs::disabled(downloadButton("b_downloadData", "Download"))

             )##sidebarPanel~END
             , mainPanel(
               tabsetPanel(type="tabs"
                           , tabPanel("Data, Import"
                                      , DT::dataTableOutput('df_import_DT'))
               )##tabsetPanel~END
             )##mainPanel~END

           )##sidebarLayout~END

  )## tabPanel~END
}##FUNCTION~END
