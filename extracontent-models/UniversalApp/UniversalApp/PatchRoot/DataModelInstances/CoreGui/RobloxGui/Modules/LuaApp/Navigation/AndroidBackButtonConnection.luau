local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local l_GuiService_0 = game:GetService("GuiService");
return function() --[[ Line: 7 ]]
    -- upvalues: l_GuiService_0 (copy), v1 (copy)
    local v3 = nil;
    local function v4() --[[ Line: 10 ]]
        -- upvalues: v3 (ref)
        if v3 then
            v3:Disconnect();
            v3 = nil;
        end;
    end;
    local function v6(v5) --[[ Line: 17 ]]
        -- upvalues: v3 (ref), l_GuiService_0 (ref)
        if v3 and v3 then
            v3:Disconnect();
            v3 = nil;
        end;
        if l_GuiService_0 then
            v3 = l_GuiService_0.ShowLeaveConfirmation:Connect(v5);
        end;
    end;
    local function v7() --[[ Line: 26 ]]
        -- upvalues: l_GuiService_0 (ref), v1 (ref)
        if l_GuiService_0 and v1 then
            l_GuiService_0:BroadcastNotification("", v1.BACK_BUTTON_NOT_CONSUMED);
        end;
    end;
    return {
        disconnect = v4, 
        connect = v6, 
        showExitDialog = v7
    };
end;