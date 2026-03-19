local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_Modules_0.AvatarExperience.Common.Reducers.WidgetInfo);
local v4 = require(l_Modules_0.AvatarExperience.Common.Reducers.HydratedWidgetData);
local v5 = require(l_Modules_0.AvatarExperience.Common.Reducers.SearchPageWidgetInfo);
local v6 = require(l_Modules_0.AvatarExperience.Common.Reducers.ContextWidgetInfo);
return v2.combineReducers({
    WidgetInfo = v3, 
    SearchPageWidgetInfo = v5, 
    ContextWidgetInfo = v6, 
    HydratedWidgetData = v4
});