local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_NavigateDown_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateDown;
local l_EntryPoints_0 = require(l_CorePackages_0.Workspace.Packages.DiscoverabilityModal).Analytics.EntryPoints;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v11 = require(l_Modules_0.LuaApp.Components.Home.UserInfoWidget);
local v12 = require(l_Modules_0.LuaApp.Thunks.OpenProfilePeekView);
local v13 = require(l_Modules_0.LuaApp.Components.DiscoverabilityModal.useNavigateToDiscoverabilityModal);
local l_Sources_0 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Sources;
local l_FFlagLuaAppMoveProfileIntoTopBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBar;
local v16 = v1.PureComponent:extend("HomeUserInfoWidget");
v16.init = function(v17) --[[ Line: 26 ]] --[[ Name: init ]]
    -- upvalues: l_Sources_0 (copy), l_EntryPoints_0 (copy)
    v17.navigateToProfile = function() --[[ Line: 27 ]]
        -- upvalues: v17 (copy), l_Sources_0 (ref)
        local l_id_0 = v17.props.localUserModel.id;
        v17.props.openProfilePeekView(l_id_0, {
            source = l_Sources_0.HomePageSelfWidget
        });
    end;
    v17.onUsernameActivated = function() --[[ Line: 35 ]]
        -- upvalues: v17 (copy), l_EntryPoints_0 (ref)
        if not v17.props.enableHomeProfileLink then
            return;
        else
            v17.props.navigateToDiscoverabilityModal({
                isStandaloneDiscoverabilityModal = true, 
                navigateOnActivated = v17.navigateToProfile, 
                entryPoint = l_EntryPoints_0.HomePageProfile
            });
            return;
        end;
    end;
end;
v16.render = function(v19) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), v1 (copy), v11 (copy)
    local l_localUserModel_0 = v19.props.localUserModel;
    local l_layoutOrder_0 = v19.props.layoutOrder;
    local l_sideMargin_0 = v19.props.sideMargin;
    local v23 = if l_FFlagLuaAppMoveProfileIntoTopBar_0 then v19.props.shouldOnlyDisplayAvatarIcon else nil;
    local v24 = if l_FFlagLuaAppMoveProfileIntoTopBar_0 then v19.props.onlyAvatarButtonRef else nil;
    if not l_localUserModel_0 then
        return nil;
    else
        return v1.createElement(v11, {
            layoutOrder = l_layoutOrder_0, 
            localUserModel = l_localUserModel_0, 
            onActivated = v19.onUsernameActivated, 
            sideMargin = l_sideMargin_0, 
            shouldOnlyDisplayAvatarIcon = if l_FFlagLuaAppMoveProfileIntoTopBar_0 then v23 else nil, 
            onlyAvatarButtonRef = if l_FFlagLuaAppMoveProfileIntoTopBar_0 then v24 else nil
        });
    end;
end;
local v27 = l_memoize_0(function(v25, v26) --[[ Line: 71 ]]
    return v25[v26];
end);
v16 = v2.connect(function(v28, _) --[[ Line: 75 ]]
    -- upvalues: v27 (copy)
    return {
        localUserModel = v27(v28.Users, v28.LocalUserId)
    };
end, function(v30) --[[ Line: 79 ]]
    -- upvalues: l_NavigateDown_0 (copy), v12 (copy)
    return {
        navigateDown = function(v31) --[[ Line: 81 ]] --[[ Name: navigateDown ]]
            -- upvalues: v30 (copy), l_NavigateDown_0 (ref)
            v30(l_NavigateDown_0(v31));
        end, 
        openProfilePeekView = function(v32, v33) --[[ Line: 84 ]] --[[ Name: openProfilePeekView ]]
            -- upvalues: v30 (copy), v12 (ref)
            v30(v12(v32, v33));
        end
    };
end)(v16);
v16 = l_RoactAppPolicy_0.connect(function(v34, _) --[[ Line: 90 ]]
    return {
        enableHomeProfileLink = v34.getHomePageProfileLink()
    };
end)(v16);
v16 = l_RoactServices_0.connect({
    networking = l_RoactNetworking_0
})(v16);
HomeUserInfoWidgetWrapper = function(v36) --[[ Line: 100 ]] --[[ Name: HomeUserInfoWidgetWrapper ]]
    -- upvalues: v13 (copy), v1 (copy), v16 (ref), v3 (copy)
    local v37 = v13();
    return v1.createElement(v16, v3.Dictionary.join({
        navigateToDiscoverabilityModal = v37
    }, v36));
end;
return HomeUserInfoWidgetWrapper;