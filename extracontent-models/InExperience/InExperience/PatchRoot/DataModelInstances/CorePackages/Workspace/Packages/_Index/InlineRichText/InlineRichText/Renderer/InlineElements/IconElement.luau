local l_Parent_0 = script:FindFirstAncestor("InlineRichText").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.InlineLayout);
local v3 = require(l_Parent_0.Foundation);
local l_RenderableInlineElement_0 = v2.Components.InlineLayoutElements.RenderableInlineElement;
local l_Icon_0 = v3.Icon;
local v6 = {};
local function v8(v7) --[[ Line: 13 ]] --[[ Name: mapProps ]]
    -- upvalues: v1 (copy)
    return v1.Dictionary.omit(v7, "id", "Size");
end;
v6.new = function(v9) --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: l_RenderableInlineElement_0 (copy), l_Icon_0 (copy), v1 (copy), v8 (copy)
    return l_RenderableInlineElement_0.new(l_Icon_0, v1.Dictionary.join(v9, {
        Size = UDim2.fromOffset(v9.size, v9.size)
    }), v8);
end;
return v6;