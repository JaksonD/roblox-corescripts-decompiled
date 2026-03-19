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
local l_Images_0 = v5.App.ImageSet.Images;
local l_useStyle_0 = v5.Core.Style.useStyle;
local v42 = require(script.Parent.SquadInviteFriendsButton);
local v43 = require(l_script_FirstAncestor_0.Thunks.inviteToSquad);
local function v44() --[[ Line: 61 ]]

end;
local v46 = {
    buttonText = "Add", 
    onMultiInvite = function(_) --[[ Line: 65 ]] --[[ Name: onMultiInvite ]]

    end, 
    participants = {}, 
    analyticsInfo = {}, 
    onRemoveCallback = function() --[[ Line: 68 ]] --[[ Name: onRemoveCallback ]]

    end, 
    preselectedUsers = nil, 
    preselectedUsersUnremovable = false, 
    onSelectedFriendsChanged = function() --[[ Line: 71 ]] --[[ Name: onSelectedFriendsChanged ]]

    end, 
    shouldHideFooterButton = nil
};
local function v53(v47) --[[ Line: 75 ]] --[[ Name: SelectedFriendsListener ]]
    -- upvalues: l_React_0 (copy), l_SelectedUsersContext_0 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), v30 (copy)
    local v48 = l_React_0.useContext(l_SelectedUsersContext_0);
    local l_selectedFriendsSize_0 = v48.selectedFriendsSize;
    local l_selectedFriends_0 = v48.selectedFriends;
    local v51 = l_React_0.useCallback(function() --[[ Line: 84 ]]
        -- upvalues: l_FFlagEnablePartyQuickStartButton_0 (ref), v47 (copy), l_selectedFriends_0 (copy)
        if l_FFlagEnablePartyQuickStartButton_0 and v47.onMultiInvite then
            v47.onMultiInvite(l_selectedFriends_0);
            return;
        else
            v47.fallbackOnMultiInvite(l_selectedFriends_0);
            return;
        end;
    end, {
        v47.onMultiInvite, 
        v47.fallbackOnMultiInvite, 
        l_selectedFriends_0
    });
    local v52 = v30(l_selectedFriendsSize_0, v48.selectedFriends or {}, v48.preselectedUsers or {});
    l_React_0.useEffect(function() --[[ Line: 98 ]]
        -- upvalues: v47 (copy), v52 (copy), v51 (copy)
        v47.onSelectedFriendsChanged(not v52, v51);
    end, {
        v52, 
        v51, 
        v47.onSelectedFriendsChanged
    });
    return nil;
