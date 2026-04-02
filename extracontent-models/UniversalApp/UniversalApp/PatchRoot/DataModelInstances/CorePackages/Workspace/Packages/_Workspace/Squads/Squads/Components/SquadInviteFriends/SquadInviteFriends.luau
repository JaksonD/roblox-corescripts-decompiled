local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.FriendsMenu);
local v3 = require(l_Parent_0.NotificationModalsManager);
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_Parent_0.UIBlox);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v8 = require(l_Parent_0.ReactFocusNavigation);
local l_CoreGui_0 = v8.EngineInterface.CoreGui;
local l_FocusNavigationContext_0 = v8.FocusNavigationContext;
local l_FocusNavigationService_0 = v8.FocusNavigationService;
local v12 = require(l_Parent_0.FocusBehaviors);
local v13 = require(l_script_FirstAncestor_0.dependencies);
local v14 = require(l_script_FirstAncestor_0.Common.Constants);
local v15 = require(l_script_FirstAncestor_0.Thunks.InviteToParentChannel);
local v16 = require(l_script_FirstAncestor_0.Enums.SquadInviteSourceEnum);
local l_Cryo_0 = v13.Cryo;
local l_React_0 = v13.React;
local l_dependencyArray_0 = v13.Hooks.dependencyArray;
local l_SharedFlags_0 = v13.SharedFlags;
local l_Constants_0 = v13.SquadsCore.Common.Constants;
local l_SquadExternalContractContext_0 = v13.SquadsCore.SquadExternalContractProvider.SquadExternalContractContext;
local l_EventNames_0 = v13.SquadsCore.Analytics.EventNames;
local l_SquadPromptType_0 = v13.SquadsCore.Enums.SquadPromptType;
local l_useDispatch_0 = v13.Hooks.useDispatch;
local l_useCurrentSquadSelector_0 = v13.Hooks.useCurrentSquadSelector;
local l_useLocalization_0 = v13.Hooks.useLocalization;
local l_useStore_0 = v13.Hooks.useStore;
local l_useNavigation_0 = v13.useNavigation;
local v30 = require(l_script_FirstAncestor_0.Hooks.useIsInviteButtonDisabled);
local l_FriendsMenuFriendsList_0 = v2.FriendsMenuFriendsList;
local l_FriendsMenuContextWrapper_0 = v2.FriendsMenuContextWrapper;
local l_FriendsMenuSearch_0 = v2.FriendsMenuSearch;
local l_FriendMenuType_0 = v2.FriendMenuType;
local l_SelectedUsersScroller_0 = v2.SelectedUsersScroller;
local l_SelectedUsersContext_0 = v2.SelectedUsersContext;
local l_FFlagEnablePartyQuickStartButton_0 = l_SharedFlags_0.FFlagEnablePartyQuickStartButton;
local l_FFlagEnableAppChatFocusableFixes_0 = l_SharedFlags_0.FFlagEnableAppChatFocusableFixes;
local l_FFlagEnableAppChatFocusableFixesUpdate_0 = l_SharedFlags_0.FFlagEnableAppChatFocusableFixesUpdate;
local l_FFlagRemoveDependencyArrayAntipattern_0 = l_SharedFlags_0.FFlagRemoveDependencyArrayAntipattern;
local l_Images_0 = v5.App.ImageSet.Images;
local l_useStyle_0 = v5.Core.Style.useStyle;
local v43 = require(script.Parent.SquadInviteFriendsButton);
local v44 = require(l_script_FirstAncestor_0.Thunks.inviteToSquad);
local function v45() --[[ Line: 62 ]]

