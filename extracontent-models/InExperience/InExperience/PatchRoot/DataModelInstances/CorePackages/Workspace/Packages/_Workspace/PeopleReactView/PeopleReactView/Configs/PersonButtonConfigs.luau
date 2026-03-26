local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.PeopleService);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.SignalsReact);
local _ = require(l_Parent_0.Signals);
local v9 = require(l_Parent_0.RobloxAppHooks);
local v10 = require(l_Parent_0.RobloxAppEnums);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ButtonVariant_0 = require(l_Parent_0.Foundation).Enums.ButtonVariant;
local l_useSignalState_0 = v7.useSignalState;
local l_useDeviceOrientation_0 = v9.useDeviceOrientation;
local v15 = require(l_script_FirstAncestor_0.Constants);
local v16 = v5.getService("Constants");
local v17 = v5.getService("Flags");
local l_GetFFlagNewPeopleButtonOrder_0 = v17.GetFFlagNewPeopleButtonOrder;
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local l_GetFFlagNewPeoplePageIcons_0 = v17.GetFFlagNewPeoplePageIcons;
local l_GetFFlagAddPeoplePageCardLayout_0 = v17.GetFFlagAddPeoplePageCardLayout;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local function v23() --[[ Line: 41 ]] --[[ Name: getPlaySessionId ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy)
    if l_game_EngineFeature_0 then
        return l_RbxAnalyticsService_0:GetPlaySessionId();
    else
        return "";
    end;
end;
return function(v24) --[[ Line: 66 ]] --[[ Name: usePersonButtonConfigs ]]
    -- upvalues: v5 (copy), l_useDeviceOrientation_0 (copy), v10 (copy), l_useLocalization_0 (copy), v15 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v6 (copy), l_Players_0 (copy), v23 (copy), l_useSignalState_0 (copy), l_GetFFlagAddPeoplePageCardLayout_0 (copy), v16 (copy), l_GetFFlagNewPeopleButtonOrder_0 (copy), l_GetFFlagNewPeoplePageIcons_0 (copy), l_ButtonVariant_0 (copy), l_GuiService_0 (copy)
    local v25 = v5.getService("PeopleVoiceChatStore");
    local v26 = v5.getService("PeopleReportAbuseMenu");
    local v27 = v5.getService("PeopleAnalyticsManager");
    local v28 = v5.getService("SettingsHubService");
    local v29 = v5.getService("FriendStatusStore");
    local v30 = v5.getService("PeopleBlockStatusStore");
    local v31 = v5.getService("PeopleUtility");
    local v32 = l_useDeviceOrientation_0() == v10.DeviceOrientationMode.Portrait;
    local v33 = l_useLocalization_0({
        requestSent = v15.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.REQUEST_SENT, 
        friend = if l_FFlagConnectionsToFriendsRename_0 then v15.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.FRIEND else nil, 
        addFriend = if l_FFlagConnectionsToFriendsRename_0 then v15.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.ADD_FRIEND else nil, 
        connection = if l_FFlagConnectionsToFriendsRename_0 then nil else v15.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.CONNECTION, 
        addConnection = if l_FFlagConnectionsToFriendsRename_0 then nil else v15.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.ADD_CONNECTION, 
        unblock = v15.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.UNBLOCK
    });
    local v34 = v6.useMemo(function() --[[ Line: 100 ]]
        -- upvalues: l_FFlagConnectionsToFriendsRename_0 (ref), v33 (copy)
        return {
            isFriend = if l_FFlagConnectionsToFriendsRename_0 then v33.friend else v33.connection, 
            addPerson = if l_FFlagConnectionsToFriendsRename_0 then v33.addFriend else v33.addConnection, 
            requestSent = v33.requestSent
        };
    end, {
        v33
    });
    local v35 = v6.useMemo(function() --[[ Line: 110 ]]
        -- upvalues: v24 (copy), l_Players_0 (ref)
        if v24 then
            return (l_Players_0:GetPlayerByUserId(v24));
        else
            return nil;
        end;
    end, {
        v24
    });
    local v36 = v6.useMemo(v23, {});
    local v37 = v25.getPlayerMuteState(v24);
    local v38 = v25.getPlayerAnimatedIcon(v24);
    local v39 = v25.getPlayerIsLocalMuted(v24);
    local v40 = l_useSignalState_0(v25.getPlayerShouldShowMuteButton(v24));
    local v41 = l_useSignalState_0(v29.getShouldShowFriendButton(v24, v35));
    local v42 = if l_GetFFlagAddPeoplePageCardLayout_0() then v6.useMemo(function() --[[ Line: 124 ]]
        -- upvalues: v29 (copy), v24 (copy)
        return v29.getFriendStatus(v24);
    end, {
        v24
    }) else v29.getFriendStatus(v24);
    local v43 = if l_GetFFlagAddPeoplePageCardLayout_0() then v6.useMemo(function() --[[ Line: 131 ]]
        -- upvalues: v29 (copy), v24 (copy), v34 (copy)
        return v29.getFriendButtonText(v24, v34);
    end, {
        v24, 
        v34
    }) else v29.getFriendButtonText(v24, v34);
    local v44 = if l_GetFFlagAddPeoplePageCardLayout_0() then v6.useMemo(function() --[[ Line: 138 ]]
        -- upvalues: v29 (copy), v24 (copy)
        return v29.getFriendButtonVariant(v24);
    end, {
        v24
    }) else v29.getFriendButtonVariant(v24);
    local v45 = v6.useMemo(function() --[[ Line: 144 ]]
        -- upvalues: v24 (copy), v30 (copy)
        if v24 then
            return (v30.getPlayerBlockStatus(v24));
        else
            return nil;
        end;
    end, {
        v24
    });
    local v46 = l_useSignalState_0(v45);
    local v47 = v6.useMemo(function() --[[ Line: 149 ]]
        -- upvalues: v31 (copy), v35 (copy), v24 (copy)
        return v31.showPersonButtons(v35, v24);
    end, {
        v24
    });
    return (v6.useMemo(function() --[[ Line: 154 ]]
        -- upvalues: v16 (ref), v38 (copy), v37 (copy), v40 (copy), v27 (copy), v24 (copy), v39 (copy), l_GetFFlagAddPeoplePageCardLayout_0 (ref), v25 (copy), l_GetFFlagNewPeopleButtonOrder_0 (ref), v46 (copy), v33 (copy), l_GetFFlagNewPeoplePageIcons_0 (ref), v15 (ref), v47 (copy), v35 (copy), v30 (copy), l_ButtonVariant_0 (ref), v32 (copy), v43 (copy), v42 (copy), v44 (copy), v41 (copy), v29 (copy), v26 (copy), l_GuiService_0 (ref), v36 (copy), v28 (copy)
        local v48 = {};
        local v50 = {
            id = v16.PERSON_BUTTONS.MUTE_PLAYER, 
            animatedIcon = v38, 
            buttonState = v37, 
            shouldShow = function() --[[ Line: 162 ]] --[[ Name: shouldShow ]]
                -- upvalues: v40 (ref)
                return v40;
            end, 
            onActivated = function(v49) --[[ Line: 165 ]] --[[ Name: onActivated ]]
                -- upvalues: v27 (ref), v24 (ref), v39 (ref), l_GetFFlagAddPeoplePageCardLayout_0 (ref), v25 (ref)
                v27:trackToggleMutePlayer(v24, v39(false), if l_GetFFlagAddPeoplePageCardLayout_0() then v49 else nil);
                v25.togglePlayerMute(v24);
            end, 
            layoutOrder = l_GetFFlagNewPeopleButtonOrder_0() and 30 or 10, 
            isGrayedOut = v39, 
            isBuilderIcon = false
        };
        if l_GetFFlagAddPeoplePageCardLayout_0() then
            v48[v16.PERSON_BUTTONS.MUTE_PLAYER] = v50;
        else
            table.insert(v48, v50);
        end;
        local v52 = {
            id = v16.PERSON_BUTTONS.BLOCK_PLAYER, 
            text = if v46 then v33.unblock else nil, 
            onIcon = if v46 then nil else if l_GetFFlagNewPeoplePageIcons_0() then v15.PEOPLEPAGE.PERSON_BUTTONS.ICON.BLOCK_NEW else v15.PEOPLEPAGE.PERSON_BUTTONS.ICON.BLOCK_LEGACY, 
            shouldShow = function() --[[ Line: 195 ]] --[[ Name: shouldShow ]]
                -- upvalues: v47 (ref)
                return v47;
            end, 
            onActivated = function(v51) --[[ Line: 198 ]] --[[ Name: onActivated ]]
                -- upvalues: v35 (ref), v46 (ref), v30 (ref), l_GetFFlagAddPeoplePageCardLayout_0 (ref)
                if v35 then
                    if v46 then
                        v30.unblockPlayer(v35, if l_GetFFlagAddPeoplePageCardLayout_0() then v51 else nil);
                        return;
                    else
                        v30.blockPlayer(v35, if l_GetFFlagAddPeoplePageCardLayout_0() then v51 else nil);
                    end;
                end;
            end, 
            buttonVariant = if v46 then l_ButtonVariant_0.Subtle else nil, 
            layoutOrder = l_GetFFlagNewPeopleButtonOrder_0() and 10 or 40, 
            isBuilderIcon = l_GetFFlagNewPeoplePageIcons_0()
        };
        if l_GetFFlagAddPeoplePageCardLayout_0() then
            v48[v16.PERSON_BUTTONS.BLOCK_PLAYER] = v52;
        else
            table.insert(v48, v52);
        end;
        local v54 = {
            id = v16.PERSON_BUTTONS.ADD_FRIEND, 
            text = if v32 then nil else v43, 
            onIcon = if not v32 then nil else if l_GetFFlagNewPeoplePageIcons_0() then v15.PEOPLEPAGE.PERSON_BUTTONS.ICON.ADD_FRIEND_NEW else v15.PEOPLEPAGE.PERSON_BUTTONS.ICON.ADD_FRIEND_LEGACY, 
            offIcon = if not v32 then nil else if l_GetFFlagNewPeoplePageIcons_0() then v15.PEOPLEPAGE.PERSON_BUTTONS.ICON.FRIEND_NEW else v15.PEOPLEPAGE.PERSON_BUTTONS.ICON.FRIEND_LEGACY, 
            buttonState = v42, 
            buttonVariant = if v32 then nil else v44, 
            shouldShow = function() --[[ Line: 238 ]] --[[ Name: shouldShow ]]
                -- upvalues: v41 (ref)
                return v41;
            end, 
            onActivated = function(v53) --[[ Line: 241 ]] --[[ Name: onActivated ]]
                -- upvalues: v27 (ref), l_GetFFlagAddPeoplePageCardLayout_0 (ref), v29 (ref), v35 (ref)
                v27:trackRequestFriendship(if l_GetFFlagAddPeoplePageCardLayout_0() then v53 else nil);
                v29.sendFriendRequest(v35);
            end, 
            layoutOrder = 60, 
            isDisabled = v29.getIsFriendButtonDisabled(v24), 
            isGrayedOut = v29.getIsFriendButtonGrayedOut(v24), 
            isBuilderIcon = l_GetFFlagNewPeoplePageIcons_0()
        };
        if l_GetFFlagAddPeoplePageCardLayout_0() then
            v48[v16.PERSON_BUTTONS.ADD_FRIEND] = v54;
        else
            table.insert(v48, v54);
        end;
        local v56 = {
            id = v16.PERSON_BUTTONS.REPORT_PLAYER, 
            onIcon = if l_GetFFlagNewPeoplePageIcons_0() then v15.PEOPLEPAGE.PERSON_BUTTONS.ICON.REPORT_PLAYER_NEW else v15.PEOPLEPAGE.PERSON_BUTTONS.ICON.REPORT_PLAYER_LEGACY, 
            shouldShow = function() --[[ Line: 267 ]] --[[ Name: shouldShow ]]
                -- upvalues: v47 (ref)
                return v47;
            end, 
            onActivated = function(v55) --[[ Line: 270 ]] --[[ Name: onActivated ]]
                -- upvalues: v35 (ref), v26 (ref), l_GetFFlagAddPeoplePageCardLayout_0 (ref)
                if v35 then
                    v26:ReportPlayer(v35, if l_GetFFlagAddPeoplePageCardLayout_0() then v55 else "MenuPlayerList");
                end;
            end, 
            layoutOrder = l_GetFFlagNewPeopleButtonOrder_0() and 40 or 30, 
            isBuilderIcon = l_GetFFlagNewPeoplePageIcons_0()
        };
        if l_GetFFlagAddPeoplePageCardLayout_0() then
            v48[v16.PERSON_BUTTONS.REPORT_PLAYER] = v56;
        else
            table.insert(v48, v56);
        end;
        local v59 = {
            id = v16.PERSON_BUTTONS.INSPECT, 
            onIcon = if l_GetFFlagNewPeoplePageIcons_0() then v15.PEOPLEPAGE.PERSON_BUTTONS.ICON.INSPECT_NEW else v15.PEOPLEPAGE.PERSON_BUTTONS.ICON.INSPECT_LEGACY, 
            shouldShow = function() --[[ Line: 294 ]] --[[ Name: shouldShow ]]
                -- upvalues: l_GuiService_0 (ref)
                return l_GuiService_0:GetInspectMenuEnabled();
            end, 
            onActivated = function(v57) --[[ Line: 297 ]] --[[ Name: onActivated ]]
                -- upvalues: v35 (ref), l_GetFFlagAddPeoplePageCardLayout_0 (ref), v27 (ref), v36 (ref), l_GuiService_0 (ref), v28 (ref)
                if v35 then
                    if l_GetFFlagAddPeoplePageCardLayout_0() then
                        v27:trackInspectButton(game.GameId, v36, v57);
                    else
                        v27:trackInspectButton(game.GameId, v36);
                    end;
                    l_GuiService_0:InspectPlayerFromUserIdWithCtx(v35.UserId, "escapeMenu");
                    local v58 = v28.hubRef();
                    if v58 then
                        v58:SetVisibility(false);
                    end;
                end;
            end, 
            layoutOrder = 20, 
            isBuilderIcon = l_GetFFlagNewPeoplePageIcons_0()
        };
        if l_GetFFlagAddPeoplePageCardLayout_0() then
            v48[v16.PERSON_BUTTONS.INSPECT] = v59;
            return v48;
        else
            table.insert(v48, v59);
            return v48;
        end;
    end, {
        v40, 
        v41, 
        v47, 
        v46, 
        v32, 
        v43, 
        v44, 
        v42
    }));
end;