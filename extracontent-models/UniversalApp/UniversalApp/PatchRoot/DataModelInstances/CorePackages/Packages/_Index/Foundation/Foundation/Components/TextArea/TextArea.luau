local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v4 = require(l_Components_0.InputField);
local v5 = require(l_Components_0.InternalTextInput);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v7 = require(l_script_FirstAncestor_0.Utility.Flags);
local v8 = require(l_Components_0.TextInput.useTextInputVariants);
local v9 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v10 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v11 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v12 = require(l_script_FirstAncestor_0.Enums.InputSize);
local _ = require(l_script_FirstAncestor_0.Enums.InputVariant);
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local v15 = {
    size = v12.Medium, 
    numLines = 3, 
    testId = "--foundation-text-area"
};
return v2.memo(v2.forwardRef(function(v16, v17) --[[ Line: 39 ]] --[[ Name: TextArea ]]
    -- upvalues: v11 (copy), v15 (copy), v9 (copy), v8 (copy), v7 (copy), v2 (copy), v4 (copy), v10 (copy), v5 (copy)
    local v18 = v11(v16, v15);
    local v19 = v9();
    local v20 = v8(v19, v18.size, if v7.FoundationTextAreaVariant then v18.variant else nil);
    return v2.createElement(v4, v10(v18, {
        width = if v18.width then v18.width else nil, 
        label = v18.label, 
        hint = v18.hint, 
        hasError = v18.hasError, 
        isDisabled = v18.isDisabled, 
        isRequired = v18.isRequired, 
        input = function(v21) --[[ Line: 54 ]] --[[ Name: input ]]
            -- upvalues: v2 (ref), v5 (ref), v18 (copy), v7 (ref), v20 (copy), v19 (copy)
            return v2.createElement(v5, {
                size = v18.size, 
                variant = if v7.FoundationTextAreaVariant then v18.variant else nil, 
                numLines = v18.numLines, 
                focusBehavior = if v7.FoundationTextInputFocusBehavior then v18.focusBehavior else nil, 
                onFocus = v18.onFocusGained, 
                onFocusLost = v18.onFocusLost, 
                onChanged = v18.onChanged, 
                text = v18.text, 
                hasError = v18.hasError, 
                isDisabled = v18.isDisabled, 
                placeholder = v18.placeholder, 
                horizontalPadding = {
                    left = v20.innerContainer.horizontalPadding, 
                    right = v20.innerContainer.horizontalPadding - UDim.new(0, v19.Size.Size_150)
                }, 
                LayoutOrder = 2, 
                ref = v21, 
                testId = ("%*--input"):format(v18.testId)
            });
        end, 
        textBoxRef = v18.textBoxRef, 
        ref = v17
    }));
end));