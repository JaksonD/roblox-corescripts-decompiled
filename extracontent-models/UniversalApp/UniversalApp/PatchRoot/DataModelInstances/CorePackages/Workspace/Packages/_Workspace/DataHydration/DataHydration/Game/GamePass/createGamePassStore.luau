local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.DiscoveryUtils);
local l_logResponseError_0 = v2.logResponseError;
local l_DiscoveryEventErrorLogger_0 = v2.DiscoveryEventErrorLogger;
local v5 = require(l_script_FirstAncestor_0.createDataCache);
local v6 = require(l_script_FirstAncestor_0.createDataResolver);
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local _ = require(script.Parent.GamePassStoreTypes);
local v9 = require(script.Parent.fetchGamePasses);
return function() --[[ Line: 23 ]] --[[ Name: createGamePassStore ]]
    -- upvalues: v5 (copy), v6 (copy), l_logResponseError_0 (copy), l_DiscoveryEventErrorLogger_0 (copy), v9 (copy)
    local v10 = v5();
    local v11 = v5();
    local v21 = v6({
        cache = v11, 
        supportsMultiGet = false, 
        logError = function(v12) --[[ Line: 33 ]] --[[ Name: logError ]]
            -- upvalues: l_logResponseError_0 (ref), l_DiscoveryEventErrorLogger_0 (ref)
            local v13 = if type(v12) == "table" and v12.StatusCode then v12.StatusCode else nil;
            l_logResponseError_0("game-passes/v1/universes/.../game-passes", {
                StatusCode = v13
            });
            l_DiscoveryEventErrorLogger_0.reportError("GamePassStore", "Failed to fetch game passes", {
                err = tostring(v12)
            });
        end, 
        fetchFn = function(v14, _) --[[ Line: 40 ]] --[[ Name: fetchFn ]]
            -- upvalues: v9 (ref), v10 (copy)
            return v9(v14):andThen(function(v16) --[[ Line: 41 ]]
                -- upvalues: v10 (ref)
                local v17 = {};
                for _, v19 in v16.gamePasses do
                    local v20 = tostring(v19.id);
                    table.insert(v17, v20);
                    v10.updateItems({
                        [v20] = v19
                    });
                end;
                return {
                    orderedIds = v17
                };
            end);
        end
    });
    return {
        getPassesForUniverse = v21.getCachedItem, 
        getAndFetchPassesForUniverse = v21.getAndFetchItem, 
        fetchPassesForUniverse = v21.fetchItem, 
        getGamePassInfo = v10.getItem, 
        updateGamePassInfos = v10.updateItems, 
        updateUniversePasses = v11.updateItems, 
        clear = function() --[[ Line: 55 ]] --[[ Name: clear ]]
            -- upvalues: v11 (copy), v21 (copy), v10 (copy)
            v11.clear();
            v21.clear();
            v10.clear();
        end, 
        dispose = function() --[[ Line: 61 ]] --[[ Name: dispose ]]
            -- upvalues: v21 (copy), v10 (copy)
            v21.dispose();
            v10.dispose();
        end
    };
end;