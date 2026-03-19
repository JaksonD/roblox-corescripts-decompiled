local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.FriendsMenu);
local v4 = require(l_Parent_0.SquadsCore);
local v5 = require(l_Parent_0.UIBlox);
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local v7 = require(l_Parent_0.UniversalAppPolicy);
local v8 = require(l_script_FirstAncestor_0.dependencies);
local v9 = require(l_script_FirstAncestor_0.Hooks.useIsInviteButtonDisabled);
local l_dependencyArray_0 = v8.Hooks.dependencyArray;
local l_React_0 = v8.React;
local l_useLocalization_0 = v8.Hooks.useLocalization;
local l_Button_0 = v5.App.Button.Button;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_FriendsListContext_0 = v3.FriendsListContext;
local l_InviteCallbackContext_0 = v3.InviteCallbackContext;
local l_SelectedUsersContext_0 = v3.SelectedUsersContext;
local l_FFlagEnablePartyQuickStartButton_0 = require(l_Parent_0.SharedFlags).FFlagEnablePartyQuickStartButton;
local l_encodeUserIds_0 = v4.Common.encodeUserIds;
local l_SquadExternalContractContext_0 = v4.SquadExternalContractProvider.SquadExternalContractContext;
local l_EventNames_0 = v4.Analytics.EventNames;
local l_SquadRootViewType_0 = v4.Enums.SquadRootViewType;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v24 = {
    [l_UserModel_0.PresenceType.OFFLINE] = 0, 
    [l_UserModel_0.PresenceType.ONLINE] = 1, 
    [l_UserModel_0.PresenceType.IN_GAME] = 2, 
    [l_UserModel_0.PresenceType.IN_STUDIO] = 3
};
local function _() --[[ Line: 49 ]] --[[ Name: getFFlagRenameFriendsToConnectionsPartyLobby ]]
    -- upvalues: v7 (copy)
    return v7.getAppFeaturePolicies().getRenameFriendsToConnections();
