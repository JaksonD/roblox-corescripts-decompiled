local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v4 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
return function(v5) --[[ Line: 12 ]] --[[ Name: isFullView ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), v4 (copy)
    if l_IsVRAppBuild_0() then
        local v6 = {};
        setmetatable(v6, {
            __index = function() --[[ Line: 17 ]] --[[ Name: __index ]]
                -- upvalues: v4 (ref)
                return v4.None;
            end
        });
        return v6;
    else
        return v5.AvatarExperience.Common.FullView;
    end;
end;