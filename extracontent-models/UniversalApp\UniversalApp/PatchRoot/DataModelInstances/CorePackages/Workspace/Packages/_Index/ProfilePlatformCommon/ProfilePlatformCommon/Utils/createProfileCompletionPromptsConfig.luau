local l_Parent_0 = script:FindFirstAncestor("ProfilePlatformCommon").Parent;
local l_PromptsEntryPoint_0 = require(l_Parent_0.ServerTriggeredModals).PromptsEntryPoint;
local l_SduiLoadTimer_0 = require(l_Parent_0.SduiSharedUtilities).SduiLoadTimer;
return function() --[[ Line: 14 ]]
    -- upvalues: l_SduiLoadTimer_0 (copy), l_PromptsEntryPoint_0 (copy)
    local v3 = l_SduiLoadTimer_0.createLoadTimer("ProfileCompletion");
    return {
        entryPoint = l_PromptsEntryPoint_0.SelfUserProfileOpen, 
        surfaceKey = "ProfileCompletion", 
        configKey = "ProfileCompletion", 
        clearOnEmptyResponse = true, 
        loadTimer = v3
    };
end;