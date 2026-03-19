local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Thunks.FetchIXPUserInit);
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local v4 = require(l_Modules_0.LuaApp.Promise);
return function(v5, v6, v7) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), l_RetrievalStatus_0 (copy), v4 (copy)
    return function(v8) --[[ Line: 8 ]]
        -- upvalues: v2 (ref), v6 (copy), v5 (copy), l_RetrievalStatus_0 (ref), v4 (ref), v7 (copy)
        local v9 = v2.GetFetchingStatus(v8:getState(), v6, v5);
        if v9 == l_RetrievalStatus_0.Done or v9 == l_RetrievalStatus_0.Failed then
            return v4.resolve();
        else
            return v4.new(function(v10, _) --[[ Line: 14 ]]
                -- upvalues: v8 (copy), v2 (ref), v5 (ref), v6 (ref), v7 (ref)
                v8:dispatch(v2.Fetch(v5, v6, v7)):andThen(function() --[[ Line: 15 ]]
                    -- upvalues: v10 (copy)
                    v10();
                end, function() --[[ Line: 17 ]]
                    -- upvalues: v10 (copy)
                    v10();
                end);
            end);
        end;
    end;
end;