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
local v10 = require(l_script_FirstAncestor_0.Utility.Flags);
local v11 = require(l_script_FirstAncestor_0.Components.TextInput.useTextInputVariants);
local v12 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v13 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v14 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v15 = require(l_script_FirstAncestor_0.Enums.InputSize);
local _ = require(l_script_FirstAncestor_0.Enums.InputVariant);
local v17 = require(l_script_FirstAncestor_0.Utility.getInputTextSize);
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local v19 = {
    size = v15.Large, 
    testId = "--foundation-text-input"
};
return v2.memo(v2.forwardRef(function(v20, v21) --[[ Line: 52 ]] --[[ Name: TextInput ]]
    -- upvalues: v14 (copy), v19 (copy), v12 (copy), v11 (copy), v10 (copy), v2 (copy), v6 (copy), v13 (copy), v17 (copy), v7 (copy), v9 (copy), v4 (copy), v5 (copy)
    local v22 = v14(v20, v19);
    local v23 = v12();
    local v24 = v11(v23, v22.size, if v10.FoundationTextInputVariant then v22.variant else nil);
    return v2.createElement(v6, v13(v22, {
        width = v22.width, 
        ref = v21, 
        label = v22.label, 
        size = v17(v22.size), 
        isRequired = v22.isRequired, 
        hasError = v22.hasError, 
        hint = v22.hint, 
        textBoxRef = v22.textBoxRef, 
        input = function(v25) --[[ Line: 69 ]] --[[ Name: input ]]
            -- upvalues: v2 (ref), v7 (ref), v22 (copy), v10 (ref), v24 (copy), v9 (ref), v4 (ref), v5 (ref)
            return v2.createElement(v7, {
                ref = v25, 
                hasError = v22.hasError, 
                isDisabled = v22.isDisabled, 
                text = v22.text, 
                textInputType = v22.textInputType, 
                focusBehavior = if v10.FoundationTextInputFocusBehavior then v22.focusBehavior else nil, 
                size = v22.size, 
                variant = if v10.FoundationTextInputVariant then v22.variant else nil, 
                horizontalPadding = {
                    left = v24.innerContainer.horizontalPadding, 
                    right = v24.innerContainer.horizontalPadding
                }, 
                onChanged = v22.onChanged, 
                onFocus = v22.onFocusGained, 
                onFocusLost = v22.onFocusLost, 
                onReturnPressed = v22.onReturnPressed, 
                placeholder = v22.placeholder, 
                leadingElement = if v22.leadingIcon then v2.createElement(v9, {
                    tag = "row align-y-center size-0-full auto-x"
                }, v2.createElement(v4, {
                    name = v22.leadingIcon, 
                    style = v24.icon.style, 
                    size = v24.icon.size
                })) else nil, 
                trailingElement = if v22.iconTrailing then v2.createElement(v9, {
                    tag = "row align-y-center size-0-full auto-x"
                }, if type(v22.iconTrailing) == "table" and v22.iconTrailing.onActivated then v2.createElement(v5, {
                    onActivated = v22.iconTrailing.onActivated, 
                    isDisabled = v22.isDisabled, 
                    size = v24.icon.size, 
                    icon = v22.iconTrailing.name, 
                    testId = ("%*--trailing-icon-button"):format(v22.testId)
                }) else v2.createElement(v4, {
                    name = if type(v22.iconTrailing) == "table" then v22.iconTrailing.name else v22.iconTrailing, 
                    style = v24.icon.style, 
                    size = v24.icon.size
                })) else nil, 
                testId = ("%*--internal-text-input"):format(v22.testId)
            });
        end
    }));
end));