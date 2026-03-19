local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.OpenNativeClosePrompt);
return function(v2, v3, v4) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    local function _() --[[ Line: 7 ]] --[[ Name: getDisplayCount ]]
        -- upvalues: v3 (copy)
        return tonumber(v3:GetItem("NativeCloseLuaPromptDisplayCount")) or 0;
    end;
    local function _(v6) --[[ Line: 11 ]] --[[ Name: setDisplayCount ]]
        -- upvalues: v3 (copy)
        v3:SetItem("NativeCloseLuaPromptDisplayCount", (tostring(v6)));
        v3:flush();
    end;
    local l_v2_NotificationTypeList_0 = v2:GetNotificationTypeList();
    return function(v9) --[[ Line: 18 ]]
        -- upvalues: v3 (copy), v4 (copy), v2 (copy), l_v2_NotificationTypeList_0 (copy), v1 (ref)
        local l_closingApp_0 = v9:getState().nativeClosePrompt.closingApp;
        local v11 = tonumber(v3:GetItem("NativeCloseLuaPromptDisplayCount")) or 0;
        if l_closingApp_0 or v4 <= v11 then
            v2:BroadcastNotification("", l_v2_NotificationTypeList_0.NATIVE_EXIT);
            return;
        else
            v9:dispatch(v1());
            local v12 = v11 + 1;
            v3:SetItem("NativeCloseLuaPromptDisplayCount", (tostring(v12)));
            v3:flush();
            return;
        end;
    end;
end;