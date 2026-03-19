local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_Object_0 = require(l_CorePackages_0.Packages.LuauPolyfill).Object;
local l_useEarlyIsFocused_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useEarlyIsFocused;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v7 = require(l_Modules_0.LuaApp.mapTransitionAnimationToNativeString);
local v8 = require(script.Parent.WebView);
local v9 = require(l_Modules_0.LuaApp.Flags.GetFFlagWebViewServiceHasBackButtonVisibility);
local function _(v10, v11) --[[ Line: 23 ]] --[[ Name: useTitle ]]
    -- upvalues: l_useLocalization_0 (copy)
    local v12 = l_useLocalization_0({
        titleKey = v11
    });
    return v10 or v12.titleKey;
end;
local function v17(v14) --[[ Line: 30 ]] --[[ Name: useLatestCallbackOnUnmount ]]
    -- upvalues: v2 (copy)
    local v15 = v2.useRef(v14);
    v2.useEffect(function() --[[ Line: 33 ]]
        -- upvalues: v15 (copy), v14 (copy)
        v15.current = v14;
    end, {
        v14
    });
    v2.useEffect(function() --[[ Line: 37 ]]
        -- upvalues: v15 (copy)
        return function() --[[ Line: 38 ]]
            -- upvalues: v15 (ref)
            local l_current_0 = v15.current;
            if l_current_0 ~= nil then
                l_current_0();
            end;
        end;
    end, {});
end;
return function(v18) --[[ Line: 47 ]] --[[ Name: AppWebView ]]
    -- upvalues: l_useEarlyIsFocused_0 (copy), l_useNavigation_0 (copy), l_useLocalization_0 (copy), v17 (copy), v2 (copy), v8 (copy), l_Object_0 (copy), v7 (copy), v9 (copy)
    local v19 = l_useEarlyIsFocused_0();
    local v20 = l_useNavigation_0();
    local l_title_0 = v18.title;
    local l_titleKey_0 = v18.titleKey;
    local v23 = l_useLocalization_0({
        titleKey = l_titleKey_0
    });
    local v24 = l_title_0 or v23.titleKey;
    v17(v18.windowCloseCallback);
    if v19 then
        return (v2.createElement(v8, l_Object_0.assign({}, v18, {
            title = v24, 
            transitionAnimation = v7(v18.transitionAnimation), 
            windowCloseCallback = v20.goBack, 
            hasBackButton = if v9() then v18.hasBackButton else nil
        })));
    else
        return nil;
    end;
end;