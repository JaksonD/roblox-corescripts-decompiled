local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
return function(v2) --[[ Line: 11 ]] --[[ Name: useTableWrappedCallbackRef ]]
    -- upvalues: v1 (copy)
    local v3 = v1.useRef(nil);
    v1.useImperativeHandle(v2, function() --[[ Line: 19 ]]
        -- upvalues: v3 (copy)
        return v3.current;
    end);
    return v3;
end;