local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_NotificationType_0 = require(l_Parent_0.RobloxAppEnums).NotificationType;
local v5 = require(l_Parent_0.React);
local v6 = {
    LIGHT = "lightcontent", 
    DEFAULT = "default"
};
local function v8(v7) --[[ Line: 19 ]]
    -- upvalues: l_UserInputService_0 (copy), l_GuiService_0 (copy), l_HttpService_0 (copy), l_NotificationType_0 (copy)
    if l_UserInputService_0:GetPlatform() == Enum.Platform.IOS then
        l_GuiService_0:BroadcastNotification(l_HttpService_0:JSONEncode({
            style = v7
        }), l_NotificationType_0.SET_STATUS_BAR_STYLE);
    end;
end;
return function(v9, v10) --[[ Line: 31 ]] --[[ Name: useIOSStatusBarStyler ]]
    -- upvalues: v8 (copy), v5 (copy), v6 (copy)
    local v11 = v10 or v8;
    v5.useEffect(function() --[[ Line: 34 ]]
        -- upvalues: v9 (copy), v6 (ref), v11 (copy)
        local v12 = if v9 then v6.LIGHT else v6.DEFAULT;
        v11(v12);
        return function() --[[ Line: 37 ]]
            -- upvalues: v11 (ref)
            v11("default");
        end;
    end, {
        v9
    });
end;