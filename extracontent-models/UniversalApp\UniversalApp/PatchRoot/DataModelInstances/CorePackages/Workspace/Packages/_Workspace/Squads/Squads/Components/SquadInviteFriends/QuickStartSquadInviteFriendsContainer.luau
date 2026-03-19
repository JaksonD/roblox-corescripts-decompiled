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
local l_EventNames_0 = v2.SquadsCore.Analytics.EventNames;
return function(v23) --[[ Line: 39 ]] --[[ Name: QuickStartSquadInviteFriendsContainer ]]
    -- upvalues: l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useDispatch_0 (copy), l_useStore_0 (copy), l_useCurrentSquadSelector_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (copy), l_useLocalUserId_0 (copy), l_useLocalization_0 (copy), l_dependencyArray_0 (copy), l_EventNames_0 (copy), v3 (copy), v4 (copy), l_createConversation_0 (copy), l_Cryo_0 (copy), l_leaveSquad_0 (copy), l_SquadPromptType_0 (copy), v19 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy)
    local v24 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v25 = l_useDispatch_0();
    local v26 = l_useStore_0();
    local v27 = l_useCurrentSquadSelector_0();
    local v28 = l_useCurrentSquadParentChannelId_0();
    local v29 = v24.useGetConversationFromId(v28);
    local v30 = not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v24.useIsChatEnabled();
    local v31 = l_useLocalUserId_0();
    local v32 = l_useLocalization_0({
        startPartyText = "Feature.Squads.Action.Start"
    });
    local v33 = l_React_0.useRef(false);
    local v35 = l_React_0.useCallback(function(v34) --[[ Line: 60 ]]
        -- upvalues: v33 (copy), v23 (copy)
        v33.current = true;
        v23.navigateIntoSquadLobby(v34);
    end, l_dependencyArray_0(v23.navigateIntoSquadLobby));
    local v39 = l_React_0.useCallback(function(v36) --[[ Line: 66 ]]
        -- upvalues: v24 (copy), l_EventNames_0 (ref), v23 (copy), v3 (ref), v4 (ref), v25 (copy), l_createConversation_0 (ref), v35 (copy)
        local v37 = #v36 == 1 and "one_to_one" or "group";
        v24.fireSquadAnalytics(l_EventNames_0.EnterSquadButtonPressed, {
            partyAttemptId = v23.partyAttemptId, 
            squadButtonSource = v3.PartyQuickStartButton, 
            squadLocation = v24.squadLocation, 
            userIntention = v4.Create
        });
        v25(l_createConversation_0({
            conversationType = v37, 
            userIds = v36, 
            source = "conversationCreatedFromPartyQuickStart", 
            onSuccessCallback = function(v38) --[[ Line: 80 ]] --[[ Name: onSuccessCallback ]]
                -- upvalues: v35 (ref)
                v35(v38);
            end, 
            squadContext = v24
        }));
    end, l_dependencyArray_0(v25, v23.partyAttemptId, v23.navigateIntoSquadLobby, v24.createConversation, v24.setSquadPrompt, v24.squadLocation, v24.fireSquadAnalytics, v26));
    local v46 = l_React_0.useCallback(function(v40) --[[ Line: 99 ]]
        -- upvalues: l_Cryo_0 (ref), v27 (copy), v29 (copy), v35 (copy), v28 (copy), v25 (copy), l_leaveSquad_0 (ref), l_SquadPromptType_0 (ref), v24 (copy), v39 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v30 (copy)
        local v41 = l_Cryo_0.Dictionary.keys(v40);
        if v27 and v29.type == "one_to_one" and #v41 == 1 then
            local v42 = v41[1];
            local l_participants_0 = v29.participants;
            for _, v45 in ipairs(l_participants_0) do
                if v45 == v42 then
                    v35(v28);
                    return;
                end;
            end;
        end;
        if v27 then
            v25(l_leaveSquad_0(l_SquadPromptType_0.JoinAnotherSquad, v24.setSquadPrompt, function() --[[ Line: 120 ]]
                -- upvalues: v39 (ref), v41 (copy)
                v39(v41);
            end, v24.squadLocation, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v30));
            return;
        else
            v39(v41);
            return;
        end;
    end, l_dependencyArray_0(v27, v25, v39, v29, v28, v23.navigateIntoSquadLobby, v24.setSquadPrompt, v24.squadLocation, if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v30 else nil));
    return l_React_0.createElement(v19, {
        onMultiInvite = v46, 
        buttonText = v32.startPartyText, 
        participants = if v31 and v31 ~= "" then {
            v31
        } else nil, 
        partyStartedRef = v33, 
        analyticsInfo = l_React_0.useMemo(function() --[[ Line: 149 ]]
            -- upvalues: v23 (copy)
            return {
                partyAttemptId = v23.partyAttemptId, 
                selectionPageType = "QuickStartInvite"
            };
        end, {
            v23.partyAttemptId
        }), 
        onSelectedFriendsChanged = if l_FFlagEnableAppChatFocusableFixes_0 then v23.onSelectedFriendsChanged else nil, 
        shouldHideFooterButton = if l_FFlagEnableAppChatFocusableFixes_0 then v23.shouldHideFooterButton else nil
    });
end;