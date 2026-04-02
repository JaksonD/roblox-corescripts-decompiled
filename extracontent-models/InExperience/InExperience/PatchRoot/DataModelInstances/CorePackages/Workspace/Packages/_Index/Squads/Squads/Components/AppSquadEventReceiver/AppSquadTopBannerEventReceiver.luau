local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppTopBanner);
local l_AppTopBannerType_0 = v2.Enums.AppTopBannerType;
local l_SetAppTopBanner_0 = v2.Actions.SetAppTopBanner;
local v5 = require(l_script_FirstAncestor_0.dependencies);
local l_Cryo_0 = v5.Cryo;
local l_React_0 = v5.React;
local l_SharedFlags_0 = v5.SharedFlags;
local l_EventNames_0 = v5.SquadsCore.Analytics.EventNames;
local l_SquadExternalContractContext_0 = v5.SquadsCore.SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadViewFlags_0 = v5.SquadsCore.SquadExternalContractProvider.SquadViewFlags;
local l_SquadRootViewType_0 = v5.SquadsCore.Enums.SquadRootViewType;
local l_dependencyArray_0 = v5.Hooks.dependencyArray;
local l_encodeSquadMembers_0 = v5.SquadsCore.Common.encodeSquadMembers;
local l_useCurrentSquadId_0 = v5.SquadsCore.Hooks.useCurrentSquadId;
local l_useCurrentSquadMembers_0 = v5.SquadsCore.Hooks.useCurrentSquadMembers;
local l_useCurrentSquadParentChannelId_0 = v5.SquadsCore.Hooks.useCurrentSquadParentChannelId;
local l_useDispatch_0 = v5.Hooks.useDispatch;
local l_useCanAccessParty_0 = require(l_Parent_0.Squads).Hooks.useCanAccessParty;
local l_FFlagEnableSquadTopBannerWideMode_0 = l_SharedFlags_0.FFlagEnableSquadTopBannerWideMode;
local v21 = require(l_script_FirstAncestor_0.Flags.FFlagIntroduceTopBannerPartyStates);
local v22 = require(l_script_FirstAncestor_0.Flags.FFlagIntroduceNameToOneToOneWaitingState);
local v23 = game:DefineFastFlag("FixSquadTopBannerMemo", false);
local l_FFlagIsSquadEnabledAMP_0 = l_SharedFlags_0.FFlagIsSquadEnabledAMP;
local l_FFlagRemoveDependencyArrayAntipattern_0 = l_SharedFlags_0.FFlagRemoveDependencyArrayAntipattern;
return function() --[[ Line: 37 ]]
    -- upvalues: l_useDispatch_0 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useCurrentSquadId_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), v21 (copy), l_useCurrentSquadMembers_0 (copy), v23 (copy), l_Cryo_0 (copy), l_encodeSquadMembers_0 (copy), l_EventNames_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v22 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), l_useCanAccessParty_0 (copy), l_FFlagEnableSquadTopBannerWideMode_0 (copy), l_SquadRootViewType_0 (copy), l_SetAppTopBanner_0 (copy), l_AppTopBannerType_0 (copy), l_SquadViewFlags_0 (copy)
    local v26 = l_useDispatch_0();
    local v27 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v28 = l_useCurrentSquadId_0();
    local v29 = l_useCurrentSquadParentChannelId_0();
    local v30 = if v21 then l_useCurrentSquadMembers_0() else nil;
    local v31 = nil;
    v31 = if v23 then l_React_0.useMemo(function() --[[ Line: 47 ]]
        -- upvalues: v21 (ref), v30 (copy), l_Cryo_0 (ref)
        if v21 and v30 then
            return (l_Cryo_0.List.map(v30, function(v32) --[[ Line: 49 ]]
                return v32.userId;
            end));
        else
            return {};
        end;
    end, {
        if v21 then v30 else nil
    }) else if v21 and v30 then l_Cryo_0.List.map(v30, function(v33) --[[ Line: 56 ]]
        return v33.userId;
    end) else {};
    local v34 = if v21 then l_React_0.useRef(os.clock()) else nil;
    local v36 = l_React_0.useCallback(function() --[[ Line: 68 ]]
        -- upvalues: v27 (copy), v29 (copy), v26 (copy), v21 (ref), l_encodeSquadMembers_0 (ref), v30 (copy), l_EventNames_0 (ref), v28 (copy), v34 (copy)
        if v27.navigateIntoSquadLobby and v29 then
            v26(v27.navigateIntoSquadLobby({
                conversationId = v29
            }, true));
        end;
        if v21 then
            local v35 = l_encodeSquadMembers_0(v30);
            v27.fireSquadAnalytics(l_EventNames_0.SquadTopBannerClicked, {
                squadId = v28, 
                parentChannelId = v29, 
                squadMembers = v35, 
                timePassedSinceLastStateUpdatedInSec = os.clock() - v34.current
            });
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        if v21 then v28 else nil, 
        v29, 
        v26, 
        v27.navigateIntoSquadLobby, 
        if v21 then v27.fireSquadAnalytics else nil, 
        if v21 then v30 else nil
    } else l_dependencyArray_0(if v21 then v28 else nil, v29, v26, v27.navigateIntoSquadLobby, if v21 then v27.fireSquadAnalytics else nil, if v21 then v30 else nil));
    local v37 = if v22 then v27.useGetConversationFromId(v29) else nil;
    local v38 = if v22 then v37 and v37.type else nil;
    local v39 = if v22 then v37 and v37.participants else nil;
    local v40 = if l_FFlagIsSquadEnabledAMP_0 then l_useCanAccessParty_0() else nil;
    local v41 = v27.useSquadRootView();
    if l_FFlagEnableSquadTopBannerWideMode_0 then
        local v42 = v27.useSquadTopBannerDisabled();
        l_React_0.useEffect(function() --[[ Line: 121 ]]
            -- upvalues: v28 (copy), v42 (copy), v41 (copy), l_SquadRootViewType_0 (ref), l_FFlagIsSquadEnabledAMP_0 (ref), v40 (copy), v21 (ref), v34 (copy), v26 (copy), l_SetAppTopBanner_0 (ref), l_AppTopBannerType_0 (ref), v31 (ref), v38 (copy), v39 (copy), v36 (copy)
            local v43 = v28 and (not v42 or v41 == l_SquadRootViewType_0.None);
            if if l_FFlagIsSquadEnabledAMP_0 then v40 and v43 else v43 then
                if v21 then
                    v34.current = os.clock();
                end;
                v26(l_SetAppTopBanner_0(true, l_AppTopBannerType_0.ActiveSquad, if v21 then {
                    squadMemberList = v31, 
                    parentChannelType = v38, 
                    parentChannelParticipants = v39
                } else nil, v36));
                return;
            else
                v26(l_SetAppTopBanner_0(false, l_AppTopBannerType_0.None, nil));
                return;
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v28, 
            if v21 then v31 else nil, 
            v26, 
            v36, 
            if v22 then v38 else nil, 
            if v22 then v39 else nil, 
            v42, 
            v41
        } else l_dependencyArray_0(v28, if v21 then v31 else nil, v26, v36, if v22 then v38 else nil, if v22 then v39 else nil, v42, v41));
    else
        local v44 = v27.useSquadViewFlags();
        l_React_0.useEffect(function() --[[ Line: 178 ]]
            -- upvalues: v28 (copy), v44 (copy), l_SquadViewFlags_0 (ref), v41 (copy), l_SquadRootViewType_0 (ref), l_FFlagIsSquadEnabledAMP_0 (ref), v40 (copy), v21 (ref), v34 (copy), v26 (copy), l_SetAppTopBanner_0 (ref), l_AppTopBannerType_0 (ref), v31 (ref), v38 (copy), v39 (copy), v36 (copy)
            local v45 = v28 and (bit32.band(v44, l_SquadViewFlags_0.SquadLobby) == 0 or v41 == l_SquadRootViewType_0.None);
            if if l_FFlagIsSquadEnabledAMP_0 then v40 and v45 else v45 then
                if v21 then
                    v34.current = os.clock();
                end;
                v26(l_SetAppTopBanner_0(true, l_AppTopBannerType_0.ActiveSquad, if v21 then {
                    squadMemberList = v31, 
                    parentChannelType = v38, 
                    parentChannelParticipants = v39
                } else nil, v36));
                return;
            else
                v26(l_SetAppTopBanner_0(false, l_AppTopBannerType_0.None, nil));
                return;
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v28, 
            if v21 then v31 else nil, 
            v26, 
            v36, 
            v44, 
            if v22 then v38 else nil, 
            if v22 then v39 else nil, 
            v41
        } else l_dependencyArray_0(v28, if v21 then v31 else nil, v26, v36, v44, if v22 then v38 else nil, if v22 then v39 else nil, v41));
    end;
    return nil;
end;