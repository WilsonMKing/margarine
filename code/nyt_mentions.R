################################################################################
################# Graph of New York Times Mentions of Margarine ################
################################################################################

### Create Dataframe of NY Times Mentions
margarine_mentions <- data.frame(
  year = seq(1860, 1970, 1),
  articles = c(1,0,0,0,0,0,0,0,0,0, # 1869
               0,0,0,1,3,0,1,0,2,0, # 1879
               3,6,1,1,1,1,3,2,2,0, # 1889
               4,0,3,3,1,3,3,1,3,0, # 1899
               3,4,5,3,0,2,1,2,0,1, # 1909
               1,2,3,8,0,10,11,32,31,13, #1919
               12,11,7,27,8,4,8,8,58,105, #1929
               137,74,11,13,17,18,0,23,17,44, #1939
               88,40,73,300,253,240,132,206,228,170, # 1949
               194,144,150,94,87,39,34,41,54,47, #1959
               43,36,36,28,31,26,37,34,20,28,20)) # 1970

### Restrict Years
margarine_mentions <- margarine_mentions[margarine_mentions$year >= 1900,]

### Plot Graph
ggplot(margarine_mentions, aes(x = year, y = articles)) +
  geom_area(fill = "navy", color = "black", alpha = 0.2) +
  geom_vline(xintercept = 1943, linetype = 2, color = "gray34") +
  geom_vline(xintercept = 1930, linetype = 2, color = "gray34") +
  annotate("text", x = 1929, y = 280, 
           label = "Unilever founded from\n Margarine Unie\n and Lever Brothers", 
           hjust = "right",
           family = "Times New Roman") +
  annotate("text", x = 1950, y = 300,
           label = "Schultz resigns",
           family = "Times New Roman") +
  xlab("Year") +
  ylab("New York Times Articles on Margarine") +
  theme_classic() +
  theme(legend.position = "top",
        legend.title = element_blank(),
        text = element_text(family = "Times New Roman", size = 12))

### Save
ggsave(paste0(exhibits, "nytimes_mentions.jpeg"), units = "cm", 
       width = 18, height = 12)
