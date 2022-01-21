
<!-- README.md is generated from README.Rmd. Please edit that file -->

# features_creator

Helper functions to create new features for temporal data.

## Contributors

-   Nikita Shymberg
-   Rakesh Pandey
-   Son Chau
-   Wenjia Zhu

## Description

This package aims to speed up and simplify the process of feature
engineering for temporal (e.g. weekly or monthly) data. It works with
dataframes that have columns whose names follow a pattern and end with a
number. For example payment_week_1, payment_week_2, … For such datasets,
commonly engineered features include, among others, the percentage
change across time periods, the average across time periods, and the
standard deviation across time periods.

This package defines the following four functions:

-   `get_matching_column_names`: Returns a subset of the columns whose
    names match the pattern. This is a prerequisite for the feature
    engineering
-   `calculate_average`: Returns the average value across matching
    columns for each row.
-   `calculate_standard_deviation`: Returns the stadard deviation across
    matching columns for each row.
-   `calculate_percentage_change`: Returns the percent change across
    consecutive time periods for each row.

### How does this package fit into the existing ecosystem?

There are several existing packages that work with time series data. For
example, the
[tsfeatures](https://cran.r-project.org/web/packages/tsfeatures/vignettes/tsfeatures.html)
package use functions to extract features from time series data. Other
package such as [tscompdata](https://github.com/robjhyndman/tscompdata)
is useful for comparing time series data.

For datasets that have columns that follow the pattern `quantity_1`,
`quantity_2`, … `featurescreator` is the simplest package for
engineering features.

## Installation

You can install the development version of regexcite from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/featurescreator")
```

## Usage

-   TODO

## Contributing

Interested in contributing? Check out the contributing guidelines.
Please note that this project is released with a Code of Conduct. By
contributing to this project, you agree to abide by its terms.

## License

`featurescreator` was created by DSCI_524_GROUP26. It is licensed under
the terms of the MIT license.

## Credits

`featurescreator` was based on tutorial
[`The whole game`](https://r-pkgs.org/whole-game.html) by [Hadley
Wickham and Jenny Bryan](https://r-pkgs.org/index.html).
