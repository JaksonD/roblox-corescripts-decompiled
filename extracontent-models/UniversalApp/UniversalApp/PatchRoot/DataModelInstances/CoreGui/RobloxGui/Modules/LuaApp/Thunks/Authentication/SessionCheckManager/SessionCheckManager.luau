local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Promise);
local l_MessageBusService_0 = game:GetService("MessageBusService");
local v3 = require(l_Modules_0.LuaApp.Flags.getFFlagSessionCheckDefaultTimeoutInSeconds)();
local v4 = game:DefineFastFlag("EnableSessionCheckManagerToListenOnce", false);
local v5 = {
    NotStarted = 0, 
    InProgress = 1, 
    Success = 2, 
    Failed = 3
};
local v6 = {};
v6.__index = v6;
v6.new = function() --[[ Line: 23 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v6 (copy)
    return (setmetatable({
        _currentStatus = v5.NotStarted, 
        _connection = nil, 
        _resolveFunction = nil
    }, v6));
end;
v6.registerSessionStatusChange = function(v7) --[[ Line: 33 ]] --[[ Name: registerSessionStatusChange ]]
    -- upvalues: l_MessageBusService_0 (copy), v5 (copy)
    if v7._connection then
        v7._connection:Disconnect();
    end;
    v7._connection = l_MessageBusService_0:Subscribe("SessionCheckStatusChanged", function(v8) --[[ Line: 39 ]]
        -- upvalues: v7 (copy), v5 (ref)
        if v8 and v8.status then
            v7._currentStatus = v8.status;
            if (v8.status == v5.Success or v8.status == v5.Failed) and v7._resolveFunction then
                if v8.status == v5.Failed then
                    v7._resolveFunction({
                        status = v8.status, 
                        errorStatus = v8.httpStatusCode or v8.errorStatus
                    });
                else
                    v7._resolveFunction({
                        status = v8.status
                    });
                end;
                v7._resolveFunction = nil;
            end;
        end;
    end, false, true);
end;
v6.waitForSessionCheckTerminalStatus = function(v9, v10) --[[ Line: 67 ]] --[[ Name: waitForSessionCheckTerminalStatus ]]
    -- upvalues: v3 (copy), v1 (copy), v5 (copy)
    v10 = v10 or v3;
    return v1.new(function(v11, v12) --[[ Line: 70 ]]
        -- upvalues: v9 (copy), v5 (ref), v1 (ref), v10 (ref)
        if v9._currentStatus == v5.Success or v9._currentStatus == v5.Failed then
            v11(v9._currentStatus);
            return;
        else
            v9._resolveFunction = v11;
            v1.delay(v10):andThen(function() --[[ Line: 81 ]]
                -- upvalues: v9 (ref), v12 (copy), v10 (ref)
                if v9._resolveFunction then
                    v9._resolveFunction = nil;
                    v12("Session check timeout after " .. v10 .. " seconds");
                end;
            end);
            return;
        end;
    end);
end;
v6.listenToSessionStatusChange = function(v13, v14) --[[ Line: 91 ]] --[[ Name: listenToSessionStatusChange ]]
    -- upvalues: l_MessageBusService_0 (copy), v4 (copy)
    if v13._connection then
        v13._connection:Disconnect();
    end;
    v13._connection = l_MessageBusService_0:Subscribe("SessionCheckStatusChanged", function(v15) --[[ Line: 95 ]]
        -- upvalues: v14 (copy)
        if v14 and v15 then
            v14(v15);
        end;
    end, v4, true);
    return v13._connection;
end;
v6.Status = v5;
v6.default = v6.new();
return v6;