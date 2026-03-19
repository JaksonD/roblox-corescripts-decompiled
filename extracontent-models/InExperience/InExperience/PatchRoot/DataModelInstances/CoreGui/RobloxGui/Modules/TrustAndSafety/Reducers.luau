local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(script.common);
local v3 = require(script.displayOptions);
local v4 = require(script.placeInfo);
local v5 = require(script.report);
return (v1.combineReducers({
    common = v2, 
    displayOptions = v3, 
    placeInfo = v4, 
    report = v5
}));