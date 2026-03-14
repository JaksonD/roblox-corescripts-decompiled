local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
return function(v2, v3) --[[ Line: 5 ]] --[[ Name: new ]]
    -- upvalues: l_Roact_0 (copy)
    v3 = v3 or {};
    local v4 = {
        blockLayout = v2
    };
    for v5, v6 in ipairs(v3) do
        local l_size_0 = v6.size;
        local l_element_0 = v6.element;
        v4[v5 .. "-block"] = l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = l_size_0, 
            LayoutOrder = v5
        }, {
            child = l_element_0
        });
    end;
    return v4;
end;