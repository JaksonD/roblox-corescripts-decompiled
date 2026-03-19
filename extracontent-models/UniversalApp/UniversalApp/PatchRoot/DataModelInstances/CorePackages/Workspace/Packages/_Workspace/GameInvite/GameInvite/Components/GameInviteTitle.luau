local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_TextService_0 = game:GetService("TextService");
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_utils_0 = l_script_FirstAncestor_0.utils;
local v6 = require(l_Parent_0.FriendsMenu);
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.UIBlox);
local v9 = require(l_Parent_0.UniversalAppPolicy);
local l_DeviceInfo_0 = require(l_Parent_0.NotificationsCommon).DeviceInfo;
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local l_FriendsMenuSearch_0 = v6.FriendsMenuSearch;
local l_FriendsListContext_0 = v6.FriendsListContext;
local l_InviteFriendContext_0 = v6.InviteFriendContext;
local v15 = require(l_script_FirstAncestor_0.analytics.GameInviteAnalyticsManager);
local v16 = require(l_script_FirstAncestor_0.GameInviteModalManager);
local v17 = require(l_Components_0.ShareGameInviteLink);
local v18 = require(l_utils_0.isExperienceOlderThanOneWeek);
local _ = require(l_script_FirstAncestor_0.gameInviteModalType);
local l_LocalizationHelper_0 = require(l_Parent_0.NotificationsCommon).LocalizationHelper;
local v21 = require(l_script_FirstAncestor_0.GameInviteConstants);
local v22 = require(l_Context_0.GameInviteModalLayoutContext);
local v23 = require(l_Context_0.GameDetailsContext);
local l_useStyle_0 = v8.Core.Style.useStyle;
local l_ImageSetButton_0 = v8.Core.ImageSet.ImageSetButton;
local l_Images_0 = v8.App.ImageSet.Images;
local l_getLocalizedStrings_0 = l_LocalizationHelper_0.getLocalizedStrings;
local l_useAppPolicy_0 = v9.useAppPolicy;
local v29 = require(l_Parent_0.SharedFlags);
local l_GetFFlagEnableGameInviteModalVRSupport_0 = v29.GetFFlagEnableGameInviteModalVRSupport;
local l_FFlagHideCloseButtonEdp_0 = v29.FFlagHideCloseButtonEdp;
local l_TitleIconSize_0 = v21.Layout.TitleIconSize;
local l_SidePadding_0 = v21.Layout.SidePadding;
local v34 = l_Images_0["icons/navigation/close"];
local v35 = l_Images_0["icons/menu/search"];
local v36 = {
    cancelText = "Feature.SettingsHub.Action.CancelSearch", 
    inviteConnections = "CommonUI.Features.Label.InviteConnections", 
    copyLink = "Feature.SocialShare.Action.CopyLink"
};
local function v40(v37, v38, v39) --[[ Line: 56 ]]
    -- upvalues: l_GetFFlagEnableGameInviteModalVRSupport_0 (copy), l_IsVRAppBuild_0 (copy), v18 (copy)
    if l_GetFFlagEnableGameInviteModalVRSupport_0() then
        return not l_IsVRAppBuild_0() and v39 and not v38 and v37 and v37.isCoreScript and v37.serverType == "StandardServer" and v18(v37.gameDetails);
    else
        return not v38 and v39 and v37 and v37.isCoreScript and v37.serverType == "StandardServer" and v18(v37.gameDetails);
    end;
