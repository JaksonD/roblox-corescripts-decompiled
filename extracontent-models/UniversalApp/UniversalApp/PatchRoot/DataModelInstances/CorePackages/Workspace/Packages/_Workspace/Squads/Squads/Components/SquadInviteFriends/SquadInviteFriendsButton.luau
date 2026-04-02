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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v25 = {
    [l_UserModel_0.PresenceType.OFFLINE] = 0, 
    [l_UserModel_0.PresenceType.ONLINE] = 1, 
    [l_UserModel_0.PresenceType.IN_GAME] = 2, 
    [l_UserModel_0.PresenceType.IN_STUDIO] = 3
};
local function _() --[[ Line: 51 ]] --[[ Name: getFFlagRenameFriendsToConnectionsPartyLobby ]]
    -- upvalues: v7 (copy)
    return v7.getAppFeaturePolicies().getRenameFriendsToConnections();
end;
return function(v27) --[[ Line: 55 ]] --[[ Name: SquadInviteFriendsButton ]]
    -- upvalues: l_React_0 (copy), l_SelectedUsersContext_0 (copy), l_InviteCallbackContext_0 (copy), l_FriendsListContext_0 (copy), l_SquadExternalContractContext_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v9 (copy), v2 (copy), l_useLocalization_0 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), l_UserModel_0 (copy), v25 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_encodeUserIds_0 (copy), l_EventNames_0 (copy), l_SquadRootViewType_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v7 (copy)
    local v28 = l_React_0.useContext(l_SelectedUsersContext_0);
    local v29 = l_React_0.useContext(l_InviteCallbackContext_0);
    local v30 = l_React_0.useContext(l_FriendsListContext_0);
    local v31 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local l_selectedFriendsSize_0 = v28.selectedFriendsSize;
    local v33 = nil;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v33 = v9(l_selectedFriendsSize_0, v28.selectedFriends or {}, v28.preselectedUsers or {});
    else
        v33 = true;
        if v28.preselectedUsers then
            if l_selectedFriendsSize_0 < #v28.preselectedUsers then
                v33 = false;
            elseif v28.preselectedUsers then
                for v34, _ in pairs(v28.selectedFriends) do
                    if not v2.List.find(v28.preselectedUsers, (tostring(v34))) then
                        v33 = false;
                        break;
                    end;
                end;
            end;
        else
            v33 = l_selectedFriendsSize_0 == 0;
        end;
    end;
    local v36 = l_useLocalization_0({
        addFriendsText = "Feature.Chat.Label.AddFriends", 
        addConnectionsText = "CommonUI.Features.Label.AddConnections"
    });
    local v37 = nil;
    if l_FFlagEnablePartyQuickStartButton_0 then
        local v38 = v31.useSquadRootView();
        local v39 = l_React_0.useRef({});
        local v44 = l_React_0.useCallback(function() --[[ Line: 106 ]]
            -- upvalues: v30 (copy), l_UserModel_0 (ref), v25 (ref)
            if v30.isFetchingFriends then
                return {}, {};
            else
                local v40 = {};
                local v41 = {};
                for _, v43 in pairs(v30.friends) do
                    if v43.presence ~= l_UserModel_0.PresenceType.OFFLINE then
                        table.insert(v40, (tonumber(v43.id)));
                        table.insert(v41, v25[v43.presence]);
                    end;
                end;
                return v40, v41;
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v30.isFetchingFriends, 
            v30.friends
        } else l_dependencyArray_0(v30.isFetchingFriends, v30.friends));
        local v52 = l_React_0.useCallback(function() --[[ Line: 128 ]]
            -- upvalues: v28 (copy), v30 (copy), v25 (ref)
            local v45 = {};
            local v46 = {};
            local v47 = {};
            for v48, _ in pairs(v28.selectedFriends) do
                v47[v48] = true;
            end;
            for _, v51 in ipairs(v30.friends) do
                if v47[v51.id] then
                    table.insert(v45, (tonumber(v51.id)));
                    table.insert(v46, v25[v51.presence]);
                end;
            end;
            return v45, v46;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v28.selectedFriends, 
            v30.friends
        } else l_dependencyArray_0(v28.selectedFriends, v30.friends));
        l_React_0.useEffect(function() --[[ Line: 152 ]]
            -- upvalues: v44 (copy), v52 (copy), v39 (copy)
            local v53, v54 = v44();
            local v55, v56 = v52();
            v39.current = {
                onlineFriendsIds = v53, 
                onlineFriendsPresence = v54, 
                selectedFriendsIds = v55, 
                selectedFriendsPresence = v56, 
                numActiveFriends = #v53, 
                numSelectedFriends = #v55
            };
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v44, 
            v52
        } else l_dependencyArray_0(v44, v52));
        local v60 = l_React_0.useCallback(function(v57) --[[ Line: 171 ]]
            -- upvalues: v39 (copy), v2 (ref), v27 (copy), v31 (copy), l_encodeUserIds_0 (ref), l_EventNames_0 (ref)
            local l_current_0 = v39.current;
            local v59 = v2.Dictionary.join(v27.analyticsInfo, {
                actionLocation = v31.squadLocation, 
                actionType = v57, 
                activeFriendsUserIds = l_encodeUserIds_0(l_current_0.onlineFriendsIds), 
                activeFriendsPresences = l_encodeUserIds_0(l_current_0.onlineFriendsPresence), 
                selectedFriendsUserIds = l_encodeUserIds_0(l_current_0.selectedFriendsIds), 
                selectedFriendsPresences = l_encodeUserIds_0(l_current_0.selectedFriendsPresence), 
                numActiveFriends = l_current_0.numActiveFriends, 
                numSelectedFriends = l_current_0.numSelectedFriends, 
                clientTimeStamp = os.time()
            });
            v31.fireSquadAnalytics(l_EventNames_0.MultiInviteMenuActionStatus, v59);
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v31.squadLocation, 
            v31.fireSquadAnalytics, 
            v27.analyticsInfo
        } else l_dependencyArray_0(v31.squadLocation, v31.fireSquadAnalytics, v27.analyticsInfo));
        l_React_0.useEffect(function() --[[ Line: 198 ]]
            -- upvalues: v27 (copy), v60 (copy)
            return function() --[[ Line: 199 ]]
                -- upvalues: v27 (ref), v60 (ref)
                if not v27.partyStartedRef.current then
                    v60("leave_page");
                    return;
                else
                    v60("multi_invite_attempted");
                    return;
                end;
            end;
        end, {});
        l_React_0.useEffect(function() --[[ Line: 211 ]]
            -- upvalues: v38 (copy), l_SquadRootViewType_0 (ref), v60 (copy)
            if v38 == l_SquadRootViewType_0.None then
                v60("leave_page");
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v38, 
            v60
        } else l_dependencyArray_0(v38, v60));
        v37 = l_React_0.useCallback(function() --[[ Line: 223 ]]
            -- upvalues: v60 (copy), v29 (copy), v28 (copy)
            v60("multi_invite_button_clicked");
            v29.inviteMultiFriends(v28.selectedFriends);
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v60, 
            v29.inviteMultiFriends, 
            v28.selectedFriends
        } else l_dependencyArray_0(v60, v29.inviteMultiFriends, v28.selectedFriends));
    else
        v37 = l_React_0.useCallback(function() --[[ Line: 241 ]]
            -- upvalues: v29 (copy), v28 (copy)
            v29.inviteMultiFriends(v28.selectedFriends);
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v29.inviteMultiFriends, 
            v28.selectedFriends
        } else l_dependencyArray_0(v29.inviteMultiFriends, v28.selectedFriends));
    end;
    return l_React_0.createElement(l_Button_0, {
        onActivated = v37, 
        buttonTextOverride = {
            TextWrapped = false
        }, 
        buttonType = l_ButtonType_0.PrimarySystem, 
        size = UDim2.new(1, 0, 0, 36), 
        text = if l_FFlagEnablePartyQuickStartButton_0 then v27.buttonText else if v7.getAppFeaturePolicies().getRenameFriendsToConnections() then v36.addConnectionsText else v36.addFriendsText, 
        isDisabled = v33
    });
end;