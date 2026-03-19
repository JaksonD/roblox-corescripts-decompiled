local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.React);
return function(v2) --[[ Line: 17 ]] --[[ Name: ProviderContainer ]]
    -- upvalues: v1 (copy)
    local v3 = v2.providers or {};
    local l_children_0 = v2.children;
    local v5 = {
        PageWrapper = v1.createElement("Folder", {}, l_children_0)
    };
    for v6 = #v3, 1, -1 do
        local v7 = v3[v6];
        v5 = {
            ProviderChildren = v1.createElement(v7.class, v7.props, v5)
        };
    end;
    return v1.createElement("Folder", nil, v5);
end;