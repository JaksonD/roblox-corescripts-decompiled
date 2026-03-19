local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Constants);
local v4 = require(l_script_FirstAncestor_0.Utility.Flags);
local v5 = require(l_script_FirstAncestor_0.Providers.Style.PresentationContext);
local v6 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v8 = require(l_script_FirstAncestor_0.Components.View);
local v9 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v10 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v11 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v12 = require(script.Parent.Accessory);
local v13 = require(l_script_FirstAncestor_0.Enums.IconPosition);
local v14 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local v15 = require(l_script_FirstAncestor_0.Enums.StateLayerMode);
local _ = require(l_script_FirstAncestor_0.Enums.CursorType);
local v17 = require(l_script_FirstAncestor_0.Enums.ChipSize);
local v18 = require(l_script_FirstAncestor_0.Enums.ChipVariant);
local v19 = require(script.Parent.useChipVariants);
local v20 = {
    isChecked = false, 
    Selectable = true, 
    isDisabled = false, 
    size = v17.Medium, 
    variant = if v4.FoundationAddUtilityVariantToChip then v18.Standard else nil, 
    testId = "--foundation-chip"
};
return v2.memo(v2.forwardRef(function(v21, v22) --[[ Line: 69 ]] --[[ Name: Chip ]]
    -- upvalues: v11 (copy), v20 (copy), v9 (copy), v2 (copy), v13 (copy), v19 (copy), v4 (copy), v8 (copy), v10 (copy), v15 (copy), v3 (copy), v5 (copy), v14 (copy), v12 (copy), v6 (copy)
    local v23 = v11(v21, v20);
    local v24 = v9();
    local v28, v29 = v2.useMemo(function() --[[ Line: 73 ]]
        -- upvalues: v23 (copy), v13 (ref)
        local v25 = nil;
        local v26 = nil;
        if v23.icon == nil then
            return v23.leading, v23.trailing;
        else
            if typeof(v23.icon) == "string" then
                v25 = {
                    iconName = v23.icon
                };
            else
                local v27 = {
                    iconName = v23.icon.name
                };
                if v23.icon.position == v13.Left then
                    v25 = v27;
                else
                    v26 = v27;
                end;
            end;
            return v23.leading or v25, v23.trailing or v26;
        end;
    end, {
        v23.leading, 
        v23.icon, 
        v23.trailing
    });
    local v30 = v19(v24, v23.size, if v4.FoundationAddUtilityVariantToChip then v23.variant else nil, v23.isChecked, v28 ~= nil, v29 ~= nil);
    local v31 = math.floor(v24.Stroke.Thicker);
    return v2.createElement(v8, v10(v23, {
        isDisabled = v23.isDisabled, 
        selection = {
            Selectable = not v23.isDisabled and v23.Selectable, 
            NextSelectionUp = v23.NextSelectionUp, 
            NextSelectionDown = v23.NextSelectionDown, 
            NextSelectionLeft = v23.NextSelectionLeft, 
            NextSelectionRight = v23.NextSelectionRight
        }, 
        onActivated = v23.onActivated, 
        stateLayer = if v23.isChecked then {
            mode = v15.Inverse
        } else nil, 
        backgroundStyle = v30.chip.backgroundStyle, 
        padding = v30.chip.padding, 
        cursor = {
            radius = UDim.new(0, v24.Radius.Circle), 
            offset = v31 * 2, 
            borderWidth = v31
        }, 
        tag = v30.chip.tag, 
        ref = v22, 
        GroupTransparency = if v23.isDisabled then v3.DISABLED_TRANSPARENCY else 0
    }), v2.createElement(v5.Provider, {
        value = {
            colorMode = if v23.isChecked then v14.Inverse else v14.Color, 
            isIconSize = true
        }
    }, {
        Leading = if v28 then v2.createElement(v12, {
            isLeading = true, 
            config = v28, 
            size = v23.size, 
            chipBackgroundStyle = v30.chip.backgroundStyle, 
            contentStyle = v30.text.contentStyle, 
            isDisabled = v23.isDisabled, 
            testId = ("%*--leading-accessory"):format(v23.testId)
        }) else nil, 
        Text = if v23.text and v23.text ~= "" then v2.createElement(v6, {
            Text = v23.text, 
            textStyle = v30.text.contentStyle, 
            LayoutOrder = 2, 
            tag = v30.text.tag, 
            padding = v30.text.padding, 
            testId = ("%*--text"):format(v23.testId)
        }) else nil, 
        Trailing = if v29 then v2.createElement(v12, {
            isLeading = false, 
            config = v29, 
            size = v23.size, 
            chipBackgroundStyle = v30.chip.backgroundStyle, 
            contentStyle = v30.text.contentStyle, 
            isDisabled = v23.isDisabled, 
            testId = ("%*--trailing-accessory"):format(v23.testId)
        }) else nil
    }));
end));