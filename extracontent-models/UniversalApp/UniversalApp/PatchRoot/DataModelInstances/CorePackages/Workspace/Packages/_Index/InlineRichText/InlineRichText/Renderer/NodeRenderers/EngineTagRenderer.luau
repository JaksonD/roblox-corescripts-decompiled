local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.Types);
return function(v4, v5) --[[ Line: 7 ]]
    -- upvalues: v2 (copy)
    local v6 = {
        name = v4.name, 
        attributes = v4.attributes
    };
    local v7 = v5.processChildren(v4, v5);
    return v2.List.map(v7, function(v8) --[[ Line: 14 ]]
        -- upvalues: v2 (ref), v6 (copy)
        return {
            text = v8.text, 
            engineTags = v2.List.join(v8.engineTags, {
                v6
            })
        };
    end);
end;