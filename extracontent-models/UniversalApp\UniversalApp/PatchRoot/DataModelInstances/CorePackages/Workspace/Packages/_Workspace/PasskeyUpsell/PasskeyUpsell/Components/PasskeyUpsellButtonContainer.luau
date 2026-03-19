local l_Parent_0 = script:FindFirstAncestor("PasskeyUpsell").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_FillBehavior_0 = v2.Enums.FillBehavior;
local l_ButtonSize_0 = v2.Enums.ButtonSize;
local l_View_0 = v2.View;
local l_Button_0 = v2.Button;
local v8 = game:DefineFastInt("PasskeyUpsellDisableButtonTimer", 1);
return function(v9) --[[ Line: 25 ]] --[[ Name: PasskeyUpsellButtonContainer ]]
    -- upvalues: v1 (copy), l_View_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy), l_FillBehavior_0 (copy), v8 (copy)
    local v10 = "gap-small align-y-center align-x-center col";
    local v11 = 88;
    local v12 = v9.localizedCancelText and v9.onCancelButtonPressed;
    if not v12 then
        v10 = "align-y-center align-x-center col";
        v11 = 40;
    end;
    return v1.createElement(l_View_0, {
        tag = v10, 
        Size = UDim2.new(1, 0, 0, v11), 
        Position = UDim2.new(0, 0, 1, -v11), 
        LayoutOrder = v9.layoutOrder
    }, {
        ContinueButton = v1.createElement(l_Button_0, {
            variant = l_ButtonVariant_0.Emphasis, 
            text = v9.localizedContinueText, 
            size = l_ButtonSize_0.Large, 
            fillBehavior = l_FillBehavior_0.Fill, 
            width = UDim.new(1, 0), 
            onActivated = v9.onContinueButtonPressed, 
            isDisabled = v9.isDisabled
        }), 
        CancelButton = v12 and v1.createElement(l_Button_0, {
            variant = l_ButtonVariant_0.Standard, 
            size = l_ButtonSize_0.Large, 
            fillBehavior = l_FillBehavior_0.Fill, 
            width = UDim.new(1, 0), 
            text = v9.localizedCancelText, 
            onActivated = v9.onCancelButtonPressed, 
            inputDelay = v8, 
            isDisabled = v9.isDisabled
        })
    });
end;