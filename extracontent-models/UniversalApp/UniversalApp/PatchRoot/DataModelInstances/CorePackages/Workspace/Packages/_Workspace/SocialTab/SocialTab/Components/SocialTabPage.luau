local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local v3 = require(l_script_FirstAncestor_0.Logger);
local l_t_0 = v2.t;
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local l_memoize_0 = v2.memoize;
local l_RoactAppExperiment_0 = v2.RoactAppExperiment;
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local l_ChatEntryPointNames_0 = v2.SocialCommon.Enums.ChatEntryPointNames;
local l_DefaultMetricsGridView_0 = l_UIBlox_0.App.Grid.DefaultMetricsGridView;
local l_GridMetrics_0 = l_UIBlox_0.App.Grid.GridMetrics;
local l_HorizontalPageMargin_0 = l_UIBlox_0.App.Container.HorizontalPageMargin;
local l_HeaderBar_0 = l_UIBlox_0.App.Bar.HeaderBar;
local l_IconButton_0 = l_UIBlox_0.App.Button.IconButton;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_Promise_0 = v2.Promise;
local l_UserSearchBarButton_0 = require(l_Parent_0.SocialCommon).Components.UserSearchBar.UserSearchBarButton;
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local l_script_FirstAncestor_1 = script:FindFirstAncestor("Components");
local v21 = require(l_script_FirstAncestor_1.ChatTile);
local v22 = require(l_script_FirstAncestor_1.GroupsTile);
local v23 = require(l_script_FirstAncestor_1.ProfileEntry);
local l_RefreshScrollingFrame_0 = v2.SocialLibraries.Components.RefreshScrollingFrame;
local l_EntryPoints_0 = v2.DiscoverabilityModal.Analytics.EntryPoints;
local l_getFStringSocialConnectTabLayer_0 = require(l_Parent_0.SharedFlags).getFStringSocialConnectTabLayer;
local v27 = 24;
local v28 = 22;
local v29 = require(l_script_FirstAncestor_0.EnumScreens);
local v30 = require(l_script_FirstAncestor_0.User);
local l_StreamNotificationsBellIcon_0 = v2.StreamNotifications.StreamNotificationsBellIcon;
local v32 = l_Roact_0.PureComponent:extend("SocialTabPage");
v32.TileCellSize = {
    Wide = UDim2.fromOffset(176, 176), 
    Compact = UDim2.fromOffset(158, 158)
};
v32.TileHorizontalAlignment = {
    Wide = Enum.HorizontalAlignment.Left, 
    Compact = Enum.HorizontalAlignment.Center
};
v32.defaultProps = {
    topBarHeight = 56, 
    navigation = nil, 
    wideMode = false, 
    unreadConversationCount = 0, 
    numberOfNotifications = 0, 
    localUser = {}, 
    enableDisplayNamePolicy = false, 
    socialText = "[LOCALIZE] TITLE", 
    chatsText = "[LOCALIZE] CHATS", 
    groupsText = "[LOCALIZE] GROUPS", 
    renderUserCarousel = function(v33) --[[ Line: 74 ]] --[[ Name: renderUserCarousel ]]
        -- upvalues: l_Roact_0 (copy)
        return l_Roact_0.createElement("TextLabel", {
            Text = "User Carousel PlaceHolder", 
            Size = UDim2.new(1, 0, 0, 40), 
            LayoutOrder = v33.LayoutOrder
        });
    end, 
    refreshPageData = function() --[[ Line: 82 ]] --[[ Name: refreshPageData ]]
        -- upvalues: l_Promise_0 (copy)
        return l_Promise_0.resolve();
    end, 
    shouldShowGroupsTilePolicy = false, 
    enableNotificationsPolicy = false, 
    disableWebViewSupport = false, 
    enteredChatFromEntryPoint = function() --[[ Line: 88 ]] --[[ Name: enteredChatFromEntryPoint ]]

    end
};
v32.validateProps = l_t_0.interface({
    topBarHeight = l_t_0.optional(l_t_0.number), 
    showTopBar = l_t_0.optional(l_t_0.boolean), 
    analytics = l_t_0.table, 
    wideMode = l_t_0.optional(l_t_0.boolean), 
    navigateToLuaAppPages = l_t_0.optional(l_t_0.table), 
    navigation = l_t_0.optional(l_t_0.table), 
    localUser = v30.validateUser, 
    enableDisplayNamePolicy = l_t_0.optional(l_t_0.boolean), 
    enableNotificationsPolicy = l_t_0.optional(l_t_0.boolean), 
    renderUserCarousel = l_t_0.callback, 
    socialText = l_t_0.optional(l_t_0.string), 
    chatsText = l_t_0.optional(l_t_0.string), 
    groupsText = l_t_0.optional(l_t_0.string), 
    numberOfNotifications = l_t_0.optional(l_t_0.number), 
    unreadConversationCount = l_t_0.optional(l_t_0.number), 
    refreshPageData = l_t_0.optional(l_t_0.callback), 
    shouldShowGroupsTilePolicy = l_t_0.optional(l_t_0.boolean), 
    luaAddFriendsPageEnabled = l_t_0.optional(l_t_0.boolean), 
    isLuaProfilePageEnabled = l_t_0.optional(l_t_0.boolean), 
    replaceSearchEntry = l_t_0.optional(l_t_0.boolean), 
    enteredChatFromEntryPoint = l_t_0.optional(l_t_0.callback)
});
v32.init = function(v34) --[[ Line: 115 ]] --[[ Name: init ]]
    -- upvalues: v27 (ref), v28 (ref), v3 (copy), l_ChatEntryPointNames_0 (copy), v29 (copy), l_Sources_0 (copy), l_EntryPoints_0 (copy), l_FormFactor_0 (copy), l_memoize_0 (copy), l_Roact_0 (copy), l_StreamNotificationsBellIcon_0 (copy), l_IconButton_0 (copy), l_Images_0 (copy), v21 (copy), v22 (copy)
    if v34.props.replaceSearchEntry then
        v27 = 16;
        v28 = 16;
    end;
    v34.gridButtons = v34:getGridItems();
    v34.goToChat = function() --[[ Line: 124 ]]
        -- upvalues: v3 (ref), v34 (copy), l_ChatEntryPointNames_0 (ref), v29 (ref)
        v3:info("Going to Chats");
        v34.props.analytics:buttonClick("Chats");
        v34.props.analytics:navigate("Chats");
        v34.props.enteredChatFromEntryPoint(l_ChatEntryPointNames_0.SocialTab);
        v34.props.navigation.navigate(v29.RoactChat);
    end;
    v34.goToGroups = function() --[[ Line: 134 ]]
        -- upvalues: v3 (ref), v34 (copy), v29 (ref)
        v3:info("Going to Groups");
        v34.props.analytics:buttonClick("Groups");
        v34.props.analytics:navigate("Groups");
        v34.props.navigateToLuaAppPages[v29.Groups]();
    end;
    v34.goToUserProfile = function() --[[ Line: 141 ]]
        -- upvalues: v3 (ref), v34 (copy), v29 (ref), l_Sources_0 (ref), l_EntryPoints_0 (ref)
        v3:info("Going to User Profile");
        v34.props.analytics:buttonClick("LoggedInUserIdentity");
        v34.props.analytics:navigate("LoggedInUserIdentity");
        if v34.props.isPhoneVerified and v34.props.isDiscoverabilityUnset then
            v34.props.navigateToLuaAppPages[v29.DiscoverabilityModal]({
                isStandaloneDiscoverabilityModal = true, 
                showToast = v34.props.showToast, 
                openLearnMoreLink = v34.props.openLearnMoreLink, 
                navigateOnActivated = function() --[[ Line: 150 ]] --[[ Name: navigateOnActivated ]]
                    -- upvalues: v34 (ref), v29 (ref), l_Sources_0 (ref)
                    v34.props.navigateToLuaAppPages[v29.ViewUserProfile](v34.props.localUser.id, {
                        profilePeekViewProps = {
                            source = l_Sources_0.SocialTab
                        }
                    });
                end, 
                entryPoint = l_EntryPoints_0.SocialTabProfile, 
                onClose = v34.props.closeCentralOverlay
            });
            return;
        else
            v34.props.navigateToLuaAppPages[v29.ViewUserProfile](v34.props.localUser.id, {
                profilePeekViewProps = {
                    source = l_Sources_0.SocialTab
                }
            });
            return;
        end;
    end;
    v34.goToFriendsLanding = function() --[[ Line: 169 ]]
        -- upvalues: v34 (copy), v29 (ref)
        if v34.props.navigatingFromSocialTabEvent then
            v34.props.navigatingFromSocialTabEvent(v29.FriendsLanding);
        end;
        v34.props.navigateToFriendsPage();
    end;
    v34.goToAddFriends = function() --[[ Line: 177 ]]
        -- upvalues: v34 (copy)
        v34.props.navigateToAddFriendsPage();
    end;
    v34.goToUserSearch = function() --[[ Line: 181 ]]
        -- upvalues: v34 (copy), l_FormFactor_0 (ref)
        v34.props.analytics:buttonClick("peopleSearchBar", {
            formFactor = v34.props.wideMode and l_FormFactor_0.WIDE or l_FormFactor_0.COMPACT
        });
        v34.props.analytics:openPlayerSearch();
        v34.props.navigateToUserSearch();
    end;
    v34.renderTopBarButtons = l_memoize_0(function(v35, _) --[[ Line: 190 ]]
        -- upvalues: l_Roact_0 (ref), l_StreamNotificationsBellIcon_0 (ref), v34 (copy), l_IconButton_0 (ref), l_Images_0 (ref), v3 (ref), v29 (ref)
        local function _() --[[ Line: 191 ]]
            -- upvalues: l_Roact_0 (ref), l_StreamNotificationsBellIcon_0 (ref), v35 (copy), v34 (ref)
            return l_Roact_0.createElement(l_StreamNotificationsBellIcon_0, {
                notificationCount = v35, 
                compactWidth = not v34.props.wideMode, 
                layoutOrder = 3
            });
        end;
        local v38 = nil;
        v38 = if v34.props.enableNotificationsPolicy then l_Roact_0.createElement(l_StreamNotificationsBellIcon_0, {
            notificationCount = v35, 
            compactWidth = not v34.props.wideMode, 
            layoutOrder = 3
        }) else nil;
        if v34.props.disableWebViewSupport then
            return function() --[[ Line: 207 ]]
                -- upvalues: l_Roact_0 (ref)
                return l_Roact_0.createFragment({});
            end;
        else
            return function() --[[ Line: 211 ]]
                -- upvalues: l_Roact_0 (ref), v34 (ref), l_IconButton_0 (ref), l_Images_0 (ref), v3 (ref), v29 (ref), v38 (ref)
                return l_Roact_0.createFragment({
                    filter = if v34.props.replaceSearchEntry then nil else l_Roact_0.createElement(l_IconButton_0, {
                        size = UDim2.fromOffset(0, 0), 
                        icon = l_Images_0["icons/common/search"], 
                        layoutOrder = 1, 
                        onActivated = function() --[[ Line: 220 ]] --[[ Name: onActivated ]]
                            -- upvalues: v3 (ref), v34 (ref), v29 (ref)
                            v3:info("Going to AddFriends");
                            v34.props.analytics:buttonClick("SearchFriends");
                            v34.props.analytics:navigate("SearchFriends");
                            v34.props.navigateToLuaAppPages[v29.AddFriends]();
                        end
                    }), 
                    notifications = v38
                });
            end;
        end;
    end);
    v34.renderButtonGridItem = l_memoize_0(function(v39) --[[ Line: 233 ]]
        -- upvalues: l_Roact_0 (ref), v21 (ref), v34 (copy), v22 (ref)
        return function(v40, v41) --[[ Line: 234 ]]
            -- upvalues: l_Roact_0 (ref), v21 (ref), v39 (copy), v34 (ref), v22 (ref)
            if v40 == "Chats" then
                return l_Roact_0.createElement(v21, {
                    unreadConversationCount = v39, 
                    LayoutOrder = v41, 
                    title = v34.props.chatsText, 
                    onActivated = v34.goToChat
                });
            elseif v40 == "Groups" then
                return l_Roact_0.createElement(v22, {
                    LayoutOrder = v41, 
                    title = v34.props.groupsText, 
                    onActivated = v34.goToGroups
                });
            else
                return nil;
            end;
        end;
    end);
    v34.getButtonGridItemHeight = function(v42) --[[ Line: 254 ]]
        return v42;
    end;
    local v43, v44 = l_Roact_0.createBinding(0);
    v34.contentHeight = v43;
    v34.updateContentHeight = v44;
