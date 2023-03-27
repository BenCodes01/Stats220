library(magick)
library(tidyverse)

#Constructing data frame and renaming variables
learning_csv_file <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vR2MZ24A34PwW5x6jVGo-mZBnforjcy9qbN0Xcd-kbgBkA5pfxIAqrySzwItCCRSuZi7dAm2o3R-rc_/pub?output=csv"
learning_data <- read_csv(learning_csv_file) %>%
  rename(learning_importance = 2,
         reliable_connections = 3,
         learning_hours = 4,
         personality_type = 5,
         worker_type = 6,
         qualification = 7,
         learning_application = 8,
         learning_reflection = 9)

view(learning_data)
#Retrieve respondent charactertistics-------------------------------------------
#Total number of respondents who completed survey
num_of_respondents <- nrow(learning_data)
num_of_respondents 

#Number of respondents who are characterised as introverts
num_of_introverts <- sum(learning_data$personality_type == 'Introvert')
num_of_introverts

#Number of respondents who are characterised as extroverts
num_of_extroverts <- sum(learning_data$personality_type == 'Extrovert')
num_of_extroverts

#Respondents characterised by work preference
num_of_blue_collar <- sum(learning_data$worker_type == 'Blue-collar worker')
num_of_blue_collar

num_of_white_collar <- sum(learning_data$worker_type == 'White-collar worker')
num_of_white_collar

#Respondents characterised by qualification type
num_of_none <- sum(learning_data$qualification == 'None')
num_of_none

num_of_HSDiploma <- sum(learning_data$qualification == 'High school diploma')
num_of_HSDiploma

num_of_trade <- sum(learning_data$qualification == 'Trades certificate')
num_of_trade

num_of_diploma <- sum(learning_data$qualification == 'Polytechnic/university diploma')
num_of_diploma

num_of_bachelors <- sum(learning_data$qualification == 'Bachelors degree')
num_of_bachelors

num_of_masters <- sum(learning_data$qualification == 'Masters degree')
num_of_masters

num_of_PHD <- sum(learning_data$qualification == 'Doctor of Philosophy')
num_of_PHD

#Number of respondents who reflect on their learning
num_of_reflections <- sum(learning_data$learning_reflection == 'Yes - I analyze the conversation and research ways to create a better future outcome.')
num_of_reflections

num_of_noReflections <- sum(learning_data$learning_reflection == "No - It's not necessary because the I experience I gained is sufficient for improvement.")
num_of_noReflections


#Summary values of learning preparation for networking
mean_learning_hours <- learning_data$learning_hours %>% 
  mean() %>%
  round(1)
mean_learning_hours

min_learning_hours <- learning_data$learning_hours %>% 
  min() %>%
  round(1)
min_learning_hours

max_learning_hours <- learning_data$learning_hours %>% 
  max() %>%
  round(1)
max_learning_hours





#Bar charts---------------------------------------------------------------------
#Bar chart of frequency of learning importance separated by personality type
ggplot(data = learning_data) +
  geom_bar(aes(x = learning_importance, 
               fill = personality_type)) +
  scale_fill_manual(values = c("#69c6ff", "#0099f9")) +
  labs(title = "Importance of learning to network rated by freqeuncy",
       x = "Importance Rating",
       y = "Frequency",
       caption = "1 - least important, 10 - most important",
       fill = "Personality") +
  theme(
    plot.title = element_text(color = "#0099f9", size = 20),
    plot.caption = element_text(face = "bold")
  ) 

#Bar chart of frequency of learning importance separated by worker-type
ggplot(data = learning_data) +
  geom_bar(aes(x = learning_importance, 
               fill = worker_type)) +
  scale_fill_manual(values = c("#69c6ff", "#0099f9")) +
  labs(title = "Importance of learning to network rated by freqeuncy",
       x = "Importance Rating",
       y = "Frequency",
       caption = "1 - least important, 10 - most important",
       fill = "Worker Type") +
  theme(
    plot.title = element_text(color = "#0099f9", size = 20),
    plot.caption = element_text(face = "bold")
  ) 

#Bar graph of importance of learning to practice separated by degree
ggplot(data = learning_data) +
  geom_bar(aes(x = learning_importance, 
               fill = qualification)) +
  scale_fill_manual(values = c("#69c6ff", "#0099f9","pink", "yellow","orange","purple")) +
  labs(title = "Importance of learning to network rated by freqeuncy",
       x = "Importance Rating",
       y = "Frequency",
       caption = "Number of hours spent on researching, workshops, etc...",
       fill = "Qualification") +
  theme(
    plot.title = element_text(color = "#0099f9", size = 20),
    plot.caption = element_text(face = "bold")
  )

