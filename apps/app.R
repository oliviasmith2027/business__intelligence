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
  # add extra instructions, data_desc
)

qc$app_obj()
