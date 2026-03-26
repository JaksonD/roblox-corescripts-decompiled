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
local l_FFlagConnectionsToFriendsRename_0 = v29.FFlagConnectionsToFriendsRename;
local l_TitleIconSize_0 = v21.Layout.TitleIconSize;
local l_SidePadding_0 = v21.Layout.SidePadding;
local v35 = l_Images_0["icons/navigation/close"];
local v36 = l_Images_0["icons/menu/search"];
local v37 = {
    cancelText = "Feature.SettingsHub.Action.CancelSearch", 
    inviteFriends = l_FFlagConnectionsToFriendsRename_0 and "CoreScripts.InGameMenu.PageTitle.InviteFriends" or nil, 
    inviteConnections = if l_FFlagConnectionsToFriendsRename_0 then nil else "CommonUI.Features.Label.InviteConnections", 
    copyLink = "Feature.SocialShare.Action.CopyLink"
};
local function v41(v38, v39, v40) --[[ Line: 62 ]]
    -- upvalues: l_GetFFlagEnableGameInviteModalVRSupport_0 (copy), l_IsVRAppBuild_0 (copy), v18 (copy)
    if l_GetFFlagEnableGameInviteModalVRSupport_0() then
        return not l_IsVRAppBuild_0() and v40 and not v39 and v38 and v38.isCoreScript and v38.serverType == "StandardServer" and v18(v38.gameDetails);
    else
        return not v39 and v40 and v38 and v38.isCoreScript and v38.serverType == "StandardServer" and v18(v38.gameDetails);
    end;
