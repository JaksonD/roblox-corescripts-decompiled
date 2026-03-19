local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.BuilderIcons);
local v3 = require(l_Parent_0.React);
local l_uiblox_0 = v2.Migration.uiblox;
local v5 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v6 = require(l_script_FirstAncestor_0.Enums.FillBehavior);
local _ = require(l_script_FirstAncestor_0.Enums.IconSize);
local v8 = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local v9 = require(l_script_FirstAncestor_0.Utility.Flags);
local _ = require(l_script_FirstAncestor_0.Enums.Radius);
local v11 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local l_usePresentationContext_0 = require(l_script_FirstAncestor_0.Providers.Style.PresentationContext).usePresentationContext;
local v13 = require(l_script_FirstAncestor_0.Utility.getIconScale);
local v14 = require(l_script_FirstAncestor_0.Utility.iconMigrationUtils);
local v15 = require(l_script_FirstAncestor_0.Utility.isBuilderIcon);
local v16 = require(script.Parent.useIconButtonVariants);
local v17 = require(l_script_FirstAncestor_0.Utility.useIconSize);
local v18 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v19 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local l_isMigrated_0 = v14.isMigrated;
local l_isBuilderOrMigratedIcon_0 = v14.isBuilderOrMigratedIcon;
local v22 = require(l_script_FirstAncestor_0.Constants);
local v23 = require(l_script_FirstAncestor_0.Components.Image);
local v24 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v26 = require(l_script_FirstAncestor_0.Components.View);
local v27 = {
    isDisabled = false, 
    size = v5.Medium, 
    width = UDim.new(0, 0), 
    isCircular = false, 
    variant = v8.Utility, 
    testId = "--foundation-icon-button"
};
return v3.memo(v3.forwardRef(function(v28, v29) --[[ Line: 81 ]] --[[ Name: IconButton ]]
    -- upvalues: v19 (copy), v27 (copy), v11 (copy), l_usePresentationContext_0 (copy), l_isBuilderOrMigratedIcon_0 (copy), v13 (copy), v16 (copy), v17 (copy), v15 (copy), v3 (copy), v9 (copy), v6 (copy), v26 (copy), v18 (copy), v22 (copy), v24 (copy), l_isMigrated_0 (copy), l_uiblox_0 (copy), v2 (copy), v23 (copy)
    local v30 = v19(v28, v27);
    local v31 = v11();
    local v32 = l_usePresentationContext_0();
    local v33 = if typeof(v30.icon) == "table" then v30.icon.name else v30.icon;
    local v34 = if typeof(v30.icon) == "table" then v30.icon.variant else nil;
    local v35 = nil;
    local v36 = nil;
    if l_isBuilderOrMigratedIcon_0(v33) then
        v35 = nil;
        v36 = 1;
    else
        local v37, v38 = v13(v33, v30.size);
        v35 = v37;
        v36 = v38;
    end;
    local v39 = v16(v31, v30.size, v30.variant, if v32 then v32.colorMode else nil);
    local l_size_0 = v39.container.size;
    local v41 = if v30.isCircular then UDim.new(0, v31.Radius.Circle) else UDim.new(0, v39.container.radius or v31.Radius.Large);
    local v42 = v17(v30.size, v15(v33), true);
    local v43 = v3.useMemo(function() --[[ Line: 113 ]]
        -- upvalues: v41 (copy), v31 (copy)
        return {
            radius = v41, 
            offset = v31.Size.Size_150, 
            borderWidth = v31.Stroke.Thicker
        };
    end, {
        v31, 
        v41
    });
    local v44 = v9.FoundationIconButtonFillBehavior and v30.fillBehavior == v6.Fill;
    local v45 = nil;
    if v9.FoundationIconButtonWidth then
        local v46 = true;
        if v30.width.Scale == 0 then
            v46 = v30.width.Offset ~= 0;
        end;
        v45 = if v44 then UDim.new(1, 0) else if v46 then v30.width else l_size_0.X;
    else
        v45 = if v44 then UDim.new(1, 0) else l_size_0.X;
    end;
    return v3.createElement(v26, v18(v30, {
        onActivated = v30.onActivated, 
        Size = UDim2.new(v45, UDim.new(0, l_size_0.Y.Offset)), 
        flexItem = if v30.fillBehavior and v9.FoundationIconButtonFillBehavior then {
            FlexMode = if v30.fillBehavior == v6.Fill then Enum.UIFlexMode.Fill else Enum.UIFlexMode.Shrink
        } else nil, 
        selection = {
            Selectable = not v30.isDisabled and v30.Selectable, 
            NextSelectionUp = v30.NextSelectionUp, 
            NextSelectionDown = v30.NextSelectionDown, 
            NextSelectionLeft = v30.NextSelectionLeft, 
            NextSelectionRight = v30.NextSelectionRight
        }, 
        isDisabled = v30.isDisabled, 
        stateLayer = v39.container.stateLayer, 
        padding = v39.container.padding, 
        cornerRadius = v41, 
        backgroundStyle = v39.container.style, 
        stroke = v39.container.stroke, 
        cursor = v43, 
        GroupTransparency = if v30.isDisabled then v22.DISABLED_TRANSPARENCY else nil, 
        ref = v29
    }), {
        Icon = if l_isBuilderOrMigratedIcon_0(v33) then v3.createElement(v24, {
            Text = if l_isMigrated_0(v33) then l_uiblox_0[v33].name else v33, 
            fontStyle = {
                Font = v2.Font[if l_isMigrated_0(v33) then l_uiblox_0[v33].variant else v34 or v2.IconVariant.Regular], 
                FontSize = v42.Y.Offset
            }, 
            tag = "anchor-center-center position-center-center", 
            Size = v42, 
            textStyle = v39.content.style, 
            testId = ("%*--icon"):format(v30.testId)
        }) else v3.createElement(v23, {
            tag = "anchor-center-center position-center-center", 
            Image = v33, 
            Size = if v35 then UDim2.fromOffset(v35.X, v35.Y) else v42, 
            imageStyle = v39.content.style, 
            scale = v36, 
            testId = ("%*--image"):format(v30.testId)
        })
    });
end));