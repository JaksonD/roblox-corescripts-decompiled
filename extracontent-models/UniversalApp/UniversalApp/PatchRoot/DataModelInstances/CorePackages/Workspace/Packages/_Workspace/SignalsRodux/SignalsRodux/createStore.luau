local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Signals);
local _ = require(script.Parent.types);
local v4 = require(script.Parent.createEvent);
return function(v5, v6, v7, v8, v9) --[[ Line: 18 ]] --[[ Name: createStore ]]
    -- upvalues: v2 (copy), v4 (copy), l_RunService_0 (copy)
    local l_v6_0 = v6;
    local v11 = false;
    local v12 = {
        {
            type = "@@INIT"
        }
    };
    local function v22(v13) --[[ Line: 30 ]] --[[ Name: processActions ]]
        -- upvalues: v12 (ref), v5 (copy), l_v6_0 (ref), v8 (copy)
        local l_v12_0 = v12;
        v12 = {};
        local v15 = #l_v12_0;
        for v16, v17 in l_v12_0 do
            local v18 = coroutine.create(function() --[[ Line: 37 ]]
                -- upvalues: v16 (copy), v15 (copy), v5 (ref), l_v6_0 (ref), v17 (copy), v13 (copy)
                if v16 == v15 then
                    return v5(l_v6_0, v17, v13);
                else
                    return v5(l_v6_0, v17, nil);
                end;
            end);
            local v19, v20 = coroutine.resume(v18);
            if v19 and coroutine.status(v18) == "dead" then
                l_v6_0 = v20;
            elseif v8 ~= nil then
                local v21 = not v19 and "caught error in reducer" or "attempted to yield in reducer";
                v8.reportReducerError(l_v6_0, v17, {
                    message = v21, 
                    thrownValue = debug.traceback(v18, if not v19 then tostring(v20) else v21)
                });
            end;
        end;
    end;
    local v23, v24 = v2.createSignal(nil, function() --[[ Line: 61 ]]
        return false;
    end);
    local v26 = v2.createComputed(function(v25) --[[ Line: 65 ]]
        -- upvalues: v23 (copy), v12 (ref), v11 (ref), v22 (copy), l_v6_0 (ref)
        v23(v25);
        if #v12 == 0 then
            table.insert(v12, {
                type = "@@RECONCILE"
            });
        end;
        v11 = true;
        v22(v25);
        v11 = false;
        return l_v6_0;
    end);
    local v27, v28 = v4();
    local v29 = v26();
    local function v36() --[[ Line: 83 ]] --[[ Name: flushHandler ]]
        -- upvalues: v26 (copy), v29 (ref), v28 (copy), v8 (copy)
        local v30 = v26();
        if v30 ~= v29 then
            local l_v29_0 = v29;
            v29 = v30;
            local v32 = coroutine.create(function() --[[ Line: 89 ]]
                -- upvalues: v28 (ref), v30 (copy), l_v29_0 (copy)
                v28(v30, l_v29_0);
            end);
            local v33, v34 = coroutine.resume(v32);
            if (not v33 or coroutine.status(v32) ~= "dead") and v8 ~= nil then
                local v35 = not v33 and "caught error flushing store updates" or "attempted to yield flushing store updates";
                v8.reportUpdateError(l_v29_0, v30, {}, {
                    message = v35, 
                    thrownValue = debug.traceback(v32, if not v33 then tostring(v34) else v35)
                });
            end;
        end;
    end;
    local v37 = l_RunService_0.Heartbeat:Connect(v36);
    local v38 = false;
    local function v40(v39) --[[ Line: 113 ]]
        -- upvalues: v12 (ref), v24 (copy)
        if typeof(v39) ~= "table" or v39.type == nil then
            error("actions must be a table with a 'type' field");
        end;
        table.insert(v12, v39);
        v24();
    end;
    local v49 = {
        changed = {
            connect = function(_, v42) --[[ Line: 123 ]] --[[ Name: connect ]]
                -- upvalues: v27 (copy)
                return {
                    disconnect = v27(v42)
                };
            end
        }, 
        destruct = function(_) --[[ Line: 128 ]] --[[ Name: destruct ]]
            -- upvalues: v38 (ref), v37 (copy)
            if v38 then
                return;
            else
                v38 = true;
                v37:Disconnect();
                return;
            end;
        end, 
        dispatch = function(_, v45) --[[ Line: 135 ]] --[[ Name: dispatch ]]
            -- upvalues: v11 (ref), v38 (ref), v40 (ref)
            if v11 then
                error("reducers cannot dispatch actions");
            elseif v38 then
                error("cannot dispatch to a destroyed store");
            end;
            return v40(v45);
        end, 
        getState = function(_, v47) --[[ Line: 143 ]] --[[ Name: getState ]]
            -- upvalues: v11 (ref), v26 (copy)
            if v11 then
                error("reducers cannot call getState()");
            end;
            return v26(v47);
        end, 
        flush = function(_) --[[ Line: 149 ]] --[[ Name: flush ]]
            -- upvalues: v11 (ref), v38 (ref), v36 (copy)
            if v11 then
                error("reducers cannot flush the store");
            elseif v38 then
                error("cannot flush a destroyed store");
            end;
            v36();
        end
    };
    if v9 ~= nil then
        v9:_hookIntoStore(v49);
    end;
    if v7 ~= nil and #v7 > 0 then
        for v50 = #v7, 1, -1 do
            v40 = v7[v50](v40, v49);
        end;
    end;
    return v49;
end;