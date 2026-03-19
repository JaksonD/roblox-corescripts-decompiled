local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactOtter);
return function(v3, v4, v5) --[[ Line: 7 ]] --[[ Name: useAnimateFullscreen ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v6 = v4 ~= nil;
    local v7 = v3 and v6 and 0 or 1;
    local v8, v9 = v1.useState(v7);
    local v10, v11 = v1.useState(false);
    local v12 = v1.useCallback(function() --[[ Line: 17 ]]
        -- upvalues: v11 (copy)
        v11(false);
    end, {});
    local v13, v14 = v2.useAnimatedBinding(v7, v12);
    v1.useEffect(function() --[[ Line: 23 ]]
        -- upvalues: v7 (copy), v8 (copy), v9 (copy), v11 (copy), v14 (copy), v2 (ref), v5 (copy)
        if v7 == v8 then
            return nil;
        else
            v9(v7);
            v11(true);
            v14(v2.spring(v7, v5));
            return nil;
        end;
    end, {
        v7, 
        v8, 
        v5
    });
    return (not not v10 or v3) and v6, v13;
end;