end;
return function(v54) --[[ Line: 105 ]] --[[ Name: SquadInviteFriends ]]
    -- upvalues: l_Cryo_0 (copy), v46 (copy), l_FFlagEnableAppChatFocusableFixesUpdate_0 (copy), l_React_0 (copy), l_FocusNavigationContext_0 (copy), l_SquadExternalContractContext_0 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useStore_0 (copy), l_useStyle_0 (copy), l_useAppPolicy_0 (copy), l_useLocalUserId_0 (copy), l_dependencyArray_0 (copy), l_useCurrentSquadSelector_0 (copy), l_useLocalization_0 (copy), v16 (copy), l_EventNames_0 (copy), v3 (copy), l_Images_0 (copy), v4 (copy), v15 (copy), v43 (copy), l_Constants_0 (copy), l_SquadPromptType_0 (copy), v12 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_FocusNavigationService_0 (copy), l_CoreGui_0 (copy), l_FriendsMenuContextWrapper_0 (copy), v44 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), v14 (copy), v53 (copy), l_FriendsMenuSearch_0 (copy), l_SelectedUsersScroller_0 (copy), l_FriendsMenuFriendsList_0 (copy), l_FriendMenuType_0 (copy), v42 (copy)
    local v55 = l_Cryo_0.Dictionary.join(v46, v54);
    local v56 = if l_FFlagEnableAppChatFocusableFixesUpdate_0 then l_React_0.useContext(l_FocusNavigationContext_0) else nil;
    local v57 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v58 = l_useDispatch_0();
    local v59 = l_useNavigation_0();
    local v60 = l_useStore_0();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v62, v63 = l_React_0.useState(0);
    local v65 = l_React_0.useCallback(function(v64) --[[ Line: 120 ]]
        return v64.getCanUsePlatformChat();
    end, {});
    local v66 = l_useAppPolicy_0(v65);
    local v67 = l_React_0.useRef(nil);
    local v68 = l_React_0.useRef(nil);
    local v69 = l_useLocalUserId_0();
    local v71 = l_React_0.useCallback(function(v70) --[[ Line: 130 ]]
        -- upvalues: v63 (copy)
        v63(v70.AbsoluteSize.Y);
    end, l_dependencyArray_0(v63));
    local v72 = l_useCurrentSquadSelector_0();
    local v73 = if v72 and v72.parentChannelId then v72.parentChannelId else "";
    local v74 = v57.useGetConversationFromId(v73);
    local v75 = l_useLocalization_0({
        user = "Feature.Squads.Description.User", 
        youAddedMoreThanTwoToChat = "Feature.Squads.Description.YouAddedMoreThanTwoToChat", 
        youAddedToChat = "Feature.Squads.Description.YouAddedToChat", 
        youAddedTwoToChat = "Feature.Squads.Description.YouAddedTwoToChat"
    });
    local v78 = l_React_0.useCallback(function(v76) --[[ Line: 147 ]]
        -- upvalues: l_Cryo_0 (ref), v73 (copy), v16 (ref), v57 (copy), l_EventNames_0 (ref)
        local v77 = l_Cryo_0.Dictionary.union({
            parentChannelId = v73, 
            source = v16.SourceSquadInvitePage
        }, v76);
        v57.fireSquadAnalytics(l_EventNames_0.SquadInvite, v77);
    end, l_dependencyArray_0(v73, v57.fireSquadAnalytics));
    local v84 = l_React_0.useCallback(function(v79) --[[ Line: 159 ]]
        -- upvalues: l_Cryo_0 (ref), v75 (copy), v3 (ref), l_Images_0 (ref)
        local v80 = l_Cryo_0.Dictionary.keys(v79);
        local l_displayName_0 = v79[v80[1]].displayName;
        local v82 = nil;
        if #v80 > 2 then
            v82 = v75.youAddedMoreThanTwoToChat:gsub("{(.-)}", {
                username = l_displayName_0, 
                userCountMinusOne = tostring(#v80 - 1)
            });
        elseif #v80 == 2 then
            local l_displayName_1 = v79[v80[2]].displayName;
            v82 = v75.youAddedTwoToChat:gsub("{(.-)}", {
                username1 = l_displayName_0, 
                username2 = l_displayName_1
            });
        else
            v82 = v75.youAddedToChat:gsub("{(.-)}", {
                username = l_displayName_0
            });
        end;
        v3.SetUIBloxToast({
            iconImage = l_Images_0["icons/actions/friends/friendAdd"], 
            toastTitle = v82
        });
    end, {
        v75.youAddedMoreThanTwoToChat, 
        v75.youAddedToChat, 
        v75.youAddedTwoToChat
    });
    local v99 = l_React_0.useCallback(function(v85) --[[ Line: 187 ]]
        -- upvalues: v72 (copy), v74 (copy), l_Cryo_0 (ref), v69 (copy), v57 (copy), v58 (copy), v4 (ref), v15 (ref), v59 (copy), v43 (ref), v78 (copy), v84 (copy), l_Constants_0 (ref), v66 (copy), v60 (copy), l_SquadPromptType_0 (ref)
        if not v72 or not v74 then
            return;
        else
            local v86 = l_Cryo_0.Dictionary.keys(v85);
            local v87 = l_Cryo_0.List.toSet(v74.participants);
            local v89 = l_Cryo_0.List.filter(v86, function(v88) --[[ Line: 198 ]]
                -- upvalues: v87 (copy)
                return v87[v88] == nil;
            end);
            local function v98() --[[ Line: 202 ]]
                -- upvalues: l_Cryo_0 (ref), v74 (ref), v86 (copy), v69 (ref), v57 (ref), v58 (ref), v4 (ref), v89 (copy), v15 (ref), v59 (ref), v43 (ref), v72 (ref), v78 (ref), v84 (ref), v85 (copy)
                local v92 = l_Cryo_0.List.filter(v74.participants, function(v90) --[[ Line: 205 ]]
                    -- upvalues: l_Cryo_0 (ref), v86 (ref), v69 (ref)
                    local v91 = false;
                    if l_Cryo_0.List.find(v86, (tostring(v90))) == nil then
                        v91 = v90 ~= v69;
                    end;
                    return v91;
                end);
                local v93 = {};
                for _, v95 in ipairs(v92) do
                    table.insert(v93, v57.removeUserFromParentChannel(v58, v74.id, v95));
                end;
                v4.all(v93):andThen(function() --[[ Line: 220 ]]
                    -- upvalues: v89 (ref), v58 (ref), v15 (ref), v92 (copy), v59 (ref), v74 (ref), v43 (ref), v72 (ref), v69 (ref), v78 (ref), v84 (ref), v85 (ref), v57 (ref)
                    if #v89 > 0 then
                        v58(v15({
                            dispatch = v58, 
                            onErrorCallback = function() --[[ Line: 224 ]] --[[ Name: onErrorCallback ]]
                                -- upvalues: v92 (ref), v59 (ref)
                                if #v92 > 0 then
                                    v59.pop();
                                end;
                            end, 
                            onSuccessCallback = function(v96) --[[ Line: 229 ]] --[[ Name: onSuccessCallback ]]
                                -- upvalues: v74 (ref), v58 (ref), v43 (ref), v72 (ref), v69 (ref), v89 (ref), v78 (ref), v84 (ref), v85 (ref), v59 (ref)
                                local v97 = v96 ~= v74.id;
                                v58(v43(v72.squadId, v96, v69, v89, v78, v97));
                                v84(v85);
                                v59.pop();
                            end, 
                            parentChannel = v74, 
                            squadExternalContext = v57, 
                            userIds = v89
                        }));
                        return;
                    else
                        v59.pop();
                        return;
                    end;
                end);
            end;
            if v74.type == l_Constants_0.CONVERSATION_CHANNEL_GROUP_TYPE and v66 and #v89 > 0 then
                v57.setSquadPrompt(v60, {
                    hideCancelButton = false, 
                    promptType = l_SquadPromptType_0.ConfirmInviteToSquad, 
                    onConfirm = function() --[[ Line: 262 ]] --[[ Name: onConfirm ]]
                        -- upvalues: v98 (copy)
                        v98();
                    end
                });
                return;
            else
                v98();
                return;
            end;
        end;
    end, l_dependencyArray_0(v72, v58, v59, v74, v78, v84, v57.setSquadPrompt, v57.inviteToParentChannel, v57.removeUserFromParentChannel, v60, v69));
    l_React_0.useEffect(function() --[[ Line: 285 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixesUpdate_0 (ref), v56 (copy), v67 (copy), v68 (copy), v12 (ref), l_FFlagEnableAppChatFocusableFixes_0 (ref), l_FocusNavigationService_0 (ref), l_CoreGui_0 (ref)
        if l_FFlagEnableAppChatFocusableFixesUpdate_0 and v56 and v67.current ~= nil and v68.current ~= nil then
            if v56 then
                local v100 = v12.default(v68.current);
                local l_current_0 = v67.current;
                v56:registerFocusBehavior(l_current_0, v100);
                return function() --[[ Line: 296 ]]
                    -- upvalues: v56 (ref), l_current_0 (copy), v100 (copy)
                    v56:deregisterFocusBehavior(l_current_0, v100);
                end;
            end;
        elseif l_FFlagEnableAppChatFocusableFixes_0 and v67.current ~= nil and v68.current ~= nil then
            l_FocusNavigationService_0.new(l_CoreGui_0):registerFocusBehavior(v67.current, v12.default(v68.current));
        end;
        return function() --[[ Line: 308 ]]

        end;
    end, if l_FFlagEnableAppChatFocusableFixesUpdate_0 then {
        v56
    } else {});
    return l_React_0.createElement(l_FriendsMenuContextWrapper_0, {
        inviteSingleFriend = v44, 
        inviteMultiFriends = if l_FFlagEnablePartyQuickStartButton_0 then v55.onMultiInvite else v99, 
        isLoadingCustomParams = false, 
        selectionLimit = v14.SQUAD_PARTICIPANT_LIMIT - 1, 
        preselectedUsers = if l_FFlagEnablePartyQuickStartButton_0 then v55.preselectedUsers else v74 and v74.participants and l_Cryo_0.List.filter(v74.participants, function(v102) --[[ Line: 320 ]]
            -- upvalues: v69 (copy)
            return v102 ~= v69;
        end), 
        preselectedUsersUnremovable = if l_FFlagEnablePartyQuickStartButton_0 then v55.preselectedUsersUnremovable else if v74 then v74.type == l_Constants_0.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE or v74.initiator ~= tostring(v69) else nil, 
        onRemoveCallback = if l_FFlagEnablePartyQuickStartButton_0 then v55.onRemoveCallback else v74 and function(v103, v104) --[[ Line: 333 ]]
            -- upvalues: l_Cryo_0 (ref), v74 (copy), v57 (copy), v60 (copy), v75 (copy), l_SquadPromptType_0 (ref)
            if l_Cryo_0.List.find(v74.participants, v103) then
                v57.setSquadPrompt(v60, {
                    bodyTextLocalizationProps = {
                        displayName = v104 or v75.user
                    }, 
                    hideCancelButton = true, 
                    promptType = l_SquadPromptType_0.RemoveFromParty
                });
            end;
        end or nil
    }, {
        SelectedFriendsListener = if l_FFlagEnableAppChatFocusableFixes_0 then l_React_0.createElement(v53, {
            onMultiInvite = v55.onMultiInvite, 
            fallbackOnMultiInvite = v99, 
            onSelectedFriendsChanged = v55.onSelectedFriendsChanged
        }) else nil, 
        ContainerFrame = l_React_0.createElement("Frame", {
            Size = if l_FFlagEnableAppChatFocusableFixes_0 and v55.shouldHideFooterButton then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 1, -52), 
            BackgroundTransparency = 1, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            ref = if l_FFlagEnableAppChatFocusableFixes_0 then v67 else nil
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
                [l_React_0.Change.AbsoluteSize] = v71
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
                    ref = if l_FFlagEnableAppChatFocusableFixes_0 then v68 else nil
                }), 
                SelectedUsersScroller = l_React_0.createElement(l_SelectedUsersScroller_0, {
                    layoutOrder = 1, 
                    selectionLimit = v14.SQUAD_PARTICIPANT_LIMIT - 1
                })
            }), 
            FriendsList = l_React_0.createElement(l_FriendsMenuFriendsList_0, {
                size = UDim2.new(1, 0, 1, -v62 - 16), 
                layoutOrder = 1, 
                parentComponentName = v14.SQUAD_INVITE_PARENT_COMPONENT, 
                menuType = l_FriendMenuType_0.MultiSelect, 
                isFullRowActivatable = true, 
                backgroundTransparency = 1, 
                disableSelectionParentManagement = l_FFlagEnableAppChatFocusableFixes_0 and true or nil, 
                disableListFocus = l_FFlagEnableAppChatFocusableFixesUpdate_0 and true or nil
            })
        }), 
        FriendsListButtonFrame = if l_FFlagEnableAppChatFocusableFixes_0 and v55.shouldHideFooterButton then nil else l_React_0.createElement("Frame", {
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
            Button = l_React_0.createElement(v42, {
                buttonText = v55.buttonText, 
                analyticsInfo = v55.analyticsInfo, 
                partyStartedRef = v55.partyStartedRef
            })
        })
    });
end;