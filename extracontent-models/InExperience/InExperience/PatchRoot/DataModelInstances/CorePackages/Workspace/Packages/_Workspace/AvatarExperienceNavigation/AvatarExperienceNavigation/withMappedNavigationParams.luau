local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceNavigation").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.ReactIs);
return function(v5, v6) --[[ Line: 12 ]] --[[ Name: withMappedNavigationParams ]]
    -- upvalues: v3 (copy), v4 (copy), v1 (copy), v2 (copy)
    v3.assert(v4.isValidElementType(v5), "withMappedNavigationParams must be called with a Roact component (stateful or functional)");
    local v7 = v6 or {};
    if v7.forwardRef == nil then
        v7.forwardRef = true;
    end;
    return function(v8) --[[ Line: 23 ]]
        -- upvalues: v1 (ref), v5 (copy), v2 (ref), v7 (copy)
        local v9 = v8.navigation.state.params or {};
        return v1.createElement(v5, v2.Dictionary.join(v8, v9, {
            [v1.Ref] = v7.forwardRef and v8[v1.Ref] or v2.None
        }));
    end;
end;