end;
return function(v26) --[[ Line: 53 ]] --[[ Name: SquadInviteFriendsButton ]]
    -- upvalues: l_React_0 (copy), l_SelectedUsersContext_0 (copy), l_InviteCallbackContext_0 (copy), l_FriendsListContext_0 (copy), l_SquadExternalContractContext_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v9 (copy), v2 (copy), l_useLocalization_0 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), l_UserModel_0 (copy), v24 (copy), l_dependencyArray_0 (copy), l_encodeUserIds_0 (copy), l_EventNames_0 (copy), l_SquadRootViewType_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v7 (copy)
    local v27 = l_React_0.useContext(l_SelectedUsersContext_0);
    local v28 = l_React_0.useContext(l_InviteCallbackContext_0);
    local v29 = l_React_0.useContext(l_FriendsListContext_0);
    local v30 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local l_selectedFriendsSize_0 = v27.selectedFriendsSize;
    local v32 = nil;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v32 = v9(l_selectedFriendsSize_0, v27.selectedFriends or {}, v27.preselectedUsers or {});
    else
        v32 = true;
        if v27.preselectedUsers then
            if l_selectedFriendsSize_0 < #v27.preselectedUsers then
                v32 = false;
            elseif v27.preselectedUsers then
                for v33, _ in pairs(v27.selectedFriends) do
                    if not v2.List.find(v27.preselectedUsers, (tostring(v33))) then
                        v32 = false;
                        break;
                    end;
                end;
            end;
        else
            v32 = l_selectedFriendsSize_0 == 0;
        end;
    end;
    local v35 = l_useLocalization_0({
        addFriendsText = "Feature.Chat.Label.AddFriends", 
        addConnectionsText = "CommonUI.Features.Label.AddConnections"
    });
    local v36 = nil;
    if l_FFlagEnablePartyQuickStartButton_0 then
        local v37 = v30.useSquadRootView();
        local v38 = l_React_0.useRef({});
        local v43 = l_React_0.useCallback(function() --[[ Line: 103 ]]
            -- upvalues: v29 (copy), l_UserModel_0 (ref), v24 (ref)
            if v29.isFetchingFriends then
                return {}, {};
            else
                local v39 = {};
                local v40 = {};
                for _, v42 in pairs(v29.friends) do
                    if v42.presence ~= l_UserModel_0.PresenceType.OFFLINE then
                        table.insert(v39, (tonumber(v42.id)));
                        table.insert(v40, v24[v42.presence]);
                    end;
                end;
                return v39, v40;
            end;
        end, l_dependencyArray_0(v29.isFetchingFriends, v29.friends));
        local v51 = l_React_0.useCallback(function() --[[ Line: 120 ]]
            -- upvalues: v27 (copy), v29 (copy), v24 (ref)
            local v44 = {};
            local v45 = {};
            local v46 = {};
            for v47, _ in pairs(v27.selectedFriends) do
                v46[v47] = true;
            end;
            for _, v50 in ipairs(v29.friends) do
                if v46[v50.id] then
                    table.insert(v44, (tonumber(v50.id)));
                    table.insert(v45, v24[v50.presence]);
                end;
            end;
            return v44, v45;
        end, l_dependencyArray_0(v27.selectedFriends, v29.friends));
        l_React_0.useEffect(function() --[[ Line: 139 ]]
            -- upvalues: v43 (copy), v51 (copy), v38 (copy)
            local v52, v53 = v43();
            local v54, v55 = v51();
            v38.current = {
                onlineFriendsIds = v52, 
                onlineFriendsPresence = v53, 
                selectedFriendsIds = v54, 
                selectedFriendsPresence = v55, 
                numActiveFriends = #v52, 
                numSelectedFriends = #v54
            };
        end, l_dependencyArray_0(v43, v51));
        local v59 = l_React_0.useCallback(function(v56) --[[ Line: 153 ]]
            -- upvalues: v38 (copy), v2 (ref), v26 (copy), v30 (copy), l_encodeUserIds_0 (ref), l_EventNames_0 (ref)
            local l_current_0 = v38.current;
            local v58 = v2.Dictionary.join(v26.analyticsInfo, {
                actionLocation = v30.squadLocation, 
                actionType = v56, 
                activeFriendsUserIds = l_encodeUserIds_0(l_current_0.onlineFriendsIds), 
                activeFriendsPresences = l_encodeUserIds_0(l_current_0.onlineFriendsPresence), 
                selectedFriendsUserIds = l_encodeUserIds_0(l_current_0.selectedFriendsIds), 
                selectedFriendsPresences = l_encodeUserIds_0(l_current_0.selectedFriendsPresence), 
                numActiveFriends = l_current_0.numActiveFriends, 
                numSelectedFriends = l_current_0.numSelectedFriends, 
                clientTimeStamp = os.time()
            });
            v30.fireSquadAnalytics(l_EventNames_0.MultiInviteMenuActionStatus, v58);
        end, l_dependencyArray_0(v30.squadLocation, v30.fireSquadAnalytics, v26.analyticsInfo));
        l_React_0.useEffect(function() --[[ Line: 172 ]]
            -- upvalues: v26 (copy), v59 (copy)
            return function() --[[ Line: 173 ]]
                -- upvalues: v26 (ref), v59 (ref)
                if not v26.partyStartedRef.current then
                    v59("leave_page");
                    return;
                else
                    v59("multi_invite_attempted");
                    return;
                end;
            end;
        end, {});
        l_React_0.useEffect(function() --[[ Line: 184 ]]
            -- upvalues: v37 (copy), l_SquadRootViewType_0 (ref), v59 (copy)
            if v37 == l_SquadRootViewType_0.None then
                v59("leave_page");
            end;
        end, l_dependencyArray_0(v37, v59));
        v36 = l_React_0.useCallback(function() --[[ Line: 192 ]]
            -- upvalues: v59 (copy), v28 (copy), v27 (copy)
            v59("multi_invite_button_clicked");
            v28.inviteMultiFriends(v27.selectedFriends);
        end, l_dependencyArray_0(v59, v28.inviteMultiFriends, v27.selectedFriends));
    else
        v36 = l_React_0.useCallback(function() --[[ Line: 203 ]]
            -- upvalues: v28 (copy), v27 (copy)
            v28.inviteMultiFriends(v27.selectedFriends);
        end, l_dependencyArray_0(v28.inviteMultiFriends, v27.selectedFriends));
    end;
    return l_React_0.createElement(l_Button_0, {
        onActivated = v36, 
        buttonTextOverride = {
            TextWrapped = false
        }, 
        buttonType = l_ButtonType_0.PrimarySystem, 
        size = UDim2.new(1, 0, 0, 36), 
        text = if l_FFlagEnablePartyQuickStartButton_0 then v26.buttonText else if v7.getAppFeaturePolicies().getRenameFriendsToConnections() then v35.addConnectionsText else v35.addFriendsText, 
        isDisabled = v32
    });
end;