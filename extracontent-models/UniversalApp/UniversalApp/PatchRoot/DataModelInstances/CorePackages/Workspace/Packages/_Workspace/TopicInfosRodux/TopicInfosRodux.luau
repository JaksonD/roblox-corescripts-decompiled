local v0 = require(script.TopicInfoModel);
return {
    AddTopicInfos = require(script.AddTopicInfos), 
    TopicInfoModel = v0, 
    TopicInfosReducer = require(script.TopicInfosReducer), 
    ["jest.config"] = script["jest.config"]
};