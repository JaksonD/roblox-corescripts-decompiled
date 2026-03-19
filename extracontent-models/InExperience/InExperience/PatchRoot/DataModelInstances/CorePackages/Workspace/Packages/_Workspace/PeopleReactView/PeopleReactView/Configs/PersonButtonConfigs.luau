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
local function v22() --[[ Line: 40 ]] --[[ Name: getPlaySessionId ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy)
    if l_game_EngineFeature_0 then
        return l_RbxAnalyticsService_0:GetPlaySessionId();
    else
        return "";
    end;
end;
return function(v23) --[[ Line: 65 ]] --[[ Name: usePersonButtonConfigs ]]
    -- upvalues: v5 (copy), l_useDeviceOrientation_0 (copy), v10 (copy), l_useLocalization_0 (copy), v15 (copy), v6 (copy), l_Players_0 (copy), v22 (copy), l_useSignalState_0 (copy), l_GetFFlagAddPeoplePageCardLayout_0 (copy), v16 (copy), l_GetFFlagNewPeopleButtonOrder_0 (copy), l_GetFFlagNewPeoplePageIcons_0 (copy), l_ButtonVariant_0 (copy), l_GuiService_0 (copy)
    local v24 = v5.getService("PeopleVoiceChatStore");
    local v25 = v5.getService("PeopleReportAbuseMenu");
    local v26 = v5.getService("PeopleAnalyticsManager");
    local v27 = v5.getService("SettingsHubService");
    local v28 = v5.getService("FriendStatusStore");
    local v29 = v5.getService("PeopleBlockStatusStore");
    local v30 = v5.getService("PeopleUtility");
    local v31 = l_useDeviceOrientation_0() == v10.DeviceOrientationMode.Portrait;
    local v32 = l_useLocalization_0({
        requestSent = v15.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.REQUEST_SENT, 
        connection = v15.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.CONNECTION, 
        addConnection = v15.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.ADD_CONNECTION, 
        unblock = v15.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.UNBLOCK
    });
    local v33 = v6.useMemo(function() --[[ Line: 86 ]]
        -- upvalues: v32 (copy)
        return {
            isFriend = v32.connection, 
            addPerson = v32.addConnection, 
            requestSent = v32.requestSent
        };
    end, {
        v32
    });
    local v34 = v6.useMemo(function() --[[ Line: 94 ]]
        -- upvalues: v23 (copy), l_Players_0 (ref)
        if v23 then
            return (l_Players_0:GetPlayerByUserId(v23));
        else
            return nil;
        end;
    end, {
        v23
    });
    local v35 = v6.useMemo(v22, {});
    local v36 = v24.getPlayerMuteState(v23);
    local v37 = v24.getPlayerAnimatedIcon(v23);
    local v38 = v24.getPlayerIsLocalMuted(v23);
    local v39 = l_useSignalState_0(v24.getPlayerShouldShowMuteButton(v23));
    local v40 = l_useSignalState_0(v28.getShouldShowFriendButton(v23, v34));
    local v41 = if l_GetFFlagAddPeoplePageCardLayout_0() then v6.useMemo(function() --[[ Line: 108 ]]
        -- upvalues: v28 (copy), v23 (copy)
        return v28.getFriendStatus(v23);
    end, {
        v23
    }) else v28.getFriendStatus(v23);
    local v42 = if l_GetFFlagAddPeoplePageCardLayout_0() then v6.useMemo(function() --[[ Line: 115 ]]
        -- upvalues: v28 (copy), v23 (copy), v33 (copy)
        return v28.getFriendButtonText(v23, v33);
    end, {
        v23, 
        v33
    }) else v28.getFriendButtonText(v23, v33);
    local v43 = if l_GetFFlagAddPeoplePageCardLayout_0() then v6.useMemo(function() --[[ Line: 122 ]]
        -- upvalues: v28 (copy), v23 (copy)
        return v28.getFriendButtonVariant(v23);
    end, {
        v23
    }) else v28.getFriendButtonVariant(v23);
    local v44 = v6.useMemo(function() --[[ Line: 128 ]]
        -- upvalues: v23 (copy), v29 (copy)
        if v23 then
            return (v29.getPlayerBlockStatus(v23));
        else
            return nil;
        end;
    end, {
        v23
    });
    local v45 = l_useSignalState_0(v44);
    local v46 = v6.useMemo(function() --[[ Line: 133 ]]
        -- upvalues: v30 (copy), v34 (copy), v23 (copy)
        return v30.showPersonButtons(v34, v23);
    end, {
        v23
    });
    return (v6.useMemo(function() --[[ Line: 138 ]]
        -- upvalues: v16 (ref), v37 (copy), v36 (copy), v39 (copy), v26 (copy), v23 (copy), v38 (copy), l_GetFFlagAddPeoplePageCardLayout_0 (ref), v24 (copy), l_GetFFlagNewPeopleButtonOrder_0 (ref), v45 (copy), v32 (copy), l_GetFFlagNewPeoplePageIcons_0 (ref), v15 (ref), v46 (copy), v34 (copy), v29 (copy), l_ButtonVariant_0 (ref), v31 (copy), v42 (copy), v41 (copy), v43 (copy), v40 (copy), v28 (copy), v25 (copy), l_GuiService_0 (ref), v35 (copy), v27 (copy)
        local v47 = {};
        local v49 = {
            id = v16.PERSON_BUTTONS.MUTE_PLAYER, 
            animatedIcon = v37, 
            buttonState = v36, 
            shouldShow = function() --[[ Line: 146 ]] --[[ Name: shouldShow ]]
                -- upvalues: v39 (ref)
                return v39;
            end, 
            onActivated = function(v48) --[[ Line: 149 ]] --[[ Name: onActivated ]]
                -- upvalues: v26 (ref), v23 (ref), v38 (ref), l_GetFFlagAddPeoplePageCardLayout_0 (ref), v24 (ref)
                v26:trackToggleMutePlayer(v23, v38(false), if l_GetFFlagAddPeoplePageCardLayout_0() then v48 else nil);
                v24.togglePlayerMute(v23);
            end, 
            layoutOrder = l_GetFFlagNewPeopleButtonOrder_0() and 30 or 10, 
            isGrayedOut = v38, 
            isBuilderIcon = false
        };
        if l_GetFFlagAddPeoplePageCardLayout_0() then
            v47[v16.PERSON_BUTTONS.MUTE_PLAYER] = v49;
        else
            table.insert(v47, v49);
        end;
        local v51 = {
            id = v16.PERSON_BUTTONS.BLOCK_PLAYER, 
            text = if v45 then v32.unblock else nil, 
            onIcon = if v45 then nil else if l_GetFFlagNewPeoplePageIcons_0() then v15.PEOPLEPAGE.PERSON_BUTTONS.ICON.BLOCK_NEW else v15.PEOPLEPAGE.PERSON_BUTTONS.ICON.BLOCK_LEGACY, 
            shouldShow = function() --[[ Line: 179 ]] --[[ Name: shouldShow ]]
                -- upvalues: v46 (ref)
                return v46;
            end, 
            onActivated = function(v50) --[[ Line: 182 ]] --[[ Name: onActivated ]]
                -- upvalues: v34 (ref), v45 (ref), v29 (ref), l_GetFFlagAddPeoplePageCardLayout_0 (ref)
                if v34 then
                    if v45 then
                        v29.unblockPlayer(v34, if l_GetFFlagAddPeoplePageCardLayout_0() then v50 else nil);
                        return;
                    else
                        v29.blockPlayer(v34, if l_GetFFlagAddPeoplePageCardLayout_0() then v50 else nil);
                    end;
                end;
            end, 
            buttonVariant = if v45 then l_ButtonVariant_0.Subtle else nil, 
            layoutOrder = l_GetFFlagNewPeopleButtonOrder_0() and 10 or 40, 
            isBuilderIcon = l_GetFFlagNewPeoplePageIcons_0()
        };
        if l_GetFFlagAddPeoplePageCardLayout_0() then
            v47[v16.PERSON_BUTTONS.BLOCK_PLAYER] = v51;
        else
            table.insert(v47, v51);
        end;
        local v53 = {
            id = v16.PERSON_BUTTONS.ADD_FRIEND, 
            text = if v31 then nil else v42, 
            onIcon = if not v31 then nil else if l_GetFFlagNewPeoplePageIcons_0() then v15.PEOPLEPAGE.PERSON_BUTTONS.ICON.ADD_FRIEND_NEW else v15.PEOPLEPAGE.PERSON_BUTTONS.ICON.ADD_FRIEND_LEGACY, 
            offIcon = if not v31 then nil else if l_GetFFlagNewPeoplePageIcons_0() then v15.PEOPLEPAGE.PERSON_BUTTONS.ICON.FRIEND_NEW else v15.PEOPLEPAGE.PERSON_BUTTONS.ICON.FRIEND_LEGACY, 
            buttonState = v41, 
            buttonVariant = if v31 then nil else v43, 
            shouldShow = function() --[[ Line: 222 ]] --[[ Name: shouldShow ]]
                -- upvalues: v40 (ref)
                return v40;
            end, 
            onActivated = function(v52) --[[ Line: 225 ]] --[[ Name: onActivated ]]
                -- upvalues: v26 (ref), l_GetFFlagAddPeoplePageCardLayout_0 (ref), v28 (ref), v34 (ref)
                v26:trackRequestFriendship(if l_GetFFlagAddPeoplePageCardLayout_0() then v52 else nil);
                v28.sendFriendRequest(v34);
            end, 
            layoutOrder = 60, 
            isDisabled = v28.getIsFriendButtonDisabled(v23), 
            isGrayedOut = v28.getIsFriendButtonGrayedOut(v23), 
            isBuilderIcon = l_GetFFlagNewPeoplePageIcons_0()
        };
        if l_GetFFlagAddPeoplePageCardLayout_0() then
            v47[v16.PERSON_BUTTONS.ADD_FRIEND] = v53;
        else
            table.insert(v47, v53);
        end;
        local v55 = {
            id = v16.PERSON_BUTTONS.REPORT_PLAYER, 
            onIcon = if l_GetFFlagNewPeoplePageIcons_0() then v15.PEOPLEPAGE.PERSON_BUTTONS.ICON.REPORT_PLAYER_NEW else v15.PEOPLEPAGE.PERSON_BUTTONS.ICON.REPORT_PLAYER_LEGACY, 
            shouldShow = function() --[[ Line: 251 ]] --[[ Name: shouldShow ]]
                -- upvalues: v46 (ref)
                return v46;
            end, 
            onActivated = function(v54) --[[ Line: 254 ]] --[[ Name: onActivated ]]
                -- upvalues: v34 (ref), v25 (ref), l_GetFFlagAddPeoplePageCardLayout_0 (ref)
                if v34 then
                    v25:ReportPlayer(v34, if l_GetFFlagAddPeoplePageCardLayout_0() then v54 else "MenuPlayerList");
                end;
            end, 
            layoutOrder = l_GetFFlagNewPeopleButtonOrder_0() and 40 or 30, 
            isBuilderIcon = l_GetFFlagNewPeoplePageIcons_0()
        };
        if l_GetFFlagAddPeoplePageCardLayout_0() then
            v47[v16.PERSON_BUTTONS.REPORT_PLAYER] = v55;
        else
            table.insert(v47, v55);
        end;
        local v58 = {
            id = v16.PERSON_BUTTONS.INSPECT, 
            onIcon = if l_GetFFlagNewPeoplePageIcons_0() then v15.PEOPLEPAGE.PERSON_BUTTONS.ICON.INSPECT_NEW else v15.PEOPLEPAGE.PERSON_BUTTONS.ICON.INSPECT_LEGACY, 
            shouldShow = function() --[[ Line: 278 ]] --[[ Name: shouldShow ]]
                -- upvalues: l_GuiService_0 (ref)
                return l_GuiService_0:GetInspectMenuEnabled();
            end, 
            onActivated = function(v56) --[[ Line: 281 ]] --[[ Name: onActivated ]]
                -- upvalues: v34 (ref), l_GetFFlagAddPeoplePageCardLayout_0 (ref), v26 (ref), v35 (ref), l_GuiService_0 (ref), v27 (ref)
                if v34 then
                    if l_GetFFlagAddPeoplePageCardLayout_0() then
                        v26:trackInspectButton(game.GameId, v35, v56);
                    else
                        v26:trackInspectButton(game.GameId, v35);
                    end;
                    l_GuiService_0:InspectPlayerFromUserIdWithCtx(v34.UserId, "escapeMenu");
                    local v57 = v27.hubRef();
                    if v57 then
                        v57:SetVisibility(false);
                    end;
                end;
            end, 
            layoutOrder = 20, 
            isBuilderIcon = l_GetFFlagNewPeoplePageIcons_0()
        };
        if l_GetFFlagAddPeoplePageCardLayout_0() then
            v47[v16.PERSON_BUTTONS.INSPECT] = v58;
            return v47;
        else
            table.insert(v47, v58);
            return v47;
        end;
    end, {
        v39, 
        v40, 
        v46, 
        v45, 
        v31, 
        v42, 
        v43, 
        v41
    }));
end;