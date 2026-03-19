local l_Parent_0 = script:FindFirstAncestor("Components").Parent.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineLayoutElements");
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.BaseTextElement);
local l_Text_0 = v3.Text;
local v6 = {};
mapProps = function(v7) --[[ Line: 17 ]] --[[ Name: mapProps ]]
    -- upvalues: v2 (copy)
    return v2.omit(v7, {
        "id", 
        "EngineTags"
    });
end;
v6.new = function(v8) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), l_Text_0 (copy)
    return v4.new(l_Text_0, v8, mapProps);
end;
return v6;