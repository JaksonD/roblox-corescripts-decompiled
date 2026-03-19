local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.DiscoveryClientAppStorage);
return function(v5, v6, v7) --[[ Line: 20 ]] --[[ Name: makeDiscoveryNetworkCallWithCacheFallback ]]
    -- upvalues: v4 (copy), v3 (copy)
    return v5:andThen(function(v8) --[[ Line: 26 ]]
        return v8;
    end):catch(function(v9) --[[ Line: 29 ]]
        -- upvalues: v4 (ref), v6 (copy), v7 (copy), v3 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 30 ]]
            -- upvalues: v4 (ref), v6 (ref), v7 (ref)
            return v4.getJsonStorageData(v6, v7);
        end);
        if not l_status_0 then
            return v3.reject(l_result_0);
        elseif l_result_0 then
            return v3.resolve({
                responseBody = l_result_0, 
                isFromCache = true
            });
        else
            return v3.reject(v9);
        end;
    end);
end;