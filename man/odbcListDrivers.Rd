% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/odbc-drivers.R
\name{odbcListDrivers}
\alias{odbcListDrivers}
\title{List Configured ODBC Drivers}
\usage{
odbcListDrivers(
  keep = getOption("odbc.drivers_keep"),
  filter = getOption("odbc.drivers_filter")
)
}
\arguments{
\item{keep, filter}{A character vector of driver names to keep in or remove
from the results, respectively. If \code{NULL}, all driver names will be kept,
or none will be removed, respectively. The \code{odbc.drivers_keep} and
\code{odbc.drivers_filter} options control the argument defaults.

Driver names are first processed with \code{keep}, then \code{filter}. Thus, if a
driver name is in both \code{keep} and \code{filter}, it won't appear in output.}
}
\value{
A data frame with three columns.

\describe{
\item{name}{Name of the driver. The entries in this column can be
passed to the \code{driver} argument of \code{\link[=dbConnect]{dbConnect()}} (as long as the
driver accepts the argument).}
\item{attribute}{Driver attribute name.}
\item{value}{Driver attribute value.}
}

If a driver has multiple attributes, there will be one row per attribute,
each with the same driver \code{name}. If a given driver name does not have any
attributes, the function will return one row with the driver \code{name}, but
the last two columns will be \code{NA}.
}
\description{
Collect information about the configured driver names. A driver must be both
installed and configured with the driver manager to be included in this list.
Configuring a driver name just sets up a lookup table (e.g. in
\code{odbcinst.ini}) to allow users to pass only the driver name to \code{\link[=dbConnect]{dbConnect()}}.

Driver names that are not configured with the driver manager (and thus
do not appear in this function's output) can still be
used in \code{\link[=dbConnect]{dbConnect()}} by providing a path to a driver directly.
}
\section{Configuration}{


This function interfaces with the driver manager to collect information
about the available driver names.

For \strong{MacOS and Linux}, the odbc package supports the unixODBC driver
manager. unixODBC looks to the \code{odbcinst.ini} \emph{configuration file} for
information on driver names. Find the location(s) of your \code{odbcinst.ini}
file(s) with \code{odbcinst -j}.

In this example \code{odbcinst.ini} file:

\if{html}{\out{<div class="sourceCode">}}\preformatted{[MySQL Driver]
Driver=/opt/homebrew/Cellar/mysql/8.2.0_1/lib/libmysqlclient.dylib
}\if{html}{\out{</div>}}

Then the driver name is \verb{MySQL Driver}, which will appear in the \code{name}
column of this function's output. To pass the driver name as the \code{driver}
argument to \code{\link[=dbConnect]{dbConnect()}}, pass it as a string, like \code{"MySQL Driver"}.

\strong{Windows} is \href{https://learn.microsoft.com/en-us/sql/odbc/admin/odbc-data-source-administrator}{bundled}
with an ODBC driver manager.

In this example, function output would include 1 row: the \code{name} column
would read \code{"MySQL Driver"}, \code{attribute} would be \code{"Driver"}, and \code{value}
would give the file path to the driver. Additional key-value pairs
under the driver name would add additional rows with the same \code{name} entry.

When a driver is configured with a driver manager, information on the driver
will be automatically passed on to \code{\link[=dbConnect]{dbConnect()}} when its \code{driver} argument
is set. For an example, see the same section in the \code{\link[=odbcListDataSources]{odbcListDataSources()}}
help-file. Instead of configuring driver information with a driver manager,
it is also possible to provide a path to a driver directly to \code{\link[=dbConnect]{dbConnect()}}.
}

\examples{
\dontshow{if (FALSE) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
odbcListDrivers()
\dontshow{\}) # examplesIf}
}
\seealso{
\code{\link[=odbcListDataSources]{odbcListDataSources()}}
}
