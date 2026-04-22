local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.ActionButton);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_CombinedFFlagShouldUseLegacyGamepadFocus_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).CombinedFFlagShouldUseLegacyGamepadFocus;
ActionBarWithExpiredTimedOptions = function(v13) --[[ Line: 29 ]] --[[ Name: ActionBarWithExpiredTimedOptions ]]
    -- upvalues: l_useTokens_0 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy), v2 (copy), l_useLocalization_0 (copy), l_useStyle_0 (copy), l_Text_0 (copy), v7 (copy), l_View_0 (copy), l_Focusable_0 (copy)
    local v14 = l_useTokens_0();
    local v15 = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v2.useRef(nil) else nil;
    local v16 = l_useLocalization_0({
        expiredItemsPlural = {
            "Feature.Durables.BottomBar.Repurchase.ExpiredItemsPlural"; 
            number = v13.expiredItemCount
        }, 
        expiredItemsSingular = {
            "Feature.Durables.BottomBar.Repurchase.ExpiredItemsSingular"; 
            number = v13.expiredItemCount
        }
    });
    local v17 = if v13.expiredItemCount == 1 then v16.expiredItemsSingular else v16.expiredItemsPlural;
    local v18 = {
        buttonText = "View", 
        buttonIcon = nil, 
        buttonIconPadding = 0, 
        buttonIconSize = 0, 
        buttonIsDisabled = false, 
        buttonIsLoading = false, 
        buttonColor = v14.Color.ActionEmphasis.Background.Color3, 
        buttonTextColor = v14.Color.ActionEmphasis.Foreground.Color3, 
        onActivated = v13.onViewPressed
    };
    local v19 = l_useStyle_0();
    local v20 = {
        ExpiredLabel = v2.createElement(l_Text_0, {
            tag = "text-title-large content-emphasis auto-xy anchor-center-left", 
            Position = UDim2.new(0, v14.Size.Size_500, 0.5, 0), 
            Text = v17, 
            LayoutOrder = 1
        }), 
        ActionButton = v2.createElement(v7, {
            Size = UDim2.new(0.5, -v14.Size.Size_250, 1, -v14.Size.Size_250), 
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, 0, 0, 0), 
            LayoutOrder = 2, 
            Font = v19.Font, 
            buttonProps = v18, 
            ref = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v15 else nil
        })
    };
    return v2.createElement(l_View_0, {
        tag = "size-full-0 anchor-bottom-left", 
        Size = UDim2.new(1, 0, 0, v14.Size.Size_1500), 
        Position = UDim2.new(0, 0, 1, 0), 
        ZIndex = 3
    }, {
        ActionBarFrame = v2.createElement(l_View_0, {
            tag = "bg-surface-100 padding-y-small padding-x-small", 
            Size = UDim2.fromScale(1, 1)
        }, {
            FocusableContent = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v2.createElement(l_Focusable_0.Frame, {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                defaultChild = v15
            }, v20) else nil, 
            ExpiredLabel = if not l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v20.ExpiredLabel else nil, 
            ActionButton = if not l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v20.ActionButton else nil
        })
    });
end;
return ActionBarWithExpiredTimedOptions;