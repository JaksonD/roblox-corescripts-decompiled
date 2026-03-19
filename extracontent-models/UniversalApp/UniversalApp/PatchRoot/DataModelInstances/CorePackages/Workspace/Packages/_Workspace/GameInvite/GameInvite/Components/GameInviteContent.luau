local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.FriendsMenu);
local v5 = require(l_Parent_0.React);
local l_DeviceInfo_0 = require(l_Parent_0.NotificationsCommon).DeviceInfo;
local v7 = require(l_Parent_0.RoactUtils);
local l_FriendsMenuFriendsList_0 = v4.FriendsMenuFriendsList;
local l_InviteFriendContext_0 = v4.InviteFriendContext;
local l_FriendsMenuContextWrapper_0 = v4.FriendsMenuContextWrapper;
local l_FriendsMenuSearch_0 = v4.FriendsMenuSearch;
local l_FriendMenuType_0 = v4.FriendMenuType;
local v13 = require(l_script_FirstAncestor_0.analytics.GameInviteAnalyticsManager);
local v14 = require(l_Components_0.GameInviteTitle);
local v15 = require(l_Components_0.GameInviteRewardsBanner);
local v16 = require(l_Components_0.GameInviteCustomText);
local v17 = require(l_script_FirstAncestor_0.GameInviteConstants);
local v18 = require(l_Context_0.GameInviteModalLayoutContext);
local v19 = require(l_Context_0.GameDetailsContext);
local l_useSelector_0 = v7.Hooks.RoactRodux.useSelector;
local l_GetFFlagEnableCommonFriendsMenu_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableCommonFriendsMenu;
local l_GetFFlagEnableGameInviteRewardsBanner_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableGameInviteRewardsBanner;
local v23 = require(l_Parent_0.Loggers).Logger:new(script.Name);
local v24 = require(l_script_FirstAncestor_0.Requests.GetRewardMetadata);
local l_FFlagHideCloseButtonEdp_0 = require(l_Parent_0.SharedFlags).FFlagHideCloseButtonEdp;
local l_SidePadding_0 = v17.Layout.SidePadding;
local l_TitleHeight_0 = v17.Layout.TitleHeight;
local function v44(v28) --[[ Line: 46 ]]
    -- upvalues: v5 (copy), v18 (copy), v19 (copy), l_GetFFlagEnableGameInviteRewardsBanner_0 (copy), v24 (copy), v23 (copy), l_useSelector_0 (copy), l_DeviceInfo_0 (copy), l_TitleHeight_0 (copy), v14 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_SidePadding_0 (copy), l_FriendsMenuSearch_0 (copy), v13 (copy), v16 (copy), v15 (copy), l_FriendsMenuFriendsList_0 (copy), v17 (copy), l_FriendMenuType_0 (copy)
    local v29 = v5.useContext(v18);
    local v30 = v5.useContext(v19);
    local v31, v32 = v5.useState(nil);
    if l_GetFFlagEnableGameInviteRewardsBanner_0() then
        v5.useEffect(function() --[[ Line: 51 ]]
            -- upvalues: v24 (ref), v32 (copy), v23 (ref)
            if game.GameId > 0 then
                v24():andThen(function(v33) --[[ Line: 53 ]]
                    -- upvalues: v32 (ref)
                    if v33.responseBody and v33.responseBody.name and v33.responseBody.description then
                        v32(v33.responseBody);
                    end;
                end):catch(function(v34) --[[ Line: 57 ]]
                    -- upvalues: v23 (ref)
                    v23:error((("Error fetching reward metadata: %*"):format(v34)));
                end);
            end;
        end, {});
    end;
    local v36 = l_useSelector_0(function(v35) --[[ Line: 64 ]]
        return v35.TopBar;
    end);
    local v37 = l_DeviceInfo_0.isConsole();
    local v38 = v29.modalMode == "compact";
    local l_promptMessage_0 = v30.promptMessage;
    local v40 = l_promptMessage_0 and #l_promptMessage_0 > 0;
    local v41 = l_TitleHeight_0 + 12;
    local v42 = not v38 and not v37;
    if v42 then
        v41 = v41 + 48;
    end;
    if v40 then
        v41 = v41 + 48;
    end;
    local l_l_TitleHeight_0_0 = l_TitleHeight_0;
    if not v30.isCoreScript and (v36 and v36.statusBarHeight and true or false) and v36 then
        v41 = v41 + v36.statusBarHeight;
        l_l_TitleHeight_0_0 = l_l_TitleHeight_0_0 + v36.statusBarHeight;
    end;
    return v5.createElement("Frame", {
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        UIPadding = v5.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 8), 
            PaddingTop = UDim.new(0, 8)
        }), 
        UIListLayout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 12), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        TitleContainer = v5.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 0, 
            Size = UDim2.new(1, 0, 0, l_l_TitleHeight_0_0)
        }, {
            GameInviteTitle = v5.createElement(v14, {
                layoutOrder = 0, 
                size = UDim2.new(1, 0, 0, l_TitleHeight_0), 
                hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v28.hideCloseButton else nil
            })
        }), 
        SearchBox = v42 and v5.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 36)
        }, {
            UIPadding = v5.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_SidePadding_0), 
                PaddingRight = UDim.new(0, l_SidePadding_0)
            }), 
            UIListLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 12), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            FriendsMenuSearch = v5.createElement(l_FriendsMenuSearch_0, {
                layoutOrder = 1, 
                size = UDim2.new(1, 0, 0, 36), 
                focusElement = false, 
                onFocus = function() --[[ Line: 143 ]] --[[ Name: onFocus ]]
                    -- upvalues: v13 (ref)
                    v13:onSearchFocused();
                end
            })
        }) or nil, 
        CustomTextContainer = v40 and v5.createElement(v16, {
            layoutOrder = 2, 
            size = UDim2.new(1, 0, 0, 36), 
            promptMessage = l_promptMessage_0
        }) or nil, 
        RewardsBanner = l_GetFFlagEnableGameInviteRewardsBanner_0() and v31 ~= nil and v5.createElement(v15, {
            layoutOrder = 2, 
            rewardMetadata = v31
        }) or nil, 
        FriendsList = v5.createElement(l_FriendsMenuFriendsList_0, {
            layoutOrder = 3, 
            size = UDim2.new(1, 0, 1, -v41), 
            parentComponentName = v17.ParentComponentName, 
            menuType = l_FriendMenuType_0.SingleSelect, 
            gameDetailsData = v30, 
            disableSelectionParentManagement = v28.disableSelectionParentManagement
        })
    });
end;
return function(v45) --[[ Line: 171 ]]
    -- upvalues: l_GetFFlagEnableCommonFriendsMenu_0 (copy), v5 (copy), l_InviteFriendContext_0 (copy), l_FriendsMenuContextWrapper_0 (copy), v44 (copy)
    local v46 = if l_GetFFlagEnableCommonFriendsMenu_0() then v5.useContext(l_InviteFriendContext_0) else {
        inviteSingleFriend = function() --[[ Line: 174 ]] --[[ Name: inviteSingleFriend ]]

        end, 
        getMaxRecipientRowNum = function() --[[ Line: 174 ]] --[[ Name: getMaxRecipientRowNum ]]

        end
    };
    if l_GetFFlagEnableCommonFriendsMenu_0() then
        return (v5.createElement(l_FriendsMenuContextWrapper_0, {
            inviteSingleFriend = v46.inviteSingleFriend, 
            inviteMultiFriends = function() --[[ Line: 178 ]] --[[ Name: inviteMultiFriends ]]

            end, 
            isLoadingCustomParams = v45.isLoadingCustomParams
        }, {
            GameInviteContent = v5.createElement(v44, v45)
        }));
    else
        return (v5.createElement(v44, v45));
    end;
end;