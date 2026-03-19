local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_LogTree_0 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree;
local v4 = require(l_Modules_0.LuaApp.LuaAppBacktraceLogger);
local v5 = game:DefineFastInt("LogTreeMaxLogsToBacktrace", 1000);
local v6 = game:DefineFastString("DebugLogTags", "");
local v7 = game:DefineFastString("BacktraceLogTags", "");
local v8 = 0;
local function v13(_, v10, v11) --[[ Line: 15 ]] --[[ Name: logToBacktrace ]]
    -- upvalues: v8 (ref), v5 (copy), v4 (copy), l_LogTree_0 (copy)
    v8 = v8 + 1;
    if v5 < v8 then
        if v5 > 0 and v8 == v5 + 1 then
            v4:addLumberyakLog(string.format("[Log limit reached: %d]", v5));
        end;
        return;
    else
        local v12 = l_LogTree_0.formatLog(v10, v11, true);
        v4:addLumberyakLog(v12);
        return;
    end;
end;
l_LogTree_0.setLogTags(v6, l_LogTree_0.logToConsole);
l_LogTree_0.setLogTags(v7, v13);
return {};