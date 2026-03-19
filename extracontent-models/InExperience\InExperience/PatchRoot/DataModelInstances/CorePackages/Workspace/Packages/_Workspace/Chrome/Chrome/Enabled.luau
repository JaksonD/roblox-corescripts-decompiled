local l_Parent_0 = script:FindFirstAncestor("Chrome").Parent;
local v1 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableConsoleExpControls_0 = v1.FFlagEnableConsoleExpControls;
local l_FFlagExperienceMenuGamepadExposureEnabled_0 = v1.FFlagExperienceMenuGamepadExposureEnabled;
game:DefineFastFlag("EnableInGameMenuChrome", false);
local v4 = game:DefineFastFlag("DebugEnableChromeOnUnsupportedDevices", false);
local l_VRService_0 = game:GetService("VRService");
local v6 = game:GetService("GuiService"):IsTenFootInterface();
local l_isInExperienceUIVREnabled_0 = require(l_Parent_0.SharedExperimentDefinition).isInExperienceUIVREnabled;
return function() --[[ Line: 18 ]]
    -- upvalues: v4 (copy), l_VRService_0 (copy), l_isInExperienceUIVREnabled_0 (copy), l_FFlagExperienceMenuGamepadExposureEnabled_0 (copy), v6 (copy), l_FFlagEnableConsoleExpControls_0 (copy)
    if v4 then
        return true;
    elseif l_VRService_0.VREnabled then
        if l_isInExperienceUIVREnabled_0 then
            return true;
        else
            return false;
        end;
    elseif l_FFlagExperienceMenuGamepadExposureEnabled_0 then
        return true;
    elseif v6 and not l_FFlagEnableConsoleExpControls_0 then
        return false;
    else
        return game:GetFastFlag("EnableInGameMenuChrome");
    end;
end;