<!-- badges: start -->

[![lifecycle](https://img.shields.io/badge/lifecycle-paused-orange.svg)](https://www.tidyverse.org/lifecycle/#paused)

<!-- badges: end -->


# MioMap Ingest Script

MioMap (the Miocene Mammal Mapping Project) is a MySQL database of vertebrate fauna for the Miocene; more information can be found on the [MioMap webpage](http://www.ucmp.berkeley.edu/miomap/).  The database is hosted by the [University of California Museum of Paleontology](http://www.ucmp.berkeley.edu/).

As part of a project underway, MioMap will become a constituent database within Neotoma.  This actvity requires two steps:

1. Initial cross-walk from MioMap SQL data structure to Tilia format.
2. Stewardship & upload to Neotoma.

The Tilia file format is an XML file, with a defined schema, included in the [Tilia GitHub Repository](https://github.com/NeotomaDB/Tilia).  The *MIOMAP_Ingest* repository is intended to address Item 1 in the two stage upload process.

## Contribution

*We welcome contributions from any individual, whether code, documentation, or issue tracking.  All participants are expected to follow the [code of conduct](https://github.com/Neotomadb/MIOMAP_Ingest/blob/master/code_of_conduct.md) for this project.*

+ [Simon Goring](http://goring.org) - University of Wisconsin-Madison, Department of Geography

## Using This Repository

### Missing Files

All files in this repository are used to generate the required Tilia output files, however, two files are excluded.  One is the required MIOMAP MySQL database.  This file may be generated using the [MIOMAP Download Page](http://www.ucmp.berkeley.edu/faunmap/use/datadownload.html).  The process for converting Excel is described elsewhere (see for example this [Guide for Exporting XLS to MySQL](https://dev.mysql.com/doc/mysql-for-excel/en/mysql-for-excel-export.html)).

Along with the database itself is a file called `hidden.txt`.  This file should live within the home directory and contain three text strings, the name of the database, the user name and the password, as such:

```
miomap
root
password
```

This file is hidden using `.gitignore` so that individuals don't accidentally reveal their passwords.  Please keep this file hidden.

### Other Files

The core file in this repository is the `MiomapIngest_asList.Rmd`.  The file is a prototype at present.  It serves to connect to the MySQL database, query the database for each fossil element, and then convert the data structure to the appropriate Tilia fields for conversion to the `TLX` format.

The output `TLX` files are put into the `outputs` folder.

The file is written as an `Rmd` to provide more detail into the decision making process around the cross-walk, but at present the focus has been on getting a workflow developed that will allow a basic TLX file to be generated.