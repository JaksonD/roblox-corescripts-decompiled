local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Foundation);
local l_Button_0 = v4.Button;
local l_IconButton_0 = v4.IconButton;
local l_View_0 = v4.View;
local l_ButtonVariant_0 = v4.Enums.ButtonVariant;
local l_FillBehavior_0 = v4.Enums.FillBehavior;
local l_HorizontalPageMargin_0 = v3.App.Container.HorizontalPageMargin;
local l_InputSize_0 = v4.Enums.InputSize;
local l_Text_0 = v4.Text;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_IconSize_0 = v4.Enums.IconSize;
local v15 = require(l_script_FirstAncestor_0.Components.ProfileActionBar.ActionMenuButton);
local v16 = require(l_script_FirstAncestor_0.Components.ProfileActionBar.ProfileMoreButton);
local v17 = require(l_script_FirstAncestor_0.Components.ProfileActionBar.useDisabledReasonText);
local v18 = require(l_script_FirstAncestor_0.Components.ProfileActionBar.PlusMoreMenuTooltip);
local v19 = require(l_script_FirstAncestor_0.Flags.FFlagEnableCommunityVerificationModal);
local v20 = require(l_script_FirstAncestor_0.Flags.FFlagEnableProfilePlatformDisabledReasonText);
local v21 = require(l_script_FirstAncestor_0.Flags.FFlagPortEnableCommunityVerificationModal);
local v22 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableEditAppearanceMenu);
local v23 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableTransferTooltip);
local _ = require(l_script_FirstAncestor_0.Types.UpsellTooltipProps);
return function(v25) --[[ Line: 51 ]] --[[ Name: ProfileActionBar ]]
    -- upvalues: v20 (copy), l_useTokens_0 (copy), l_ButtonVariant_0 (copy), v2 (copy), v17 (copy), v22 (copy), v15 (copy), l_Button_0 (copy), l_FillBehavior_0 (copy), l_InputSize_0 (copy), v21 (copy), v19 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), v23 (copy), v16 (copy), v18 (copy), l_HorizontalPageMargin_0 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v26 = if v20 then l_useTokens_0() else nil;
    local l_profileActions_0 = v25.profileActions;
    local l_Standard_0 = l_ButtonVariant_0.Standard;
    local v29 = nil;
    v29 = if v20 then v2.useMemo(function() --[[ Line: 61 ]]
        -- upvalues: l_profileActions_0 (copy)
        if l_profileActions_0.primary then
            for _, v31 in ipairs(l_profileActions_0.primary) do
                if v31.disabledReason then
                    return v31.disabledReason;
                end;
            end;
        end;
        return nil;
    end, {
        l_profileActions_0.primary
    }) else nil;
    local v32 = if v20 then v17(v29) else nil;
    local v41 = v2.useMemo(function() --[[ Line: 80 ]]
        -- upvalues: l_profileActions_0 (copy), v22 (ref), v2 (ref), v15 (ref), v25 (copy), l_Standard_0 (copy), l_ButtonVariant_0 (ref), l_Button_0 (ref), l_FillBehavior_0 (ref), l_InputSize_0 (ref), v21 (ref), v19 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), v23 (ref), v16 (ref), v18 (ref)
        local v33 = {};
        if l_profileActions_0.primary then
            for v34, v35 in ipairs(l_profileActions_0.primary) do
                if v22 and v35.menuItems then
                    v33[v34] = v2.createElement(v15, {
                        text = v35.text, 
                        variant = v35.variant, 
                        menuItems = v35.menuItems, 
                        buttonRef = if v34 == 1 then v25.primaryButtonRef else nil, 
                        onMenuOpened = v35.onActivated, 
                        LayoutOrder = v34
                    });
                else
                    local v36 = if v35.variant then v35.variant else l_Standard_0;
                    if #l_profileActions_0.primary >= 2 and v34 > 1 then
                        v36 = l_ButtonVariant_0.Standard;
                    end;
                    v33[v34] = v2.createElement(l_Button_0, {
                        onActivated = v35.onActivated, 
                        text = v35.text, 
                        isDisabled = v35.isDisabled, 
                        isLoading = v35.isLoading, 
                        variant = v36, 
                        width = UDim.new(1, 0), 
                        fillBehavior = l_FillBehavior_0.Fill, 
                        size = l_InputSize_0.Medium, 
                        ref = if v34 == 1 then v25.primaryButtonRef else nil, 
                        icon = if v21 and v19 then v35.icon else nil, 
                        LayoutOrder = v34
                    });
                end;
            end;
        end;
        if l_profileActions_0.secondary then
            for v37, v38 in ipairs(l_profileActions_0.secondary) do
                v33[#(l_profileActions_0.primary or {}) + v37] = v2.createElement(l_IconButton_0, {
                    onActivated = v38.onActivated, 
                    icon = v38.icon, 
                    size = l_IconSize_0.Medium, 
                    isDisabled = v38.isDisabled, 
                    variant = l_ButtonVariant_0.Standard, 
                    LayoutOrder = #(l_profileActions_0.primary or {}) + v37
                });
            end;
        end;
        if v25.openContextualMenu then
            local v39 = #(l_profileActions_0.primary or {}) + #(l_profileActions_0.secondary or {}) + 1;
            local l_upsellTooltipProps_0 = v25.upsellTooltipProps;
            if v23 and v25.showPlusMoreMenuTooltip and l_upsellTooltipProps_0 and l_upsellTooltipProps_0.plusMoreMenuTooltipBody and l_upsellTooltipProps_0.plusMoreMenuTooltipBody ~= "" then
                v33[v39] = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(40, 40), 
                    ClipsDescendants = false, 
                    ZIndex = 10, 
                    LayoutOrder = v39
                }, {
                    Button = v2.createElement(v16, {
                        layoutOrder = 1, 
                        onActivated = v25.openContextualMenu, 
                        isSelected = v25.isContextualMenuOpen, 
                        buttonRef = v25.moreButtonRef
                    }), 
                    PlusMoreMenuTooltip = v2.createElement(v18, {
                        anchorRef = v25.moreButtonRef, 
                        isOpen = v25.showPlusMoreMenuTooltip == true, 
                        text = l_upsellTooltipProps_0.plusMoreMenuTooltipBody, 
                        title = l_upsellTooltipProps_0.plusMoreMenuTooltipTitle, 
                        onClose = l_upsellTooltipProps_0.onPlusMoreMenuTooltipClose, 
                        onPressedOutside = l_upsellTooltipProps_0.onPlusMoreMenuTooltipDismiss
                    })
                });
                return v33;
            else
                v33[v39] = v2.createElement(v16, {
                    layoutOrder = v39, 
                    onActivated = v25.openContextualMenu, 
                    isSelected = v25.isContextualMenuOpen, 
                    buttonRef = v25.moreButtonRef
                });
            end;
        end;
        return v33;
    end, {
        l_profileActions_0.primary, 
        l_profileActions_0.secondary, 
        v25.openContextualMenu, 
        v25.isContextualMenuOpen, 
        v25.showPlusMoreMenuTooltip, 
        v25.upsellTooltipProps, 
        v25.moreButtonRef
    });
    return v2.createElement(l_HorizontalPageMargin_0, {
        size = UDim2.fromScale(1, 0), 
        backgroundTransparency = 1, 
        layoutOrder = v25.layoutOrder, 
        useAutomaticSizing = true
    }, {
        UIListLayout = if v20 then v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 8)
        }) else nil, 
        ActionBar = v2.createElement(l_View_0, {
            tag = "size-full-0 auto-y row align-y-center gap-small", 
            LayoutOrder = 0
        }, v41), 
        DisabledReasonText = if v20 and v32 and v26 then v2.createElement(l_Text_0, {
            LayoutOrder = 1, 
            Text = v32, 
            TextWrapped = true, 
            fontStyle = v26.Typography.CaptionMedium, 
            colorStyle = v26.Color.Content.Emphasis, 
            tag = "text-align-y-bottom text-align-x-left auto-y size-full-0"
        }) else nil
    });
end;