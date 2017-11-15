library("rpart")
library("caret")

train=read.csv("~/Documents/ProgramFiles/training.csv")
test=read.csv("~/Documents/ProgramFiles/testing.csv")

#Using random forest
set.seed(111);
rf_model <- randomForest(Retweet_count~word_count+polarity+subjectivity, data = train,ntree=1000,importance=TRUE);

rf_prediction <- predict(rf_model, test)
rf_solution <- data.frame(Id = test$Id, Retweet_count = rf_prediction);
write.csv(rf_solution, file = "~/Desktop/result.csv", row.names = FALSE);

time=ymd_hms(train$Time)

#Using glm
glm_model=glm(Retweet_count~word_count+polarity+subjectivity, data = train)
glm_prediction <- predict(glm_model, test)
glm_solution <- data.frame(Id = test$Id, Retweet_count = glm_prediction);
write.csv(glm_solution, file = "~/Desktop/result1.csv", row.names = FALSE);
