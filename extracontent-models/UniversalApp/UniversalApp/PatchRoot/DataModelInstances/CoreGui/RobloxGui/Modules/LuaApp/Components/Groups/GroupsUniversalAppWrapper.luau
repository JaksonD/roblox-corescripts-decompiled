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
local l_UrlBuilder_0 = v14.UrlBuilder;
local l_UrlBase_0 = v14.UrlBase;
local l_GroupsNavigatorWithProviders_0 = v7.Navigation.GroupsNavigatorWithProviders;
local l_GroupsWrapperContext_0 = v7.Contexts.GroupsWrapperContext;
local function v33(_) --[[ Line: 36 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useLocalUserId_0 (copy), l_useNavigationProps_0 (copy), v2 (copy), v10 (copy), v11 (copy), l_UrlBuilder_0 (copy), l_UrlBase_0 (copy), l_dependencyArray_0 (copy), l_GroupsWrapperContext_0 (copy), l_GroupsNavigatorWithProviders_0 (copy), v12 (copy), v13 (copy)
    local v20 = l_useDispatch_0();
    local v21 = l_useNavigation_0();
    local v22 = l_useLocalUserId_0();
    local v25 = l_useNavigationProps_0(function(v23, _) --[[ Line: 41 ]]
        return {
            userId = v23
        };
    end).userId or v22 and tostring(v22) or "";
    local v27 = v2.useCallback(function(v26) --[[ Line: 49 ]]
        -- upvalues: v20 (copy), v10 (ref), v11 (ref)
        v20(v10({
            name = v11.GenericWebPage, 
            detail = v26
        }));
    end, {
        v20
    });
    local v29 = v2.useCallback(function(v28) --[[ Line: 56 ]]
        -- upvalues: v27 (copy), l_UrlBuilder_0 (ref)
        v27(l_UrlBuilder_0.user.group({
            groupId = v28
        }));
    end, {
        v27
    });
    local v30 = v2.useCallback(function() --[[ Line: 60 ]]
        -- upvalues: v27 (copy), l_UrlBuilder_0 (ref), l_UrlBase_0 (ref)
        v27(l_UrlBuilder_0.new({
            base = l_UrlBase_0.WWW, 
            path = "search/communities"
        })());
    end, {
        v27
    });
    local v31 = v2.useCallback(function() --[[ Line: 67 ]]
        -- upvalues: v27 (copy), l_UrlBuilder_0 (ref), l_UrlBase_0 (ref)
        v27(l_UrlBuilder_0.new({
            base = l_UrlBase_0.WWW, 
            path = "communities/create"
        })());
    end, {
        v27
    });
    local v32 = v2.useMemo(function() --[[ Line: 75 ]]
        -- upvalues: v27 (copy), v29 (copy), v30 (copy), v31 (copy), v25 (copy)
        return {
            navigateTo = {
                webView = v27, 
                groupDetails = v29, 
                seeAllGroups = v30, 
                createGroup = v31
            }, 
            userId = v25
        };
    end, l_dependencyArray_0(v27, v29, v30, v31, v25));
    return v2.createElement(l_GroupsWrapperContext_0.Provider, {
        value = v32
    }, {
        GroupsNavigator = v2.createElement(l_GroupsNavigatorWithProviders_0, {}), 
        AndroidBackButtonNavigationHandler = v2.createElement(v12, {
            canGoBackInRN = not v13(v21.state), 
            navigateBackInRN = v21.pop
        })
    });
end;
local v34 = v2.PureComponent:extend("classWrapper");
v34.render = function(v35) --[[ Line: 99 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v33 (copy)
    return v2.createElement(v33, v35.props);
end;
return v34;