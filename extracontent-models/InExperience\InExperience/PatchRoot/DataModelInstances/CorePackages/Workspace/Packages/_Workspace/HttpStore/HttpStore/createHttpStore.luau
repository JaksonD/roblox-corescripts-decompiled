local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.InternalHttpStore);
local _ = require(l_Parent_1.Signals);
local v4 = require(l_Parent_0.Handlers.createErrorStatusHandler);
local l_GetHttpStore_0 = v2.GetHttpStore;
local _ = require(l_Parent_0.Types);
local v7 = require(l_Parent_0.HttpSessionTracker);
return function(v8, v9) --[[ Line: 25 ]] --[[ Name: createHttpStore ]]
    -- upvalues: l_GetHttpStore_0 (copy), v7 (copy), v4 (copy)
    local v10 = l_GetHttpStore_0(v9);
    local v11 = {};
    return {
        fetch = function(v12, v13) --[[ Line: 30 ]] --[[ Name: fetch ]]
            -- upvalues: v7 (ref), v11 (copy), v10 (copy), v4 (ref), v8 (copy)
            local v14 = v7.currentSession();
            if v11[v14] == nil then
                v11[v14] = {};
            end;
            local v15, v16 = v10.fetch(v12, v13);
            v15 = v4(v8)(v15);
            v11[v14][v12] = {
                getFetchSignal = v15, 
                cancelRequest = v16
            };
            return v15, v16;
        end, 
        cancelAll = function() --[[ Line: 46 ]] --[[ Name: cancelAll ]]
            -- upvalues: v7 (ref), v11 (copy)
            local v17 = v7.currentSession();
            if v11[v17] then
                for _, v19 in v11[v17] do
                    v19.cancelRequest();
                end;
            end;
            v11[v17] = nil;
            v7.cancelAll();
            v11[v7.currentSession()] = {};
        end
    };
end;