end;
local v47 = {
    buttonText = "Add", 
    onMultiInvite = function(_) --[[ Line: 66 ]] --[[ Name: onMultiInvite ]]

    end, 
    participants = {}, 
    analyticsInfo = {}, 
    onRemoveCallback = function() --[[ Line: 69 ]] --[[ Name: onRemoveCallback ]]

    end, 
    preselectedUsers = nil, 
    preselectedUsersUnremovable = false, 
    onSelectedFriendsChanged = function() --[[ Line: 72 ]] --[[ Name: onSelectedFriendsChanged ]]

    end, 
    shouldHideFooterButton = nil
};
local function v54(v48) --[[ Line: 76 ]] --[[ Name: SelectedFriendsListener ]]
    -- upvalues: l_React_0 (copy), l_SelectedUsersContext_0 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), v30 (copy)
    local v49 = l_React_0.useContext(l_SelectedUsersContext_0);
    local l_selectedFriendsSize_0 = v49.selectedFriendsSize;
    local l_selectedFriends_0 = v49.selectedFriends;
    local v52 = l_React_0.useCallback(function() --[[ Line: 85 ]]
        -- upvalues: l_FFlagEnablePartyQuickStartButton_0 (ref), v48 (copy), l_selectedFriends_0 (copy)
        if l_FFlagEnablePartyQuickStartButton_0 and v48.onMultiInvite then
            v48.onMultiInvite(l_selectedFriends_0);
            return;
        else
            v48.fallbackOnMultiInvite(l_selectedFriends_0);
            return;
        end;
    end, {
        v48.onMultiInvite, 
        v48.fallbackOnMultiInvite, 
        l_selectedFriends_0
    });
    local v53 = v30(l_selectedFriendsSize_0, v49.selectedFriends or {}, v49.preselectedUsers or {});
    l_React_0.useEffect(function() --[[ Line: 99 ]]
        -- upvalues: v48 (copy), v53 (copy), v52 (copy)
        v48.onSelectedFriendsChanged(not v53, v52);
    end, {
        v53, 
        v52, 
        v48.onSelectedFriendsChanged
    });
    return nil;
