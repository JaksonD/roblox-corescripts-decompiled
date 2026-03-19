local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Shell_0 = l_Modules_0:FindFirstChild("Shell");
local v2 = nil;
local v3 = nil;
if l_Shell_0 then
    v2 = require(l_Modules_0.Shell.Actions.RemoveScreen);
    v3 = require(l_Modules_0.Shell.EventHub);
end;
return function(_) --[[ Line: 66 ]]
    -- upvalues: l_Shell_0 (copy), v2 (ref), v3 (ref)
    return function(v5) --[[ Line: 67 ]]
        -- upvalues: l_Shell_0 (ref), v2 (ref), v3 (ref)
        if not l_Shell_0 then
            return;
        else
            local l_ScreenList_0 = v5:getState().ScreenList;
            if l_ScreenList_0 then
                spawn(function() --[[ Line: 80 ]]
                    -- upvalues: l_ScreenList_0 (copy), v5 (copy), v2 (ref), v3 (ref)
                    local v7 = l_ScreenList_0[1];
                    v5:dispatch(v2(v7));
                    v3:dispatchEvent(v3.Notifications.NavigateToRobuxScreen);
                end);
            end;
            return;
        end;
    end;
end;