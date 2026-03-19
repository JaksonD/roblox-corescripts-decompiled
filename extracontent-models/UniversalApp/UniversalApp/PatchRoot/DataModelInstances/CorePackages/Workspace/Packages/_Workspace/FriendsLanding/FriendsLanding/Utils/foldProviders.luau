local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
return function(v2, v3) --[[ Line: 6 ]]
    -- upvalues: l_Roact_0 (copy)
    local l_v2_0 = v2;
    for _, v6 in v3 do
        l_v2_0 = l_Roact_0.createElement(v6[1], v6[2], {
            l_v2_0
        });
    end;
    return l_v2_0;
end;