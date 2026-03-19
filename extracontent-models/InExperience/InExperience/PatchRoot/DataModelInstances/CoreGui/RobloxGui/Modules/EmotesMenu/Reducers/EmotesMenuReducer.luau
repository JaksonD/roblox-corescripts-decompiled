local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent;
local v3 = require(l_Parent_0.DisplayOptions);
local v4 = require(l_Parent_0.EmotesPage);
local v5 = require(l_Parent_0.EmotesWheel);
local v6 = require(l_Parent_0.Layout);
local v7 = require(l_Parent_0.Locale);
return (v1.combineReducers({
    displayOptions = v3, 
    emotesPage = v4, 
    emotesWheel = v5, 
    layout = v6, 
    locale = v7
}));