local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarSwitcher");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local l_useEventConnection_0 = require(l_Parent_0.ReactUtils).useEventConnection;
local l_sendAXCounterV2_0 = require(l_Parent_0.AvatarExperienceAnalytics).sendAXCounterV2;
local v6 = require(l_script_FirstAncestor_0.Components.Modals.RespawnChoiceDialog);
local v7 = require(l_script_FirstAncestor_0.Components.Modals.RespawnLaterDialog);
local v8 = require(l_script_FirstAncestor_0.Stores.getAvatarSwitcherStore);
local v9 = require(l_script_FirstAncestor_0.Utils.respawnAvatar);
local v10 = require(l_script_FirstAncestor_0.Constants);
local l_FFlagAvatarSwitcherCounters_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAvatarSwitcherCounters;
return function(v12) --[[ Line: 31 ]] --[[ Name: RespawnDialogContainer ]]
    -- upvalues: v3 (copy), v8 (copy), v2 (copy), l_useEventConnection_0 (copy), l_FFlagAvatarSwitcherCounters_0 (copy), l_sendAXCounterV2_0 (copy), v10 (copy), v9 (copy), v6 (copy), v7 (copy)
    local v13 = v3.useSignalState(v8);
    local v14 = v3.useSignalState(v13.getRespawnPromptShown);
    local v17, v18 = v2.useState(function() --[[ Line: 35 ]]
        -- upvalues: v12 (copy)
        local v15, _ = v12.getRespawnBehaviour();
        return v15;
    end);
    l_useEventConnection_0(v12.respawnBehaviorChangedEvent.Event, v18, {});
    local v19 = v2.useCallback(function() --[[ Line: 42 ]]
        -- upvalues: v13 (copy), v12 (copy), l_FFlagAvatarSwitcherCounters_0 (ref), l_sendAXCounterV2_0 (ref), v10 (ref), v9 (ref)
        v13.toggleRespawnPrompt(false);
        v12.toggleWindow();
        if l_FFlagAvatarSwitcherCounters_0 then
            l_sendAXCounterV2_0(v10.Counters.ConfirmRespawn);
        end;
        v13.switchAvatar();
        v9(v12.getRespawnBehaviour);
    end, {
        v12.getRespawnBehaviour, 
        v12.toggleWindow
    });
    local v20 = v2.useCallback(function() --[[ Line: 53 ]]
        -- upvalues: v13 (copy), v12 (copy), l_FFlagAvatarSwitcherCounters_0 (ref), l_sendAXCounterV2_0 (ref), v10 (ref), v17 (copy)
        v13.toggleRespawnPrompt(false);
        v12.toggleWindow();
        if l_FFlagAvatarSwitcherCounters_0 then
            l_sendAXCounterV2_0(v10.Counters.DeferRespawn, {
                respawnEnabled = tostring(v17)
            });
        end;
        v13.switchAvatar();
    end, {
        v12.toggleWindow
    });
    local v21 = v2.useCallback(function() --[[ Line: 63 ]]
        -- upvalues: l_FFlagAvatarSwitcherCounters_0 (ref), l_sendAXCounterV2_0 (ref), v10 (ref), v13 (copy)
        if l_FFlagAvatarSwitcherCounters_0 then
            l_sendAXCounterV2_0(v10.Counters.CancelSwitchAvatar);
        end;
        v13.toggleRespawnPrompt(false);
    end, {});
    return v2.createElement(v2.Fragment, nil, {
        RespawnChoiceDialog = v14 and v17 and v2.createElement(v6, {
            onConfirm = v19, 
            onDefer = v20, 
            onClose = v21
        }), 
        RespawnLaterDialog = v14 and not v17 and v2.createElement(v7, {
            onDefer = v20, 
            onClose = v21
        })
    });
end;