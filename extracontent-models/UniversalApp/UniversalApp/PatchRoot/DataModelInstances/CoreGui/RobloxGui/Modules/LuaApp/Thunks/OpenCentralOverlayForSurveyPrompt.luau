local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v2 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
return function(v3, v4, v5, v6, v7, v8) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v9) --[[ Line: 9 ]]
        -- upvalues: v2 (ref), v1 (ref), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy)
        v9:dispatch(v2(v1.SurveyPrompt, {
            continueFunc = v3, 
            closeFunc = v4, 
            titleText = v5, 
            bodyText = v6, 
            cancelButtonText = v7, 
            confirmButtonText = v8
        }));
    end;
end;