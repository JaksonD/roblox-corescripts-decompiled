local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Service.ChromeUtils);
return function(v4) --[[ Line: 7 ]]
    -- upvalues: v2 (copy)
    if not v4 then
        warn("observableValue undefined");
        return nil;
    else
        local v5, v6 = v2.useState(v4:get());
        v2.useEffect(function() --[[ Line: 14 ]]
            -- upvalues: v4 (copy), v6 (copy), v5 (copy)
            local v7 = v4:connect(function() --[[ Line: 15 ]]
                -- upvalues: v6 (ref), v4 (ref)
                v6(v4:get());
            end);
            if v5 ~= v4:get() then
                v6(v4:get());
            end;
            return function() --[[ Line: 23 ]]
                -- upvalues: v7 (copy)
                v7:disconnect();
            end;
        end, {
            v4
        });
        return v5;
    end;
end;