#Bar graph of desired number of reliable connections separated by personality type
ggplot(data = learning_data) +
  geom_bar(aes(x = reliable_connections, 
               fill = personality_type)) +
  scale_fill_manual(values = c("#69c6ff", "#0099f9")) +
  labs(title = "Frequency of Desired Number of Network Connections",
       x = "Desired Number of Reliable Connections",
       y = "Frequency",
       caption = "Network connections defined as different people or organisations",
       fill = "Personality") +
  theme(
    plot.title = element_text(color = "#0099f9", size = 20),
    plot.caption = element_text(face = "bold")
  ) 

#Bar graph of required amount of learning prior to practice separated by personality type
ggplot(data = learning_data) +
  geom_bar(aes(x = learning_hours, 
               fill = personality_type)) +
  scale_fill_manual(values = c("#69c6ff", "#0099f9")) +
  labs(title = "Frequency of Required Preparation Hours Prior to Practice",
       x = "Required Number of Preparation Hours",
       y = "Frequency",
       caption = "Number of hours spent on researching, workshops, etc...",
       fill = "Personality") +
  theme(
    plot.title = element_text(color = "#0099f9", size = 20),
    plot.caption = element_text(face = "bold")
  ) 

#Bar graph of required amount of learning prior to practice separated by learning importance
ggplot(data = learning_data) +
  geom_bar(aes(x = learning_hours, 
               fill = learning_importance)) +
  labs(title = "Frequency of Required Preparation Hours Prior to Practice",
       x = "Required Number of Preparation Hours",
       y = "Frequency",
       caption = "Number of hours spent on researching, workshops, etc...",
       fill = "Personality") +
  theme(
    plot.title = element_text(color = "#0099f9", size = 20),
    plot.caption = element_text(face = "bold")
  ) 

#Bar graph of required amount of learning prior to practice separated by worker type
ggplot(data = learning_data) +
  geom_bar(aes(x = learning_hours, 
               fill = worker_type)) +
  scale_fill_manual(values = c("#69c6ff", "#0099f9")) +
  labs(title = "Frequency of Required Preparation Hours Prior to Practice",
       x = "Required Number of Preparation Hours",
       y = "Frequency",
       caption = "Number of hours spent on researching, workshops, etc...",
       fill = "Worker Type") +
  theme(
    plot.title = element_text(color = "#0099f9", size = 20),
    plot.caption = element_text(face = "bold")
  ) 

#Bar graph of required amount of learning prior to practice separated by degree
ggplot(data = learning_data) +
  geom_bar(aes(x = learning_hours, 
               fill = qualification)) +
  scale_fill_manual(values = c("#69c6ff", "#0099f9","pink", "yellow","orange","purple")) +
  labs(title = "Frequency of Required Preparation Hours Prior to Practice",
       x = "Required Number of Preparation Hours",
       y = "Frequency",
       caption = "Number of hours spent on researching, workshops, etc...",
       fill = "Qualification") +
  theme(
    plot.title = element_text(color = "#0099f9", size = 20),
    plot.caption = element_text(face = "bold")
  ) 

#Bar graph of frequency of learning reflection separated by personality type
ggplot(data = learning_data) +
  geom_bar(aes(x = learning_reflection, 
               fill = personality_type)) +
  scale_fill_manual(values = c("#69c6ff", "#0099f9")) +
  labs(title = "Frequency of Learning Reflection",
       x = "Learning Reflection",
       y = "Frequency",
       caption = "Wander if people reflect on their practical experience?",
       fill = "Personality Type") +
  scale_x_discrete(labels=c('No', 'Yes')) +
  theme(
    plot.title = element_text(color = "#0099f9", size = 20),
    plot.caption = element_text(face = "bold")
  ) 

#Bar graph of frequency of learning reflection separated by worker type
ggplot(data = learning_data) +
  geom_bar(aes(x = learning_reflection, 
               fill = worker_type)) +
  scale_fill_manual(values = c("#69c6ff", "#0099f9")) +
  labs(title = "Frequency of Learning Reflection",
       x = "Learning Reflection",
       y = "Frequency",
       caption = "Wander if people reflect on their practical experience?",
       fill = "worker Type") +
  scale_x_discrete(labels=c('No', 'Yes')) +
  theme(
    plot.title = element_text(color = "#0099f9", size = 20),
    plot.caption = element_text(face = "bold")
  ) 

#Bar graph of frequency of learning reflection separated by degree
ggplot(data = learning_data) +
  geom_bar(aes(x = learning_reflection, 
               fill = qualification)) +
  scale_fill_manual(values = c("#69c6ff", "#0099f9","pink", "yellow","orange","purple")) +
  labs(title = "Frequency of Learning Reflection",
       x = "Learning Reflection",
       y = "Frequency",
       caption = "Wander if people reflect on their practical experience?",
       fill = "Qualification") +
  scale_x_discrete(labels=c('No', 'Yes')) +
  theme(
    plot.title = element_text(color = "#0099f9", size = 20),
    plot.caption = element_text(face = "bold")
  ) 


