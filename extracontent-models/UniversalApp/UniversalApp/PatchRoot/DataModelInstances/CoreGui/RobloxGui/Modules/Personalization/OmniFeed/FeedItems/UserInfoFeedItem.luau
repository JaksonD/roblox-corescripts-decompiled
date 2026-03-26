local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.Promise);
local l_SetNetworkingErrorToast_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_PreloadUsersThumbnail_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.PreloadUsersThumbnail;
local l_AvatarThumbnailRequests_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.AvatarThumbnailRequests;
local v12 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_OmniFeedProps_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.OmniFeedProps;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v15 = require(l_Modules_0.LuaApp.Components.Home.HomeUserInfoWidget);
local l_FFlagLuaAppCompositionSupport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppCompositionAlways;
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v12.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v12.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING;
local v20 = v1.PureComponent:extend("UserInfoFeedItem");
v20.validateProps = v3.strictInterface({
    [l_OmniFeedProps_0.key] = l_OmniFeedProps_0.interface, 
    formFactor = v3.string, 
    localUserModel = v3.optional(v3.table), 
    refresh = v3.callback, 
    networking = v3.any
});
v20.init = function(v21) --[[ Line: 46 ]] --[[ Name: init ]]
    -- upvalues: l_OmniFeedProps_0 (copy)
    v21.isMounted = false;
    v21.refreshSignalConnection = v21.props[l_OmniFeedProps_0.key].refreshSignal:connect(function() --[[ Line: 49 ]]
        -- upvalues: v21 (copy)
        if v21.isMounted then
            v21.props.refresh(v21.props.networking, v21.props.localUserModel);
        end;
    end);
end;
v20.didMount = function(v22) --[[ Line: 56 ]] --[[ Name: didMount ]]
    v22.isMounted = true;
end;
v20.render = function(v23) --[[ Line: 60 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_OmniFeedProps_0 (copy), l_FormFactor_0 (copy), l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 (copy), l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 (copy), v1 (copy), v15 (copy)
    local l_formFactor_0 = v23.props.formFactor;
    local v25 = l_FFlagLuaAppCompositionAlways_0 and true or if l_FFlagLuaAppCompositionSupport_0 then v23.props[l_OmniFeedProps_0.key].appCompositionEnabled else nil;
    local v26 = nil;
    v26 = v25 and 0 or if l_formFactor_0 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0;
    return v1.createElement(v15, {
        sideMargin = v26
    });
end;
v20.willUnmount = function(v27) --[[ Line: 82 ]] --[[ Name: willUnmount ]]
    v27.isMounted = false;
    if v27.refreshSignalConnection then
        v27.refreshSignalConnection:disconnect();
        v27.refreshSignalConnection = nil;
    end;
end;
local v30 = l_memoize_0(function(v28, v29) --[[ Line: 91 ]]
    return v28[v29];
end);
v20 = v2.connect(function(v31, _) --[[ Line: 115 ]]
    -- upvalues: v30 (copy)
    return {
        formFactor = v31.FormFactor, 
        localUserModel = v30(v31.Users, v31.LocalUserId)
    };
end, function(v33) --[[ Line: 95 ]]
    -- upvalues: l_PreloadUsersThumbnail_0 (copy), l_AvatarThumbnailRequests_0 (copy), v4 (copy), l_SetNetworkingErrorToast_0 (copy)
    return {
        refresh = function(_, v35) --[[ Line: 96 ]]
            -- upvalues: v33 (copy), l_PreloadUsersThumbnail_0 (ref), l_AvatarThumbnailRequests_0 (ref), v4 (ref), l_SetNetworkingErrorToast_0 (ref)
            local v36 = {
                (v33(l_PreloadUsersThumbnail_0({
                    v35.id
                }, l_AvatarThumbnailRequests_0.HOME_HEADER_USER, nil)))
            };
            return v4.all(v36):andThen(function(v37) --[[ Line: 103 ]]
                -- upvalues: v4 (ref)
                return v4.resolve(v37);
            end, function(v38) --[[ Line: 105 ]]
                -- upvalues: v33 (ref), l_SetNetworkingErrorToast_0 (ref), v4 (ref)
                v33((l_SetNetworkingErrorToast_0(v38)));
                return v4.reject(v38);
            end);
        end
    };
end)(v20);
return (l_RoactServices_0.connect({
    networking = l_RoactNetworking_0
})(v20));