library(ggplot2)

this_base <- "fig04-16_paying-attention-data-loess-fit"

set.seed(5)

my_data <- data.frame(x = rnorm(n = 150, mean = 60, sd = 20),
                      y = rnorm(n = 150, mean = 5, sd = 20))

my_data <- subset(my_data, y > 0 )

p <- ggplot(my_data, aes(x = x, y = y)) +
  geom_point(shape = 1) +
  geom_smooth(method = "loess", formula = y ~ x, se = FALSE, colour = "black") +
  scale_x_continuous(breaks = seq(0, 100, 20), limits = c(0, 120)) +
  scale_y_continuous(breaks = seq(0, 40, 10)) +
  labs(x = "Number of Elements", y = "Average Time (minutes)") + 
  ggtitle("Fig 4.16 Paying Attention Data: Loess Fit") +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        plot.title = element_text(size = rel(1.5), face = "bold", vjust = 1.5))

p

ggsave(paste0(this_base, ".png"), p, width = 6, height = 5)

## note: my_data is simulated to resemble the original

