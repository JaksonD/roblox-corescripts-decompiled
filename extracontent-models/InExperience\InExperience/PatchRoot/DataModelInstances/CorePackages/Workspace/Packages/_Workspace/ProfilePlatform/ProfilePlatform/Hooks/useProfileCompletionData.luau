local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_Parent_0.SduiSharedUtilities);
local _ = require(l_Parent_0.SduiCoreSystem);
local v6 = require(l_script_FirstAncestor_0.Common.Enums);
local l_createProfileCompletionPromptsConfig_0 = require(l_Parent_0.ProfilePlatformCommon).Utils.createProfileCompletionPromptsConfig;
local v8 = require(l_Parent_0.ServerTriggeredModals);
local l_getSduiApiStore_0 = v4.getSduiApiStore;
local l_fetchPrompts_0 = v8.fetchPrompts;
return function() --[[ Line: 26 ]] --[[ Name: useProfileCompletionData ]]
    -- upvalues: v2 (copy), l_createProfileCompletionPromptsConfig_0 (copy), l_fetchPrompts_0 (copy), l_getSduiApiStore_0 (copy), v6 (copy), v3 (copy)
    local v11 = v2.useMemo(function() --[[ Line: 27 ]]
        -- upvalues: l_createProfileCompletionPromptsConfig_0 (ref)
        return l_createProfileCompletionPromptsConfig_0();
    end, {});
    v2.useEffect(function() --[[ Line: 31 ]]
        -- upvalues: l_fetchPrompts_0 (ref), v11 (copy)
        l_fetchPrompts_0(v11, true);
    end, {
        v11
    });
    local v12 = v2.useCallback(function() --[[ Line: 35 ]]
        -- upvalues: l_fetchPrompts_0 (ref), l_createProfileCompletionPromptsConfig_0 (ref)
        l_fetchPrompts_0(l_createProfileCompletionPromptsConfig_0(), true);
    end, {});
    local v14 = v2.useCallback(function(v13) --[[ Line: 39 ]]
        -- upvalues: l_getSduiApiStore_0 (ref), v6 (ref)
        return (l_getSduiApiStore_0().getRootConfig(v6.Components.ProfileCompletion, v13));
    end, {});
    return v3.useSignalState(v14), v12;
end;