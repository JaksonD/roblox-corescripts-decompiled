local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.BuilderIcons);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Constants);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v6 = require(l_Components_0.InternalInput);
local v7 = require(l_Components_0.Text);
local _ = require(l_Components_0.Types);
local v9 = require(l_Components_0.InternalInput.useUncontrolledState);
local v10 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v11 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v12 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v13 = require(script.Parent.useCheckboxVariants);
local v14 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v15 = require(l_script_FirstAncestor_0.Enums.InputPlacement);
local v16 = {
    size = v14.Medium, 
    placement = v15.Start, 
    Selectable = true, 
    testId = "--foundation-checkbox"
};
return v3.memo(v3.forwardRef(function(v17, v18) --[[ Line: 53 ]] --[[ Name: Checkbox ]]
    -- upvalues: v12 (copy), v16 (copy), v10 (copy), v13 (copy), v9 (copy), v3 (copy), v6 (copy), v11 (copy), v4 (copy), v7 (copy), v2 (copy)
    local v19 = v12(v17, v16);
    local v20 = v10();
    local v21 = v13(v20, v19.size);
    local v22, v23 = v9(v19.isChecked, v19.onActivated);
    local v24 = v19.isIndeterminate or false;
    return v3.createElement(v6, v11(v19, {
        isChecked = v22, 
        isIndeterminate = v24, 
        isDisabled = v19.isDisabled, 
        onActivated = v23, 
        label = {
            text = v19.label, 
            position = v4.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[v19.placement]
        }, 
        customVariantProps = v21.input, 
        size = v19.size, 
        Selectable = v19.Selectable, 
        NextSelectionUp = v19.NextSelectionUp, 
        NextSelectionDown = v19.NextSelectionDown, 
        NextSelectionLeft = v19.NextSelectionLeft, 
        NextSelectionRight = v19.NextSelectionRight, 
        ref = v18
    }), {
        Checkmark = if not not v22 or v24 then v3.createElement(v7, {
            Text = if v24 then v2.Icon.Minus else v2.Icon.Check, 
            fontStyle = {
                Font = v2.Font[v2.IconVariant.Filled]
            }, 
            TextScaled = true, 
            tag = v21.checkmark.tag, 
            testId = ("%*--checkmark"):format(v19.testId)
        }) else nil
    });
end));