end;
return function(v42) --[[ Line: 91 ]]
    -- upvalues: l_useStyle_0 (copy), v7 (copy), v22 (copy), v23 (copy), l_FriendsListContext_0 (copy), l_InviteFriendContext_0 (copy), l_getLocalizedStrings_0 (copy), v37 (copy), l_useAppPolicy_0 (copy), l_DeviceInfo_0 (copy), v41 (copy), l_TextService_0 (copy), l_TitleIconSize_0 (copy), v16 (copy), l_SidePadding_0 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_ImageSetButton_0 (copy), v35 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v36 (copy), v17 (copy), l_FriendsMenuSearch_0 (copy), v15 (copy)
    local v43 = l_useStyle_0();
    local v44 = v7.useContext(v22);
    local v45 = v7.useContext(v23);
    local v46 = v7.useContext(l_FriendsListContext_0);
    local v47 = v7.useContext(l_InviteFriendContext_0);
    local v48, v49 = v7.useState(false);
    local v50 = l_getLocalizedStrings_0(v37);
    local l_searchFriends_0 = v46.searchFriends;
    local v53 = l_useAppPolicy_0(function(v52) --[[ Line: 103 ]]
        return v52.getExperienceInviteShareLinkEnabled();
    end);
    local v54 = v44.modalMode == "compact";
    local l_isFullWidth_0 = v44.isFullWidth;
    local v56 = l_DeviceInfo_0.isDesktopDevice();
    local v57 = l_DeviceInfo_0.isConsole();
    local v58 = v41(v45, v57, v53);
    local v59 = v56 and not l_isFullWidth_0;
    local v60 = v43.Font.BaseSize * v43.Font.Header2.RelativeSize;
    local v61 = v43.Font.BaseSize * v43.Font.Body.RelativeSize;
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v50.copyLink, v60, v43.Font.Header2.Font, Vector2.new(300 - l_TitleIconSize_0, 1e999));
    local v63 = nil;
    local v64 = 0;
    if v58 then
        if v56 and v59 then
            local v65 = math.ceil(l_l_TextService_0_TextSize_0.X) + 10;
            v63 = UDim2.new(0, v65, 1, 0);
            v64 = v64 + v65;
        else
            v63 = UDim2.new(0, l_TitleIconSize_0, 0, l_TitleIconSize_0);
            v64 = v64 + l_TitleIconSize_0;
        end;
    end;
    if v54 then
        v64 = v64 + l_TitleIconSize_0;
    end;
    if v54 and v58 then
        v64 = v64 + 4;
    end;
    local function v66() --[[ Line: 144 ]]
        -- upvalues: v16 (ref), v47 (copy)
        v16:closeModal(v47.getMaxRecipientRowNum());
    end;
    local function v67() --[[ Line: 148 ]]
        -- upvalues: v49 (copy)
        v49(true);
    end;
    local function v68() --[[ Line: 152 ]]
        -- upvalues: v49 (copy), l_searchFriends_0 (copy)
        v49(false);
        l_searchFriends_0("");
    end;
    if not v54 and v48 then
        v49(false);
        l_searchFriends_0("");
    end;
    local v69 = v7.useMemo(function() --[[ Line: 163 ]]
        -- upvalues: v7 (ref), l_SidePadding_0 (ref), v64 (ref), l_FFlagHideCloseButtonEdp_0 (ref), v42 (copy), l_ImageSetButton_0 (ref), l_TitleIconSize_0 (ref), v66 (copy), v35 (ref), v43 (copy), l_FFlagConnectionsToFriendsRename_0 (ref), v50 (copy), v60 (copy), v54 (copy), v67 (copy), v36 (ref), v58 (copy), v17 (ref), v56 (copy), v59 (copy), v63 (ref)
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
                Size = UDim2.new(0, v64, 1, 0), 
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
                CloseButton = if l_FFlagHideCloseButtonEdp_0 and v42.hideCloseButton then nil else v7.createElement(l_ImageSetButton_0, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, l_TitleIconSize_0, 0, l_TitleIconSize_0), 
                    [v7.Event.Activated] = v66, 
                    Image = v35, 
                    ImageColor3 = v43.Theme.IconEmphasis.Color, 
                    ImageTransparency = v43.Theme.IconEmphasis.Transparency, 
                    BorderSizePixel = 0
                })
            }), 
            Title = v7.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Text = if l_FFlagConnectionsToFriendsRename_0 then v50.inviteFriends else v50.inviteConnections, 
                TextSize = v60, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextColor3 = v43.Theme.TextEmphasis.Color, 
                Font = v43.Font.Header2.Font, 
                Size = UDim2.new(1, v64 * 2 * -1, 1, 0), 
                LayoutOrder = 1
            }), 
            RightActionContainer = v7.createElement("Frame", {
                Size = UDim2.new(0, v64, 1, 0), 
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
                SearchButton = v54 and v7.createElement(l_ImageSetButton_0, {
                    LayoutOrder = 0, 
                    BackgroundTransparency = 1, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Size = UDim2.new(0, l_TitleIconSize_0, 0, l_TitleIconSize_0), 
                    [v7.Event.Activated] = v67, 
                    Image = v36, 
                    ImageColor3 = v43.Theme.IconEmphasis.Color, 
                    ImageTransparency = v43.Theme.IconEmphasis.Transparency, 
                    BorderSizePixel = 0
                }) or nil, 
                ShareGameInviteLink = v58 and v7.createElement(v17, {
                    layoutOrder = 1, 
                    isDesktop = v56, 
                    isFullSize = v59, 
                    size = v63
                }) or nil
            })
        };
    end, {
        v48, 
        v59, 
        v54, 
        v58, 
        v56
    });
    local v70 = v7.useMemo(function() --[[ Line: 244 ]]
        -- upvalues: v7 (ref), l_FriendsMenuSearch_0 (ref), v15 (ref), v61 (copy), v43 (copy), v50 (copy), v68 (copy)
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
                onFocus = function() --[[ Line: 257 ]] --[[ Name: onFocus ]]
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
                TextSize = v61, 
                TextColor3 = v43.Theme.UIDefault.Color, 
                Text = v50.cancelText, 
                Font = v43.Font.Body.Font, 
                [v7.Event.Activated] = v68
            })
        };
    end, {
        v48
    });
    return v7.createElement("Frame", {
        BackgroundTransparency = 1, 
        AnchorPoint = Vector2.new(0, 1), 
        LayoutOrder = v42.layoutOrder, 
        Position = UDim2.new(0, 0, 1, 0), 
        Size = v42.size
    }, if v48 then v70 else v69);
end;