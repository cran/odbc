% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/connection-pane.R
\name{odbcListObjects}
\alias{odbcListObjects}
\title{List objects in a connection.}
\usage{
odbcListObjects(connection, ...)
}
\arguments{
\item{connection}{A connection object, as returned by \code{dbConnect()}.}

\item{...}{Attributes to filter by.}
}
\value{
A data frame with \code{name} and \code{type} columns, listing the
objects.
}
\description{
Lists all of the objects in the connection, or all the objects which have
specific attributes.
}
\details{
When used without parameters, this function returns all of the objects known
by the connection. Any parameters passed will filter the list to only objects
which have the given attributes; for instance, passing \code{schema = "foo"}
will return only objects matching the schema \code{foo}.
}
