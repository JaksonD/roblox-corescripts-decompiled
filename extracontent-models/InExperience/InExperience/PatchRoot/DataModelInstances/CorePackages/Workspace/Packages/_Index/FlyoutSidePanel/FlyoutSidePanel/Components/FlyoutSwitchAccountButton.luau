local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v1 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v3 = require(l_Parent_0.Foundation);
local l_Button_0 = v3.Button;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_ButtonSize_0 = v3.Enums.ButtonSize;
return function(v7) --[[ Line: 16 ]] --[[ Name: FlyoutSwitchAccountButton ]]
    -- upvalues: v1 (copy), l_useLocalization_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy)
    local v8 = v1.useCallback(function() --[[ Line: 17 ]]
        -- upvalues: v7 (copy)
        v7.closeDrawer();
        if v7.onSwitchAccountActivated then
            v7.onSwitchAccountActivated();
        end;
    end, {
        v7.onSwitchAccountActivated, 
        v7.closeDrawer
    });
    local v9 = l_useLocalization_0({
        title = "Authentication.AccountSwitch.Action.SwitchAccount"
    });
    return v1.createElement(l_Button_0, {
        text = v9.title, 
        variant = l_ButtonVariant_0.Standard, 
        LayoutOrder = v7.layoutOrder, 
        onActivated = v8, 
        isDisabled = false, 
        size = l_ButtonSize_0.Large, 
        width = UDim.new(1, 0)
    });
end;