local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(script.Parent.AppPolicyContext);
return function() --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3 = v1.Component:extend("PolicyProvider");
    v3.init = function(v4, v5) --[[ Line: 9 ]] --[[ Name: init ]]
        assert(type(v5.policy) == "table", "Provider expects props.policy to be a table");
        v4.policy = {
            presentationPolicy = v5.policy, 
            staticExternalPolicy = v5.policyData
        };
    end;
    v3.render = function(v6) --[[ Line: 18 ]] --[[ Name: render ]]
        -- upvalues: v1 (ref), v2 (ref)
        return v1.createElement(v2.Provider, {
            value = v6.policy
        }, v6.props[v1.Children]);
    end;
    return v3;
end;