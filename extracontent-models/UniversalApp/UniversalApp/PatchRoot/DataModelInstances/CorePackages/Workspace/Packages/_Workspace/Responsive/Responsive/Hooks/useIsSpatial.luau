local l_Parent_0 = script:FindFirstAncestor("Responsive").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.AppCommonLib);
return function() --[[ Line: 5 ]] --[[ Name: useIsSpatial ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3, v4 = v1.useState(v2.isSpatial);
    v1.useEffect(function() --[[ Line: 7 ]]
        -- upvalues: v4 (copy), v2 (ref)
        v4(v2.isSpatial());
        local v6 = v2.connectToIsSpatialChanged(function(v5) --[[ Line: 9 ]]
            -- upvalues: v4 (ref)
            v4(v5);
        end);
        return function() --[[ Line: 12 ]]
            -- upvalues: v6 (copy)
            v6:Disconnect();
        end;
    end, {});
    return v3;
end;