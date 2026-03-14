local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Constants);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v5 = require(l_Components_0.InternalInput);
local _ = require(l_Components_0.Types);
local v7 = require(l_Components_0.View);
local v8 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v9 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v10 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v11 = require(script.Parent.useRadioGroupItemVariants);
local v12 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v13 = require(l_script_FirstAncestor_0.Enums.InputPlacement);
local v14 = require(script.Parent.Parent.useRadioGroup);
local v15 = {
    size = v12.Medium, 
    isDisabled = false, 
    placement = v13.Start
};
return v2.memo(v2.forwardRef(function(v16, v17) --[[ Line: 47 ]] --[[ Name: RadioGroupItem ]]
    -- upvalues: v10 (copy), v15 (copy), v14 (copy), v8 (copy), v2 (copy), v11 (copy), v5 (copy), v9 (copy), v3 (copy), v7 (copy)
    local v18 = v10(v16, v15);
    local l_isDisabled_0 = v18.isDisabled;
    local v20 = v14();
    local v21 = v20.value == v18.value;
    local v22 = v18.label or v18.value;
    local v23 = v8();
    local v24 = v2.useCallback(function() --[[ Line: 57 ]]
        -- upvalues: v20 (copy), v18 (copy)
        v20.onValueChanged(v18.value);
    end, {
        l_isDisabled_0, 
        v18.value, 
        v20.onValueChanged
    });
    local v25 = v11(v23, v18.size);
    v18.testId = ("%*--item-%*"):format(v20.testId, v18.value);
    return v2.createElement(v5, v9(v18, {
        isChecked = v21, 
        isDisabled = l_isDisabled_0, 
        onActivated = v24, 
        label = {
            text = v22, 
            position = v3.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[v18.placement]
        }, 
        customVariantProps = v25.input, 
        size = v18.size, 
        Selectable = v20.Selectable, 
        ref = v17
    }), {
        Center = if v21 then v2.createElement(v7, {
            tag = v25.checkmark.tag, 
            backgroundStyle = v25.checkmark.style
        }) else nil
    });
end));