end;
return function(v55) --[[ Line: 106 ]] --[[ Name: SquadInviteFriends ]]
    -- upvalues: l_Cryo_0 (copy), v47 (copy), l_FFlagEnableAppChatFocusableFixesUpdate_0 (copy), l_React_0 (copy), l_FocusNavigationContext_0 (copy), l_SquadExternalContractContext_0 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useStore_0 (copy), l_useStyle_0 (copy), l_useAppPolicy_0 (copy), l_useLocalUserId_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useCurrentSquadSelector_0 (copy), l_useLocalization_0 (copy), v16 (copy), l_EventNames_0 (copy), v3 (copy), l_Images_0 (copy), v4 (copy), v15 (copy), v44 (copy), l_Constants_0 (copy), l_SquadPromptType_0 (copy), v12 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_FocusNavigationService_0 (copy), l_CoreGui_0 (copy), l_FriendsMenuContextWrapper_0 (copy), v45 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), v14 (copy), v54 (copy), l_FriendsMenuSearch_0 (copy), l_SelectedUsersScroller_0 (copy), l_FriendsMenuFriendsList_0 (copy), l_FriendMenuType_0 (copy), v43 (copy)
    local v56 = l_Cryo_0.Dictionary.join(v47, v55);
    local v57 = if l_FFlagEnableAppChatFocusableFixesUpdate_0 then l_React_0.useContext(l_FocusNavigationContext_0) else nil;
    local v58 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v59 = l_useDispatch_0();
    local v60 = l_useNavigation_0();
    local v61 = l_useStore_0();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v63, v64 = l_React_0.useState(0);
    local v66 = l_React_0.useCallback(function(v65) --[[ Line: 121 ]]
        return v65.getCanUsePlatformChat();
    end, {});
    local v67 = l_useAppPolicy_0(v66);
    local v68 = l_React_0.useRef(nil);
    local v69 = l_React_0.useRef(nil);
    local v70 = l_useLocalUserId_0();
    local v72 = l_React_0.useCallback(function(v71) --[[ Line: 132 ]]
        -- upvalues: v64 (copy)
        v64(v71.AbsoluteSize.Y);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v64
    } else l_dependencyArray_0(v64));
    local v73 = l_useCurrentSquadSelector_0();
    local v74 = if v73 and v73.parentChannelId then v73.parentChannelId else "";
    local v75 = v58.useGetConversationFromId(v74);
    local v76 = l_useLocalization_0({
        user = "Feature.Squads.Description.User", 
        youAddedMoreThanTwoToChat = "Feature.Squads.Description.YouAddedMoreThanTwoToChat", 
        youAddedToChat = "Feature.Squads.Description.YouAddedToChat", 
        youAddedTwoToChat = "Feature.Squads.Description.YouAddedTwoToChat"
    });
    local v79 = l_React_0.useCallback(function(v77) --[[ Line: 154 ]]
        -- upvalues: l_Cryo_0 (ref), v74 (copy), v16 (ref), v58 (copy), l_EventNames_0 (ref)
        local v78 = l_Cryo_0.Dictionary.union({
            parentChannelId = v74, 
            source = v16.SourceSquadInvitePage
        }, v77);
        v58.fireSquadAnalytics(l_EventNames_0.SquadInvite, v78);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v74, 
        v58.fireSquadAnalytics
    } else l_dependencyArray_0(v74, v58.fireSquadAnalytics));
    local v85 = l_React_0.useCallback(function(v80) --[[ Line: 170 ]]
        -- upvalues: l_Cryo_0 (ref), v76 (copy), v3 (ref), l_Images_0 (ref)
        local v81 = l_Cryo_0.Dictionary.keys(v80);
        local l_displayName_0 = v80[v81[1]].displayName;
        local v83 = nil;
        if #v81 > 2 then
            v83 = v76.youAddedMoreThanTwoToChat:gsub("{(.-)}", {
                username = l_displayName_0, 
                userCountMinusOne = tostring(#v81 - 1)
            });
        elseif #v81 == 2 then
            local l_displayName_1 = v80[v81[2]].displayName;
            v83 = v76.youAddedTwoToChat:gsub("{(.-)}", {
                username1 = l_displayName_0, 
                username2 = l_displayName_1
            });
        else
            v83 = v76.youAddedToChat:gsub("{(.-)}", {
                username = l_displayName_0
            });
        end;
        v3.SetUIBloxToast({
            iconImage = l_Images_0["icons/actions/friends/friendAdd"], 
            toastTitle = v83
        });
    end, {
        v76.youAddedMoreThanTwoToChat, 
        v76.youAddedToChat, 
        v76.youAddedTwoToChat
    });
    local v100 = l_React_0.useCallback(function(v86) --[[ Line: 198 ]]
        -- upvalues: v73 (copy), v75 (copy), l_Cryo_0 (ref), v70 (copy), v58 (copy), v59 (copy), v4 (ref), v15 (ref), v60 (copy), v44 (ref), v79 (copy), v85 (copy), l_Constants_0 (ref), v67 (copy), v61 (copy), l_SquadPromptType_0 (ref)
        if not v73 or not v75 then
            return;
        else
            local v87 = l_Cryo_0.Dictionary.keys(v86);
            local v88 = l_Cryo_0.List.toSet(v75.participants);
            local v90 = l_Cryo_0.List.filter(v87, function(v89) --[[ Line: 209 ]]
                -- upvalues: v88 (copy)
                return v88[v89] == nil;
            end);
            local function v99() --[[ Line: 213 ]]
                -- upvalues: l_Cryo_0 (ref), v75 (ref), v87 (copy), v70 (ref), v58 (ref), v59 (ref), v4 (ref), v90 (copy), v15 (ref), v60 (ref), v44 (ref), v73 (ref), v79 (ref), v85 (ref), v86 (copy)
                local v93 = l_Cryo_0.List.filter(v75.participants, function(v91) --[[ Line: 216 ]]
                    -- upvalues: l_Cryo_0 (ref), v87 (ref), v70 (ref)
                    local v92 = false;
                    if l_Cryo_0.List.find(v87, (tostring(v91))) == nil then
                        v92 = v91 ~= v70;
                    end;
                    return v92;
                end);
                local v94 = {};
                for _, v96 in ipairs(v93) do
                    table.insert(v94, v58.removeUserFromParentChannel(v59, v75.id, v96));
                end;
                v4.all(v94):andThen(function() --[[ Line: 231 ]]
                    -- upvalues: v90 (ref), v59 (ref), v15 (ref), v93 (copy), v60 (ref), v75 (ref), v44 (ref), v73 (ref), v70 (ref), v79 (ref), v85 (ref), v86 (ref), v58 (ref)
                    if #v90 > 0 then
                        v59(v15({
                            dispatch = v59, 
                            onErrorCallback = function() --[[ Line: 235 ]] --[[ Name: onErrorCallback ]]
                                -- upvalues: v93 (ref), v60 (ref)
                                if #v93 > 0 then
                                    v60.pop();
                                end;
                            end, 
                            onSuccessCallback = function(v97) --[[ Line: 240 ]] --[[ Name: onSuccessCallback ]]
                                -- upvalues: v75 (ref), v59 (ref), v44 (ref), v73 (ref), v70 (ref), v90 (ref), v79 (ref), v85 (ref), v86 (ref), v60 (ref)
                                local v98 = v97 ~= v75.id;
                                v59(v44(v73.squadId, v97, v70, v90, v79, v98));
                                v85(v86);
                                v60.pop();
                            end, 
                            parentChannel = v75, 
                            squadExternalContext = v58, 
                            userIds = v90
                        }));
                        return;
                    else
                        v60.pop();
                        return;
                    end;
                end);
            end;
            if v75.type == l_Constants_0.CONVERSATION_CHANNEL_GROUP_TYPE and v67 and #v90 > 0 then
                v58.setSquadPrompt(v61, {
                    hideCancelButton = false, 
                    promptType = l_SquadPromptType_0.ConfirmInviteToSquad, 
                    onConfirm = function() --[[ Line: 273 ]] --[[ Name: onConfirm ]]
                        -- upvalues: v99 (copy)
                        v99();
                    end
                });
                return;
            else
                v99();
                return;
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v73, 
        v59, 
        v60, 
        v75, 
        v79, 
        v85, 
        v58.setSquadPrompt, 
        v58.inviteToParentChannel, 
        v58.removeUserFromParentChannel, 
        v61, 
        v70
    } else l_dependencyArray_0(v73, v59, v60, v75, v79, v85, v58.setSquadPrompt, v58.inviteToParentChannel, v58.removeUserFromParentChannel, v61, v70));
    l_React_0.useEffect(function() --[[ Line: 310 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixesUpdate_0 (ref), v57 (copy), v68 (copy), v69 (copy), v12 (ref), l_FFlagEnableAppChatFocusableFixes_0 (ref), l_FocusNavigationService_0 (ref), l_CoreGui_0 (ref)
        if l_FFlagEnableAppChatFocusableFixesUpdate_0 and v57 and v68.current ~= nil and v69.current ~= nil then
            if v57 then
                local v101 = v12.default(v69.current);
                local l_current_0 = v68.current;
                v57:registerFocusBehavior(l_current_0, v101);
                return function() --[[ Line: 321 ]]
                    -- upvalues: v57 (ref), l_current_0 (copy), v101 (copy)
                    v57:deregisterFocusBehavior(l_current_0, v101);
                end;
            end;
        elseif l_FFlagEnableAppChatFocusableFixes_0 and v68.current ~= nil and v69.current ~= nil then
            l_FocusNavigationService_0.new(l_CoreGui_0):registerFocusBehavior(v68.current, v12.default(v69.current));
        end;
        return function() --[[ Line: 333 ]]

        end;
    end, if l_FFlagEnableAppChatFocusableFixesUpdate_0 then {
        v57
    } else {});
    return l_React_0.createElement(l_FriendsMenuContextWrapper_0, {
        inviteSingleFriend = v45, 
        inviteMultiFriends = if l_FFlagEnablePartyQuickStartButton_0 then v56.onMultiInvite else v100, 
        isLoadingCustomParams = false, 
        selectionLimit = v14.SQUAD_PARTICIPANT_LIMIT - 1, 
        preselectedUsers = if l_FFlagEnablePartyQuickStartButton_0 then v56.preselectedUsers else v75 and v75.participants and l_Cryo_0.List.filter(v75.participants, function(v103) --[[ Line: 345 ]]
            -- upvalues: v70 (copy)
            return v103 ~= v70;
        end), 
        preselectedUsersUnremovable = if l_FFlagEnablePartyQuickStartButton_0 then v56.preselectedUsersUnremovable else if v75 then v75.type == l_Constants_0.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE or v75.initiator ~= tostring(v70) else nil, 
        onRemoveCallback = if l_FFlagEnablePartyQuickStartButton_0 then v56.onRemoveCallback else v75 and function(v104, v105) --[[ Line: 358 ]]
            -- upvalues: l_Cryo_0 (ref), v75 (copy), v58 (copy), v61 (copy), v76 (copy), l_SquadPromptType_0 (ref)
            if l_Cryo_0.List.find(v75.participants, v104) then
                v58.setSquadPrompt(v61, {
                    bodyTextLocalizationProps = {
                        displayName = v105 or v76.user
                    }, 
                    hideCancelButton = true, 
                    promptType = l_SquadPromptType_0.RemoveFromParty
                });
            end;
        end or nil
    }, {
        SelectedFriendsListener = if l_FFlagEnableAppChatFocusableFixes_0 then l_React_0.createElement(v54, {
            onMultiInvite = v56.onMultiInvite, 
            fallbackOnMultiInvite = v100, 
            onSelectedFriendsChanged = v56.onSelectedFriendsChanged
        }) else nil, 
        ContainerFrame = l_React_0.createElement("Frame", {
            Size = if l_FFlagEnableAppChatFocusableFixes_0 and v56.shouldHideFooterButton then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 1, -52), 
            BackgroundTransparency = 1, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            ref = if l_FFlagEnableAppChatFocusableFixes_0 then v68 else nil
        }, {
            VerticalLayout = l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 16), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            SearchSelectFrame = l_React_0.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 0, 
                [l_React_0.Change.AbsoluteSize] = v72
            }, {
                Padding = l_React_0.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24), 
                    PaddingTop = UDim.new(0, 12)
                }), 
                VerticalLayout = l_React_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, 16), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                FriendsMenuSearch = l_React_0.createElement(l_FriendsMenuSearch_0, {
                    layoutOrder = 0, 
                    size = UDim2.new(1, 0, 0, 36), 
                    focusElement = false, 
                    ref = if l_FFlagEnableAppChatFocusableFixes_0 then v69 else nil
                }), 
                SelectedUsersScroller = l_React_0.createElement(l_SelectedUsersScroller_0, {
                    layoutOrder = 1, 
                    selectionLimit = v14.SQUAD_PARTICIPANT_LIMIT - 1
                })
            }), 
            FriendsList = l_React_0.createElement(l_FriendsMenuFriendsList_0, {
                size = UDim2.new(1, 0, 1, -v63 - 16), 
                layoutOrder = 1, 
                parentComponentName = v14.SQUAD_INVITE_PARENT_COMPONENT, 
                menuType = l_FriendMenuType_0.MultiSelect, 
                isFullRowActivatable = true, 
                backgroundTransparency = 1, 
                disableSelectionParentManagement = l_FFlagEnableAppChatFocusableFixes_0 and true or nil, 
                disableListFocus = l_FFlagEnableAppChatFocusableFixesUpdate_0 and true or nil
            })
        }), 
        FriendsListButtonFrame = if l_FFlagEnableAppChatFocusableFixes_0 and v56.shouldHideFooterButton then nil else l_React_0.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.fromScale(0, 1), 
            Size = UDim2.new(1, 0, 0, 52), 
            BackgroundTransparency = 1, 
            BackgroundColor3 = l_Theme_0.BackgroundContrast.Color, 
            BorderSizePixel = 0
        }, {
            Padding = l_React_0.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, 12), 
                PaddingBottom = UDim.new(0, 8), 
                PaddingTop = UDim.new(0, 8)
            }), 
            Button = l_React_0.createElement(v43, {
                buttonText = v56.buttonText, 
                analyticsInfo = v56.analyticsInfo, 
                partyStartedRef = v56.partyStartedRef
            })
        })
    });
end;