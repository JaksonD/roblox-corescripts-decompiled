local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Analytics.Events.accountSecurityPromptEvent);
local v2 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.DisplayType);
local v3 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v4 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v5 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptType);
local v6 = require(l_Modules_0.LuaApp.Actions.AccountSecurity.UpdatePromptType);
return function(v7, v8, v9, v10) --[[ Line: 12 ]]
    -- upvalues: v5 (copy), v2 (copy), v4 (copy), v1 (copy), v3 (copy), v6 (copy)
    local v11 = true;
    if v9 ~= nil then
        v11 = v5.isEnumValue(v9) or v8 and typeof(v10) == "table" and v2.isEnumValue(v2.fromRawValue(v10.displayType));
    end;
    assert(v11, "Invalid arguments for UpdatePromptTypeWithEvent");
    return function(v12) --[[ Line: 24 ]]
        -- upvalues: v9 (copy), v4 (ref), v5 (ref), v1 (ref), v7 (copy), v3 (ref), v6 (ref), v8 (copy), v10 (copy)
        local l_AccountSecurityPrompt_0 = v12:getState().AccountSecurityPrompt;
        local l_OverlayType_0 = v12:getState().CentralOverlay.OverlayType;
        local l_promptType_0 = l_AccountSecurityPrompt_0.promptType;
        if v9 ~= nil and l_OverlayType_0 ~= v4.AccountSecurityPromptOverlay and v9 ~= l_promptType_0 then
            local v16 = v5.toRawValue(v9);
            if v16 == nil then
                v16 = v9;
            end;
            v1(v7.EventStream, v3.Context.ModalStateViewed, v16, "NONE");
        end;
        v12:dispatch(v6(v8, v9, v10));
    end;
end;