#' open a browser window
#' @param url that the browser opens.
#' @return opens a browser window (returns NULL)
#' @examples
#' openURL()
#' openURL("https://www.google.com")
openURL <- function(url="https://episphere.github.io/r"){
  utils::browseURL(url)
  invisible()
}

#' opens the box file browser for a directory in your default browser
#' @param id  box folder id.
#' @return opens a browser window (returns NULL)
#' @examples
#' openBoxFolder()
#' openBoxFolder(id=0)
openBoxFolder <- function(id=133596945131){
  boxr::box_auth(getOption("episphereR.box_cid"),getOption("episphereR.box_cls"))
  message(paste("folder #",id," opened in your browser",sep=""))
  openURL(paste("https://nih.app.box.com/folder/",id,sep=""))
  invisible()
}

#' opens a box file in your default browser
#' @param id  box file id.
#' @param ver box file version number
#' @return opens a browser window (returns NULL)
#' @examples
#' openBoxFile()
#' openBoxFile(id=787813783402)
openBoxFile <- function(id=787813783402,ver=NULL){
  url=paste("https://nih.app.box.com/file/",id,sep="")
  if(typeof(NULL)!="NULL"){
    url=paste(url,"?sb=/details/versions/",ver,sep="")
  }
  message(paste("browser tab opened at",url))
  openURL(url)
  invisible()
}


