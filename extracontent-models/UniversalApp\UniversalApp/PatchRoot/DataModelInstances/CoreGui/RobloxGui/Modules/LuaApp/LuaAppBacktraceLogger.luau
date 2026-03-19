local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Rodux);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v6 = require(l_Modules_0.LuaApp.Util.safeCall);
local v7 = require(l_Modules_0.LuaApp.Util.toStringLimited);
local v8 = require(l_Modules_0.Common.StringUtilities.StringReplaceAll);
local v9 = game:DefineFastFlag("LuaAppEnableLumberyakLogBound", false);
local v10 = game:DefineFastInt("LuaAppLumberyakLogBound", 10000);
local v11 = {
    _store = nil, 
    _lumberyakLog = ""
};
if v9 then
    v11._lumberyakBuffer = table.create(v10);
    v11._currentBufferIndex = 1;
end;
v11.addLumberyakLog = nil;
local v12 = game:DefineFastString("LuaAppBacktraceLogLevel", "Info");
l_Logger_0:addSink({
    maxLevel = l_Logger_0.Levels.fromString(v12), 
    log = function(_, v14, _) --[[ Line: 37 ]] --[[ Name: log ]]
        -- upvalues: v11 (copy)
        v11:addLumberyakLog(v14);
    end
});
v11.connectToStore = function(v16, v17) --[[ Line: 42 ]] --[[ Name: connectToStore ]]
    -- upvalues: v4 (copy)
    if getmetatable(v17) == v4.Store then
        v16._store = v17;
    end;
end;
v11.addLumberyakLog = function(v18, v19) --[[ Line: 48 ]] --[[ Name: addLumberyakLog ]]
    -- upvalues: v9 (copy), v10 (copy)
    if type(v19) == "string" then
        if v9 then
            v18._lumberyakBuffer[v18._currentBufferIndex] = v19;
            v18._currentBufferIndex = v18._currentBufferIndex + 1;
            if v18._currentBufferIndex > v10 then
                v18._currentBufferIndex = 1;
                return;
            end;
        else
            v18._lumberyakLog = v18._lumberyakLog .. v19 .. "\n";
        end;
    end;
end;
v11.generateAppLog = function(v20) --[[ Line: 62 ]] --[[ Name: generateAppLog ]]
    -- upvalues: v6 (copy), v9 (copy), v7 (copy), l_Players_0 (copy), v8 (copy)
    return (v6(function() --[[ Line: 63 ]]
        -- upvalues: v9 (ref), v20 (copy), v7 (ref), l_Players_0 (ref), v8 (ref)
        local v21 = "";
        if v9 then
            if #v20._lumberyakBuffer > 0 then
                v21 = ((v21 .. "============ LumberYak Logs ============\n") .. table.concat(v20._lumberyakBuffer, "\n", v20._currentBufferIndex)) .. "\n" .. table.concat(v20._lumberyakBuffer, "\n", 1, v20._currentBufferIndex - 1);
            end;
        elseif #v20._lumberyakLog > 0 then
            v21 = (v21 .. "============ LumberYak Logs ============\n") .. v20._lumberyakLog;
        end;
        if v20._store ~= nil then
            local v23 = v7(v20._store:getState(), nil, 5, function(v22) --[[ Line: 82 ]]
                if v22 == 1 then
                    return -1;
                else
                    return 20;
                end;
            end);
            if #v23 > 0 then
                v21 = (v21 .. "============ Rodux Store ============\n") .. v23;
            end;
        end;
        local v24 = {};
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if l_LocalPlayer_0 ~= nil then
            if l_LocalPlayer_0.UserId and l_LocalPlayer_0.UserId > 0 then
                v24[tostring(l_LocalPlayer_0.UserId)] = "UserId";
            end;
            if l_LocalPlayer_0.Name and l_LocalPlayer_0.Name ~= "" then
                v24[tostring(l_LocalPlayer_0.Name)] = "UserName";
            end;
        end;
        return (v8(v21, v24));
    end, ""));
end;
return v11;