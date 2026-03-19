local l_RunService_0 = game:GetService("RunService");
local v1 = {};
v1.__index = v1;
v1.new = function() --[[ Line: 6 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v2 = setmetatable({}, v1);
    v2.lastInputTimeSec = -1;
    v2.subscriptions = {};
    v2.lastProgress = -1;
    return v2;
end;
v1.getCurrentProgress = function(v3) --[[ Line: 15 ]] --[[ Name: getCurrentProgress ]]
    local v4 = os.clock() - v3.lastInputTimeSec;
    if v4 < v3.dwellTimeSec then
        return 1;
    elseif v4 < v3.dwellTimeSec + v3.fadeDurationSec then
        return 1 - (v4 - v3.dwellTimeSec) / v3.fadeDurationSec;
    else
        return 0;
    end;
end;
v1.inProgress = function(v5) --[[ Line: 26 ]] --[[ Name: inProgress ]]
    return v5:getCurrentProgress() > 0;
end;
v1.isFading = function(v6) --[[ Line: 30 ]] --[[ Name: isFading ]]
    local v7 = os.clock() - v6.lastInputTimeSec;
    local v8 = false;
    if v6.dwellTimeSec <= v7 then
        v8 = v7 < v6.dwellTimeSec + v6.fadeDurationSec;
    end;
    return v8;
end;
v1.updateLastInputTime = function(v9) --[[ Line: 35 ]] --[[ Name: updateLastInputTime ]]
    v9.lastInputTimeSec = os.clock();
end;
v1.skipToFade = function(v10) --[[ Line: 39 ]] --[[ Name: skipToFade ]]
    if not v10:isFading() then
        v10.lastInputTimeSec = os.clock() - v10.dwellTimeSec;
    end;
end;
v1.zeroOut = function(v11) --[[ Line: 45 ]] --[[ Name: zeroOut ]]
    v11.lastInputTimeSec = -1;
end;
v1.subscribe = function(v12, v13) --[[ Line: 49 ]] --[[ Name: subscribe ]]
    -- upvalues: l_RunService_0 (copy)
    table.insert(v12.subscriptions, v13);
    if not v12.heartbeatConnection then
        v12.heartbeatConnection = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 53 ]]
            -- upvalues: v12 (copy)
            local v14 = v12:getCurrentProgress();
            if v14 ~= v12.lastProgress then
                v12.lastProgress = v14;
                for _, v16 in ipairs(v12.subscriptions) do
                    v16(v14);
                end;
            end;
        end);
    end;
end;
v1.unsubscribe = function(v17, v18) --[[ Line: 65 ]] --[[ Name: unsubscribe ]]
    for v19, v20 in ipairs(v17.subscriptions) do
        if v20 == v18 then
            table.remove(v17.subscriptions, v19);
            break;
        end;
    end;
    if #v17.subscriptions == 0 and v17.heartbeatConnection then
        v17.heartbeatConnection:Disconnect();
        v17.heartbeatConnection = nil;
    end;
end;
v1.fadeDurationSec = 1;
v1.dwellTimeSec = 1;
return v1;