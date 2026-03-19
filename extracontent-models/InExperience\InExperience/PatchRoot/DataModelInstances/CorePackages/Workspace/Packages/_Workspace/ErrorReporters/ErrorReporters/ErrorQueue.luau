local l_Parent_0 = script.Parent.Parent;
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.t);
local v4 = {};
v4.__index = v4;
local v5 = v3.tuple(v3.callback, v3.optional(v3.strictInterface({
    queueTimeLimit = v3.optional(v3.numberPositive), 
    queueErrorLimit = v3.optional(v3.numberPositive), 
    queueKeyLimit = v3.optional(v3.numberPositive)
})));
v4.new = function(v6, v7) --[[ Line: 54 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v4 (copy)
    assert(v5(v6, v7));
    local v8 = v7 or {};
    local v9 = {
        _reportMethod = v6, 
        _queueTimeLimit = v8.queueTimeLimit or 30, 
        _queueErrorLimit = v8.queueErrorLimit or 30, 
        _queueKeyLimit = v8.queueKeyLimit or 10, 
        _errors = {}, 
        _totalErrorCount = 0, 
        _totalKeyCount = 0, 
        _runningTime = 0, 
        _renderSteppedConnection = nil
    };
    setmetatable(v9, v4);
    return v9;
end;
v4.hasError = function(v10, v11) --[[ Line: 80 ]] --[[ Name: hasError ]]
    if type(v11) ~= "string" or v11 == "" then
        return false;
    else
        return v10._errors[v11] ~= nil;
    end;
end;
v4.addError = function(v12, v13, v14) --[[ Line: 88 ]] --[[ Name: addError ]]
    if type(v13) ~= "string" or v13 == "" then
        return;
    else
        if not v12._errors[v13] then
            v12._errors[v13] = {
                data = v14, 
                count = 1
            };
            v12._totalKeyCount = v12._totalKeyCount + 1;
        else
            v12._errors[v13].count = v12._errors[v13].count + 1;
        end;
        v12._totalErrorCount = v12._totalErrorCount + 1;
        if v12:isReadyToReport() then
            v12:reportAllErrors();
        end;
        return;
    end;
end;
v4.isReadyToReport = function(v15) --[[ Line: 112 ]] --[[ Name: isReadyToReport ]]
    local v16 = true;
    if v15._totalKeyCount < v15._queueKeyLimit then
        v16 = true;
        if v15._totalErrorCount < v15._queueErrorLimit then
            v16 = false;
            if v15._totalErrorCount > 0 then
                v16 = v15._runningTime >= v15._queueTimeLimit;
            end;
        end;
    end;
    return v16;
end;
v4.reportAllErrors = function(v17) --[[ Line: 118 ]] --[[ Name: reportAllErrors ]]
    -- upvalues: v2 (copy)
    local v18 = v2.Dictionary.join(v17._errors, {});
    v17._errors = {};
    v17._totalErrorCount = 0;
    v17._totalKeyCount = 0;
    v17._runningTime = 0;
    for v19, v20 in pairs(v18) do
        v17._reportMethod(v19, v20.data, v20.count);
    end;
end;
v4._onRenderStep = function(v21, v22) --[[ Line: 133 ]] --[[ Name: _onRenderStep ]]
    v21._runningTime = v21._runningTime + v22;
    if v21:isReadyToReport() then
        v21:reportAllErrors();
    end;
end;
v4.startTimer = function(v23) --[[ Line: 141 ]] --[[ Name: startTimer ]]
    -- upvalues: l_RunService_0 (copy)
    if v23._renderSteppedConnection == nil then
        v23._runningTime = 0;
        v23._renderSteppedConnection = l_RunService_0.renderStepped:Connect(function(v24) --[[ Line: 145 ]]
            -- upvalues: v23 (copy)
            v23:_onRenderStep(v24);
        end);
    end;
end;
v4.stopTimer = function(v25) --[[ Line: 151 ]] --[[ Name: stopTimer ]]
    if v25._renderSteppedConnection ~= nil then
        v25._renderSteppedConnection:Disconnect();
        v25._runningTime = 0;
        v25._renderSteppedConnection = nil;
    end;
end;
return v4;