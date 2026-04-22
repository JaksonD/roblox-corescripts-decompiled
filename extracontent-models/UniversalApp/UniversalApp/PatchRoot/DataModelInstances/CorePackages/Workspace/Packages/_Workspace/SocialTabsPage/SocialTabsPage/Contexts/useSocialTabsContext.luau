local l_Parent_0 = script:FindFirstAncestor("SocialTabsPage").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.SocialTabsContext);
return function() --[[ Line: 7 ]] --[[ Name: useSocialTabsContext ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3 = v1.useContext(v2);
    assert(v3 ~= nil, "useSocialTabsContext must be used within a SocialTabsContext.Provider");
    return v3;
end;