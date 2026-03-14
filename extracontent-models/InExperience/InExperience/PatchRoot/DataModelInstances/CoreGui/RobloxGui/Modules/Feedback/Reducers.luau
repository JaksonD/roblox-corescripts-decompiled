local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(script.common);
local v3 = require(script.displayOptions);
local v4 = require(script.feedbackFlowState);
local l_FetchingStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Reducers.FetchingStatus;
return (v1.combineReducers({
    common = v2, 
    displayOptions = v3, 
    feedbackFlowState = v4, 
    FetchingStatus = l_FetchingStatus_0
}));