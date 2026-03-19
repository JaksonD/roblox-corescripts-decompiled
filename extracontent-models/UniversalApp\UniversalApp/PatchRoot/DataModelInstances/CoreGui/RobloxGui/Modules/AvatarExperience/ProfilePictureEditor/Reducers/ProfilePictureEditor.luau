local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent;
local v3 = require(l_Parent_0.ProfilePictureParams);
local v4 = require(l_Parent_0.PeekabooLayoutDetails);
local v5 = require(l_Parent_0.CameraSliders);
local v6 = require(l_Parent_0.FinalPageViewMode);
return v1.combineReducers({
    ProfilePictureParams = v3, 
    PeekabooLayoutDetails = v4, 
    CameraSliders = v5, 
    FinalPageViewMode = v6
});