local l_script_FirstAncestor_0 = script:FindFirstAncestor("Http");
local l_UpdateFetchingStatus_0 = require(l_script_FirstAncestor_0.Actions).UpdateFetchingStatus;
local l_BatchUpdateFetchingStatus_0 = require(l_script_FirstAncestor_0.Actions).BatchUpdateFetchingStatus;
return function(v3) --[[ Line: 5 ]] --[[ Name: createPerformFetchMiddleware ]]
    -- upvalues: l_BatchUpdateFetchingStatus_0 (copy), l_UpdateFetchingStatus_0 (copy)
    local v4 = {};
    local v5 = false;
    local v6 = v3 or 0;
    return function(v7, v8) --[[ Line: 10 ]]
        -- upvalues: v5 (ref), v6 (copy), v4 (ref), l_BatchUpdateFetchingStatus_0 (ref), l_UpdateFetchingStatus_0 (ref)
        local function _() --[[ Line: 11 ]] --[[ Name: runBatchDispatcher ]]
            -- upvalues: v5 (ref), v6 (ref), v4 (ref), v8 (copy), l_BatchUpdateFetchingStatus_0 (ref)
            if v5 then
                return;
            else
                v5 = true;
                task.delay(v6, function() --[[ Line: 17 ]]
                    -- upvalues: v4 (ref), v5 (ref), v8 (ref), l_BatchUpdateFetchingStatus_0 (ref)
                    local l_v4_0 = v4;
                    v4 = {};
                    v5 = false;
                    v8:dispatch(l_BatchUpdateFetchingStatus_0(l_v4_0, true));
                end);
                return;
            end;
        end;
        return function(v11) --[[ Line: 26 ]]
            -- upvalues: l_UpdateFetchingStatus_0 (ref), v4 (ref), v5 (ref), v6 (ref), v8 (copy), l_BatchUpdateFetchingStatus_0 (ref), v7 (copy)
            if v11.type == l_UpdateFetchingStatus_0.name then
                table.insert(v4, v11);
                if not v5 then
                    v5 = true;
                    task.delay(v6, function() --[[ Line: 17 ]]
                        -- upvalues: v4 (ref), v5 (ref), v8 (ref), l_BatchUpdateFetchingStatus_0 (ref)
                        local l_v4_1 = v4;
                        v4 = {};
                        v5 = false;
                        v8:dispatch(l_BatchUpdateFetchingStatus_0(l_v4_1, true));
                    end);
                end;
            elseif v11.type == l_BatchUpdateFetchingStatus_0.name and not v11.shouldImmediatelyDispatch then
                for _, v14 in pairs(v11.fetchingStatuses) do
                    table.insert(v4, v14);
                end;
                if not v5 then
                    v5 = true;
                    task.delay(v6, function() --[[ Line: 17 ]]
                        -- upvalues: v4 (ref), v5 (ref), v8 (ref), l_BatchUpdateFetchingStatus_0 (ref)
                        local l_v4_2 = v4;
                        v4 = {};
                        v5 = false;
                        v8:dispatch(l_BatchUpdateFetchingStatus_0(l_v4_2, true));
                    end);
                end;
            else
                return v7(v11);
            end;
            return nil;
        end;
    end;
end;