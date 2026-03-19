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
return function() --[[ Line: 35 ]]
    -- upvalues: l_useDispatch_0 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useCurrentSquadId_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), v21 (copy), l_useCurrentSquadMembers_0 (copy), v23 (copy), l_Cryo_0 (copy), l_encodeSquadMembers_0 (copy), l_EventNames_0 (copy), l_dependencyArray_0 (copy), v22 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), l_useCanAccessParty_0 (copy), l_FFlagEnableSquadTopBannerWideMode_0 (copy), l_SquadRootViewType_0 (copy), l_SetAppTopBanner_0 (copy), l_AppTopBannerType_0 (copy), l_SquadViewFlags_0 (copy)
    local v25 = l_useDispatch_0();
    local v26 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v27 = l_useCurrentSquadId_0();
    local v28 = l_useCurrentSquadParentChannelId_0();
    local v29 = if v21 then l_useCurrentSquadMembers_0() else nil;
    local v30 = nil;
    v30 = if v23 then l_React_0.useMemo(function() --[[ Line: 45 ]]
        -- upvalues: v21 (ref), v29 (copy), l_Cryo_0 (ref)
        if v21 and v29 then
            return (l_Cryo_0.List.map(v29, function(v31) --[[ Line: 47 ]]
                return v31.userId;
            end));
        else
            return {};
        end;
    end, {
        if v21 then v29 else nil
    }) else if v21 and v29 then l_Cryo_0.List.map(v29, function(v32) --[[ Line: 54 ]]
        return v32.userId;
    end) else {};
    local v33 = if v21 then l_React_0.useRef(os.clock()) else nil;
    local v35 = l_React_0.useCallback(function() --[[ Line: 66 ]]
        -- upvalues: v26 (copy), v28 (copy), v25 (copy), v21 (ref), l_encodeSquadMembers_0 (ref), v29 (copy), l_EventNames_0 (ref), v27 (copy), v33 (copy)
        if v26.navigateIntoSquadLobby and v28 then
            v25(v26.navigateIntoSquadLobby({
                conversationId = v28
            }, true));
        end;
        if v21 then
            local v34 = l_encodeSquadMembers_0(v29);
            v26.fireSquadAnalytics(l_EventNames_0.SquadTopBannerClicked, {
                squadId = v27, 
                parentChannelId = v28, 
                squadMembers = v34, 
                timePassedSinceLastStateUpdatedInSec = os.clock() - v33.current
            });
        end;
    end, l_dependencyArray_0(if v21 then v27 else nil, v28, v25, v26.navigateIntoSquadLobby, if v21 then v26.fireSquadAnalytics else nil, if v21 then v29 else nil));
    local v36 = if v22 then v26.useGetConversationFromId(v28) else nil;
    local v37 = if v22 then v36 and v36.type else nil;
    local v38 = if v22 then v36 and v36.participants else nil;
    local v39 = if l_FFlagIsSquadEnabledAMP_0 then l_useCanAccessParty_0() else nil;
    local v40 = v26.useSquadRootView();
    if l_FFlagEnableSquadTopBannerWideMode_0 then
        local v41 = v26.useSquadTopBannerDisabled();
        l_React_0.useEffect(function() --[[ Line: 110 ]]
            -- upvalues: v27 (copy), v41 (copy), v40 (copy), l_SquadRootViewType_0 (ref), l_FFlagIsSquadEnabledAMP_0 (ref), v39 (copy), v21 (ref), v33 (copy), v25 (copy), l_SetAppTopBanner_0 (ref), l_AppTopBannerType_0 (ref), v30 (ref), v37 (copy), v38 (copy), v35 (copy)
            local v42 = v27 and (not v41 or v40 == l_SquadRootViewType_0.None);
            if if l_FFlagIsSquadEnabledAMP_0 then v39 and v42 else v42 then
                if v21 then
                    v33.current = os.clock();
                end;
                v25(l_SetAppTopBanner_0(true, l_AppTopBannerType_0.ActiveSquad, if v21 then {
                    squadMemberList = v30, 
                    parentChannelType = v37, 
                    parentChannelParticipants = v38
                } else nil, v35));
                return;
            else
                v25(l_SetAppTopBanner_0(false, l_AppTopBannerType_0.None, nil));
                return;
            end;
        end, l_dependencyArray_0(v27, if v21 then v30 else nil, v25, v35, if v22 then v37 else nil, if v22 then v38 else nil, v41, v40));
    else
        local v43 = v26.useSquadViewFlags();
        l_React_0.useEffect(function() --[[ Line: 156 ]]
            -- upvalues: v27 (copy), v43 (copy), l_SquadViewFlags_0 (ref), v40 (copy), l_SquadRootViewType_0 (ref), l_FFlagIsSquadEnabledAMP_0 (ref), v39 (copy), v21 (ref), v33 (copy), v25 (copy), l_SetAppTopBanner_0 (ref), l_AppTopBannerType_0 (ref), v30 (ref), v37 (copy), v38 (copy), v35 (copy)
            local v44 = v27 and (bit32.band(v43, l_SquadViewFlags_0.SquadLobby) == 0 or v40 == l_SquadRootViewType_0.None);
            if if l_FFlagIsSquadEnabledAMP_0 then v39 and v44 else v44 then
                if v21 then
                    v33.current = os.clock();
                end;
                v25(l_SetAppTopBanner_0(true, l_AppTopBannerType_0.ActiveSquad, if v21 then {
                    squadMemberList = v30, 
                    parentChannelType = v37, 
                    parentChannelParticipants = v38
                } else nil, v35));
                return;
            else
                v25(l_SetAppTopBanner_0(false, l_AppTopBannerType_0.None, nil));
                return;
            end;
        end, l_dependencyArray_0(v27, if v21 then v30 else nil, v25, v35, v43, if v22 then v37 else nil, if v22 then v38 else nil, v40));
    end;
    return nil;
end;