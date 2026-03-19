local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserList");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_UserTile_0 = require(l_Parent_0.UserTile).UserTile;
local v4 = require(l_Parent_0.Foundation);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v6 = require(l_script_FirstAncestor_0.Common.Enums);
local v7 = require(l_script_FirstAncestor_0.Common.Constants);
local v8 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v10 = game:DefineFastFlag("UserListUseActionAddTranslation", false);
local l_FFlagFriendsPageViewBtnEnabled_0 = require(l_Parent_0.SharedFlags).FFlagFriendsPageViewBtnEnabled;
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagUserListActivatesTCIndicator);
local l_View_0 = v4.View;
local l_Button_0 = v4.Button;
local l_ButtonVariant_0 = v4.Enums.ButtonVariant;
local l_InputSize_0 = v4.Enums.InputSize;
local l_IconButton_0 = v4.IconButton;
local l_IconSize_0 = v4.Enums.IconSize;
local l_useTokens_0 = v4.Hooks.useTokens;
return v2.memo(function(v20) --[[ Line: 66 ]] --[[ Name: BaseRow ]]
    -- upvalues: l_useTokens_0 (copy), v10 (copy), l_useLocalization_0 (copy), v8 (copy), v6 (copy), l_FFlagFriendsPageViewBtnEnabled_0 (copy), v2 (copy), l_View_0 (copy), v7 (copy), l_UserTile_0 (copy), v4 (copy), v12 (copy), l_Button_0 (copy), l_InputSize_0 (copy), l_ButtonVariant_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy)
    local v21 = l_useTokens_0();
    local v22 = if v10 then l_useLocalization_0({
        Accept = v8.Accept, 
        Add = v8.Add, 
        Chat = v8.Chat, 
        Join = v8.Join, 
        Pending = v8.Pending, 
        [v6.ButtonTypes.View] = if l_FFlagFriendsPageViewBtnEnabled_0 then v8.View else nil
    }) else nil;
    return v2.createElement(l_View_0, {
        LayoutOrder = v20.layoutOrder, 
        tag = {
            ["size-full-0 auto-y align-y-center"] = true, 
            ["row gap-medium padding-top-medium padding-bottom-medium padding-right-xsmall flex-x-between"] = v20.layoutMode == v6.RowLayoutMode.Wide, 
            ["col gap-small padding-medium bg-surface-100 radius-medium"] = v20.layoutMode == v6.RowLayoutMode.Compact
        }
    }, {
        UserTileContainer = v2.createElement(l_View_0, {
            tag = {
                fill = v20.layoutMode == v6.RowLayoutMode.Wide, 
                ["size-full-0 auto-y"] = v20.layoutMode == v6.RowLayoutMode.Compact
            }, 
            Size = if v20.layoutMode == v6.RowLayoutMode.Wide then UDim2.new(0, 0, 0, v7.USER_ROW_HEIGHT) else nil, 
            LayoutOrder = 1
        }, {
            UserTile = v2.createElement(l_UserTile_0, {
                userId = v20.userId or "", 
                avatarThumbnailUrl = v20.avatarThumbnailUrl, 
                userPresenceType = v20.userPresenceType or v4.Enums.UserPresence.None, 
                title = v20.title, 
                subtitle = v20.subtitle, 
                layoutMode = v20.layoutMode, 
                onActivated = v20.onActivated, 
                selectable = v20.selectable == nil or v20.selectable, 
                isTitleLoading = v20.isTitleLoading, 
                isSubtitleLoading = v20.isSubtitleLoading, 
                contextualInfo = v20.contextualInfo and v20.contextualInfo.text, 
                isContextualInfoLoading = v20.isContextualInfoLoading, 
                avatarSize = if v20.layoutMode == v6.RowLayoutMode.Compact then UDim2.new(0, v21.Size.Size_1400, 0, v21.Size.Size_1400) else nil, 
                trustedConnectionIndicatorEnabled = if v12 then v20.trustedConnectionIndicatorEnabled else nil
            })
        }), 
        TrailingSection = v2.createElement(l_View_0, {
            tag = {
                ["gap-xsmall"] = true, 
                ["row align-y-center auto-xy"] = v20.layoutMode == v6.RowLayoutMode.Wide, 
                ["col size-full-0 auto-y align-x-center"] = v20.layoutMode == v6.RowLayoutMode.Compact
            }, 
            LayoutOrder = 2
        }, {
            PrimaryActionCta = if v20.primaryCta and v20.primaryCta.onActivated then v2.createElement(l_Button_0, {
                text = if v10 then v22[v20.primaryCta.type] else v20.primaryCta.type, 
                size = l_InputSize_0.Small, 
                variant = if l_FFlagFriendsPageViewBtnEnabled_0 then v20.primaryCta.variant or l_ButtonVariant_0.SoftEmphasis else l_ButtonVariant_0.SoftEmphasis, 
                onActivated = v20.primaryCta.onActivated, 
                isDisabled = v20.primaryCta.isDisabled, 
                isLoading = v20.primaryCta.isLoading, 
                LayoutOrder = 1, 
                width = if v20.layoutMode == v6.RowLayoutMode.Compact then UDim.new(1, 0) else nil
            }) else nil, 
            SecondaryActionCta = if v20.layoutMode == v6.RowLayoutMode.Wide and v20.secondaryCta and v20.secondaryCta.icon and v20.secondaryCta.onActivated then v2.createElement(l_IconButton_0, {
                icon = v20.secondaryCta.icon, 
                size = l_IconSize_0.Small, 
                variant = l_ButtonVariant_0.Utility, 
                onActivated = v20.secondaryCta.onActivated, 
                isDisabled = v20.secondaryCta.isDisabled, 
                isLoading = v20.secondaryCta.isLoading, 
                LayoutOrder = 2
            }) else nil, 
            TrailingContentWrapper = if v20.layoutMode == v6.RowLayoutMode.Wide and v20.trailingContent then v2.createElement(l_View_0, {
                tag = "auto-xy", 
                LayoutOrder = 3
            }, {
                Content = v20.trailingContent
            }) else nil
        })
    });
end);