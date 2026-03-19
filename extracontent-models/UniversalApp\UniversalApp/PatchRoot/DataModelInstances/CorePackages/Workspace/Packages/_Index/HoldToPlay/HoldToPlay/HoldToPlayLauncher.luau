local l_script_FirstAncestor_0 = script:FindFirstAncestor("HoldToPlay");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigationEventNameEnum_0 = v3.FocusNavigationEventNameEnum;
local l_ButtonHoldStateEnum_0 = v3.ButtonHoldStateEnum;
local l_AppShortcutBarContext_0 = require(l_Parent_0.AppShortcutBar).AppShortcutBarContext;
local v7 = require(l_script_FirstAncestor_0.HoldToPlayLoader);
return function(v8) --[[ Line: 36 ]] --[[ Name: HoldToPlayLauncher ]]
    -- upvalues: l_AppShortcutBarContext_0 (copy), v2 (copy), l_ButtonHoldStateEnum_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v7 (copy)
    local v9 = l_AppShortcutBarContext_0.useDispatchButtonHoldStarted();
    local v10 = l_AppShortcutBarContext_0.useDispatchButtonHoldEnded();
    v2.useEffect(function() --[[ Line: 40 ]]
        -- upvalues: v8 (copy), l_ButtonHoldStateEnum_0 (ref), v9 (copy), l_FocusNavigationEventNameEnum_0 (ref), v10 (copy)
        if v8.holdState == l_ButtonHoldStateEnum_0.JUST_PRESSED then
            v9(l_FocusNavigationEventNameEnum_0.HoldToPlay, v8.holdProgress);
            return;
        else
            if v8.holdState == l_ButtonHoldStateEnum_0.NOT_HELD then
                v10(l_FocusNavigationEventNameEnum_0.HoldToPlay);
            end;
            return;
        end;
    end, {
        v8.holdState, 
        v8.holdProgress, 
        v9, 
        v10
    });
    local v11 = v2.useCallback(function() --[[ Line: 49 ]]
        -- upvalues: v8 (copy)
        v8.reportExperienceLaunched(v8.selectedEntry, v8.referralSource, nil, v8.launchContext, v8.selectedIndex);
    end, {
        v8.reportExperienceLaunched, 
        v8.selectedEntry, 
        v8.referralSource, 
        v8.selectedIndex, 
        v8.launchContext
    });
    local v12 = v8.selectedNavigationUniverseId or v8.selectedEntry and v8.selectedEntry.universeId or nil;
    if v12 and (v8.holdState == l_ButtonHoldStateEnum_0.HOLDING or v8.holdState == l_ButtonHoldStateEnum_0.COMPLETED) then
        return v2.createElement(v7, {
            universeId = v12, 
            shouldAttemptLaunch = v8.holdState == l_ButtonHoldStateEnum_0.COMPLETED, 
            reportExperienceLaunched = v11, 
            onLaunched = v8.cancelHold
        });
    else
        return nil;
    end;
end;