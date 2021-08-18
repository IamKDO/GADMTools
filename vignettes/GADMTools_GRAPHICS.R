## ----message=FALSE, warning=FALSE, fig.align='center', fig.height=7-----------
library(GADMTools)
data("Corsica")

plotmap(Corsica) %>% gadm_showNorth("tl")

## ----message=FALSE, warning=FALSE, fig.align='center', fig.height=7-----------
library(GADMTools)
data("Corsica")

plotmap(Corsica) %>% gadm_showNorth("tl") %>% gadm_showScale("bl")

## -----------------------------------------------------------------------------
# Preparing data.frame
# --------------------
data("Corsica")

Corse <- gadm_union(Corsica, 0)
Cantons <- listNames(Corsica, 4)
L <- length(Cantons)
Pop <- floor(runif(L, min=15200, max=23500))

longitude <- runif(6, min=8.74, max = 9.25)
latitude  <- runif(6, min=41.7, max = 42.6)
Cases <- floor(runif(6, 25, 80))

Type <- rep(c("TYPE A", "TYPE B", "TYPE C"), 6, length.out = 6)
DAT <- data.frame(longitude, latitude, Cases)


## ----fig.align='center', fig.height=7, fig.cap="Simple dots", fig.pos="h", out.extra=""----
# Simple dots
#--------------------------------------------------------------------
dots(Corsica, DAT, color="red", size = 3)


## ----fig.align='center', fig.height=7, fig.cap="Classified dots", fig.pos="h", out.extra=""----

# Classified dots
#--------------------------------------------------------------------
dots(Corse, points = DAT, 
     palette = "Reds",
     value="Cases")

## ----fig.align='center', fig.height=7, fig.cap="Typed dots", fig.pos="h", out.extra=""----
# Typed points
#--------------------------------------------------------------------
DAT2 <- data.frame(longitude, latitude, Type)
dots(Corse, points = DAT2, 
     color = "#ee00ee",
     strate="Type")

## ----fig.align='center', fig.height=7, fig.cap="propDots", fig.pos="h", out.extra=""----
# Test of propDots with default parameters
# ------------------------------------------------------------------------------
propDots(Corse, 
         data = DAT, 
         value="Cases",
         color = "blue")

## ----fig.align='center', fig.height=7, fig.cap="propDots with provided breaks", fig.pos="h", out.extra=""----
# Test of propDots with defined breaks
# ------------------------------------------------------------------------------
propDots(Corse, 
         data = DAT,
         value="Cases", breaks=c(30, 40, 50, 70, 100),
         color = "blue")


## ----fig.align='center', fig.height=7, fig.cap="propDots", fig.pos="h", out.extra=""----
# Test of propDots with forced range of breaks
# ------------------------------------------------------------------------------
propDots(Corse, data = DAT, value="Cases",
         breaks=c(0, 25, 50, 75, 100), 
         range = c(25, 100))


## ----fig.align='center', fig.height=7, fig.cap="classDots", fig.pos="h", out.extra=""----
library(GADMTools)

classDots(Corse, DAT, color="blue", value = "Cases", steps = 4)


## ----message=FALSE, fig.align='center', fig.height=5.3, fig.cap="Dot-Density", fig.pos="h", out.extra=""----
library(GADMTools)
data("Corsica")

# Creates test data.frame -------------------------------------------------
# --------------------------------------------------------------------------
VAR_1 <- as.integer(runif(n = 43, min = 800, max = 15800))
VAR_2 <- as.integer(runif(n = 43, min = 1000, max = 15800))
VAR_3 <- as.integer(runif(n = 43, min = 1500, max = 15800))
Cantons <- listNames(Corsica, 4)
DF <- data.frame(Cantons, VAR_1, VAR_2, VAR_3, stringsAsFactors = FALSE)

dotDensity(Corsica,
                DF, adm.join="Cantons", dot.size = 0.5, cases.by.dots = 1000,
                values = c("VAR_1", "VAR_2", "VAR_3"),
                labels = c("H1N1", "H1N2", "H2N2"),
                palette = c("#ffff00", "#ffaa00", "#FF3200"))



## ----fig.align='center', fig.height=7, fig.cap="Isopleth", fig.pos="h", out.extra=""----
library(GADMTools)

isopleth(Corse, data = DAT, palette = "Blues")

## ----message=FALSE, fig.align='center', fig.height=7, fig.cap="Choropleth", fig.pos="h", out.extra=""----
DAT <- data.frame(Cantons, Pop, stringsAsFactors = FALSE)
choropleth(Corsica, data = DAT, value = "Pop", adm.join = "Cantons",
           breaks = "sd", palette = "Greens")

## ----eval=FALSE,  fig.pos="h", out.extra=""-----------------------------------
#  MAP <- gadm_sp_loadCountries("BEL", level = 3, simplify=0.01)
#  DAT = read.csv2("BE_clamydia_incidence.csv")
#  
#  # Rewriting District names
#  # ------------------------
#  DAT$district <- as.character(DAT$district)
#  DAT[7,1] = "Brussel"
#  DAT[20,1] <- "Liège"
#  DAT[22,1] = "Marche-en-Famenne"
#  DAT[27,1] = "Neufchâteau"
#  DAT <- rename(DAT, NAME_3 = district)
#  
#  
#  fast.choropleth(MAP, DAT,
#                  adm.join = "NAME_3",
#                  value = "rate03",
#                  steps = 4,
#                  breaks = "jenks",
#                  palette="Greens",
#                  legend = "Incidence",
#                  title="Chlamydia incidence by Belgian district (2003)")

