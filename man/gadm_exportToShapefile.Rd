\name{gadm_exportToShapefile}
\alias{gadm_exportToShapefile}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Export to ESRI Shapefile}
\description{
Export a gadm object to an ESRI Shapefile. This function create a directory with te name provided as parameter which contains 4 files :

 - name.dbf
 
 - name.prj
 
 - name.shp
 
 - name.shx
 
 Where "name" is the name provided as parameter.
 Directory is created in the current working directory

}
\usage{
gadm_exportToShapefile(x, name)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{\bold{gadm_sp or gadm_sf Object}}
  \item{name}{\bold{character} name given to te shapefile}
}


\value{ none }

\author{Jean Pierre Decorps <jean.pierre.decorps@gmail.com>}


\examples{
# library(GADMTools)
# data("Corsica")

# gadm_exportToShapefile(Corsica, "Corse")

}

\keyword{ ~documentation }

