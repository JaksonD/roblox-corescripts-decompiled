local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationEnums);
local v3 = require(l_Parent_0.flags.getFFlagDebugUGCValidationPrintNewStructureResults);
local v4 = {};
v4.__index = v4;
v4.new = function(v5) --[[ Line: 11 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v4 (copy)
    return (setmetatable({
        _testEnum = v5, 
        _status = v2.Status.CANNOT_START, 
        _telemetryContext = "", 
        _failureMessages = {}, 
        _internalData = {}
    }, v4));
end;
v4.begin = function(v6) --[[ Line: 22 ]] --[[ Name: begin ]]
    -- upvalues: v2 (copy)
    v6._startTime = os.clock();
    v6._status = v2.Status.PASS;
end;
v4.fail = function(v7, v8, v9, v10, v11) --[[ Line: 27 ]] --[[ Name: fail ]]
    -- upvalues: v2 (copy)
    v7._status = v2.Status.FAIL;
    table.insert(v7._internalData, v10);
    table.insert(v7._failureMessages, {
        key = v8, 
        params = v9 or {}
    });
    if v11 ~= nil then
        v7._telemetryContext = ("%* -- %*"):format(v11, v7._telemetryContext);
    end;
end;
v4.err = function(v12, v13) --[[ Line: 45 ]] --[[ Name: err ]]
    -- upvalues: v3 (copy), v2 (copy)
    if v3() then
        print("Reporting:", v12._testEnum, "has error:", v13);
    end;
    v12._status = v2.Status.ERROR;
    v12._internalData = {};
    v12._failureMessages = {};
    v12._telemetryContext = v13;
end;
v4.complete = function(v14) --[[ Line: 55 ]] --[[ Name: complete ]]
    -- upvalues: v3 (copy)
    local v15 = 0;
    if v14._startTime then
        v15 = 1000 * (os.clock() - v14._startTime);
    end;
    if v3() then
        print("Reporting:", v14._testEnum, "has status", v14._status, "in", v15);
    end;
    return {
        validationEnum = v14._testEnum, 
        status = v14._status, 
        errorTranslationContexts = v14._failureMessages, 
        internalData = v14._internalData, 
        duration = v15, 
        telemetryContext = v14._telemetryContext
    };
end;
return v4;