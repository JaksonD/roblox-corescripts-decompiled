local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Service.ChromeUtils);
return function(v4, v5) --[[ Line: 7 ]]
    -- upvalues: v2 (copy)
    if not v4 then
        warn("observableValue undefined");
        return v2.useBinding(nil);
    else
        local v6 = nil;
        v6 = v5 or function(v7) --[[ Line: 17 ]]
            return v7;
        end;
        local v8, v9 = v2.useBinding(v6(v4:get()));
        v2.useEffect(function() --[[ Line: 24 ]]
            -- upvalues: v4 (copy), v9 (copy), v6 (ref)
            local v10 = v4:connect(function() --[[ Line: 25 ]]
                -- upvalues: v9 (ref), v6 (ref), v4 (ref)
                v9(v6(v4:get()));
            end);
            v9(v6(v4:get()));
            return function() --[[ Line: 31 ]]
                -- upvalues: v10 (copy)
                v10:disconnect();
            end;
        end, {
            v4
        });
        return v8;
    end;
end;