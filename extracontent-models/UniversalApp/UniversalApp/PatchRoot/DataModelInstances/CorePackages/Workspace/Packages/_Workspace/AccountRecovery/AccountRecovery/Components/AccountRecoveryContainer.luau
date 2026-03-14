local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactNavigation);
local v4 = require(l_Parent_0.UIBlox);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_DarkTheme_0 = v4.App.Style.Themes.DarkTheme;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local l_useIOSStatusBarStyler_0 = require(l_Parent_0.RoactUtils).Hooks.useIOSStatusBarStyler;
local _ = require(l_script_FirstAncestor_0.Store.State);
local v11 = require(l_script_FirstAncestor_0.Store.AccountRecoveryContextProvider);
local v12 = require(l_script_FirstAncestor_0.Navigators.AccountRecoveryStackNavigator);
local v14 = l_memoize_0(function(v13) --[[ Line: 23 ]]
    -- upvalues: v3 (copy)
    return v3.createAppContainer(v13);
end);
return function(v15) --[[ Line: 27 ]]
    -- upvalues: l_useNavigation_0 (copy), l_useStyle_0 (copy), v14 (copy), v12 (copy), v2 (copy), v3 (copy), l_useIOSStatusBarStyler_0 (copy), l_DarkTheme_0 (copy), v11 (copy)
    local v16 = l_useNavigation_0();
    local v17 = l_useStyle_0();
    local v18 = v14(v12);
    local v19 = v2.useRef(nil);
    local v21 = v2.useCallback(function(v20) --[[ Line: 34 ]]
        -- upvalues: v19 (copy)
        v19.current = v20;
        return function() --[[ Line: 36 ]]
            -- upvalues: v19 (ref)
            v19.current = nil;
        end;
    end, {});
    local v23 = v2.useCallback(function() --[[ Line: 41 ]]
        -- upvalues: v19 (copy), v3 (ref)
        local l_current_0 = v19.current;
        if l_current_0 then
            l_current_0(v3.StackActions.popToTop());
        end;
    end, {});
    l_useIOSStatusBarStyler_0(v17.Theme == l_DarkTheme_0);
    return v2.createElement(v11, {
        parentNavigation = v16, 
        monoDeps = v15.monoDeps, 
        resetChildNavigationToFirstScreen = v23
    }, {
        NavigationAppContainer = v2.createElement(v18, {
            externalDispatchConnector = v21
        })
    });
end;