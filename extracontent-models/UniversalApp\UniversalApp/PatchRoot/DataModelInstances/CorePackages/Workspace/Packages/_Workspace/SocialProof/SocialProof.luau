local v0 = require(script.Rodux.installReducer);
local v1 = require(script.Containers.Chips);
local v2 = require(script.Containers.UserLists);
return {
    ["jest.config"] = script["jest.config"], 
    RoduxKey = require(script.Common.Constants).RODUX_KEY, 
    installReducer = v0, 
    Chips = v1, 
    UserLists = v2
};