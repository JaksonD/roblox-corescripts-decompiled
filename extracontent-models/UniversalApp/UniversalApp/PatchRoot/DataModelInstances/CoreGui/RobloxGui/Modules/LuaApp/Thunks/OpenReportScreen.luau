local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function(v3) --[[ Line: 6 ]] --[[ Name: openReportScreen ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v4) --[[ Line: 7 ]]
        -- upvalues: v1 (ref), v3 (copy), v2 (ref)
        local v5 = {
            name = v1.ReportScreen, 
            reportData = v3
        };
        v4:dispatch(v2(v5));
    end;
end;