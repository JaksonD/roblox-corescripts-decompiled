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
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagEnableCommunityVerificationModal);
local v19 = require(l_script_FirstAncestor_0.Flags.FFlagEnableProfilePlatformDisabledReasonText);
local v20 = require(l_script_FirstAncestor_0.Flags.FFlagPortEnableCommunityVerificationModal);
local v21 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableEditAppearanceMenu);
return function(v22) --[[ Line: 41 ]] --[[ Name: ProfileActionBar ]]
    -- upvalues: v19 (copy), l_useTokens_0 (copy), l_ButtonVariant_0 (copy), v2 (copy), v17 (copy), v21 (copy), v15 (copy), l_Button_0 (copy), l_FillBehavior_0 (copy), l_InputSize_0 (copy), v20 (copy), v18 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), v16 (copy), l_HorizontalPageMargin_0 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v23 = if v19 then l_useTokens_0() else nil;
    local l_profileActions_0 = v22.profileActions;
    local l_Standard_0 = l_ButtonVariant_0.Standard;
    local v26 = nil;
    v26 = if v19 then v2.useMemo(function() --[[ Line: 51 ]]
        -- upvalues: l_profileActions_0 (copy)
        if l_profileActions_0.primary then
            for _, v28 in ipairs(l_profileActions_0.primary) do
                if v28.disabledReason then
                    return v28.disabledReason;
                end;
            end;
        end;
        return nil;
    end, {
        l_profileActions_0.primary
    }) else nil;
    local v29 = if v19 then v17(v26) else nil;
    local v37 = v2.useMemo(function() --[[ Line: 70 ]]
        -- upvalues: l_profileActions_0 (copy), v21 (ref), v2 (ref), v15 (ref), v22 (copy), l_Standard_0 (copy), l_ButtonVariant_0 (ref), l_Button_0 (ref), l_FillBehavior_0 (ref), l_InputSize_0 (ref), v20 (ref), v18 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), v16 (ref)
        local v30 = {};
        if l_profileActions_0.primary then
            for v31, v32 in ipairs(l_profileActions_0.primary) do
                if v21 and v32.menuItems then
                    v30[v31] = v2.createElement(v15, {
                        text = v32.text, 
                        variant = v32.variant, 
                        menuItems = v32.menuItems, 
                        buttonRef = if v31 == 1 then v22.primaryButtonRef else nil, 
                        onMenuOpened = v32.onActivated, 
                        LayoutOrder = v31
                    });
                else
                    local v33 = if v32.variant then v32.variant else l_Standard_0;
                    if #l_profileActions_0.primary >= 2 and v31 > 1 then
                        v33 = l_ButtonVariant_0.Standard;
                    end;
                    v30[v31] = v2.createElement(l_Button_0, {
                        onActivated = v32.onActivated, 
                        text = v32.text, 
                        isDisabled = v32.isDisabled, 
                        isLoading = v32.isLoading, 
                        variant = v33, 
                        width = UDim.new(1, 0), 
                        fillBehavior = l_FillBehavior_0.Fill, 
                        size = l_InputSize_0.Medium, 
                        ref = if v31 == 1 then v22.primaryButtonRef else nil, 
                        icon = if v20 and v18 then v32.icon else nil, 
                        LayoutOrder = v31
                    });
                end;
            end;
        end;
        if l_profileActions_0.secondary then
            for v34, v35 in ipairs(l_profileActions_0.secondary) do
                v30[#(l_profileActions_0.primary or {}) + v34] = v2.createElement(l_IconButton_0, {
                    onActivated = v35.onActivated, 
                    icon = v35.icon, 
                    size = l_IconSize_0.Medium, 
                    isDisabled = v35.isDisabled, 
                    variant = l_ButtonVariant_0.Standard, 
                    LayoutOrder = #(l_profileActions_0.primary or {}) + v34
                });
            end;
        end;
        if v22.openContextualMenu then
            local v36 = #(l_profileActions_0.primary or {}) + #(l_profileActions_0.secondary or {}) + 1;
            v30[v36] = v2.createElement(v16, {
                layoutOrder = v36, 
                onActivated = v22.openContextualMenu, 
                isSelected = v22.isContextualMenuOpen, 
                buttonRef = v22.moreButtonRef
            });
        end;
        return v30;
    end, {
        l_profileActions_0.primary, 
        l_profileActions_0.secondary, 
        v22.openContextualMenu, 
        v22.isContextualMenuOpen
    });
    return v2.createElement(l_HorizontalPageMargin_0, {
        size = UDim2.fromScale(1, 0), 
        backgroundTransparency = 1, 
        layoutOrder = v22.layoutOrder, 
        useAutomaticSizing = true
    }, {
        UIListLayout = if v19 then v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 8)
        }) else nil, 
        ActionBar = v2.createElement(l_View_0, {
            tag = "size-full-0 auto-y row align-y-center gap-small", 
            LayoutOrder = 0
        }, v37), 
        DisabledReasonText = if v19 and v29 and v23 then v2.createElement(l_Text_0, {
            LayoutOrder = 1, 
            Text = v29, 
            TextWrapped = true, 
            fontStyle = v23.Typography.CaptionMedium, 
            colorStyle = v23.Color.Content.Emphasis, 
            tag = "text-align-y-bottom text-align-x-left auto-y size-full-0"
        }) else nil
    });
end;