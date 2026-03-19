local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local function _(v3, v4) --[[ Line: 6 ]] --[[ Name: openExperienceDetailsPage ]]
    -- upvalues: v2 (copy)
    v3:dispatch(v2(v4));
end;
return function(v6, v7) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v8) --[[ Line: 11 ]]
        -- upvalues: v1 (ref), v6 (copy), v7 (copy), v2 (ref)
        local v9 = {
            name = v1.ExperienceDetail, 
            detail = tostring(v6), 
            extraProps = v7
        };
        v8:dispatch(v2(v9));
    end;
end;