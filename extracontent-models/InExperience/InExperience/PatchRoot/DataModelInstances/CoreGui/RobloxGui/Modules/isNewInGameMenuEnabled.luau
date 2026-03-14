local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
game:DefineFastInt("NewInGameMenuPercentRollout3", 0);
game:DefineFastString("NewInGameMenuForcedUserIds", "");
game:DefineFastFlag("NewInGameMenuDisabledInVR", false);
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local _ = v3.isSubjectToDesktopPolicies;
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
return function() --[[ Line: 20 ]]
    -- upvalues: l_VRService_0 (copy), l_isInExperienceUIVREnabled_0 (copy), l_Players_0 (copy)
    if l_VRService_0.VREnabled then
        if l_isInExperienceUIVREnabled_0 then
            return false;
        else
            return true;
        end;
    else
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        while not l_LocalPlayer_0 do
            l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
            l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        end;
        for v8 in game:GetFastString("NewInGameMenuForcedUserIds"):gmatch("%d+") do
            if tonumber(v8) == l_LocalPlayer_0.UserId then
                return true;
            end;
        end;
        if game:GetFastInt("NewInGameMenuPercentRollout3") > l_LocalPlayer_0.UserId % 100 then
            return true;
        else
            return false;
        end;
    end;
end;