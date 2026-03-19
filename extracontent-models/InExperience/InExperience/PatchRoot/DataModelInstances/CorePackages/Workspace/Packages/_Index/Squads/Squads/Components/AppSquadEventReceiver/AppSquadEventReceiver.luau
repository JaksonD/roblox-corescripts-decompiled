local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ExperienceService_0 = require(l_Parent_0.ExperienceService).ExperienceService;
local v3 = require(script.Parent.AppSquadTopBannerEventReceiver);
local v4 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v4.React;
local l_RoduxSquads_0 = v4.RoduxSquads;
local l_SquadEventReceiver_0 = v4.SquadsCore.SquadEventReceiver;
local l_useDispatch_0 = v4.Hooks.useDispatch;
local l_useSelector_0 = v4.Hooks.useSelector;
local l_useCanAccessParty_0 = require(l_Parent_0.Squads).Hooks.useCanAccessParty;
local v11 = require(l_Parent_0.SharedFlags);
local l_FFlagIsSquadEnabledAMP_0 = v11.FFlagIsSquadEnabledAMP;
local l_GetFFlagIsSquadEnabled_0 = v11.GetFFlagIsSquadEnabled;
local l_CurrentSquadUpdated_0 = l_RoduxSquads_0.Actions.CurrentSquadUpdated;
return function(_) --[[ Line: 22 ]]
    -- upvalues: l_useDispatch_0 (copy), l_React_0 (copy), l_useSelector_0 (copy), l_ExperienceService_0 (copy), l_RoduxSquads_0 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), l_useCanAccessParty_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), l_CurrentSquadUpdated_0 (copy), v3 (copy), l_SquadEventReceiver_0 (copy)
    local v16 = l_useDispatch_0();
    local v18 = l_React_0.useCallback(function(v17) --[[ Line: 25 ]]
        if v17.Squad and v17.Squad.Squad then
            return v17.Squad.Squad.currentExperienceInvite;
        else
            return nil;
        end;
    end, {});
    local v19 = l_useSelector_0(v18);
    local v21 = l_React_0.useCallback(function(v20) --[[ Line: 30 ]]
        if v20.Squad and v20.Squad.Squad and v20.Squad.Squad.currentSquadPersist then
            return v20.Squad.Squad.currentSquadPersist.isPaused;
        else
            return false;
        end;
    end, {});
    local v22 = l_useSelector_0(v21);
    l_React_0.useEffect(function() --[[ Line: 40 ]]
        -- upvalues: l_ExperienceService_0 (ref), l_RoduxSquads_0 (ref), v16 (copy)
        l_ExperienceService_0:RegisterForExperienceJoin(function() --[[ Line: 41 ]]
            -- upvalues: l_RoduxSquads_0 (ref), v16 (ref)
            l_RoduxSquads_0.PersistManagers.currentSquadPersistManager.pause(v16);
        end);
        l_ExperienceService_0:RegisterForExperienceLeave(function() --[[ Line: 46 ]]
            -- upvalues: l_RoduxSquads_0 (ref), v16 (ref)
            l_RoduxSquads_0.PersistManagers.currentSquadPersistManager.persistAndUpdateState(v16);
        end);
    end, {
        v16
    });
    l_React_0.useEffect(function() --[[ Line: 52 ]]
        -- upvalues: v19 (copy), v22 (copy), v16 (copy), l_RoduxSquads_0 (ref)
        if v19 and v22 then
            v16(l_RoduxSquads_0.Actions.CurrentExperienceInviteDismissed(v19.notification.notificationId));
        end;
    end, {
        v19, 
        v22
    });
    local v23 = if l_FFlagIsSquadEnabledAMP_0 then l_useCanAccessParty_0() else nil;
    local v24 = if l_FFlagIsSquadEnabledAMP_0 then v23 else l_GetFFlagIsSquadEnabled_0();
    l_React_0.useEffect(function() --[[ Line: 69 ]]
        -- upvalues: v24 (copy), v16 (copy), l_CurrentSquadUpdated_0 (ref)
        if not v24 then
            v16(l_CurrentSquadUpdated_0(nil));
        end;
    end, {
        v24
    });
    return l_React_0.createElement(l_React_0.Fragment, nil, {
        appSquadTopBannerEventReceiver = l_React_0.createElement(v3), 
        squadEventReceiver = if not v24 or v22 then nil else l_React_0.createElement(l_SquadEventReceiver_0)
    });
end;