local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v3 = require(l_Parent_0.Enums.PlatformEnum);
local v4 = require(l_Parent_0.Resources.FTUXConstants);
IsFTUXExperience = function(v5) --[[ Line: 10 ]] --[[ Name: IsFTUXExperience ]]
    -- upvalues: v3 (copy), l_IsVRAppBuild_0 (copy), v4 (copy)
    if v5 == v3.QuestVR then
        return l_IsVRAppBuild_0() and tostring(game.PlaceId) == v4[v3.QuestVR].ExperienceIds.PlaceId;
    else
        return false;
    end;
end;
return IsFTUXExperience;