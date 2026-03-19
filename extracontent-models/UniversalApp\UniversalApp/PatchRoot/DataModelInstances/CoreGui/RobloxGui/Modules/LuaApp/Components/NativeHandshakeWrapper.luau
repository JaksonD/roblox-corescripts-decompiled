local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local v3 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v4 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v5 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v6 = require(l_CorePackages_0.Packages.RoactNavigation);
local v7 = require(script.Parent._NativeHandshakeWrapper);
v7 = v6.withNavigation(v7);
return (v2.connect(function(_, _) --[[ Line: 44 ]]
    return {};
end, function(v10) --[[ Line: 46 ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy)
    return {
        navigateBack = function() --[[ Line: 48 ]] --[[ Name: navigateBack ]]
            -- upvalues: v10 (copy), v3 (ref)
            return v10(v3(true));
        end, 
        onError = function(v11, v12) --[[ Line: 51 ]] --[[ Name: onError ]]
            -- upvalues: v10 (copy), v4 (ref), v5 (ref)
            return v10(v4({
                toastMessage = v11, 
                toastSubMessage = v12, 
                isLocalized = true, 
                toastType = v5.NetworkingError
            }));
        end
    };
end)(v7));