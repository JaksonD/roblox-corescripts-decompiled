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
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local v14 = {
    size = v12.Medium, 
    numLines = 3, 
    width = if v7.FoundationTextAreaTokenBasedWidth then nil else UDim.new(0, 400), 
    testId = "--foundation-text-area"
};
return v2.memo(v2.forwardRef(function(v15, v16) --[[ Line: 37 ]] --[[ Name: TextArea ]]
    -- upvalues: v7 (copy), v14 (copy), v11 (copy), v9 (copy), v8 (copy), v2 (copy), v4 (copy), v10 (copy), v5 (copy)
    if v7.FoundationTextAreaTokenBasedWidth then
        v14.width = nil;
    else
        v14.width = UDim.new(0, 400);
    end;
    local v17 = v11(v15, v14);
    local v18 = v9();
    local v19 = v8(v18, v17.size);
    return v2.createElement(v4, v10(v17, {
        width = if not v7.FoundationTextAreaTokenBasedWidth or v17.width then v17.width else nil, 
        label = v17.label, 
        hint = v17.hint, 
        hasError = v17.hasError, 
        isDisabled = v17.isDisabled, 
        isRequired = v17.isRequired, 
        input = function(v20) --[[ Line: 59 ]] --[[ Name: input ]]
            -- upvalues: v2 (ref), v5 (ref), v17 (copy), v19 (copy), v18 (copy)
            return v2.createElement(v5, {
                size = v17.size, 
                numLines = v17.numLines, 
                onFocus = v17.onFocusGained, 
                onFocusLost = v17.onFocusLost, 
                onChanged = v17.onChanged, 
                text = v17.text, 
                hasError = v17.hasError, 
                isDisabled = v17.isDisabled, 
                placeholder = v17.placeholder, 
                horizontalPadding = {
                    left = v19.innerContainer.horizontalPadding, 
                    right = v19.innerContainer.horizontalPadding - UDim.new(0, v18.Size.Size_150)
                }, 
                LayoutOrder = 2, 
                ref = v20, 
                testId = ("%*--input"):format(v17.testId)
            });
        end, 
        textBoxRef = v17.textBoxRef, 
        ref = v16
    }));
end));