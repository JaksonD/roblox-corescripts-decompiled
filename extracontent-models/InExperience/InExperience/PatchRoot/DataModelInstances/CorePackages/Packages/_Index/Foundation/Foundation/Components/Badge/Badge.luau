local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_uiblox_0 = require(l_Parent_0.BuilderIcons).Migration.uiblox;
local v4 = require(l_script_FirstAncestor_0.Components.Icon);
local v5 = require(l_script_FirstAncestor_0.Components.Image);
local v6 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v8 = require(l_script_FirstAncestor_0.Components.View);
local v9 = require(l_script_FirstAncestor_0.Utility.getIconScale);
local v10 = require(l_script_FirstAncestor_0.Utility.iconMigrationUtils);
local v11 = require(script.Parent.useBadgeVariants);
local v12 = require(l_script_FirstAncestor_0.Utility.useIconSize);
local v13 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v14 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v15 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local l_isMigrated_0 = v10.isMigrated;
local l_isBuilderOrMigratedIcon_0 = v10.isBuilderOrMigratedIcon;
local v18 = require(l_script_FirstAncestor_0.Enums.BadgeVariant);
local _ = require(l_script_FirstAncestor_0.Enums.BadgeSize);
local v20 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v21 = require(l_script_FirstAncestor_0.Enums.IconPosition);
local v22 = {
    variant = v18.Contrast, 
    testId = "--foundation-badge"
};
local v23 = {
    [v18.Primary] = v18.Contrast, 
    [v18.Secondary] = v18.Neutral
};
return v2.memo(v2.forwardRef(function(v24, v25) --[[ Line: 62 ]] --[[ Name: Badge ]]
    -- upvalues: v15 (copy), v22 (copy), v23 (copy), v13 (copy), v20 (copy), v12 (copy), v2 (copy), v21 (copy), v11 (copy), l_isBuilderOrMigratedIcon_0 (copy), v4 (copy), l_isMigrated_0 (copy), l_uiblox_0 (copy), v9 (copy), v8 (copy), v5 (copy), v14 (copy), v6 (copy)
    local v26 = v15(v24, v22);
    local v27 = v23[v26.variant] or v26.variant;
    local v28 = v13();
    local l_XSmall_0 = v20.XSmall;
    local v30 = v12(l_XSmall_0, true);
    local v31 = v2.useMemo(function() --[[ Line: 71 ]]
        -- upvalues: v26 (copy), v21 (ref)
        if typeof(v26.icon) == "string" then
            return {
                name = v26.icon, 
                position = v21.Left
            };
        else
            return v26.icon;
        end;
    end, {
        v26.icon
    });
    local v32 = false;
    if v26.text ~= nil then
        v32 = #v26.text > 0;
    end;
    local v33 = not v32;
    local v34 = v11(v28, v27, v33);
    local v35 = nil;
    if v31 ~= nil then
        local v36 = v31.position == v21.Left and 1 or 3;
        if l_isBuilderOrMigratedIcon_0(v31.name) then
            v35 = v2.createElement(v4, {
                name = if l_isMigrated_0(v31.name) then l_uiblox_0[v31.name].name else v31.name, 
                variant = if l_isMigrated_0(v31.name) then l_uiblox_0[v31.name].variant else v31.variant, 
                size = l_XSmall_0, 
                style = v34.content.style, 
                LayoutOrder = v36, 
                testId = ("%*--icon"):format(v26.testId)
            });
        else
            local v37, v38 = v9(v31.name, v20.XSmall);
            if v37 then
                v35 = v2.createElement(v8, {
                    Size = v30
                }, v2.createElement(v5, {
                    Image = v31.name, 
                    Size = UDim2.fromOffset(v37.X, v37.Y), 
                    imageStyle = v34.content.style, 
                    scale = v38, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    LayoutOrder = v36, 
                    testId = ("%*--icon"):format(v26.testId)
                }));
            end;
        end;
    end;
    return v2.createElement(v8, v14(v26, {
        backgroundStyle = v34.container.backgroundStyle, 
        stroke = v34.container.stroke, 
        tag = v34.container.tag, 
        ref = v25
    }), {
        Icon = v35, 
        Text = if v32 then v2.createElement(v6, {
            Text = v26.text, 
            textStyle = v34.content.style, 
            RichText = true, 
            LayoutOrder = 2, 
            tag = v34.text.tag, 
            testId = ("%*--text"):format(v26.testId)
        }) else nil
    });
end));