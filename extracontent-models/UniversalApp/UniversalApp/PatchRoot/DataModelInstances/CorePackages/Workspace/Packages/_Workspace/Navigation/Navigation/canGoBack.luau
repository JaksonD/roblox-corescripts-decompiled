local l_Parent_0 = script:FindFirstAncestor("Navigation").Parent;
local l_Actions_0 = require(l_Parent_0.RoactNavigation).Actions;
local _ = require(script.Parent.types);
local v3 = require(script.Parent.getRootNavigation);
return function(v4) --[[ Line: 11 ]] --[[ Name: canGoBack ]]
    -- upvalues: v3 (copy), l_Actions_0 (copy)
    local v5 = v3(v4);
    local l_state_0 = v5.state;
    return l_state_0 ~= v5.router.getStateForAction(l_Actions_0.back({
        key = false
    }), l_state_0);
end;