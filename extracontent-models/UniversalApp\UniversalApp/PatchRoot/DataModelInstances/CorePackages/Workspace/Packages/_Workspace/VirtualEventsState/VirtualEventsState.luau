local v0 = require(script.installReducer);
local _ = require(script.types);
local v2 = require(script.enums);
local v3 = require(script.network);
local v4 = require(script.Models.ExperienceDetailsModel);
local v5 = require(script.Models.ExperienceMediaModel);
return {
    RoduxKey = "VirtualEvents", 
    installReducer = v0, 
    enums = v2, 
    network = v3, 
    ExperienceDetailsModel = v4, 
    ExperienceMediaModel = v5, 
    ["jest.config"] = script["jest.config"]
};