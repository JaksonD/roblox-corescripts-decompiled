local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.BuilderIcons);
local v3 = require(l_script_FirstAncestor_0.Components.Icon);
local v4 = require(l_Parent_0.React);
local v5 = require(l_script_FirstAncestor_0.Enums.InputSize);
local l_IconVariant_0 = v2.IconVariant;
local _ = require(l_script_FirstAncestor_0.Enums.IconSize);
local v8 = require(l_script_FirstAncestor_0.Enums.CloseAffordanceVariant);
local _ = require(l_script_FirstAncestor_0.Enums.Radius);
local v10 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local l_usePresentationContext_0 = require(l_script_FirstAncestor_0.Providers.Style.PresentationContext).usePresentationContext;
local v12 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v13 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v14 = require(l_script_FirstAncestor_0.Constants);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v16 = require(l_script_FirstAncestor_0.Components.View);
local v17 = require(script.Parent.useCloseAffordanceVariants);
local v18 = {
    isDisabled = false, 
    size = v5.Medium, 
    variant = v8.OverMedia, 
    testId = "--foundation-close-affordance"
};
return v4.memo(v4.forwardRef(function(v19, v20) --[[ Line: 50 ]] --[[ Name: CloseAffordance ]]
    -- upvalues: v13 (copy), v18 (copy), v10 (copy), l_usePresentationContext_0 (copy), v17 (copy), v4 (copy), v16 (copy), v12 (copy), v14 (copy), v3 (copy), l_IconVariant_0 (copy)
    local v21 = v13(v19, v18);
    local v22 = v10();
    local v23 = l_usePresentationContext_0();
    local v24 = v17(v22, v21.size, v21.variant, v23.colorMode);
    local v25 = UDim.new(0, v24.container.radius);
    local v26 = v4.useMemo(function() --[[ Line: 57 ]]
        -- upvalues: v25 (copy), v22 (copy)
        return {
            radius = v25, 
            offset = v22.Size.Size_150, 
            borderWidth = v22.Stroke.Thicker
        };
    end, {
        v22, 
        v25
    });
    return v4.createElement(v16, v12(v21, {
        Size = v24.container.size, 
        onActivated = v21.onActivated, 
        selection = {
            Selectable = not v21.isDisabled and v21.Selectable, 
            NextSelectionUp = v21.NextSelectionUp, 
            NextSelectionDown = v21.NextSelectionDown, 
            NextSelectionLeft = v21.NextSelectionLeft, 
            NextSelectionRight = v21.NextSelectionRight
        }, 
        isDisabled = v21.isDisabled, 
        padding = v24.container.padding, 
        cornerRadius = v25, 
        stateLayer = v24.container.stateLayer, 
        cursor = v26, 
        tag = v24.container.tag, 
        GroupTransparency = if v21.isDisabled then v14.DISABLED_TRANSPARENCY else nil, 
        ref = v20
    }), {
        Icon = v4.createElement(v3, {
            name = "x", 
            variant = l_IconVariant_0.Regular, 
            size = v24.content.iconSize, 
            style = v24.content.style
        })
    });
end));