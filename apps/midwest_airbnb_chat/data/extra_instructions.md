# Extra Instructions

Rules the LLM follows when it writes SQL for `listings`.

- `price` is the nightly price in U.S. dollars. When the user asks what something costs, use `price` and round money to whole dollars in the answer.

<!-- Add more rules below (Assignment 05 asks for at least three). Good candidates:
     `host_is_superhost` and `instant_bookable` are the text values 't' and 'f',
     not booleans; how to match a city name the user types; how to search `name`
     case-insensitively; and whether to ignore rows whose `review_scores_rating`
     is NULL when averaging ratings. -->
     


host_is_superhost and instant_bookable are text values 't' and 'f' rather than booleans, so filter them using character matching (e.g., == "t"). 

When matching a city name the user types, ensure the search is case-insensitive (e.g., using tolower() or str_detect with ignore_case = TRUE).

When searching the name column for keywords, perform a case-insensitive search using str_detect with ignore_case = TRUE.

When averaging review_scores_rating, ignore missing values (NA) by using na.rm = TRUE.

