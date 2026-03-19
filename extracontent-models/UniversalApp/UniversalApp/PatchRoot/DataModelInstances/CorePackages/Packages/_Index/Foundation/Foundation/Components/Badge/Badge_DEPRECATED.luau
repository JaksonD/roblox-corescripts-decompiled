local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_Parent_0.BuilderIcons);
local v4 = require(l_script_FirstAncestor_0.Components.Icon);
local v5 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v7 = require(l_script_FirstAncestor_0.Components.View);
local v8 = require(script.Parent.useBadgeVariants_DEPRECATED);
local v9 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v10 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v11 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v12 = require(l_script_FirstAncestor_0.Enums.BadgeVariant);
local v13 = require(l_script_FirstAncestor_0.Enums.BadgeSize);
local v14 = require(l_script_FirstAncestor_0.Enums.IconPosition);
local v15 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v16 = {
    variant = v12.Primary, 
    size = v13.Medium, 
    testId = "--foundation-badge"
};
return v2.memo(v2.forwardRef(function(v17, v18) --[[ Line: 47 ]] --[[ Name: Badge ]]
    -- upvalues: v11 (copy), v16 (copy), v9 (copy), v2 (copy), v14 (copy), v8 (copy), v7 (copy), v10 (copy), v4 (copy), v15 (copy), v5 (copy)
    local v19 = v11(v17, v16);
    local v20 = v9();
    local v21 = v2.useMemo(function() --[[ Line: 52 ]]
        -- upvalues: v19 (copy), v14 (ref)
        if typeof(v19.icon) == "string" then
            return {
                name = v19.icon, 
                position = v14.Left
            };
        else
            return v19.icon;
        end;
    end, {
        v19.icon
    });
    local v22 = v21 ~= nil;
    local v23 = false;
    if v19.text ~= nil then
        v23 = #v19.text > 0;
    end;
    local v24, v25, v26, v27, v28 = v8(v19.variant, v19.size, v22, v23);
    return v2.createElement(v7, v10(v19, {
        GroupTransparency = v19.isDisabled and 0.5 or nil, 
        backgroundStyle = v24.backgroundStyle, 
        stroke = {
            Color = v20.Color.Surface.Surface_100.Color3, 
            Transparency = v20.Color.Surface.Surface_100.Transparency
        }, 
        sizeConstraint = v25, 
        tag = v27, 
        ref = v18
    }), {
        Icon = if v21 ~= nil then v2.createElement(v4, {
            name = v21.name, 
            size = v15.Small, 
            style = v24.contentStyle, 
            LayoutOrder = v21.position == v14.Left and 1 or 3, 
            testId = ("%*--icon"):format(v19.testId)
        }) else nil, 
        Text = if v23 then v2.createElement(v5, {
            Text = v19.text, 
            textStyle = v24.contentStyle, 
            fontStyle = {
                LineHeight = 1
            }, 
            RichText = true, 
            LayoutOrder = 2, 
            sizeConstraint = v26, 
            tag = v28, 
            testId = ("%*--text"):format(v19.testId)
        }) else nil
    });
end));