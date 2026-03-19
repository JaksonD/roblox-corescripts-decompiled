local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v3, v4 = v1.useState(v2:getIsLarge());
    v1.useEffect(function() --[[ Line: 7 ]]
        -- upvalues: v2 (copy), v4 (copy), v3 (copy)
        local v5 = v2:connect(function() --[[ Line: 8 ]]
            -- upvalues: v4 (ref), v2 (ref)
            v4(v2:getIsLarge());
        end);
        if v3 ~= v2:getIsLarge() then
            v4(v2:getIsLarge());
        end;
        return function() --[[ Line: 16 ]]
            -- upvalues: v5 (copy)
            v5:disconnect();
        end;
    end, {
        v2
    });
    return v3;
end;