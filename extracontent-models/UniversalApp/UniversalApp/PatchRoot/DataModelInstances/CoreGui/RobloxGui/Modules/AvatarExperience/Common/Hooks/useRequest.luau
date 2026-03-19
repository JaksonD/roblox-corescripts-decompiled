local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Packages.LuauPolyfill);
local v2 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Common.Enum.RequestStatusEnum);
local v5 = require(l_CorePackages_0.Packages.Promise);
return function(v6) --[[ Line: 24 ]] --[[ Name: useRequest ]]
    -- upvalues: v2 (copy), v4 (copy), v5 (copy)
    local v7, v8 = v2.useState({
        status = v4.None
    });
    local v9 = v2.createRef();
    return v7, (v2.useCallback(function() --[[ Line: 28 ]]
        -- upvalues: v9 (copy), v5 (ref), v8 (copy), v4 (ref), v6 (copy)
        if v9.current then
            return v5.resolve();
        else
            v8({
                status = v4.Pending
            });
            v9.current = true;
            return v6():andThen(function(v10) --[[ Line: 36 ]]
                -- upvalues: v8 (ref), v4 (ref), v9 (ref)
                v8({
                    status = v4.Resolved, 
                    response = v10
                });
                v9.current = false;
            end, function(v11) --[[ Line: 39 ]]
                -- upvalues: v8 (ref), v4 (ref), v9 (ref)
                v8({
                    status = v4.Rejected, 
                    response = v11
                });
                v9.current = false;
            end);
        end;
    end, {
        v6, 
        v9.current
    }));
end;