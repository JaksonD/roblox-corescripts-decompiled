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
local v15 = require(l_script_FirstAncestor_0.Utility.getInputTextSize);
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local v17 = {
    size = v14.Large, 
    testId = "--foundation-text-input"
};
return v2.memo(v2.forwardRef(function(v18, v19) --[[ Line: 48 ]] --[[ Name: TextInput ]]
    -- upvalues: v13 (copy), v17 (copy), v11 (copy), v10 (copy), v2 (copy), v6 (copy), v12 (copy), v15 (copy), v7 (copy), v9 (copy), v4 (copy), v5 (copy)
    local v20 = v13(v18, v17);
    local v21 = v11();
    local v22 = v10(v21, v20.size);
    return v2.createElement(v6, v12(v20, {
        width = v20.width, 
        ref = v19, 
        label = v20.label, 
        size = v15(v20.size), 
        isRequired = v20.isRequired, 
        hasError = v20.hasError, 
        hint = v20.hint, 
        textBoxRef = v20.textBoxRef, 
        input = function(v23) --[[ Line: 64 ]] --[[ Name: input ]]
            -- upvalues: v2 (ref), v7 (ref), v20 (copy), v22 (copy), v9 (ref), v4 (ref), v5 (ref)
            return v2.createElement(v7, {
                ref = v23, 
                hasError = v20.hasError, 
                isDisabled = v20.isDisabled, 
                text = v20.text, 
                textInputType = v20.textInputType, 
                size = v20.size, 
                horizontalPadding = {
                    left = v22.innerContainer.horizontalPadding, 
                    right = v22.innerContainer.horizontalPadding
                }, 
                onChanged = v20.onChanged, 
                onFocus = v20.onFocusGained, 
                onFocusLost = v20.onFocusLost, 
                onReturnPressed = v20.onReturnPressed, 
                placeholder = v20.placeholder, 
                leadingElement = if v20.leadingIcon then v2.createElement(v9, {
                    tag = "size-0-full auto-x row align-y-center"
                }, v2.createElement(v4, {
                    name = v20.leadingIcon, 
                    style = v22.icon.style, 
                    size = v22.icon.size
                })) else nil, 
                trailingElement = if v20.iconTrailing then v2.createElement(v9, {
                    tag = "size-0-full auto-x row align-y-center"
                }, if type(v20.iconTrailing) == "table" and v20.iconTrailing.onActivated then v2.createElement(v5, {
                    onActivated = v20.iconTrailing.onActivated, 
                    isDisabled = v20.isDisabled, 
                    size = v22.icon.size, 
                    icon = v20.iconTrailing.name, 
                    testId = ("%*--trailing-icon-button"):format(v20.testId)
                }) else v2.createElement(v4, {
                    name = if type(v20.iconTrailing) == "table" then v20.iconTrailing.name else v20.iconTrailing, 
                    style = v22.icon.style, 
                    size = v22.icon.size
                })) else nil, 
                testId = ("%*--internal-text-input"):format(v20.testId)
            });
        end
    }));
end));