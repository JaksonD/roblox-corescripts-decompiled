local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_AvatarScreen_0 = require(l_Parent_0.AvatarExperienceNavigation).Enums.AvatarScreen;
local v7 = require(l_script_FirstAncestor_0.Stores.TimeoutStatusStore.getTimeoutStatusStore);
local v8 = require(l_script_FirstAncestor_0.Utils.formatTimeoutEndTime);
return function(v9) --[[ Line: 28 ]] --[[ Name: useTimeoutBannerProps ]]
    -- upvalues: v7 (copy), l_useSignalState_0 (copy), l_useNavigation_0 (copy), v2 (copy), v8 (copy), l_useLocalization_0 (copy), l_AvatarScreen_0 (copy)
    local v10 = not v9 or v9.shouldFetch ~= false;
    local v11 = v9 == nil or v9.shouldNavigateOnClick ~= false;
    local v12 = v7();
    local v13 = l_useSignalState_0(v12.getStatus);
    local v14 = l_useSignalState_0(v12.getIsTimedOut);
    local v15 = l_useNavigation_0();
    v2.useEffect(function() --[[ Line: 37 ]]
        -- upvalues: v10 (copy), v12 (copy)
        if v10 then
            v12.fetchStatus();
        end;
    end, {
        v10, 
        v12
    });
    local v16 = v13.timeoutAction and v13.timeoutAction.endTime or v13.details and v13.details.endDate;
    local v17 = v8(v16);
    local v18 = l_useLocalization_0({
        messageText = if v17 then {
            "Feature.Timeout.WarningBanner.DisabledUntilMessage"; 
            time = v17
        } else "Feature.Timeout.WarningBanner.DisabledMessage"
    });
    local v19 = v2.useCallback(function() --[[ Line: 52 ]]
        -- upvalues: v15 (copy), l_AvatarScreen_0 (ref)
        v15.navigate(l_AvatarScreen_0.TimeoutStatusPrompt);
    end, {
        v15
    });
    return {
        messageText = v18.messageText, 
        onBannerActivated = if v11 then v19 else nil, 
        shouldShow = v14
    };
end;