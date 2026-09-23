---
  title: "Houston Housing Market"
author: "Naaz Parvaz"
format: pdf
---
  # An Overview of Housing Trends in Houston 
  ## Annual Houses Sold in Houston, TX
  ```{r}

if(!require("tidyverse")) install.packages("tidyverse")
library(tidyverse)
txhousing |> 
  filter(city=="Houston") |> 
  group_by(year) |> 
  summarize(sales=sum(sales)) |> 
  ggplot(aes(x=year, y=sales)) + 
  geom_line() + 
  ggtitle("Annual Houses Sold in Houston, TX")
```

## Average Price of Houses Sold in Texas by Month
```{r}
if(!require("tidyverse")) install.packages("tidyverse")
library(tidyverse)
txhousing |> 
  filter(city=="Houston") |> 
  group_by(month) |> 
  summarize(avg_price=sum(volume) / sum(sales)) |> 
  mutate(month=factor(month.abb[month], 
                      levels=month.abb, ordered=TRUE)) |>
  ggplot(aes(x=month, y=avg_price)) + 
  geom_bar(stat="identity") + 
  ggtitle("Average Price of Houses Sold in Texas by Month") + 
  xlab("Month") + 
  ylab("Average Sale Price") + 
  scale_y_continuous(labels = scales::dollar)
```

## Average Price of Houses Sold in 2015 by City in Texas
```{r}
if(!require("tidyverse")) install.packages("tidyverse")
library(tidyverse)
txhousing |> filter(year==2015) |> 
  group_by(city) |> 
  summarize(avg_price=sum(volume) / sum(sales),
            num_sales=sum(sales)) |> 
  slice_max(num_sales, n=10) |>
  ggplot(aes(x=city, y=avg_price)) + 
  geom_bar(stat="identity") + 
  ggtitle("Average Price of Houses Sold in 2015 by City in Texas") + 
  xlab("City") + 
  ylab("Average Sale Price") + 
  scale_y_continuous(labels = scales::dollar)
```