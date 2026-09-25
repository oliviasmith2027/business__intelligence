# ISA 401 Job Scout Chat: ask questions, get SQL, a table, or a chart back

con = DBI::dbConnect(RSQLite::SQLite(), "data/midwest_airbnb.db") # change file

client = ellmer::chat_openai(
  model  = "gpt-5.6-luna",
  params = ellmer::params(reasoning_effort = "none")
)

qc = querychat::querychat(
  con, "listings",
  client   = client,
  tools    = c("filter", "query", "visualize"),  # visualize: charts in the chat (needs ggsql)
  # change the greeting
  greeting = "Ask me about 14,887 Airbnb listings in Chicago, Columbus, and the Twin Cities.",
  data_description   = "data/data_desc.md",
  extra_instructions = "data/extra_instructions.md"
)

qc$app_obj()

ui = page_sidebar(
  title   = "Midwest Airbnb Chat",
  theme   = bs_theme(primary = "#C3142D",
                     base_font = font_google("Roboto")),
  sidebar = qc$sidebar(width = 350),
  card(card_header(textOutput("title")),
       DT::DTOutput("table")),
  accordion(open = FALSE,
            accordion_panel("SQL", verbatimTextOutput("sql")),
            accordion_panel("About", " Midwest Airbnb listings for Chicago, Columbus, and Twin Cities; built by Olivia Smith"))
)
server = function(input, output, session) {
  vals = qc$server()
  output$title = renderText(vals$title() %||% "All postings")
  output$table = DT::renderDT(vals$df(),
                              options = list(pageLength = 10))
  output$sql   = renderText(vals$sql() %||%
                              "SELECT * FROM airbnb_listings")
}

shinyApp(ui, server)
