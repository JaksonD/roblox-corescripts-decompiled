local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Service.ChromeUtils);
return function(v4, v5) --[[ Line: 11 ]]
    -- upvalues: v2 (copy)
    if not v4 then
        warn("observableValue undefined");
        return nil;
    else
        local v6, v7 = v2.useState(v5(v4:get()));
        v2.useEffect(function() --[[ Line: 18 ]]
            -- upvalues: v4 (copy), v7 (copy), v5 (copy), v6 (copy)
            local v8 = v4:connect(function() --[[ Line: 19 ]]
                -- upvalues: v7 (ref), v5 (ref), v4 (ref)
                v7(v5(v4:get()));
            end);
            local v9 = v5(v4:get());
            if v6 ~= v9 then
                v7(v9);
            end;
            return function() --[[ Line: 28 ]]
                -- upvalues: v8 (copy)
                v8:disconnect();
            end;
        end, {
            v4
        });
        return v6;
    end;
end;