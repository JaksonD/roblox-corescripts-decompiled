local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v4 = require(l_Components_0.Icon);
local v5 = require(l_Components_0.IconButton);
local v6 = require(l_Components_0.InputField);
local v7 = require(l_Components_0.InternalTextInput);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v9 = require(l_Components_0.View);
local v10 = require(l_script_FirstAncestor_0.Components.TextInput.useTextInputVariants);
local v11 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v12 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v13 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v14 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v15 = require(l_script_FirstAncestor_0.Utility.Flags);
local v16 = require(l_script_FirstAncestor_0.Utility.getInputTextSize);
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local v18 = {
    size = v14.Large, 
    width = if v15.FoundationTextInputTokenBasedWidth then nil else UDim.new(0, 400), 
    testId = "--foundation-text-input"
};
return v2.memo(v2.forwardRef(function(v19, v20) --[[ Line: 50 ]] --[[ Name: TextInput ]]
    -- upvalues: v15 (copy), v18 (copy), v13 (copy), v11 (copy), v10 (copy), v2 (copy), v6 (copy), v12 (copy), v16 (copy), v7 (copy), v9 (copy), v4 (copy), v5 (copy)
    if v15.FoundationTextInputTokenBasedWidth then
        v18.width = nil;
    else
        v18.width = UDim.new(0, 400);
    end;
    local v21 = v13(v19, v18);
    local v22 = v11();
    local v23 = v10(v22, v21.size);
    return v2.createElement(v6, v12(v21, {
        width = if not v15.FoundationTextInputTokenBasedWidth or v21.width then v21.width else nil, 
        ref = v20, 
        label = v21.label, 
        size = v16(v21.size), 
        isRequired = v21.isRequired, 
        hasError = v21.hasError, 
        hint = v21.hint, 
        textBoxRef = v21.textBoxRef, 
        input = function(v24) --[[ Line: 75 ]] --[[ Name: input ]]
            -- upvalues: v2 (ref), v7 (ref), v21 (copy), v23 (copy), v9 (ref), v4 (ref), v5 (ref)
            return v2.createElement(v7, {
                ref = v24, 
                hasError = v21.hasError, 
                isDisabled = v21.isDisabled, 
                text = v21.text, 
                textInputType = v21.textInputType, 
                size = v21.size, 
                horizontalPadding = {
                    left = v23.innerContainer.horizontalPadding, 
                    right = v23.innerContainer.horizontalPadding
                }, 
                onChanged = v21.onChanged, 
                onFocus = v21.onFocusGained, 
                onFocusLost = v21.onFocusLost, 
                onReturnPressed = v21.onReturnPressed, 
                placeholder = v21.placeholder, 
                leadingElement = if v21.leadingIcon then v2.createElement(v9, {
                    tag = "size-0-full auto-x row align-y-center"
                }, v2.createElement(v4, {
                    name = v21.leadingIcon, 
                    style = v23.icon.style, 
                    size = v23.icon.size
                })) else nil, 
                trailingElement = if v21.iconTrailing then v2.createElement(v9, {
                    tag = "size-0-full auto-x row align-y-center"
                }, if type(v21.iconTrailing) == "table" and v21.iconTrailing.onActivated then v2.createElement(v5, {
                    onActivated = v21.iconTrailing.onActivated, 
                    isDisabled = v21.isDisabled, 
                    size = v23.icon.size, 
                    icon = v21.iconTrailing.name, 
                    testId = ("%*--trailing-icon-button"):format(v21.testId)
                }) else v2.createElement(v4, {
                    name = if type(v21.iconTrailing) == "table" then v21.iconTrailing.name else v21.iconTrailing, 
                    style = v23.icon.style, 
                    size = v23.icon.size
                })) else nil, 
                testId = ("%*--internal-text-input"):format(v21.testId)
            });
        end
    }));
end));