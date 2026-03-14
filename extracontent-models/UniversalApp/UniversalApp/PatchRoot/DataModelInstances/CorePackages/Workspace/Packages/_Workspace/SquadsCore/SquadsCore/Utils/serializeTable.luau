local l_Parent_0 = script:FindFirstAncestor("SquadsCore").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_FFlagDebugSquadLogsEnabled_0 = require(l_Parent_0.SharedFlags).FFlagDebugSquadLogsEnabled;
return function(v3) --[[ Line: 8 ]]
    -- upvalues: l_FFlagDebugSquadLogsEnabled_0 (copy), l_HttpService_0 (copy)
    if l_FFlagDebugSquadLogsEnabled_0 then
        return l_HttpService_0:JSONEncode(v3);
    else
        return v3;
    end;
end;