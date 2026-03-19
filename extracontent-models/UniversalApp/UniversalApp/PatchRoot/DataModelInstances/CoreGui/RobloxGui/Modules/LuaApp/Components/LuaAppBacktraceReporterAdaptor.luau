local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = game:DefineFastFlag("EnableVirtualizedListBacktraceTag", false);
local v8 = require(l_Modules_0.LuaApp.LuaAppBacktraceReporter);
local v9 = require(l_Modules_0.LuaApp.Util.safeCall);
local v10 = game:DefineFastFlag("EnableRoact17BacktraceTag", false);
local v11 = v5.PureComponent:extend("LuaAppBacktraceReporterAdaptor");
v11.updateAppGenericAttributes = function(_, _) --[[ Line: 18 ]] --[[ Name: updateAppGenericAttributes ]]
    -- upvalues: v9 (copy), l_NotificationService_0 (copy), l_LocalizationService_0 (copy), v8 (copy), v10 (copy), v7 (copy)
    local v14 = v9(function() --[[ Line: 19 ]]
        -- upvalues: l_NotificationService_0 (ref), l_LocalizationService_0 (ref)
        return {
            AppTheme = tostring(l_NotificationService_0.SelectedTheme), 
            Locale = tostring(l_LocalizationService_0.RobloxLocaleId)
        };
    end, {});
    v8:updateSharedAttributes(v14);
    v8:updateSharedAttributes({
        RoactNavigationVersion = "0.5.3"
    });
    if v10 then
        v8:updateSharedAttributes({
            Roact17Version = "17.0.1"
        });
    end;
    if v7 then
        v8:updateSharedAttributes({
            VirtualizedListVersion = "1.1.2"
        });
    end;
end;
v11.updateStoreAnnotations = function(v15) --[[ Line: 46 ]] --[[ Name: updateStoreAnnotations ]]
    -- upvalues: v8 (copy)
    v8:updateSharedAnnotations(v15.props);
end;
v11.didMount = function(v16) --[[ Line: 50 ]] --[[ Name: didMount ]]
    v16:updateAppGenericAttributes(v16.props);
end;
v11.render = function(_) --[[ Line: 54 ]] --[[ Name: render ]]
    return nil;
end;
v11.didUpdate = function(v18, _) --[[ Line: 58 ]] --[[ Name: didUpdate ]]
    v18:updateStoreAnnotations();
end;
return (v6.connect(function(v20, _) --[[ Line: 62 ]]
    -- upvalues: v9 (copy)
    return v9(function() --[[ Line: 65 ]]
        -- upvalues: v20 (copy)
        return {
            FormFactor = v20.FormFactor, 
            isLocalUserSoothsayer = v20.IsLocalUserSoothsayer, 
            GlobalGuiInset = v20.GlobalGuiInset
        };
    end, {});
end)(v11));