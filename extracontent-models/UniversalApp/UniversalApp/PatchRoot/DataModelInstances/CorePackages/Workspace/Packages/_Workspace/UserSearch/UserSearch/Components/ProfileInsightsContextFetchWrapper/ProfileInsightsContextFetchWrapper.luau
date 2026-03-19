local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.React);
local v3 = require(script.Parent.usePaginatedProfileInsightsFetch);
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
return function(v5) --[[ Line: 17 ]]
    -- upvalues: v3 (copy)
    local v6 = v3({
        users = v5.users or {}, 
        searchKeyword = v5.searchParameters.searchKeyword
    }) or {};
    return v5.renderComponent(v6);
end;