local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function(v3, v4) --[[ Line: 7 ]] --[[ Name: openRequestRefundPage ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v5) --[[ Line: 8 ]]
        -- upvalues: v1 (ref), v3 (copy), v4 (copy), v2 (ref)
        local v6 = {
            name = v1.GenericWebPage, 
            detail = v3, 
            extraProps = {
                titleKey = "Feature.PaidAccessRefunds.Webview.Title.RequestRefund", 
                onClose = v4
            }
        };
        v5:dispatch(v2(v6));
    end;
end;