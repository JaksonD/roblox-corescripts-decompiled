local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local l_GetFFlagMigrateRoactUtilsToReactUtils_0 = require(l_Parent_0.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils;
local v2 = require(l_Parent_0.ReactUtils);
if l_GetFFlagMigrateRoactUtilsToReactUtils_0() then
    return v2.usePrevious;
else
    local v3 = require(l_Parent_0.React);
    return function(v4) --[[ Line: 16 ]] --[[ Name: usePrevious ]]
        -- upvalues: v3 (copy)
        local v5 = v3.useRef(nil);
        v3.useEffect(function() --[[ Line: 18 ]]
            -- upvalues: v5 (copy), v4 (copy)
            v5.current = v4;
        end);
        return v5.current;
    end;
end;