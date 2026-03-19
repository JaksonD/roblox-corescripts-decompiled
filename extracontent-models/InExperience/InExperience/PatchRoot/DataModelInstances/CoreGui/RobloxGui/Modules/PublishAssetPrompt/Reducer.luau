local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(script.PromptRequestReducer);
return (v1.combineReducers({
    promptRequest = v2
}));