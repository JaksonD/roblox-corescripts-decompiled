local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.BuilderIcons);
local v3 = require(l_Parent_0.React);
local l_uiblox_0 = v2.Migration.uiblox;
local v5 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v6 = require(l_script_FirstAncestor_0.Enums.FillBehavior);
local _ = require(l_script_FirstAncestor_0.Enums.IconSize);
local v8 = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local _ = require(l_script_FirstAncestor_0.Enums.Radius);
local v10 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local l_usePresentationContext_0 = require(l_script_FirstAncestor_0.Providers.Style.PresentationContext).usePresentationContext;
local v12 = require(l_script_FirstAncestor_0.Utility.getIconScale);
local v13 = require(l_script_FirstAncestor_0.Utility.iconMigrationUtils);
local v14 = require(l_script_FirstAncestor_0.Utility.isBuilderIcon);
local v15 = require(script.Parent.useIconButtonVariants);
local v16 = require(l_script_FirstAncestor_0.Utility.useIconSize);
local v17 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v18 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local l_isMigrated_0 = v13.isMigrated;
local l_isBuilderOrMigratedIcon_0 = v13.isBuilderOrMigratedIcon;
local v21 = require(l_script_FirstAncestor_0.Constants);
local v22 = require(l_script_FirstAncestor_0.Components.Image);
local v23 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v25 = require(l_script_FirstAncestor_0.Components.View);
local v26 = {
    isDisabled = false, 
    size = v5.Medium, 
    width = UDim.new(0, 0), 
    isCircular = false, 
    variant = v8.Utility, 
    testId = "--foundation-icon-button"
};
return v3.memo(v3.forwardRef(function(v27, v28) --[[ Line: 79 ]] --[[ Name: IconButton ]]
    -- upvalues: v18 (copy), v26 (copy), v10 (copy), l_usePresentationContext_0 (copy), l_isBuilderOrMigratedIcon_0 (copy), v12 (copy), v15 (copy), v16 (copy), v14 (copy), v3 (copy), v6 (copy), v25 (copy), v17 (copy), v21 (copy), v23 (copy), l_isMigrated_0 (copy), l_uiblox_0 (copy), v2 (copy), v22 (copy)
    local v29 = v18(v27, v26);
    local v30 = v10();
    local v31 = l_usePresentationContext_0();
    local v32 = if typeof(v29.icon) == "table" then v29.icon.name else v29.icon;
    local v33 = if typeof(v29.icon) == "table" then v29.icon.variant else nil;
    local v34 = nil;
    local v35 = nil;
    if l_isBuilderOrMigratedIcon_0(v32) then
        v34 = nil;
        v35 = 1;
    else
        local v36, v37 = v12(v32, v29.size);
        v34 = v36;
        v35 = v37;
    end;
    local v38 = v15(v30, v29.size, v29.variant, if v31 then v31.colorMode else nil);
    local l_size_0 = v38.container.size;
    local v40 = if v29.isCircular then UDim.new(0, v30.Radius.Circle) else UDim.new(0, v38.container.radius or v30.Radius.Large);
    local v41 = v16(v29.size, v14(v32), true);
    local v42 = v3.useMemo(function() --[[ Line: 111 ]]
        -- upvalues: v40 (copy), v30 (copy)
        return {
            radius = v40, 
            offset = v30.Size.Size_150, 
            borderWidth = v30.Stroke.Thicker
        };
    end, {
        v30, 
        v40
    });
    local v43 = v29.fillBehavior == v6.Fill;
    local v44 = true;
    if v29.width.Scale == 0 then
        v44 = v29.width.Offset ~= 0;
    end;
    local v45 = if v43 then UDim.new(1, 0) else if v44 then v29.width else l_size_0.X;
    return v3.createElement(v25, v17(v29, {
        onActivated = v29.onActivated, 
        Size = UDim2.new(v45, UDim.new(0, l_size_0.Y.Offset)), 
        flexItem = if v29.fillBehavior then {
            FlexMode = if v29.fillBehavior == v6.Fill then Enum.UIFlexMode.Fill else Enum.UIFlexMode.Shrink
        } else nil, 
        selection = {
            Selectable = not v29.isDisabled and v29.Selectable, 
            NextSelectionUp = v29.NextSelectionUp, 
            NextSelectionDown = v29.NextSelectionDown, 
            NextSelectionLeft = v29.NextSelectionLeft, 
            NextSelectionRight = v29.NextSelectionRight
        }, 
        isDisabled = v29.isDisabled, 
        stateLayer = v38.container.stateLayer, 
        padding = v38.container.padding, 
        cornerRadius = v40, 
        backgroundStyle = v38.container.style, 
        stroke = v38.container.stroke, 
        cursor = v42, 
        GroupTransparency = if v29.isDisabled then v21.DISABLED_TRANSPARENCY else nil, 
        ref = v28
    }), {
        Icon = if l_isBuilderOrMigratedIcon_0(v32) then v3.createElement(v23, {
            Text = if l_isMigrated_0(v32) then l_uiblox_0[v32].name else v32, 
            fontStyle = {
                Font = v2.Font[if l_isMigrated_0(v32) then l_uiblox_0[v32].variant else v33 or v2.IconVariant.Regular], 
                FontSize = v41.Y.Offset
            }, 
            tag = "anchor-center-center position-center-center", 
            Size = v41, 
            textStyle = v38.content.style, 
            testId = ("%*--icon"):format(v29.testId)
        }) else v3.createElement(v22, {
            tag = "anchor-center-center position-center-center", 
            Image = v32, 
            Size = if v34 then UDim2.fromOffset(v34.X, v34.Y) else v41, 
            imageStyle = v38.content.style, 
            scale = v35, 
            testId = ("%*--image"):format(v29.testId)
        })
    });
end));