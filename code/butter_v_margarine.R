################################################################################
################# Graph of US Butter and Margarine Consumption #################
################################################################################

### Load Butter Data
butter <- readxl::read_xls(paste0(data, "fats.xls"), sheet = "Butter")
colnames(butter) <- butter[1,]
butter <- butter[-c(1:6),]
butter <- butter[,c(1,12)]
colnames(butter) <- c("year", "consumption_per_capita")
butter$fat <- "Butter"

### Load Margarine Data
margarine <- readxl::read_xls(paste0(data, "fats.xls"), sheet = "Margarine")
colnames(margarine) <- margarine[1,]
margarine <- margarine[-c(1:6),]
margarine <- margarine[,c(1,12)]
colnames(margarine) <- c("year", "consumption_per_capita")
margarine$fat <- "Margarine"

### Combine
fats <- rbind(butter, margarine)
fats$consumption_per_capita <- as.numeric(fats$consumption_per_capita)
fats <- fats[!is.na(fats$consumption_per_capita),]
fats$year <- as.numeric(fats$year)
fats$year[fats$year == 19929] <- 1992

### Restrict to 1910-2010
fats <- fats[fats$year >= 1910 & fats$year <= 2010,]

### Create Graph
colors <- c("Butter" = "navy", "Margarine" = "yellow")
ggplot(fats, aes(x = year, y = consumption_per_capita, fill = fat)) +
  geom_area(alpha = 0.2, color = "black") +
  scale_fill_manual(values = colors) +
  xlab("Year") +
  ylab("Consumption per Capita") +
  theme_classic() +
  theme(legend.position = "top",
        legend.title = element_blank(),
        text = element_text(family = "Times New Roman", size = 12))

### Save
ggsave(paste0(exhibits, "butter_v_margarine.jpeg"), units = "cm", 
       width = 18, height = 12)

### Peak Margarine
max <- max(fats$consumption_per_capita[fats$fat == "Margarine"])
max_year <- fats$year[which.max(fats$consumption_per_capita[fats$fat == "Margarine"])]

### Print Max
print(paste0("Margarine consumption was highest in the United States in ", max_year, 
             ", when it reached a peak of ", round(max, 2), " pounds."))
