local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_Modules_0.LuaApp.AppPage);
local v3 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v4 = require(l_Modules_0.LuaApp.Thunks.ApiFetchIAPProducts);
local v5 = require(l_Modules_0.LuaApp.Thunks.Economy.OpenNativePurchase);
local v6 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v7 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
return function(v8) --[[ Line: 12 ]]
    -- upvalues: v7 (copy), v4 (copy), v3 (copy), l_UserInputService_0 (copy), v6 (copy), v2 (copy), v5 (copy)
    return {
        dispatchCentralOverlay = function(v9, v10) --[[ Line: 14 ]] --[[ Name: dispatchCentralOverlay ]]
            -- upvalues: v8 (copy), v7 (ref)
            return v8(v7(v9, v10));
        end, 
        dispatchFetchIAPProducts = function(v11) --[[ Line: 17 ]] --[[ Name: dispatchFetchIAPProducts ]]
            -- upvalues: v8 (copy), v4 (ref)
            v8(v4.Fetch(v11));
        end, 
        closeCentralOverlay = function() --[[ Line: 20 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v8 (copy), v3 (ref)
            v8(v3());
        end, 
        promptPremium = function(v12, v13) --[[ Line: 23 ]] --[[ Name: promptPremium ]]
            -- upvalues: l_UserInputService_0 (ref), v8 (copy), v6 (ref), v2 (ref), v5 (ref)
            local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
            if l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows or l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
                v8(v6({
                    name = v2.BuildersClub
                }));
                return;
            else
                v8(v5(v12, v13));
                return;
            end;
        end
    };
end;