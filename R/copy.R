#' Copy Simulated Datasets
#' 
#' @param path_from A string of the path to the directory containing the simulated datasets.
#' @param path_to A string of the path to the directory to copy the simulated dataset to.
#' @param exists A flag specifying whether \code{path_to} should already exist.
#' If \code{exists = NA} it doesn't matter. If the directory already exists 
#' sims compatible files are deleted if \code{exists = TRUE} or \code{exists = NA} otherwise an
#' error is thrown.
#' @param ask A flag specifying whether to ask before deleting files.
#' @param silent A flag specifying whether to suppress warnings.
#' @return A character vector of the names of the files copied.
#' @export
sims_copy <- function(path_from = "sims", path_to = paste0(path_from, "_copy"), 
                      exists = FALSE, ask = getOption("sims.ask", TRUE), 
                      silent = FALSE) {
  if(is_chk_on()) {
    chk_string(path_to)
    chk_string(path_from)
    chk_lgl(exists)
    chk_flag(ask)
    chk_flag(silent)
    sims_check(path_from)
  }
  create_path(path_to, exists = exists, ask = ask, silent = silent)
  files <- data_files(path_from)
  file.copy(file.path(path_from, c(".sims.rds", files)), to = path_to)
  files
}