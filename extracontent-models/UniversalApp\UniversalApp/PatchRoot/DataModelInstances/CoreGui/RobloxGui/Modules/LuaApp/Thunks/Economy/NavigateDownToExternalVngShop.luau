local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.AppPage);
local v3 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v4 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v5 = require(l_Modules_0.LuaApp.Thunks.Economy.ApiFetchVngShopUrl);
local l_GetFStringVNGWebshopUrl_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringVNGWebshopUrl;
return function(v7, v8) --[[ Line: 13 ]]
    -- upvalues: v5 (copy), l_GetFStringVNGWebshopUrl_0 (copy), v3 (copy), v2 (copy), v4 (copy)
    return function(v9) --[[ Line: 14 ]]
        -- upvalues: v5 (ref), v8 (copy), l_GetFStringVNGWebshopUrl_0 (ref), v3 (ref), v2 (ref), v7 (copy), v4 (ref)
        v9:dispatch(v5(v8)):andThen(function(v10) --[[ Line: 17 ]]
            -- upvalues: l_GetFStringVNGWebshopUrl_0 (ref), v9 (copy), v3 (ref), v2 (ref), v7 (ref), v4 (ref)
            local v11 = v10.vngShopRedirectUrl or l_GetFStringVNGWebshopUrl_0();
            v9:dispatch(v3({
                name = v2.GenericWebPage, 
                detail = v11, 
                extraProps = {
                    onClose = v7
                }
            }));
            v9:dispatch(v4());
        end):catch(function(_) --[[ Line: 28 ]]
            -- upvalues: l_GetFStringVNGWebshopUrl_0 (ref), v9 (copy), v3 (ref), v2 (ref), v7 (ref), v4 (ref)
            local v13 = l_GetFStringVNGWebshopUrl_0();
            v9:dispatch(v3({
                name = v2.GenericWebPage, 
                detail = v13, 
                extraProps = {
                    onClose = v7
                }
            }));
            v9:dispatch(v4());
        end);
    end;
end;