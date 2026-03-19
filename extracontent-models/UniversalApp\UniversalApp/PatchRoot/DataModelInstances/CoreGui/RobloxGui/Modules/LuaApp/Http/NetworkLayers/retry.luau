local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Promise);
local v2 = require(l_Modules_0.LuaApp.Http.HttpError);
local function _(v3) --[[ Line: 10 ]] --[[ Name: defer ]]
    -- upvalues: v1 (copy)
    return v1.new(function(v4) --[[ Line: 11 ]]
        -- upvalues: v3 (copy)
        delay(v3, function() --[[ Line: 12 ]]
            -- upvalues: v4 (copy)
            v4();
        end);
    end);
end;
local function v6(v7, v8) --[[ Line: 25 ]] --[[ Name: retryRequest ]]
    -- upvalues: v2 (copy), v1 (copy), v6 (copy)
    return v7():catch(function(v9) --[[ Line: 26 ]]
        -- upvalues: v8 (copy), v2 (ref), v1 (ref), v6 (ref), v7 (copy)
        v8.remainingAttempts = v8.remainingAttempts - 1;
        local v10 = false;
        if v8.remainingAttempts > 0 then
            v10 = true;
            if v9.kind ~= v2.Kind.RequireExternalRetry then
                v10 = v9.kind == v2.Kind.LuaTimeout;
            end;
        end;
        if not v10 then
            return v1.reject(v9);
        elseif v8.shouldImmediateRetry then
            return v6(v7, v8);
        else
            local v11 = v8.backoffRate ^ (v8.maxAttempts - v8.remainingAttempts);
            return v1.new(function(v12) --[[ Line: 11 ]]
                -- upvalues: v11 (copy)
                delay(v11, function() --[[ Line: 12 ]]
                    -- upvalues: v12 (copy)
                    v12();
                end);
            end):andThen(function() --[[ Line: 45 ]]
                -- upvalues: v6 (ref), v7 (ref), v8 (ref)
                return v6(v7, v8);
            end);
        end;
    end);
end;
return function(v13, v14) --[[ Line: 55 ]]
    -- upvalues: v2 (copy), v1 (copy), v6 (copy)
    return function(v15, v16, v17) --[[ Line: 56 ]]
        -- upvalues: v14 (copy), v13 (copy), v2 (ref), v1 (ref), v6 (ref)
        local v18 = {
            maxAttempts = 3, 
            backoffRate = 2, 
            shouldImmediateRetry = false
        };
        if v14 and v14.shouldImmediateRetry then
            assert(type(v14.shouldImmediateRetry) == "boolean", "shouldImmediateRetry must be a bool");
            v18.shouldImmediateRetry = v14.shouldImmediateRetry;
        end;
        v18.remainingAttempts = v18.maxAttempts;
        local function v19() --[[ Line: 72 ]] --[[ Name: makeRequest ]]
            -- upvalues: v13 (ref), v15 (copy), v16 (copy), v17 (copy)
            return v13(v15, v16, v17);
        end;
        return (v13(v15, v16, v17):catch(function(v20) --[[ Line: 26 ]]
            -- upvalues: v18 (copy), v2 (ref), v1 (ref), v6 (ref), v19 (copy)
            v18.remainingAttempts = v18.remainingAttempts - 1;
            local v21 = false;
            if v18.remainingAttempts > 0 then
                v21 = true;
                if v20.kind ~= v2.Kind.RequireExternalRetry then
                    v21 = v20.kind == v2.Kind.LuaTimeout;
                end;
            end;
            if not v21 then
                return v1.reject(v20);
            elseif v18.shouldImmediateRetry then
                return v6(v19, v18);
            else
                local v22 = v18.backoffRate ^ (v18.maxAttempts - v18.remainingAttempts);
                return v1.new(function(v23) --[[ Line: 11 ]]
                    -- upvalues: v22 (copy)
                    delay(v22, function() --[[ Line: 12 ]]
                        -- upvalues: v23 (copy)
                        v23();
                    end);
                end):andThen(function() --[[ Line: 45 ]]
                    -- upvalues: v6 (ref), v19 (ref), v18 (ref)
                    return v6(v19, v18);
                end);
            end;
        end));
    end;
end;