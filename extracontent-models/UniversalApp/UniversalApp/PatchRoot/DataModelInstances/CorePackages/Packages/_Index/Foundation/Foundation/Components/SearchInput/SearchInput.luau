local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.BuilderIcons);
local v3 = require(l_Parent_0.React);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v5 = require(l_Components_0.Icon);
local v6 = require(l_Components_0.InternalTextInput);
local _ = require(l_Components_0.Types);
local v8 = require(l_Components_0.View);
local v9 = require(l_script_FirstAncestor_0.Constants);
local v10 = require(l_script_FirstAncestor_0.Utility.Localization.Translator);
local v11 = require(l_script_FirstAncestor_0.Utility.useScaledValue);
local v12 = require(l_script_FirstAncestor_0.Components.TextInput.useTextInputVariants);
local v13 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v14 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v15 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v16 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v17 = require(l_script_FirstAncestor_0.Enums.InputVariant);
local v18 = require(l_script_FirstAncestor_0.Enums.Radius);
local v19 = require(l_script_FirstAncestor_0.Enums.SearchInputShape);
local v20 = {
    [v19.Pill] = v18.Circle, 
    [v19.Box] = v18.None
};
local v21 = {
    size = v16.Medium, 
    variant = v17.Standard, 
    shape = v19.Pill, 
    testId = "--foundation-search-input"
};
return v3.memo(v3.forwardRef(function(v22, v23) --[[ Line: 72 ]] --[[ Name: SearchInput ]]
    -- upvalues: v15 (copy), v21 (copy), v13 (copy), v12 (copy), v11 (copy), v9 (copy), v3 (copy), v8 (copy), v14 (copy), v6 (copy), v20 (copy), v10 (copy), v5 (copy), v2 (copy)
    local v24 = v15(v22, v21);
    local v25 = v13();
    local v26 = v12(v25, v24.size, v24.variant, nil, nil, nil, nil, true);
    local v27 = v11(v9.DEFAULT_INPUT_FIELD_WIDTH_PIXELS);
    local v28 = v3.useMemo(function() --[[ Line: 84 ]]
        -- upvalues: v26 (copy), v25 (copy)
        return UDim2.fromOffset(0, (v26.outerContainer.minHeight - v25.Stroke.Standard) / 2);
    end, {
        v26.outerContainer.minHeight, 
        v25.Stroke.Standard
    });
    return v3.createElement(v8, v14(v24, {
        Size = if v24.width then UDim2.new(v24.width, UDim.new(0, 0)) else UDim2.new(UDim.new(0, v27), UDim.new(0, 0)), 
        tag = "auto-y"
    }), {
        Input = v3.createElement(v6, {
            forceEnableFlagsForSearchInput = true, 
            ref = v23, 
            hasError = v24.hasError, 
            isDisabled = v24.isDisabled, 
            text = v24.text, 
            size = v24.size, 
            radius = v20[v24.shape], 
            variant = v24.variant, 
            horizontalPadding = {
                left = v26.innerContainer.horizontalPadding, 
                right = v26.innerContainer.horizontalPadding
            }, 
            onChanged = v24.onChanged, 
            onFocus = v24.onFocusGained, 
            onFocusLost = v24.onFocusLost, 
            placeholder = if v24.placeholder then v24.placeholder else v10:FormatByKey("CommonUI.Controls.Action.Search"), 
            leadingElement = v3.createElement(v8, {
                Position = v28, 
                tag = "anchor-center-left auto-xy"
            }, {
                Icon = v3.createElement(v5, {
                    name = v2.Icon.MagnifyingGlass, 
                    size = v24.size, 
                    testId = ("%*--search-icon"):format(v24.testId)
                })
            }), 
            testId = ("%*--input"):format(v24.testId)
        })
    });
end));