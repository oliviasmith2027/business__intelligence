# Midwest Airbnb Listings: Data Dictionary

**Dataset:** `listings` table in `midwest_airbnb.db` (SQLite), 14,887 rows and 29 columns **Source:** Inside Airbnb (<https://insideairbnb.com/get-the-data/>), the detailed `listings.csv.gz` file for each of three regions: Chicago (snapshot 2026-07-20), Columbus (snapshot 2026-07-23), and Twin Cities MSA (snapshot 2026-07-21). Column meanings follow Inside Airbnb's data dictionary and assumptions (<https://insideairbnb.com/data-assumptions/>). **Course:** ISA 401, Miami University

> One row is one listing that showed a nightly price on the snapshot date; listings with no price were dropped. Empty cells are stored as SQL `NULL`.

------------------------------------------------------------------------

## Field Definitions

| Field | Type | Description |
|------------------------|------------------------|------------------------|
| `city` | text | Which Inside Airbnb region the listing came from: `Chicago` (7,439 rows), `Columbus` (2,587), or `Twin Cities` (4,861). The Twin Cities file covers the Minneapolis-St. Paul metro area, not just the two cities. |
| `snapshot_date` | text | Date Inside Airbnb compiled the file, stored as an ISO text string, not a date: `2026-07-20` for Chicago, `2026-07-23` for Columbus, `2026-07-21` for Twin Cities. Every row of a city shares the same value. |
| `id` | text | Airbnb's listing id. Unique across the table (14,887 distinct values). Stored as text even though it looks numeric, so compare it to a quoted string. |
| `name` | text | Listing title as shown on Airbnb (for example "Tiny Studio Apartment 94 Walk Score"). Never empty. |
| `price` | real | Nightly price in U.S. dollars on the snapshot date, with the dollar sign and commas removed. Ranges from 2.56 to 11,412; never `NULL` (rows without a price were dropped). |
| `room_type` | text | Airbnb's four listing categories: `Entire home/apt` (11,652 rows), `Private room` (2,951), `Hotel room` (246), or `Shared room` (38). |
| `host_id` | text | Airbnb's unique identifier for the host/user. Stored as text to maintain precise ID matching across queries. |",
| `host_name` | text | Name of the host as listed on their profile (usually just the first name or first names). |
| `host_since` | text | The date the host profile was created on Airbnb, stored as an ISO text string (`YYYY-MM-DD`). |
| `host_is_superhost` | text | Indicator of whether the host has achieved Superhost status (`t` for true, `f` for false). |
| `neighbourhood` | text | The host's self-reported neighborhood or area description as written on the listing page. |
| `latitude` | real | Geographic coordinate for latitude using the WGS84 projection system. |
| `longitude` | real | Geographic coordinate for longitude using the WGS84 projection system. |
| `property_type` | text | Self-selected property description assigned by the host (e.g., \"Entire rental unit\", \"Private room in home\"). |
| `accommodates` | integer | The maximum guest capacity allowed for the listing. |
| `bedrooms` | real | The total number of bedrooms available in the listing. |
| `beds` | real | The total number of beds available in the listing. |
| `bathrooms_text` | text | Text description of the number and type of bathrooms (e.g., \"1 bath\", \"1.5 shared baths\", \"Half-bath\"). |
| `minimum_nights` | integer | The minimum number of nights required for a single reservation. |
| `availability_365` | integer | The total number of available booking days over the next 365 days according to the listing calendar. |
| `number_of_reviews` | integer | The cumulative total number of reviews the listing has received over its lifetime. |
| `number_of_reviews_ltm` | integer | The total number of reviews received by the listing in the last 12 months (365 days). |
| `first_review` | text | The date of the oldest/first review on record for this listing, stored as an ISO text string (`YYYY-MM-DD`). |
| `last_review` | text | The date of the most recent/latest review on record for this listing, stored as an ISO text string (`YYYY-MM-DD`). |
| `review_scores_rating` | real | Overall average review rating score awarded by guests (scaled 0 to 5). |
| `reviews_per_month` | real | The calculated average number of reviews per month across the lifetime of the listing. |
| `instant_bookable` | text | Indicates whether guests can book automatically without waiting for host approval (`t` for true, `f` for false). |
| `estimated_revenue_l365d` | real | Calculated metric estimating host gross revenue over the past 365 days based on review count, average length of stay, and nightly rate. |
| `amenities_count` | integer | Calculated integer count of individual amenities provided, parsed from the listing's amenities array. |

Continue the table for the remaining 23 columns (Assignment 05): `host_id`, `host_name`, `host_since`, `host_is_superhost`, `neighbourhood`, `latitude`, `longitude`, `property_type`, `accommodates`, `bedrooms`, `beds`, `bathrooms_text`, `minimum_nights`, `availability_365`, `number_of_reviews`, `number_of_reviews_ltm`, `first_review`, `last_review`, `review_scores_rating`, `reviews_per_month`, `instant_bookable`, `estimated_revenue_l365d`, `amenities_count`.

Two hints: `neighbourhood` is Inside Airbnb's `neighbourhood_cleansed` column, and `amenities_count` is not an Inside Airbnb column; it was computed for this course as the number of items in each listing's `amenities` list. Everything else keeps its Inside Airbnb name, so the data dictionary linked above explains it.
