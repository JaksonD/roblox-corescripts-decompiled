local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local l_isBuilderIcon_0 = v2.Utility.isBuilderIcon;
local v5 = require(l_script_FirstAncestor_0.Renderer.InlineElements.IconElement);
local _ = require(l_script_FirstAncestor_0.Types);
return function(v7, v8) --[[ Line: 12 ]]
    -- upvalues: v3 (copy), l_isBuilderIcon_0 (copy), v5 (copy)
    local l_name_0 = v7.attributes.name;
    if not l_name_0 then
        v3:warning("IconRenderer: No name provided for icon");
        return {};
    elseif not l_isBuilderIcon_0(l_name_0) then
        v3:warning((("IconRenderer: Icon %* is not a builder icon. You must provide a Foundation builder icon name."):format(l_name_0)));
        return {};
    else
        return {
            v5.new({
                name = l_name_0, 
                size = tonumber(v7.attributes.size) or v8.styles.fontStyle.FontSize or 18
            })
        };
    end;
end;