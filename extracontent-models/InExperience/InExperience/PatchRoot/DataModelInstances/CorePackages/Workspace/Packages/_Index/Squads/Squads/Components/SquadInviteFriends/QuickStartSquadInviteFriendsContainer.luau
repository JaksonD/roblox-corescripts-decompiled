local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local v3 = require(l_script_FirstAncestor_0.Enums.SquadButtonSourceEnum);
local v4 = require(l_script_FirstAncestor_0.Enums.SquadButtonClickIntentionEnum);
local v5 = require(l_Parent_0.SharedFlags);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_Cryo_0 = v2.Cryo;
local l_dependencyArray_0 = v2.Hooks.dependencyArray;
local l_createConversation_0 = v2.SquadsCore.Thunks.createConversation;
local l_leaveSquad_0 = v2.SquadsCore.Thunks.leaveSquad;
local l_React_0 = v2.React;
local l_SquadExternalContractContext_0 = v2.SquadsCore.SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadPromptType_0 = v2.SquadsCore.Enums.SquadPromptType;
local l_useCurrentSquadParentChannelId_0 = v2.SquadsCore.Hooks.useCurrentSquadParentChannelId;
local l_useCurrentSquadSelector_0 = v2.Hooks.useCurrentSquadSelector;
local l_useDispatch_0 = v2.Hooks.useDispatch;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useStore_0 = v2.Hooks.useStore;
local v19 = require(script.Parent.SquadInviteFriends);
local l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 = v5.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled;
local l_FFlagEnableAppChatFocusableFixes_0 = v2.SharedFlags.FFlagEnableAppChatFocusableFixes;
local l_FFlagRemoveDependencyArrayAntipattern_0 = v5.FFlagRemoveDependencyArrayAntipattern;
local l_EventNames_0 = v2.SquadsCore.Analytics.EventNames;
return function(v24) --[[ Line: 41 ]] --[[ Name: QuickStartSquadInviteFriendsContainer ]]
    -- upvalues: l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useDispatch_0 (copy), l_useStore_0 (copy), l_useCurrentSquadSelector_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (copy), l_useLocalUserId_0 (copy), l_useLocalization_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_EventNames_0 (copy), v3 (copy), v4 (copy), l_createConversation_0 (copy), l_Cryo_0 (copy), l_leaveSquad_0 (copy), l_SquadPromptType_0 (copy), v19 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy)
    local v25 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v26 = l_useDispatch_0();
    local v27 = l_useStore_0();
    local v28 = l_useCurrentSquadSelector_0();
    local v29 = l_useCurrentSquadParentChannelId_0();
    local v30 = v25.useGetConversationFromId(v29);
    local v31 = not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v25.useIsChatEnabled();
    local v32 = l_useLocalUserId_0();
    local v33 = l_useLocalization_0({
        startPartyText = "Feature.Squads.Action.Start"
    });
    local v34 = l_React_0.useRef(false);
    local v36 = l_React_0.useCallback(function(v35) --[[ Line: 63 ]]
        -- upvalues: v34 (copy), v24 (copy)
        v34.current = true;
        v24.navigateIntoSquadLobby(v35);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v24.navigateIntoSquadLobby
    } else l_dependencyArray_0(v24.navigateIntoSquadLobby));
    local v40 = l_React_0.useCallback(function(v37) --[[ Line: 73 ]]
        -- upvalues: v25 (copy), l_EventNames_0 (ref), v24 (copy), v3 (ref), v4 (ref), v26 (copy), l_createConversation_0 (ref), v36 (copy)
        local v38 = #v37 == 1 and "one_to_one" or "group";
        v25.fireSquadAnalytics(l_EventNames_0.EnterSquadButtonPressed, {
            partyAttemptId = v24.partyAttemptId, 
            squadButtonSource = v3.PartyQuickStartButton, 
            squadLocation = v25.squadLocation, 
            userIntention = v4.Create
        });
        v26(l_createConversation_0({
            conversationType = v38, 
            userIds = v37, 
            source = "conversationCreatedFromPartyQuickStart", 
            onSuccessCallback = function(v39) --[[ Line: 87 ]] --[[ Name: onSuccessCallback ]]
                -- upvalues: v36 (ref)
                v36(v39);
            end, 
            squadContext = v25
        }));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v26, 
        v24.partyAttemptId, 
        v24.navigateIntoSquadLobby, 
        v25.createConversation, 
        v25.setSquadPrompt, 
        v25.squadLocation, 
        v25.fireSquadAnalytics, 
        v27
    } else l_dependencyArray_0(v26, v24.partyAttemptId, v24.navigateIntoSquadLobby, v25.createConversation, v25.setSquadPrompt, v25.squadLocation, v25.fireSquadAnalytics, v27));
    local v47 = l_React_0.useCallback(function(v41) --[[ Line: 117 ]]
        -- upvalues: l_Cryo_0 (ref), v28 (copy), v30 (copy), v36 (copy), v29 (copy), v26 (copy), l_leaveSquad_0 (ref), l_SquadPromptType_0 (ref), v25 (copy), v40 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v31 (copy)
        local v42 = l_Cryo_0.Dictionary.keys(v41);
        if v28 and v30.type == "one_to_one" and #v42 == 1 then
            local v43 = v42[1];
            local l_participants_0 = v30.participants;
            for _, v46 in ipairs(l_participants_0) do
                if v46 == v43 then
                    v36(v29);
                    return;
                end;
            end;
        end;
        if v28 then
            v26(l_leaveSquad_0(l_SquadPromptType_0.JoinAnotherSquad, v25.setSquadPrompt, function() --[[ Line: 138 ]]
                -- upvalues: v40 (ref), v42 (copy)
                v40(v42);
            end, v25.squadLocation, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v31));
            return;
        else
            v40(v42);
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v28, 
        v26, 
        v40, 
        v30, 
        v29, 
        v24.navigateIntoSquadLobby, 
        v25.setSquadPrompt, 
        v25.squadLocation, 
        if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v31 else nil
    } else l_dependencyArray_0(v28, v26, v40, v30, v29, v24.navigateIntoSquadLobby, v25.setSquadPrompt, v25.squadLocation, if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v31 else nil));
    return l_React_0.createElement(v19, {
        onMultiInvite = v47, 
        buttonText = v33.startPartyText, 
        participants = if v32 and v32 ~= "" then {
            v32
        } else nil, 
        partyStartedRef = v34, 
        analyticsInfo = l_React_0.useMemo(function() --[[ Line: 179 ]]
            -- upvalues: v24 (copy)
            return {
                partyAttemptId = v24.partyAttemptId, 
                selectionPageType = "QuickStartInvite"
            };
        end, {
            v24.partyAttemptId
        }), 
        onSelectedFriendsChanged = if l_FFlagEnableAppChatFocusableFixes_0 then v24.onSelectedFriendsChanged else nil, 
        shouldHideFooterButton = if l_FFlagEnableAppChatFocusableFixes_0 then v24.shouldHideFooterButton else nil
    });
end;