# 01_funct_Plots.R
# Helper functions for the preliminary visualizations and tests of the
# 2024 presidential vote analysis.
#
# Requires the tidyverse (dplyr, ggplot2, stringr) and scales, which are
# installed and loaded by 00_requirements.R.
# All functions expect the cleaned data frame `anes_cleaned`
# (see 11_DataCleaning.Rmd), which has a `vote_pres` column
# with the values "Democrat" and "Republican".


# Colors used for every vote plot in the project (same colors as the
# plots at the top of 13_Analysis.Rmd).
vote_colors <- c(Democrat = "#2166AC", Republican = "#B2182B")


# plot_vote_share()
# Stacked 100% bar chart of presidential vote share within each category of
# one categorical variable. The number of respondents in each category is
# printed under its label so small groups can be recognized.
# Inputs:
#   data  - data frame with a `vote_pres` column (e.g. anes_cleaned)
#   var   - name of the categorical variable, as a string (e.g. "race")
#   title - plot title
#   xlab  - label for the x axis
#   order - optional character vector giving the order of the categories
# Output: a ggplot object (print it, or let the Rmd chunk display it)
plot_vote_share <- function(data, var, title, xlab, order = NULL) {
  plot_data <- data %>% filter(!is.na(.data[[var]]))

  if (!is.null(order)) {
    plot_data[[var]] <- factor(plot_data[[var]], levels = order)
  }

  group_counts <- table(plot_data[[var]])

  ggplot(plot_data, aes(x = .data[[var]], fill = vote_pres)) +
    geom_bar(position = "fill") +
    scale_x_discrete(
      labels = function(x) {
        paste0(stringr::str_wrap(x, width = 14), "\n(n = ", as.integer(group_counts[x]), ")")
      }
    ) +
    scale_y_continuous(labels = scales::percent) +
    scale_fill_manual(values = vote_colors) +
    labs(
      title = title,
      x = xlab,
      y = "Share of Respondents",
      fill = "Presidential Vote"
    ) +
    theme_minimal()
}


# summarize_vote_by()
# Table with the number of respondents in each category of a variable and the
# percent of them who voted Democrat and Republican for president.
# Inputs:
#   data - data frame with a `vote_pres` column (e.g. anes_cleaned)
#   var  - name of the categorical variable, as a string
# Output: a data frame with columns <var>, n, pct_democrat, pct_republican
summarize_vote_by <- function(data, var) {
  data %>%
    filter(!is.na(.data[[var]])) %>%
    group_by(across(all_of(var))) %>%
    summarise(
      n = n(),
      pct_democrat = round(100 * mean(vote_pres == "Democrat"), 1),
      pct_republican = round(100 * mean(vote_pres == "Republican"), 1),
      .groups = "drop"
    )
}


# test_vote_association()
# Chi-square test of independence between one categorical variable and the
# presidential vote. Respondents with a missing value of the variable are
# left out, as in the tests at the top of 13_Analysis.Rmd.
# Inputs:
#   data - data frame with a `vote_pres` column (e.g. anes_cleaned)
#   var  - name of the categorical variable, as a string
# Output: the result of chisq.test() (an "htest" object)
test_vote_association <- function(data, var) {
  test_data <- data %>% filter(!is.na(.data[[var]]))
  chisq.test(table(test_data[[var]], test_data$vote_pres))
}
