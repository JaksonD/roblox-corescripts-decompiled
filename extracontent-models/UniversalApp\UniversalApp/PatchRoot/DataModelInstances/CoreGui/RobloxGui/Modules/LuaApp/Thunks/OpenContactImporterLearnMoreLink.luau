local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function() --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v3) --[[ Line: 8 ]]
        -- upvalues: v2 (ref), v1 (ref)
        v3:dispatch(v2({
            name = v1.GenericWebPage, 
            detail = "https://en.help.roblox.com/hc/articles/7416652004884", 
            extraProps = {
                title = ""
            }
        }, nil));
    end;
end;