local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
local v3 = require(l_Parent_0.React);
local _ = require(l_Parent_0.ReactFocusNavigation);
local v5 = require(l_Parent_0.InputHandlers);
local v6 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v6.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v6.FocusNavigationEventNameEnum;
local l_useAppFocusRoot_0 = v6.useAppFocusRoot;
local v10 = require(l_script_FirstAncestor_0.Components.CTARow.ContextualMenu);
local v11 = require(l_Parent_0.Foundation);
local l_View_0 = v11.View;
local l_Button_0 = v11.Button;
local l_IconButton_0 = v11.IconButton;
local l_ButtonVariant_0 = v11.Enums.ButtonVariant;
local l_FillBehavior_0 = v11.Enums.FillBehavior;
return function(v17) --[[ Line: 40 ]] --[[ Name: CTAButton ]]
    -- upvalues: v3 (copy), l_FocusNavigationEventNameEnum_0 (copy), v5 (copy), l_useAppFocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_ButtonVariant_0 (copy), l_IconButton_0 (copy), l_Button_0 (copy), l_FillBehavior_0 (copy), l_View_0 (copy), v10 (copy)
    local v18, v19 = v3.useState(false);
    local v20 = v3.useCallback(function() --[[ Line: 43 ]]
        -- upvalues: v19 (copy)
        v19(false);
    end, {});
    local v22 = v3.useCallback(function() --[[ Line: 47 ]]
        -- upvalues: v19 (copy)
        v19(function(v21) --[[ Line: 48 ]]
            return not v21;
        end);
    end, {});
    local v23 = v3.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v5 (ref), v20 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v5.onRelease(v20)
            }
        };
    end, {
        v20
    });
    local v24 = l_useAppFocusRoot_0({
        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.ContextualMenu, 
        customEventHandlers = v23, 
        isAutoFocusRoot = true, 
        isFocusable = v18
    });
    local v25 = v3.useRef(nil);
    local l_menuItem_0 = v17.buttonItem.menuItem;
    local l_displayValue_0 = l_menuItem_0.displayValue;
    local l_icon_0 = l_displayValue_0.icon;
    local l_text_0 = l_displayValue_0.text;
    local l_contextualMenuItems_0 = v17.buttonItem.contextualMenuItems;
    local v31 = if v17.buttonItem.buttonStyle then v17.buttonItem.buttonStyle else l_ButtonVariant_0.Standard;
    local v32 = l_contextualMenuItems_0 and #l_contextualMenuItems_0 > 0;
    local l_isDisabled_0 = v17.buttonItem.menuItem.isDisabled;
    local v34 = if v32 then v22 else l_menuItem_0.onActivated;
    local v35 = false;
    if l_icon_0 ~= nil then
        v35 = l_text_0 == nil;
    end;
    local v36 = if v35 then v3.createElement(l_IconButton_0, {
        icon = l_icon_0, 
        LayoutOrder = v17.layoutOrder, 
        onActivated = v34, 
        variant = l_ButtonVariant_0.Standard, 
        ref = v25, 
        isDisabled = l_isDisabled_0
    }) else v3.createElement(l_Button_0, {
        text = l_text_0, 
        icon = l_icon_0, 
        onActivated = v34, 
        fillBehavior = l_FillBehavior_0.Fill, 
        variant = v31, 
        isLoading = v17.buttonItem.isLoading, 
        LayoutOrder = v17.layoutOrder, 
        ref = v25, 
        isDisabled = l_isDisabled_0
    });
    return v3.createElement(l_View_0, {
        tag = {
            ["auto-xy"] = v35, 
            ["fill auto-y"] = not v35
        }, 
        LayoutOrder = v17.layoutOrder
    }, {
        Button = v36, 
        ContextualMenu = if v32 then v3.createElement(v10, {
            isOpen = v18, 
            menuItems = l_contextualMenuItems_0, 
            anchorRef = v25, 
            menuRef = v24, 
            onPressedOutside = v20, 
            align = v17.align
        }) else nil
    });
end;