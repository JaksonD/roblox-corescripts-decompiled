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
local v15 = require(l_Parent_1.UIBloxConfig);
local _ = require(script.Parent.StyleTypes);
local v17 = require(script.Parent.Tokens);
local v18 = require(l_Parent_1.Core.Style.StyleContext);
local v19 = require(l_Parent_1.Logger);
local l_getTokens_0 = v17.getTokens;
local l_validateTokens_0 = v17.validateTokens;
local l_getFoundationTokens_0 = v17.getFoundationTokens;
local l_Mappers_0 = v17.Mappers;
local v24 = {
    dark = v8.Enums.Theme.Dark, 
    light = v8.Enums.Theme.Light
};
local v25 = {
    themeName = v14.DefaultThemeName, 
    fontName = v14.DefaultFontName, 
    deviceType = v14.DefaultDeviceType, 
    settings = v14.DefaultSettings
};
return function(v26) --[[ Line: 83 ]] --[[ Name: AppStyleProvider ]]
    -- upvalues: l_Object_0 (copy), v25 (copy), v4 (copy), l_getTokens_0 (copy), v12 (copy), l_useTokens_0 (copy), l_getFoundationTokens_0 (copy), l_Mappers_0 (copy), v15 (copy), l_validateTokens_0 (copy), v13 (copy), v14 (copy), v2 (copy), v18 (copy), v5 (copy), v7 (copy), v19 (copy), l_FoundationProvider_0 (copy), v24 (copy)
    local v27 = l_Object_0.assign({}, v25, v26.style);
    local v28, v29 = v4.useState(v27.themeName);
    local v30 = v27.settings and v27.settings.scale;
    local v31 = l_getTokens_0(v27.deviceType, v28, v30);
    local v32, v33 = v4.useState(0);
    local v34 = v12(v28);
    local v35 = l_useTokens_0();
    local v36 = v35.Config ~= nil;
    local v37 = l_getFoundationTokens_0(v27.deviceType, v28);
    v31 = l_Mappers_0.mapColorTokensToFoundation(v31, v37);
    v34 = l_Mappers_0.mapThemeToFoundation(v34, if v15.useColorTokensForThemeMapping and v36 then v35 else v37);
    assert(l_validateTokens_0(v31), "Invalid tokens!");
    local v38 = if v15.enableFoundationTokenMapping then l_Mappers_0.addFoundationFlatKeys(v31, v37) else v31;
    local v39 = {
        Font = v13(v27.fontName, v38), 
        Theme = v34, 
        Tokens = v38, 
        Settings = if v27.settings then {
            PreferredTransparency = v27.settings.preferredTransparency, 
            ReducedMotion = v27.settings.reducedMotion, 
            PreferredTextSize = v27.settings.preferredTextSize, 
            Scale = v27.settings.scale
        } else v14.DefaultSettings
    };
    local v40 = v4.useRef(false);
    v4.useEffect(function() --[[ Line: 123 ]]
        -- upvalues: v40 (copy), v29 (copy), v27 (copy)
        v40.current = true;
        v29(v27.themeName);
        return function() --[[ Line: 126 ]]
            -- upvalues: v40 (ref)
            v40.current = false;
        end;
    end, {
        v40, 
        v27.themeName, 
        v29
    });
    v4.useEffect(function() --[[ Line: 131 ]]
        -- upvalues: v2 (ref), v38 (copy), v33 (copy)
        local v41, v42 = v2(v38.Semantic.Typography.Body.Font);
        if v41 then
            v33(v42);
        end;
    end, {
        v27.settings.preferredTextSize
    });
    local v45 = v4.useCallback(function(_, v44) --[[ Line: 138 ]]
        -- upvalues: v40 (copy), v29 (copy)
        if v40.current then
            v29(v44);
        end;
    end, {
        v40, 
        v29
    });
    local v46 = v4.useMemo(function() --[[ Line: 144 ]]
        -- upvalues: v28 (copy), v14 (ref)
        if v28:lower() == v14.ThemeName.Dark:lower() then
            return v14.ThemeName.Dark;
        elseif v28:lower() == v14.ThemeName.Light:lower() then
            return v14.ThemeName.Light;
        else
            return v14.DefaultThemeName;
        end;
    end, {
        v28
    });
    local v47 = v4.createElement(v18.Provider, {
        value = {
            style = v39, 
            updateTheme = v45, 
            derivedValues = {
                textSizeOffset = v32
            }, 
            styleMetadata = {
                ThemeName = v46
            }
        }
    }, v5.oneChild(v26.children));
    if not v36 then
        if not v7 and _G.__DEV__ then
            v19:warning(debug.traceback("FoundationProvider not found. Please ensure that the FoundationProvider is present in the component tree."));
        end;
        return v4.createElement(l_FoundationProvider_0, {
            theme = v24[v28:lower()], 
            device = v27.deviceType, 
            preferences = v27.settings
        }, v47);
    else
        return v47;
    end;
end;