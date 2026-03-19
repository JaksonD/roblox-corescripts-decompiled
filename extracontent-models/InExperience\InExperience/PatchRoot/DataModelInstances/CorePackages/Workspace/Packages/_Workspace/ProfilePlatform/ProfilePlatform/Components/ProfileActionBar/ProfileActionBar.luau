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
return function(v23) --[[ Line: 53 ]] --[[ Name: ProfileActionBar ]]
    -- upvalues: v20 (copy), l_useTokens_0 (copy), l_ButtonVariant_0 (copy), v2 (copy), v17 (copy), v22 (copy), v15 (copy), l_Button_0 (copy), l_FillBehavior_0 (copy), l_InputSize_0 (copy), v21 (copy), v19 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), v16 (copy), v18 (copy), l_HorizontalPageMargin_0 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v24 = if v20 then l_useTokens_0() else nil;
    local l_profileActions_0 = v23.profileActions;
    local l_Standard_0 = l_ButtonVariant_0.Standard;
    local v27 = nil;
    v27 = if v20 then v2.useMemo(function() --[[ Line: 63 ]]
        -- upvalues: l_profileActions_0 (copy)
        if l_profileActions_0.primary then
            for _, v29 in ipairs(l_profileActions_0.primary) do
                if v29.disabledReason then
                    return v29.disabledReason;
                end;
            end;
        end;
        return nil;
    end, {
        l_profileActions_0.primary
    }) else nil;
    local v30 = if v20 then v17(v27) else nil;
    local v39 = v2.useMemo(function() --[[ Line: 82 ]]
        -- upvalues: l_profileActions_0 (copy), v22 (ref), v2 (ref), v15 (ref), v23 (copy), l_Standard_0 (copy), l_ButtonVariant_0 (ref), l_Button_0 (ref), l_FillBehavior_0 (ref), l_InputSize_0 (ref), v21 (ref), v19 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), v16 (ref), v18 (ref)
        local v31 = {};
        if l_profileActions_0.primary then
            for v32, v33 in ipairs(l_profileActions_0.primary) do
                if v22 and v33.menuItems then
                    v31[v32] = v2.createElement(v15, {
                        text = v33.text, 
                        variant = v33.variant, 
                        menuItems = v33.menuItems, 
                        buttonRef = if v32 == 1 then v23.primaryButtonRef else nil, 
                        onMenuOpened = v33.onActivated, 
                        LayoutOrder = v32
                    });
                else
                    local v34 = if v33.variant then v33.variant else l_Standard_0;
                    if #l_profileActions_0.primary >= 2 and v32 > 1 then
                        v34 = l_ButtonVariant_0.Standard;
                    end;
                    v31[v32] = v2.createElement(l_Button_0, {
                        onActivated = v33.onActivated, 
                        text = v33.text, 
                        isDisabled = v33.isDisabled, 
                        isLoading = v33.isLoading, 
                        variant = v34, 
                        width = UDim.new(1, 0), 
                        fillBehavior = l_FillBehavior_0.Fill, 
                        size = l_InputSize_0.Medium, 
                        ref = if v32 == 1 then v23.primaryButtonRef else nil, 
                        icon = if v21 and v19 then v33.icon else nil, 
                        LayoutOrder = v32
                    });
                end;
            end;
        end;
        if l_profileActions_0.secondary then
            for v35, v36 in ipairs(l_profileActions_0.secondary) do
                v31[#(l_profileActions_0.primary or {}) + v35] = v2.createElement(l_IconButton_0, {
                    onActivated = v36.onActivated, 
                    icon = v36.icon, 
                    size = l_IconSize_0.Medium, 
                    isDisabled = v36.isDisabled, 
                    variant = l_ButtonVariant_0.Standard, 
                    LayoutOrder = #(l_profileActions_0.primary or {}) + v35
                });
            end;
        end;
        if v23.openContextualMenu then
            local v37 = #(l_profileActions_0.primary or {}) + #(l_profileActions_0.secondary or {}) + 1;
            local l_upsellTooltipProps_0 = v23.upsellTooltipProps;
            if v23.showPlusMoreMenuTooltip and l_upsellTooltipProps_0 and l_upsellTooltipProps_0.plusMoreMenuTooltipBody and l_upsellTooltipProps_0.plusMoreMenuTooltipBody ~= "" then
                v31[v37] = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(40, 40), 
                    ClipsDescendants = false, 
                    ZIndex = 10, 
                    LayoutOrder = v37
                }, {
                    Button = v2.createElement(v16, {
                        layoutOrder = 1, 
                        onActivated = v23.openContextualMenu, 
                        isSelected = v23.isContextualMenuOpen, 
                        buttonRef = v23.moreButtonRef
                    }), 
                    PlusMoreMenuTooltip = v2.createElement(v18, {
                        anchorRef = v23.moreButtonRef, 
                        isOpen = v23.showPlusMoreMenuTooltip == true, 
                        text = l_upsellTooltipProps_0.plusMoreMenuTooltipBody, 
                        title = l_upsellTooltipProps_0.plusMoreMenuTooltipTitle, 
                        onClose = l_upsellTooltipProps_0.onPlusMoreMenuTooltipClose
                    })
                });
                return v31;
            else
                v31[v37] = v2.createElement(v16, {
                    layoutOrder = v37, 
                    onActivated = v23.openContextualMenu, 
                    isSelected = v23.isContextualMenuOpen, 
                    buttonRef = v23.moreButtonRef
                });
            end;
        end;
        return v31;
    end, {
        l_profileActions_0.primary, 
        l_profileActions_0.secondary, 
        v23.openContextualMenu, 
        v23.isContextualMenuOpen, 
        v23.showPlusMoreMenuTooltip, 
        v23.upsellTooltipProps, 
        v23.moreButtonRef
    });
    return v2.createElement(l_HorizontalPageMargin_0, {
        size = UDim2.fromScale(1, 0), 
        backgroundTransparency = 1, 
        layoutOrder = v23.layoutOrder, 
        useAutomaticSizing = true
    }, {
        UIListLayout = if v20 then v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 8)
        }) else nil, 
        ActionBar = v2.createElement(l_View_0, {
            tag = "size-full-0 auto-y row align-y-center gap-small", 
            LayoutOrder = 0
        }, v39), 
        DisabledReasonText = if v20 and v30 and v24 then v2.createElement(l_Text_0, {
            LayoutOrder = 1, 
            Text = v30, 
            TextWrapped = true, 
            fontStyle = v24.Typography.CaptionMedium, 
            colorStyle = v24.Color.Content.Emphasis, 
            tag = "text-align-y-bottom text-align-x-left auto-y size-full-0"
        }) else nil
    });
end;