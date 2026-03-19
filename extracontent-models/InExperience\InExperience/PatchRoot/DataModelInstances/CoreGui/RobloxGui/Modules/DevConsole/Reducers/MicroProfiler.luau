local v0 = require(script.Parent.Parent.Immutable);
local v1 = require(script.Parent.Parent.Actions.AppendRecentDumpPath);
local v2 = require(script.Parent.Parent.Actions.SetRCCProfilerState);
return function(v3, v4) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v0 (copy), v1 (copy)
    local v5 = v3 or {
        waitingForRecording = false, 
        lastFileOutputLocation = "", 
        recentDumpPaths = {}
    };
    if v4.type == v2.name then
        local v6 = {
            waitingForRecording = v4.waitingForRecording, 
            lastFileOutputLocation = v4.lastFileOutputLocation, 
            recentDumpPaths = v5.recentDumpPaths
        };
        return (v0.JoinDictionaries(v5, v6));
    elseif v4.type == v1.name then
        local v7 = {
            waitingForRecording = v5.waitingForRecording, 
            lastFileOutputLocation = v5.lastFileOutputLocation, 
            recentDumpPaths = v0.Append(v5.recentDumpPaths, v4.dumpPath)
        };
        return (v0.JoinDictionaries(v5, v7));
    else
        return v5;
    end;
end;