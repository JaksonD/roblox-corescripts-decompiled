local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Common_0 = l_Modules_0.Common;
local v2 = require(l_Common_0.Action);
local v3 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
return v2(script.Name, function(v4) --[[ Line: 8 ]]
    -- upvalues: v3 (copy)
    return {
        userId = v4, 
        status = v3.Fetching
    };
end);