local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v3 = require(l_Modules_0.LuaApp.Http.Requests.GetRobuxBadge);
local v4 = require(l_Modules_0.LuaApp.Promise);
return function(v5) --[[ Line: 9 ]]
    -- upvalues: l_PerformFetch_0 (copy), v3 (copy), v4 (copy)
    return l_PerformFetch_0.Single("FetchRobuxBadge", function(_) --[[ Line: 10 ]]
        -- upvalues: v3 (ref), v5 (copy), v4 (ref)
        return v3(v5):andThen(function(v7) --[[ Line: 11 ]]
            -- upvalues: v4 (ref)
            if not v7 then
                return v4.resolve();
            else
                local v8 = v7[1];
                return v4.resolve(v8);
            end;
        end, function(_) --[[ Line: 17 ]]
            -- upvalues: v4 (ref)
            return v4.resolve();
        end);
    end);
end;