end;
v32.getGridItems = function(v45) --[[ Line: 261 ]] --[[ Name: getGridItems ]]
    local v46 = {
        "Chats"
    };
    if v45.props.shouldShowGroupsTilePolicy and not v45.props.disableWebViewSupport then
        table.insert(v46, "Groups");
    end;
    return v46;
end;
v32.render = function(v47) --[[ Line: 271 ]] --[[ Name: render ]]
    -- upvalues: l_UIBlox_0 (copy), l_Roact_0 (copy), l_HeaderBar_0 (copy), l_UserSearchBarButton_0 (copy), l_RefreshScrollingFrame_0 (copy), l_HorizontalPageMargin_0 (copy), v27 (ref), v23 (copy), v28 (ref), l_DefaultMetricsGridView_0 (copy), l_GridMetrics_0 (copy)
    return l_UIBlox_0.Style.withStyle(function(_) --[[ Line: 272 ]]
        -- upvalues: l_Roact_0 (ref), v47 (copy), l_HeaderBar_0 (ref), l_UserSearchBarButton_0 (ref), l_RefreshScrollingFrame_0 (ref), l_HorizontalPageMargin_0 (ref), v27 (ref), v23 (ref), v28 (ref), l_DefaultMetricsGridView_0 (ref), l_GridMetrics_0 (ref)
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            layout = l_Roact_0.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            topBar = l_Roact_0.createElement("Frame", {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, if v47.props.replaceSearchEntry then v47.props.topBarHeight + 48 else v47.props.topBarHeight), 
                BackgroundTransparency = 1
            }, {
                UIListLayout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                Header = l_Roact_0.createElement(l_HeaderBar_0, {
                    barHeight = v47.props.topBarHeight, 
                    title = v47.props.socialText, 
                    renderRight = v47.renderTopBarButtons(v47.props.numberOfNotifications, v47.props.enableNotificationsPolicy)
                }), 
                UserSearchBarButton = if v47.props.replaceSearchEntry then l_Roact_0.createElement(l_UserSearchBarButton_0, {
                    onActivated = v47.goToUserSearch
                }) else nil
            }), 
            gridFrame = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                ScrollView = l_Roact_0.createElement(l_RefreshScrollingFrame_0, {
                    scrollingElementProps = {
                        Size = UDim2.new(1, 0, 1, if v47.props.replaceSearchEntry then -(v47.props.topBarHeight + 48) else -v47.props.topBarHeight), 
                        ScrollBarThickness = 0, 
                        BackgroundTransparency = 1, 
                        CanvasSize = UDim2.new(1, 0, 1, if v47.props.replaceSearchEntry then -(v47.props.topBarHeight + 48) + 1 else -v47.props.topBarHeight + 1), 
                        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                        ScrollingDirection = Enum.ScrollingDirection.Y
                    }, 
                    refresh = v47.props.refreshPageData, 
                    usesBuilderIcon = true
                }, {
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    pageMargin = l_Roact_0.createElement(l_HorizontalPageMargin_0, {
                        size = UDim2.new(1, 0, 0, 0), 
                        useAutomaticSizing = true, 
                        layoutOrder = 1, 
                        backgroundTransparency = 1
                    }, {
                        Layout = l_Roact_0.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        spacerTopBar = l_Roact_0.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, v27), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 1
                        }), 
                        profileEntry = l_Roact_0.createElement(v23, {
                            userText = v47.props.enableDisplayNamePolicy and v47.props.localUser.displayName or v47.props.localUser.username, 
                            avatarImage = v47.props.localUser.thumbnail, 
                            isPremium = v47.props.localUser.isPremium, 
                            navigateToLuaAppPages = v47.props.navigateToLuaAppPages, 
                            hasVerifiedBadge = v47.props.localUser.hasVerifiedBadge, 
                            onActivated = v47.goToUserProfile, 
                            layoutOrder = 2
                        }), 
                        spacerProfile = l_Roact_0.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, v28), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 3
                        }), 
                        friendsCarousel = v47.props.renderUserCarousel({
                            LayoutOrder = 4, 
                            wideMode = v47.props.wideMode, 
                            navigateToLuaAppPages = v47.props.navigateToLuaAppPages, 
                            goToFriendsLanding = v47.goToFriendsLanding, 
                            goToAddFriends = v47.goToAddFriends, 
                            luaAddFriendsPageEnabled = v47.props.luaAddFriendsPageEnabled
                        }), 
                        spacerFriends = l_Roact_0.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 36), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 5
                        }), 
                        buttonGrid = l_Roact_0.createElement(l_DefaultMetricsGridView_0, {
                            LayoutOrder = 6, 
                            renderItem = v47.renderButtonGridItem(v47.props.unreadConversationCount), 
                            getItemHeight = v47.getButtonGridItemHeight, 
                            getItemMetrics = l_GridMetrics_0.getMediumMetrics, 
                            itemPadding = Vector2.new(12, 12), 
                            items = v47.gridButtons
                        })
                    })
                })
            })
        });
    end);
end;
v32.didMount = function(v49) --[[ Line: 405 ]] --[[ Name: didMount ]]
    -- upvalues: v3 (copy)
    v3:info("SocialTabPage mounted");
    v49.props.analytics:pageLoaded();
end;
return (l_RoactAppExperiment_0.connectUserLayer({
    l_getFStringSocialConnectTabLayer_0()
}, function(v50, _) --[[ Line: 412 ]]
    -- upvalues: l_getFStringSocialConnectTabLayer_0 (copy)
    return {
        replaceSearchEntry = (v50[l_getFStringSocialConnectTabLayer_0()] or {}).replace_search_entry
    };
end)(v32));