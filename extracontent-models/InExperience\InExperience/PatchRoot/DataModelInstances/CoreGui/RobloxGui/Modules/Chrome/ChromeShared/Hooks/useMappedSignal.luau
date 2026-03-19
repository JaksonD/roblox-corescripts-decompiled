local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Service.ChromeUtils);
return function(v4) --[[ Line: 11 ]]
    -- upvalues: v2 (copy)
    local v5, v6 = v2.useState(v4:get());
    v2.useEffect(function() --[[ Line: 13 ]]
        -- upvalues: v4 (copy), v6 (copy), v5 (copy)
        local v8 = v4:connect(function(v7) --[[ Line: 14 ]]
            -- upvalues: v6 (ref)
            v6(v7);
        end);
        if v5 ~= v4:get() then
            v6(v4:get());
        end;
        return function() --[[ Line: 24 ]]
            -- upvalues: v8 (copy)
            v8:disconnect();
        end;
    end, {
        v4
    });
    return v5;
end;