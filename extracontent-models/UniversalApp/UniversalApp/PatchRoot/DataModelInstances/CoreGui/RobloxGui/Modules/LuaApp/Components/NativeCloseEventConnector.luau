local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_l_GuiService_0_NotificationTypeList_0 = l_GuiService_0:GetNotificationTypeList();
return function(v5) --[[ Line: 7 ]] --[[ Name: NativeCloseEventConnector ]]
    -- upvalues: l_useDispatch_0 (copy), v2 (copy), l_GuiService_0 (copy), l_l_GuiService_0_NotificationTypeList_0 (copy)
    local v6 = l_useDispatch_0();
    local v7 = v2.useCallback(function() --[[ Line: 10 ]]
        -- upvalues: v6 (copy), v5 (copy), l_GuiService_0 (ref), l_l_GuiService_0_NotificationTypeList_0 (ref)
        if not v6(v5.onNativeCloseEvent()) then
            l_GuiService_0:BroadcastNotification("", l_l_GuiService_0_NotificationTypeList_0.NATIVE_EXIT);
        end;
    end, {
        v6, 
        v5.onNativeCloseEvent
    });
    v2.useEffect(function() --[[ Line: 18 ]]
        -- upvalues: l_GuiService_0 (ref), v7 (copy)
        local v8 = l_GuiService_0.NativeClose:Connect(v7);
        return function() --[[ Line: 21 ]]
            -- upvalues: v8 (copy)
            v8:Disconnect();
        end;
    end, {
        v5.onNativeCloseEvent
    });
end;