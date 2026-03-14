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
local v16 = v14 or v15;
local v17 = {
    dark = l_Theme_0.Dark, 
    light = l_Theme_0.Light
};
local function _() --[[ Line: 48 ]] --[[ Name: useTokenScale ]]
    -- upvalues: v5 (copy), l_getUIScale_0 (copy)
    return (v5.useSignalState(l_getUIScale_0));
end;
local function v30(v19) --[[ Line: 53 ]] --[[ Name: UiModeStyleProvider ]]
    -- upvalues: l_useDeviceType_0 (copy), v16 (copy), v5 (copy), l_getUIScale_0 (copy), v4 (copy), l_UserGameSettings_0 (copy), v3 (copy), l_dependencyArray_0 (copy), l_FoundationProvider_0 (copy), v17 (copy), l_AppStyleProvider_0 (copy)
    local v20 = l_useDeviceType_0();
    local v21 = nil;
    if v16 then
        v21 = v5.useSignalState(l_getUIScale_0);
    end;
    local v22, v23 = v4.useState({
        preferredTransparency = l_UserGameSettings_0.PreferredTransparency, 
        reducedMotion = l_UserGameSettings_0.ReducedMotion, 
        preferredTextSize = l_UserGameSettings_0.PreferredTextSize
    });
    v4.useEffect(function() --[[ Line: 67 ]]
        -- upvalues: v23 (copy), l_UserGameSettings_0 (ref)
        local function v24() --[[ Line: 68 ]] --[[ Name: updateSettings ]]
            -- upvalues: v23 (ref), l_UserGameSettings_0 (ref)
            v23({
                preferredTransparency = l_UserGameSettings_0.PreferredTransparency, 
                reducedMotion = l_UserGameSettings_0.ReducedMotion, 
                preferredTextSize = l_UserGameSettings_0.PreferredTextSize
            });
        end;
        local v25 = l_UserGameSettings_0:GetPropertyChangedSignal("PreferredTransparency"):Connect(v24);
        local v26 = l_UserGameSettings_0:GetPropertyChangedSignal("ReducedMotion"):Connect(v24);
        local v27 = l_UserGameSettings_0:GetPropertyChangedSignal("PreferredTextSize"):Connect(v24);
        return function() --[[ Line: 82 ]]
            -- upvalues: v25 (copy), v26 (copy), v27 (copy)
            v25:Disconnect();
            v26:Disconnect();
            v27:Disconnect();
        end;
    end, {});
    local l_style_0 = v19.style;
    local v29 = v4.useMemo(function() --[[ Line: 90 ]]
        -- upvalues: v3 (ref), l_style_0 (copy), v20 (copy), v16 (ref), v22 (copy), v21 (ref)
        return v3.Dictionary.join({
            deviceType = l_style_0.deviceType or v20
        }, l_style_0, {
            settings = if v16 then v3.Dictionary.join(v22, {
                scale = v21
            }) else v22
        });
    end, l_dependencyArray_0(l_style_0, v20, v22, v21));
    return v4.createElement(l_FoundationProvider_0, {
        device = v29.deviceType, 
        theme = v17[v29.themeName:lower()], 
        preferences = v29.settings, 
        DONOTUSE_colorUpdate = true
    }, v4.createElement(l_AppStyleProvider_0, {
        style = v29
    }, v19.children));
end;
return function(v31) --[[ Line: 120 ]] --[[ Name: ThemeProvider ]]
    -- upvalues: v4 (copy), v3 (copy), v8 (copy), v30 (copy)
    local v32, v33 = v4.useState(v31.style.themeName);
    local v34 = table.clone(v31);
    v34.style = v3.Dictionary.join(v34.style, {
        themeName = v32
    });
    return v4.createElement(v8.Provider, {
        value = {
            theme = v32, 
            setTheme = v33
        }
    }, v4.createElement(v30, v34));
end;