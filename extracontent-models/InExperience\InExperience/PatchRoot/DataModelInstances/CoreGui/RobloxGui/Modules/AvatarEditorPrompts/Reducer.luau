local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(script.PromptInfo);
local v3 = require(script.ScreenSize);
local v4 = require(script.GameName);
local v5 = require(script.AnalyticsInfo);
local l_FFlagAXAvatarTimeoutFlowIE_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE;
return (v1.combineReducers({
    promptInfo = v2, 
    screenSize = v3, 
    ScreenSize = if l_FFlagAXAvatarTimeoutFlowIE_0 then v3 else nil, 
    gameName = v4, 
    analyticsInfo = v5
}));