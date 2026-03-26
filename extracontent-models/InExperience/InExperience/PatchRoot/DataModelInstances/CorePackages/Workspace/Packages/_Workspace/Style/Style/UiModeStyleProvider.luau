local l_script_FirstAncestor_0 = script:FindFirstAncestor("Style");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.SignalsReact);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useDeviceType_0 = require(l_Parent_0.RobloxAppHooks).useDeviceType;
local v8 = require(script.Parent.ThemeContext);
local l_AppStyleProvider_0 = require(l_Parent_0.UIBlox).App.Style.AppStyleProvider;
local v10 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v10.FoundationProvider;
local l_Theme_0 = v10.Enums.Theme;
local l_getUIScale_0 = require(l_Parent_0.Display).GetDisplayStore(false).getUIScale;
local v14 = game:DefineFastFlag("LuaAppEnableWindowsHandheldTokenScale", false) and game:GetEngineFeature("EnableDisplaySize");
local v15 = game:DefineFastFlag("DebugLuaAppEnableTokenScale", false);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v17 = v14 or v15;
local v18 = {
    dark = l_Theme_0.Dark, 
    light = l_Theme_0.Light
};
local function _() --[[ Line: 50 ]] --[[ Name: useTokenScale ]]
    -- upvalues: v5 (copy), l_getUIScale_0 (copy)
    return (v5.useSignalState(l_getUIScale_0));
end;
local function v31(v20) --[[ Line: 55 ]] --[[ Name: UiModeStyleProvider ]]
    -- upvalues: l_useDeviceType_0 (copy), v17 (copy), v5 (copy), l_getUIScale_0 (copy), v4 (copy), l_UserGameSettings_0 (copy), v3 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_FoundationProvider_0 (copy), v18 (copy), l_AppStyleProvider_0 (copy)
    local v21 = l_useDeviceType_0();
    local v22 = nil;
    if v17 then
        v22 = v5.useSignalState(l_getUIScale_0);
    end;
    local v23, v24 = v4.useState({
        preferredTransparency = l_UserGameSettings_0.PreferredTransparency, 
        reducedMotion = l_UserGameSettings_0.ReducedMotion, 
        preferredTextSize = l_UserGameSettings_0.PreferredTextSize
    });
    v4.useEffect(function() --[[ Line: 69 ]]
        -- upvalues: v24 (copy), l_UserGameSettings_0 (ref)
        local function v25() --[[ Line: 70 ]] --[[ Name: updateSettings ]]
            -- upvalues: v24 (ref), l_UserGameSettings_0 (ref)
            v24({
                preferredTransparency = l_UserGameSettings_0.PreferredTransparency, 
                reducedMotion = l_UserGameSettings_0.ReducedMotion, 
                preferredTextSize = l_UserGameSettings_0.PreferredTextSize
            });
        end;
        local v26 = l_UserGameSettings_0:GetPropertyChangedSignal("PreferredTransparency"):Connect(v25);
        local v27 = l_UserGameSettings_0:GetPropertyChangedSignal("ReducedMotion"):Connect(v25);
        local v28 = l_UserGameSettings_0:GetPropertyChangedSignal("PreferredTextSize"):Connect(v25);
        return function() --[[ Line: 84 ]]
            -- upvalues: v26 (copy), v27 (copy), v28 (copy)
            v26:Disconnect();
            v27:Disconnect();
            v28:Disconnect();
        end;
    end, {});
    local l_style_0 = v20.style;
    local v30 = v4.useMemo(function() --[[ Line: 93 ]]
        -- upvalues: v3 (ref), l_style_0 (copy), v21 (copy), v17 (ref), v23 (copy), v22 (ref)
        return v3.Dictionary.join({
            deviceType = l_style_0.deviceType or v21
        }, l_style_0, {
            settings = if v17 then v3.Dictionary.join(v23, {
                scale = v22
            }) else v23
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        l_style_0, 
        v21, 
        v23, 
        v22
    } else l_dependencyArray_0(l_style_0, v21, v23, v22));
    return v4.createElement(l_FoundationProvider_0, {
        device = v30.deviceType, 
        theme = v18[v30.themeName:lower()], 
        preferences = v30.settings, 
        DONOTUSE_colorUpdate = true
    }, v4.createElement(l_AppStyleProvider_0, {
        style = v30
    }, v20.children));
end;
return function(v32) --[[ Line: 127 ]] --[[ Name: ThemeProvider ]]
    -- upvalues: v4 (copy), v3 (copy), v8 (copy), v31 (copy)
    local v33, v34 = v4.useState(v32.style.themeName);
    local v35 = table.clone(v32);
    v35.style = v3.Dictionary.join(v35.style, {
        themeName = v33
    });
    return v4.createElement(v8.Provider, {
        value = {
            theme = v33, 
            setTheme = v34
        }
    }, v4.createElement(v31, v35));
end;