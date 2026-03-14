local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigation").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(script.Parent.useNavigationProps);
local _ = require(script.Parent.types);
return function(v5) --[[ Line: 12 ]] --[[ Name: withNavigationProps ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return function(v6) --[[ Line: 13 ]]
        -- upvalues: v1 (ref), v2 (ref), v3 (ref), v5 (copy)
        return function(v7) --[[ Line: 14 ]]
            -- upvalues: v1 (ref), v6 (copy), v2 (ref), v3 (ref), v5 (ref)
            return v1.createElement(v6, v2.Dictionary.join(v7, v3(v5)));
        end;
    end;
end;