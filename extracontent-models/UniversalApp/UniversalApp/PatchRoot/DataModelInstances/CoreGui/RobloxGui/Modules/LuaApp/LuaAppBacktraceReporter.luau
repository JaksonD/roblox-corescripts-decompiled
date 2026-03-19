local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_BacktraceReporter_0 = require(l_CorePackages_0.Workspace.Packages.ErrorReporters).BacktraceReporter;
local v3 = require(script.Parent.LuaAppErrorReporterUtil);
local l_game_FastString_0 = game:GetFastString("ErrorUploadToBacktraceLuaAppToken");
local v5 = require(script.Parent.LuaAppBacktraceLogger);
return (l_BacktraceReporter_0.new({
    httpService = l_HttpService_0, 
    token = l_game_FastString_0, 
    processErrorReportMethod = v3.processReport, 
    generateLogMethod = function() --[[ Line: 14 ]] --[[ Name: generateLogMethod ]]
        -- upvalues: v5 (copy)
        return v5:generateAppLog();
    end
}));