local l_Parent_0 = script:FindFirstAncestor("ProfilePlatformCommon").Parent;
local l_PromptsEntryPoint_0 = require(l_Parent_0.ServerTriggeredModals).PromptsEntryPoint;
local l_SduiLoadTimer_0 = require(l_Parent_0.SduiSharedUtilities).SduiLoadTimer;
local l_FFlagSduiAllowNoConfigsBuilt_0 = require(l_Parent_0.SharedFlags).FFlagSduiAllowNoConfigsBuilt;
return function() --[[ Line: 16 ]]
    -- upvalues: l_SduiLoadTimer_0 (copy), l_PromptsEntryPoint_0 (copy), l_FFlagSduiAllowNoConfigsBuilt_0 (copy)
    local v4 = l_SduiLoadTimer_0.createLoadTimer("ProfileCompletion");
    return {
        entryPoint = l_PromptsEntryPoint_0.SelfUserProfileOpen, 
        surfaceKey = "ProfileCompletion", 
        configKey = "ProfileCompletion", 
        clearOnEmptyResponse = true, 
        allowNoConfigsBuilt = l_FFlagSduiAllowNoConfigsBuilt_0 and true or nil, 
        loadTimer = v4
    };
end;