end;
return function(v41) --[[ Line: 85 ]]
    -- upvalues: l_useStyle_0 (copy), v7 (copy), v22 (copy), v23 (copy), l_FriendsListContext_0 (copy), l_InviteFriendContext_0 (copy), l_getLocalizedStrings_0 (copy), v36 (copy), l_useAppPolicy_0 (copy), l_DeviceInfo_0 (copy), v40 (copy), l_TextService_0 (copy), l_TitleIconSize_0 (copy), v16 (copy), l_SidePadding_0 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_ImageSetButton_0 (copy), v34 (copy), v35 (copy), v17 (copy), l_FriendsMenuSearch_0 (copy), v15 (copy)
    local v42 = l_useStyle_0();
    local v43 = v7.useContext(v22);
    local v44 = v7.useContext(v23);
    local v45 = v7.useContext(l_FriendsListContext_0);
    local v46 = v7.useContext(l_InviteFriendContext_0);
    local v47, v48 = v7.useState(false);
    local v49 = l_getLocalizedStrings_0(v36);
    local l_searchFriends_0 = v45.searchFriends;
    local v52 = l_useAppPolicy_0(function(v51) --[[ Line: 97 ]]
        return v51.getExperienceInviteShareLinkEnabled();
    end);
    local v53 = v43.modalMode == "compact";
    local l_isFullWidth_0 = v43.isFullWidth;
    local v55 = l_DeviceInfo_0.isDesktopDevice();
    local v56 = l_DeviceInfo_0.isConsole();
    local v57 = v40(v44, v56, v52);
    local v58 = v55 and not l_isFullWidth_0;
    local v59 = v42.Font.BaseSize * v42.Font.Header2.RelativeSize;
    local v60 = v42.Font.BaseSize * v42.Font.Body.RelativeSize;
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v49.copyLink, v59, v42.Font.Header2.Font, Vector2.new(300 - l_TitleIconSize_0, 1e999));
    local v62 = nil;
    local v63 = 0;
    if v57 then
        if v55 and v58 then
            local v64 = math.ceil(l_l_TextService_0_TextSize_0.X) + 10;
            v62 = UDim2.new(0, v64, 1, 0);
            v63 = v63 + v64;
        else
            v62 = UDim2.new(0, l_TitleIconSize_0, 0, l_TitleIconSize_0);
            v63 = v63 + l_TitleIconSize_0;
        end;
    end;
    if v53 then
        v63 = v63 + l_TitleIconSize_0;
    end;
    if v53 and v57 then
        v63 = v63 + 4;
    end;
    local function v65() --[[ Line: 138 ]]
        -- upvalues: v16 (ref), v46 (copy)
        v16:closeModal(v46.getMaxRecipientRowNum());
    end;
    local function v66() --[[ Line: 142 ]]
        -- upvalues: v48 (copy)
        v48(true);
    end;
    local function v67() --[[ Line: 146 ]]
        -- upvalues: v48 (copy), l_searchFriends_0 (copy)
        v48(false);
        l_searchFriends_0("");
    end;
    if not v53 and v47 then
        v48(false);
        l_searchFriends_0("");
    end;
    local v68 = v7.useMemo(function() --[[ Line: 157 ]]
        -- upvalues: v7 (ref), l_SidePadding_0 (ref), v63 (ref), l_FFlagHideCloseButtonEdp_0 (ref), v41 (copy), l_ImageSetButton_0 (ref), l_TitleIconSize_0 (ref), v65 (copy), v34 (ref), v42 (copy), v49 (copy), v59 (copy), v53 (copy), v66 (copy), v35 (ref), v57 (copy), v17 (ref), v55 (copy), v58 (copy), v62 (ref)
        return {
            UIPadding = v7.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_SidePadding_0), 
                PaddingRight = UDim.new(0, l_SidePadding_0)
            }), 
            UIListLayout = v7.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            LeftActionContainer = v7.createElement("Frame", {
                Size = UDim2.new(0, v63, 1, 0), 
                LayoutOrder = 0, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v7.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Padding = UDim.new(0, 4)
                }), 
                CloseButton = if l_FFlagHideCloseButtonEdp_0 and v41.hideCloseButton then nil else v7.createElement(l_ImageSetButton_0, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, l_TitleIconSize_0, 0, l_TitleIconSize_0), 
                    [v7.Event.Activated] = v65, 
                    Image = v34, 
                    ImageColor3 = v42.Theme.IconEmphasis.Color, 
                    ImageTransparency = v42.Theme.IconEmphasis.Transparency, 
                    BorderSizePixel = 0
                })
            }), 
            Title = v7.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Text = v49.inviteConnections, 
                TextSize = v59, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextColor3 = v42.Theme.TextEmphasis.Color, 
                Font = v42.Font.Header2.Font, 
                Size = UDim2.new(1, v63 * 2 * -1, 1, 0), 
                LayoutOrder = 1
            }), 
            RightActionContainer = v7.createElement("Frame", {
                Size = UDim2.new(0, v63, 1, 0), 
                LayoutOrder = 2, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v7.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    Padding = UDim.new(0, 4)
                }), 
                SearchButton = v53 and v7.createElement(l_ImageSetButton_0, {
                    LayoutOrder = 0, 
                    BackgroundTransparency = 1, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Size = UDim2.new(0, l_TitleIconSize_0, 0, l_TitleIconSize_0), 
                    [v7.Event.Activated] = v66, 
                    Image = v35, 
                    ImageColor3 = v42.Theme.IconEmphasis.Color, 
                    ImageTransparency = v42.Theme.IconEmphasis.Transparency, 
                    BorderSizePixel = 0
                }) or nil, 
                ShareGameInviteLink = v57 and v7.createElement(v17, {
                    layoutOrder = 1, 
                    isDesktop = v55, 
                    isFullSize = v58, 
                    size = v62
                }) or nil
            })
        };
    end, {
        v47, 
        v58, 
        v53, 
        v57, 
        v55
    });
    local v69 = v7.useMemo(function() --[[ Line: 236 ]]
        -- upvalues: v7 (ref), l_FriendsMenuSearch_0 (ref), v15 (ref), v60 (copy), v42 (copy), v49 (copy), v67 (copy)
        return {
            UIListLayout = v7.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                Padding = UDim.new(0, 4)
            }), 
            SearchBox = v7.createElement(l_FriendsMenuSearch_0, {
                layoutOrder = 0, 
                size = UDim2.new(1, -120, 1, -20), 
                focusElement = true, 
                onFocus = function() --[[ Line: 249 ]] --[[ Name: onFocus ]]
                    -- upvalues: v15 (ref)
                    v15:onSearchFocused();
                end
            }), 
            CancelButton = v7.createElement("TextButton", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                Size = UDim2.new(0, 100, 1, 0), 
                TextSize = v60, 
                TextColor3 = v42.Theme.UIDefault.Color, 
                Text = v49.cancelText, 
                Font = v42.Font.Body.Font, 
                [v7.Event.Activated] = v67
            })
        };
    end, {
        v47
    });
    return v7.createElement("Frame", {
        BackgroundTransparency = 1, 
        AnchorPoint = Vector2.new(0, 1), 
        LayoutOrder = v41.layoutOrder, 
        Position = UDim2.new(0, 0, 1, 0), 
        Size = v41.size
    }, if v47 then v69 else v68);
end;