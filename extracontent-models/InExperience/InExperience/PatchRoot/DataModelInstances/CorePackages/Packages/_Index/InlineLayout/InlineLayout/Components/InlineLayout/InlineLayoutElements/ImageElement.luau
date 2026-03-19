local l_Parent_0 = script:FindFirstAncestor("Components").Parent.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineLayoutElements");
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.RenderableInlineElement);
local l_Image_0 = v2.Image;
local v6 = {};
local function v8(v7) --[[ Line: 13 ]] --[[ Name: mapProps ]]
    -- upvalues: v3 (copy)
    return v3.omit(v7, {
        "id"
    });
end;
v6.new = function(v9) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), l_Image_0 (copy), v8 (copy)
    return v4.new(l_Image_0, v9, v8);
end;
return v6;