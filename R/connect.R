
#' lookup_concept - search concept dictionary for terms
#'
#' Looks in the variable label/name for a string/substring
#'
#' @param x The word/substring that you want to find.
#' @param dict The JSON dictionary
#'
#' Looks up the word/substring in JSON dictionary.  The format of the
#' dictionary is as follows.
#' {
#'   "concept_id":{
#'       "label":variable label
#'       "name": variable name
#'   }
#' }
#'
#'  See \href{https://episphere.github.io/conceptGithubActions/aggregate.json}{this example}
#'  which is the default dictionary.
#' @importFrom magrittr %>%
#' @importFrom rlang .data
#' @export
lookup_concept <- function(x,dict="https://episphere.github.io/conceptGithubActions/aggregate.json"){

  message("--- reading data from ",dict)
  concepts = jsonlite::fromJSON(dict) %>%
    purrr::imap_dfr(~  c(concept_id=.y,.x)  )  %>%
    purrr::set_names(c("concept_id","variable_label","variable_name"))

  concepts %>% dplyr::filter(grepl(x,.data$variable_label)|grepl(x,.data$variable_name))
}
