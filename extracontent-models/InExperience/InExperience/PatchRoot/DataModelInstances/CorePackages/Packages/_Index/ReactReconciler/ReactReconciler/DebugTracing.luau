local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_console_0 = require(l_Parent_0.Shared).console;
local v3 = {};
local v4 = nil;
local _ = require(script.Parent.ReactFiberLane);
local l_enableDebugTracing_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableDebugTracing;
local v7 = nil;
local v8 = {};
local v9 = 0;
decimalToBinaryString = function(v10) --[[ Line: 40 ]] --[[ Name: decimalToBinaryString ]]
    local v11 = "";
    repeat
        local v12, v13 = math.modf(v10 / 2);
        v10 = v12;
        v11 = math.ceil(v13) .. v11;
    until v10 == 0;
    local v14 = 31 - string.len(v11);
    return string.rep("0", v14) .. v11;
end;
local function _(v15) --[[ Line: 53 ]] --[[ Name: formatLanes ]]
    return "0b" .. decimalToBinaryString(v15);
end;
local function v19(...) --[[ Line: 59 ]] --[[ Name: group ]]
    -- upvalues: v8 (copy), v7 (ref), l_console_0 (copy), v4 (ref)
    for _, v18 in {
        ...
    } do
        table.insert(v8, v18);
    end;
    if v7 == nil then
        v7 = l_console_0.log;
        l_console_0.log = v4;
    end;
end;
local function v20() --[[ Line: 69 ]] --[[ Name: groupEnd ]]
    -- upvalues: v8 (copy), v9 (ref), l_console_0 (copy), v7 (ref)
    table.remove(v8, 1);
    while v9 > #v8 do
        l_console_0.groupEnd();
        v9 = v9 - 1;
    end;
    if #v8 == 0 then
        l_console_0.log = v7;
        v7 = nil;
    end;
end;
v4 = function(...) --[[ Line: 81 ]] --[[ Name: log ]]
    -- upvalues: v9 (ref), v8 (copy), l_console_0 (copy), v7 (ref)
    if v9 < #v8 then
        for v21 = v9 + 1, #v8 do
            local v22 = v8[v21];
            l_console_0.group(v22);
        end;
        v9 = #v8;
    end;
    if typeof(v7) == "function" then
        v7(...);
        return;
    else
        l_console_0.log(...);
        return;
    end;
end;
v3.logCommitStarted = function(v23) --[[ Line: 99 ]] --[[ Name: logCommitStarted ]]
    -- upvalues: v1 (copy), l_enableDebugTracing_0 (copy), v19 (copy)
    if v1.__DEV__ and l_enableDebugTracing_0 then
        v19(string.format("* commit (%s)", "0b" .. decimalToBinaryString(v23)), "", "", "");
    end;
end;
v3.logCommitStopped = function() --[[ Line: 114 ]] --[[ Name: logCommitStopped ]]
    -- upvalues: v1 (copy), l_enableDebugTracing_0 (copy), v20 (copy)
    if v1.__DEV__ and l_enableDebugTracing_0 then
        v20();
    end;
end;
v3.logComponentSuspended = function(v24, v25) --[[ Line: 142 ]] --[[ Name: logComponentSuspended ]]
    -- upvalues: v1 (copy), l_enableDebugTracing_0 (copy), v4 (ref)
    if v1.__DEV__ and l_enableDebugTracing_0 then
        v4(string.format("* %s suspended", v24));
        v25:andThen(function() --[[ Line: 156 ]]
            -- upvalues: v4 (ref), v24 (copy)
            v4(string.format("* %s resolved", v24));
        end, function() --[[ Line: 165 ]]
            -- upvalues: v4 (ref), v24 (copy)
            v4(string.format("* %s rejected", v24));
        end);
    end;
end;
v3.logLayoutEffectsStarted = function(v26) --[[ Line: 180 ]] --[[ Name: logLayoutEffectsStarted ]]
    -- upvalues: v1 (copy), l_enableDebugTracing_0 (copy), v19 (copy)
    if v1.__DEV__ and l_enableDebugTracing_0 then
        v19(string.format("* layout effects (%s)", "0b" .. decimalToBinaryString(v26)));
    end;
end;
v3.logLayoutEffectsStopped = function() --[[ Line: 195 ]] --[[ Name: logLayoutEffectsStopped ]]
    -- upvalues: v1 (copy), l_enableDebugTracing_0 (copy), v20 (copy)
    if v1.__DEV__ and l_enableDebugTracing_0 then
        v20();
    end;
end;
v3.logPassiveEffectsStarted = function(v27) --[[ Line: 204 ]] --[[ Name: logPassiveEffectsStarted ]]
    -- upvalues: v1 (copy), l_enableDebugTracing_0 (copy), v19 (copy)
    if v1.__DEV__ and l_enableDebugTracing_0 then
        v19(string.format("* passive effects (%s)", "0b" .. decimalToBinaryString(v27)));
    end;
end;
v3.logPassiveEffectsStopped = function() --[[ Line: 219 ]] --[[ Name: logPassiveEffectsStopped ]]
    -- upvalues: v1 (copy), l_enableDebugTracing_0 (copy), v20 (copy)
    if v1.__DEV__ and l_enableDebugTracing_0 then
        v20();
    end;
end;
v3.logRenderStarted = function(v28) --[[ Line: 228 ]] --[[ Name: logRenderStarted ]]
    -- upvalues: v1 (copy), l_enableDebugTracing_0 (copy), v19 (copy)
    if v1.__DEV__ and l_enableDebugTracing_0 then
        v19(string.format("* render (%s)", "0b" .. decimalToBinaryString(v28)));
    end;
end;
v3.logRenderStopped = function() --[[ Line: 243 ]] --[[ Name: logRenderStopped ]]
    -- upvalues: v1 (copy), l_enableDebugTracing_0 (copy), v20 (copy)
    if v1.__DEV__ and l_enableDebugTracing_0 then
        v20();
    end;
end;
v3.logForceUpdateScheduled = function(v29, v30) --[[ Line: 252 ]] --[[ Name: logForceUpdateScheduled ]]
    -- upvalues: v1 (copy), l_enableDebugTracing_0 (copy), v4 (ref)
    if v1.__DEV__ and l_enableDebugTracing_0 then
        v4(string.format("* %s forced update (%s)", v29, "0b" .. decimalToBinaryString(v30)));
    end;
end;
v3.logStateUpdateScheduled = function(v31, v32, _) --[[ Line: 267 ]] --[[ Name: logStateUpdateScheduled ]]
    -- upvalues: v1 (copy), l_enableDebugTracing_0 (copy), v4 (ref)
    if v1.__DEV__ and l_enableDebugTracing_0 then
        v4(string.format("* %s updated state (%s)", v31, "0b" .. decimalToBinaryString(v32)));
    end;
end;
return v3;