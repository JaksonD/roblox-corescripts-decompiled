local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXDurablesSupport_0 = v7.FFlagAXDurablesSupport;
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.ActionButton);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_CombinedFFlagShouldUseLegacyGamepadFocus_0 = v7.CombinedFFlagShouldUseLegacyGamepadFocus;
ActionBarWithExpiredTimedOptions = function(v15) --[[ Line: 30 ]] --[[ Name: ActionBarWithExpiredTimedOptions ]]
    -- upvalues: l_useTokens_0 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy), v2 (copy), l_useLocalization_0 (copy), l_useStyle_0 (copy), l_Text_0 (copy), v9 (copy), l_FFlagAXDurablesSupport_0 (copy), l_View_0 (copy), l_Focusable_0 (copy)
    local v16 = l_useTokens_0();
    local v17 = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v2.useRef(nil) else nil;
    local v18 = l_useLocalization_0({
        expiredItemsPlural = {
            "Feature.Durables.BottomBar.Repurchase.ExpiredItemsPlural"; 
            number = v15.expiredItemCount
        }, 
        expiredItemsSingular = {
            "Feature.Durables.BottomBar.Repurchase.ExpiredItemsSingular"; 
            number = v15.expiredItemCount
        }
    });
    local v19 = if v15.expiredItemCount == 1 then v18.expiredItemsSingular else v18.expiredItemsPlural;
    local v20 = {
        buttonText = "View", 
        buttonIcon = nil, 
        buttonIconPadding = 0, 
        buttonIconSize = 0, 
        buttonIsDisabled = false, 
        buttonIsLoading = false, 
        buttonColor = v16.Color.ActionEmphasis.Background.Color3, 
        buttonTextColor = v16.Color.ActionEmphasis.Foreground.Color3, 
        onActivated = v15.onViewPressed
    };
    local v21 = l_useStyle_0();
    local v22 = {
        ExpiredLabel = v2.createElement(l_Text_0, {
            tag = "text-title-large content-emphasis auto-xy anchor-center-left", 
            Position = UDim2.new(0, v16.Size.Size_500, 0.5, 0), 
            Text = v19, 
            LayoutOrder = 1
        }), 
        ActionButton = v2.createElement(v9, {
            Size = UDim2.new(0.5, -v16.Size.Size_250, 1, -v16.Size.Size_250), 
            AnchorPoint = if l_FFlagAXDurablesSupport_0 then Vector2.new(1, 0) else nil, 
            Position = UDim2.new(1, 0, 0, 0), 
            LayoutOrder = 2, 
            Font = v21.Font, 
            buttonProps = v20, 
            ref = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v17 else nil
        })
    };
    return v2.createElement(l_View_0, {
        tag = "size-full-0 anchor-bottom-left", 
        Size = UDim2.new(1, 0, 0, v16.Size.Size_1500), 
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
                defaultChild = v17
            }, v22) else nil, 
            ExpiredLabel = if not l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v22.ExpiredLabel else nil, 
            ActionButton = if not l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v22.ActionButton else nil
        })
    });
end;
return ActionBarWithExpiredTimedOptions;