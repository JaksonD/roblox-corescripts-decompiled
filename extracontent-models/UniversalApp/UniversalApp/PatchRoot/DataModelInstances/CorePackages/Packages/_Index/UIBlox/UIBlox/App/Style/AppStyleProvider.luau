local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Utility.getTextSizeOffset);
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_2.Roact);
local v6 = l_Parent_1:FindFirstAncestor("Packages") or l_Parent_1:FindFirstAncestor("CorePackages");
local v7 = if v6 and v6:FindFirstChild("Dev") and v6.Dev:FindFirstChild("JestGlobals") then pcall(require, v6.Dev.JestGlobals) else false;
local v8 = require(l_Parent_2.Foundation);
local l_FoundationProvider_0 = v8.FoundationProvider;
local l_useTokens_0 = v8.Hooks.useTokens;
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v12 = require(l_Parent_0.Themes.getThemeFromName);
local v13 = require(l_Parent_0.Fonts.getFontFromName);
local v14 = require(l_Parent_0.Constants);
local _ = require(script.Parent.StyleTypes);
local v16 = require(script.Parent.Tokens);
local v17 = require(l_Parent_1.Core.Style.StyleContext);
local v18 = require(l_Parent_1.Logger);
local l_getTokens_0 = v16.getTokens;
local l_validateTokens_0 = v16.validateTokens;
local l_getFoundationTokens_0 = v16.getFoundationTokens;
local l_Mappers_0 = v16.Mappers;
local v23 = {
    dark = v8.Enums.Theme.Dark, 
    light = v8.Enums.Theme.Light
};
local v24 = {
    themeName = v14.DefaultThemeName, 
    fontName = v14.DefaultFontName, 
    deviceType = v14.DefaultDeviceType, 
    settings = v14.DefaultSettings
};
return function(v25) --[[ Line: 80 ]] --[[ Name: AppStyleProvider ]]
    -- upvalues: l_Object_0 (copy), v24 (copy), v4 (copy), l_getTokens_0 (copy), v12 (copy), l_useTokens_0 (copy), l_getFoundationTokens_0 (copy), l_Mappers_0 (copy), l_validateTokens_0 (copy), v13 (copy), v14 (copy), v2 (copy), v17 (copy), v5 (copy), v7 (copy), v18 (copy), l_FoundationProvider_0 (copy), v23 (copy)
    local v26 = l_Object_0.assign({}, v24, v25.style);
    local v27, v28 = v4.useState(v26.themeName);
    local v29 = v26.settings and v26.settings.scale;
    local v30 = l_getTokens_0(v26.deviceType, v27, v29);
    local v31, v32 = v4.useState(0);
    local v33 = v12(v27);
    local v34 = l_useTokens_0().Config ~= nil;
    local v35 = l_getFoundationTokens_0(v26.deviceType, v27);
    v30 = l_Mappers_0.mapColorTokensToFoundation(v30, v35);
    v33 = l_Mappers_0.mapThemeToFoundation(v33, v35);
    assert(l_validateTokens_0(v30), "Invalid tokens!");
    local v36 = {
        Font = v13(v26.fontName, v30), 
        Theme = v33, 
        Tokens = v30, 
        Settings = if v26.settings then {
            PreferredTransparency = v26.settings.preferredTransparency, 
            ReducedMotion = v26.settings.reducedMotion, 
            PreferredTextSize = v26.settings.preferredTextSize, 
            Scale = v26.settings.scale
        } else v14.DefaultSettings
    };
    local v37 = v4.useRef(false);
    v4.useEffect(function() --[[ Line: 110 ]]
        -- upvalues: v37 (copy), v28 (copy), v26 (copy)
        v37.current = true;
        v28(v26.themeName);
        return function() --[[ Line: 113 ]]
            -- upvalues: v37 (ref)
            v37.current = false;
        end;
    end, {
        v37, 
        v26.themeName, 
        v28
    });
    v4.useEffect(function() --[[ Line: 118 ]]
        -- upvalues: v2 (ref), v30 (ref), v32 (copy)
        local v38, v39 = v2(v30.Semantic.Typography.Body.Font);
        if v38 then
            v32(v39);
        end;
    end, {
        v26.settings.preferredTextSize
    });
    local v42 = v4.useCallback(function(_, v41) --[[ Line: 125 ]]
        -- upvalues: v37 (copy), v28 (copy)
        if v37.current then
            v28(v41);
        end;
    end, {
        v37, 
        v28
    });
    local v43 = v4.useMemo(function() --[[ Line: 131 ]]
        -- upvalues: v27 (copy), v14 (ref)
        if v27:lower() == v14.ThemeName.Dark:lower() then
            return v14.ThemeName.Dark;
        elseif v27:lower() == v14.ThemeName.Light:lower() then
            return v14.ThemeName.Light;
        else
            return v14.DefaultThemeName;
        end;
    end, {
        v27
    });
    local v44 = v4.createElement(v17.Provider, {
        value = {
            style = v36, 
            updateTheme = v42, 
            derivedValues = {
                textSizeOffset = v31
            }, 
            styleMetadata = {
                ThemeName = v43
            }
        }
    }, v5.oneChild(v25.children));
    if not v34 then
        if not v7 and _G.__DEV__ then
            v18:warning(debug.traceback("FoundationProvider not found. Please ensure that the FoundationProvider is present in the component tree."));
        end;
        return v4.createElement(l_FoundationProvider_0, {
            theme = v23[v27:lower()], 
            device = v26.deviceType, 
            preferences = v26.settings
        }, v44);
    else
        return v44;
    end;
end;