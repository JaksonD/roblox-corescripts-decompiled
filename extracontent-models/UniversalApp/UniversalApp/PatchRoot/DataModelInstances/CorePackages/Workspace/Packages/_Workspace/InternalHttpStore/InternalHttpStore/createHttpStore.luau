local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Signals);
local v3 = require(l_Parent_0.HttpSessionTracker);
local v4 = require(l_Parent_0.createFetchSignal);
local v5 = require(l_Parent_0.GlobalHandlers.createCancelRequestHandler);
local v6 = require(l_Parent_0.GlobalHandlers.createNetworkStatsHandler);
local v7 = require(l_Parent_0.GlobalHandlers.createGrafanaLoggingHandler);
local _ = require(l_Parent_0.HttpStoreTypes);
local v9 = {};
return function() --[[ Line: 31 ]] --[[ Name: createHTTPStore ]]
    -- upvalues: v9 (ref), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v2 (copy), v3 (copy)
    return {
        fetch = function(v10, v11) --[[ Line: 33 ]] --[[ Name: fetch ]]
            -- upvalues: v9 (ref), v4 (ref), v5 (ref), v6 (ref), v7 (ref), v2 (ref)
            if v10 and v9[v10] then
                return v9[v10].getFetchSignal, v9[v10].cancelRequest;
            else
                local v12, v13 = v4(v11);
                v12 = v5(v12);
                local v14 = v6(v12);
                local v15 = v7(v12);
                local function v16() --[[ Line: 55 ]]
                    -- upvalues: v14 (copy), v15 (copy), v13 (copy)
                    v14();
                    v15();
                    v13();
                end;
                if v10 then
                    local v19 = v2.createEffect(function(v17) --[[ Line: 62 ]]
                        -- upvalues: v12 (ref), v9 (ref), v10 (copy)
                        local v18 = v12(v17);
                        if v18.status == "Success" or v18.status == "Failed" then
                            v9[v10] = nil;
                        end;
                    end);
                    v16 = function() --[[ Line: 69 ]]
                        -- upvalues: v19 (copy), v14 (copy), v15 (copy), v13 (copy), v9 (ref), v10 (copy)
                        v19();
                        v14();
                        v15();
                        v13();
                        v9[v10] = nil;
                    end;
                    v9[v10] = {
                        getFetchSignal = v12, 
                        cancelRequest = v16
                    };
                end;
                return v12, v16;
            end;
        end, 
        cancelAll = function() --[[ Line: 84 ]] --[[ Name: cancelAll ]]
            -- upvalues: v9 (ref), v3 (ref)
            for _, v21 in v9 do
                v21.cancelRequest();
            end;
            v9 = {};
            v3.cancelAll();
        end
    };
end;