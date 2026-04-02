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
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
local l_FFlagFriendsPageViewBtnWidth_0 = require(l_Parent_0.SharedFlags).FFlagFriendsPageViewBtnWidth;
local l_View_0 = v4.View;
local l_Button_0 = v4.Button;
local l_ButtonVariant_0 = v4.Enums.ButtonVariant;
local l_InputSize_0 = v4.Enums.InputSize;
local l_IconButton_0 = v4.IconButton;
local l_IconSize_0 = v4.Enums.IconSize;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_FillBehavior_0 = v4.Enums.FillBehavior;
return v2.memo(function(v23) --[[ Line: 70 ]] --[[ Name: BaseRow ]]
    -- upvalues: l_useTokens_0 (copy), v10 (copy), l_useLocalization_0 (copy), v8 (copy), v6 (copy), l_FFlagFriendsPageViewBtnEnabled_0 (copy), v2 (copy), l_View_0 (copy), v7 (copy), l_UserTile_0 (copy), v4 (copy), v12 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), l_FFlagFriendsPageViewBtnWidth_0 (copy), l_Button_0 (copy), l_InputSize_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy)
    local v24 = l_useTokens_0();
    local v25 = if v10 then l_useLocalization_0({
        Accept = v8.Accept, 
        Add = v8.Add, 
        Chat = v8.Chat, 
        Join = v8.Join, 
        Pending = v8.Pending, 
        [v6.ButtonTypes.View] = if l_FFlagFriendsPageViewBtnEnabled_0 then v8.View else nil
    }) else nil;
    return v2.createElement(l_View_0, {
        LayoutOrder = v23.layoutOrder, 
        tag = {
            ["size-full-0 auto-y align-y-center"] = true, 
            ["row gap-medium padding-top-medium padding-bottom-medium padding-right-xsmall flex-x-between"] = v23.layoutMode == v6.RowLayoutMode.Wide, 
            ["col gap-small padding-medium bg-surface-100 radius-medium"] = v23.layoutMode == v6.RowLayoutMode.Compact
        }
    }, {
        UserTileContainer = v2.createElement(l_View_0, {
            tag = {
                fill = v23.layoutMode == v6.RowLayoutMode.Wide, 
                ["size-full-0 auto-y"] = v23.layoutMode == v6.RowLayoutMode.Compact
            }, 
            Size = if v23.layoutMode == v6.RowLayoutMode.Wide then UDim2.new(0, 0, 0, v7.USER_ROW_HEIGHT) else nil, 
            LayoutOrder = 1
        }, {
            UserTile = v2.createElement(l_UserTile_0, {
                userId = v23.userId or "", 
                avatarThumbnailUrl = v23.avatarThumbnailUrl, 
                userPresenceType = v23.userPresenceType or v4.Enums.UserPresence.None, 
                title = v23.title, 
                subtitle = v23.subtitle, 
                layoutMode = v23.layoutMode, 
                onActivated = v23.onActivated, 
                selectable = v23.selectable == nil or v23.selectable, 
                isTitleLoading = v23.isTitleLoading, 
                isSubtitleLoading = v23.isSubtitleLoading, 
                contextualInfo = v23.contextualInfo and v23.contextualInfo.text, 
                isContextualInfoLoading = v23.isContextualInfoLoading, 
                avatarSize = if v23.layoutMode == v6.RowLayoutMode.Compact then UDim2.new(0, v24.Size.Size_1400, 0, v24.Size.Size_1400) else nil, 
                trustedConnectionIndicatorEnabled = if v12 then v23.trustedConnectionIndicatorEnabled else nil, 
                isRobloxSubscriber = if l_FFlagEnableBlackbirdCheckDev_0 then v23.isRobloxSubscriber else nil
            })
        }), 
        TrailingSection = v2.createElement(l_View_0, {
            tag = {
                ["gap-xsmall"] = true, 
                ["row align-y-center auto-xy"] = v23.layoutMode == v6.RowLayoutMode.Wide, 
                ["col size-full-0 auto-y align-x-center"] = v23.layoutMode == v6.RowLayoutMode.Compact
            }, 
            LayoutOrder = 2
        }, {
            PrimaryActionCta = if v23.primaryCta and v23.primaryCta.onActivated then if l_FFlagFriendsPageViewBtnWidth_0 and v23.layoutMode == v6.RowLayoutMode.Wide then v2.createElement(l_View_0, {
                LayoutOrder = 1, 
                tag = "auto-xy", 
                sizeConstraint = {
                    MinSize = if v23.primaryCta.minWidth then Vector2.new(v23.primaryCta.minWidth, 0) else nil, 
                    MaxSize = if v23.primaryCta.maxWidth then Vector2.new(v23.primaryCta.maxWidth, 1e999) else nil
                }
            }, {
                Button = v2.createElement(l_Button_0, {
                    text = if v10 then v25[v23.primaryCta.type] else v23.primaryCta.type, 
                    size = l_InputSize_0.Small, 
                    variant = if l_FFlagFriendsPageViewBtnEnabled_0 then v23.primaryCta.variant or l_ButtonVariant_0.SoftEmphasis else l_ButtonVariant_0.SoftEmphasis, 
                    onActivated = v23.primaryCta.onActivated, 
                    isDisabled = v23.primaryCta.isDisabled, 
                    isLoading = v23.primaryCta.isLoading, 
                    fillBehavior = l_FillBehavior_0.Fill
                })
            }) else v2.createElement(l_Button_0, {
                text = if v10 then v25[v23.primaryCta.type] else v23.primaryCta.type, 
                size = l_InputSize_0.Small, 
                variant = if l_FFlagFriendsPageViewBtnEnabled_0 then v23.primaryCta.variant or l_ButtonVariant_0.SoftEmphasis else l_ButtonVariant_0.SoftEmphasis, 
                onActivated = v23.primaryCta.onActivated, 
                isDisabled = v23.primaryCta.isDisabled, 
                isLoading = v23.primaryCta.isLoading, 
                LayoutOrder = 1, 
                width = if v23.layoutMode == v6.RowLayoutMode.Compact then UDim.new(1, 0) else nil
            }) else nil, 
            SecondaryActionCta = if v23.layoutMode == v6.RowLayoutMode.Wide and v23.secondaryCta and v23.secondaryCta.icon and v23.secondaryCta.onActivated then v2.createElement(l_IconButton_0, {
                icon = v23.secondaryCta.icon, 
                size = l_IconSize_0.Small, 
                variant = l_ButtonVariant_0.Utility, 
                onActivated = v23.secondaryCta.onActivated, 
                isDisabled = v23.secondaryCta.isDisabled, 
                isLoading = v23.secondaryCta.isLoading, 
                LayoutOrder = 2
            }) else nil, 
            TrailingContentWrapper = if v23.layoutMode == v6.RowLayoutMode.Wide and v23.trailingContent then v2.createElement(l_View_0, {
                tag = "auto-xy", 
                LayoutOrder = 3
            }, {
                Content = v23.trailingContent
            }) else nil
        })
    });
end);