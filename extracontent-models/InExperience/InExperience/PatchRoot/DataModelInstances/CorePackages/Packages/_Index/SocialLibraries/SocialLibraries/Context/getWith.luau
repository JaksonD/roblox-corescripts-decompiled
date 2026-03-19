local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
return function(v2) --[[ Line: 5 ]]
    -- upvalues: l_Roact_0 (copy)
    return function(v3) --[[ Line: 6 ]]
        -- upvalues: l_Roact_0 (ref), v2 (copy)
        assert(type(v3) == "function", "Expect renderCallback to be a function.");
        return l_Roact_0.createElement(v2.Consumer, {
            render = v3
        });
    end;
end;