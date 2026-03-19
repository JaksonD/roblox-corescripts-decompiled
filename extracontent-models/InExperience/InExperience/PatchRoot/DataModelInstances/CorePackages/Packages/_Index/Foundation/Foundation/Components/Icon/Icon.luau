local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.BuilderIcons);
local l_Font_0 = v3.Font;
local l_IconVariant_0 = v3.IconVariant;
local v6 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v7 = require(l_script_FirstAncestor_0.Components.Image);
local v8 = require(l_script_FirstAncestor_0.Components.Text);
local v9 = require(l_script_FirstAncestor_0.Utility.Logger);
local v10 = require(l_script_FirstAncestor_0.Utility.isBuilderIcon);
local v11 = require(script.Parent.migrateFontSize);
local v12 = require(script.Parent.migrateIconName);
local v13 = require(l_script_FirstAncestor_0.Utility.useIconSize);
local v14 = require(l_script_FirstAncestor_0.Providers.Style.useTextSizeOffset);
local v15 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v16 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v17 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v19 = {
    size = v6.Medium, 
    variant = l_IconVariant_0.Regular, 
    testId = "--foundation-icon"
};
return v2.memo(v2.forwardRef(function(v20, v21) --[[ Line: 46 ]] --[[ Name: Icon ]]
    -- upvalues: v17 (copy), v19 (copy), v15 (copy), v14 (copy), v12 (copy), v13 (copy), v10 (copy), v11 (copy), v9 (copy), v2 (copy), v7 (copy), v16 (copy), v8 (copy), l_Font_0 (copy)
    local v22 = v17(v20, v19);
    local v23 = v15();
    local v24 = v14();
    local v25 = v12(v22.name);
    local v26 = v13(v22.size, v10(v22.name));
    local l_variant_0 = v22.variant;
    local l_name_0 = v22.name;
    local v29 = if typeof(v26) == "table" then nil else v26.Y.Offset;
    if not v10(l_name_0) and v25 then
        if typeof(v26) == "table" then
            error("Binding size isn't supported when migrating a UIBlox icon, use Builder Icons directly");
        end;
        l_variant_0 = v25.variant or l_variant_0;
        l_name_0 = v25.name;
        v29 = v11(v29, v23);
    end;
    local v30 = v22.style or v23.Color.Content.Default;
    if not v10(l_name_0) and not v25 then
        if v20.variant ~= nil then
            v9:warning("variant is not supported when using FoundationImages, consider using BuilderIcons");
        end;
        return (v2.createElement(v7, v16(v22, {
            imageStyle = v30, 
            Image = l_name_0, 
            Size = v26, 
            ref = v21, 
            Rotation = v22.Rotation
        }), v22.children));
    else
        return v2.createElement(v8, v16(v22, {
            textStyle = v30, 
            Text = l_name_0, 
            fontStyle = {
                Font = l_Font_0[l_variant_0], 
                FontSize = v29
            }, 
            TextScaled = typeof(v26) == "table", 
            Size = v26, 
            ref = v21, 
            Rotation = v22.Rotation
        }), {
            UITextSizeConstraint = if v24 > 0 and v29 then v2.createElement("UITextSizeConstraint", {
                MaxTextSize = v29
            }) else nil, 
            Children = v2.createElement(v2.Fragment, nil, v22.children)
        });
    end;
end));