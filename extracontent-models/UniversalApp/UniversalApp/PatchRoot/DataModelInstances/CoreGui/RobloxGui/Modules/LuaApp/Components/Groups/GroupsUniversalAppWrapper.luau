local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).useNavigationProps;
local l_useLocalUserId_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useLocalUserId;
local v7 = require(l_CorePackages_0.Workspace.Packages.Groups);
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local v10 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDown);
local v11 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local v12 = require(l_script_FirstAncestor_0.LuaApp.Navigation.AndroidBackButtonNavigationHandler.Container);
local v13 = require(l_script_FirstAncestor_0.LuaApp.Navigation.isRootRouteInRN);
local v14 = require(l_CorePackages_0.Packages.UrlBuilder);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_UrlBuilder_0 = v14.UrlBuilder;
local l_UrlBase_0 = v14.UrlBase;
local l_GroupsNavigatorWithProviders_0 = v7.Navigation.GroupsNavigatorWithProviders;
local l_GroupsWrapperContext_0 = v7.Contexts.GroupsWrapperContext;
local function v34(_) --[[ Line: 39 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useLocalUserId_0 (copy), l_useNavigationProps_0 (copy), v2 (copy), v10 (copy), v11 (copy), l_UrlBuilder_0 (copy), l_UrlBase_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_GroupsWrapperContext_0 (copy), l_GroupsNavigatorWithProviders_0 (copy), v12 (copy), v13 (copy)
    local v21 = l_useDispatch_0();
    local v22 = l_useNavigation_0();
    local v23 = l_useLocalUserId_0();
    local v26 = l_useNavigationProps_0(function(v24, _) --[[ Line: 44 ]]
        return {
            userId = v24
        };
    end).userId or v23 and tostring(v23) or "";
    local v28 = v2.useCallback(function(v27) --[[ Line: 52 ]]
        -- upvalues: v21 (copy), v10 (ref), v11 (ref)
        v21(v10({
            name = v11.GenericWebPage, 
            detail = v27
        }));
    end, {
        v21
    });
    local v30 = v2.useCallback(function(v29) --[[ Line: 59 ]]
        -- upvalues: v28 (copy), l_UrlBuilder_0 (ref)
        v28(l_UrlBuilder_0.user.group({
            groupId = v29
        }));
    end, {
        v28
    });
    local v31 = v2.useCallback(function() --[[ Line: 63 ]]
        -- upvalues: v28 (copy), l_UrlBuilder_0 (ref), l_UrlBase_0 (ref)
        v28(l_UrlBuilder_0.new({
            base = l_UrlBase_0.WWW, 
            path = "search/communities"
        })());
    end, {
        v28
    });
    local v32 = v2.useCallback(function() --[[ Line: 70 ]]
        -- upvalues: v28 (copy), l_UrlBuilder_0 (ref), l_UrlBase_0 (ref)
        v28(l_UrlBuilder_0.new({
            base = l_UrlBase_0.WWW, 
            path = "communities/create"
        })());
    end, {
        v28
    });
    local v33 = v2.useMemo(function() --[[ Line: 79 ]]
        -- upvalues: v28 (copy), v30 (copy), v31 (copy), v32 (copy), v26 (copy)
        return {
            navigateTo = {
                webView = v28, 
                groupDetails = v30, 
                seeAllGroups = v31, 
                createGroup = v32
            }, 
            userId = v26
        };
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v28, 
        v30, 
        v31, 
        v32, 
        v26
    } else l_dependencyArray_0(v28, v30, v31, v32, v26));
    return v2.createElement(l_GroupsWrapperContext_0.Provider, {
        value = v33
    }, {
        GroupsNavigator = v2.createElement(l_GroupsNavigatorWithProviders_0, {}), 
        AndroidBackButtonNavigationHandler = v2.createElement(v12, {
            canGoBackInRN = not v13(v22.state), 
            navigateBackInRN = v22.pop
        })
    });
end;
local v35 = v2.PureComponent:extend("classWrapper");
v35.render = function(v36) --[[ Line: 107 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v34 (copy)
    return v2.createElement(v34, v36.props);
end;
return v35;