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
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v12.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v12.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING;
local v18 = v1.PureComponent:extend("UserInfoFeedItem");
v18.validateProps = v3.strictInterface({
    [l_OmniFeedProps_0.key] = l_OmniFeedProps_0.interface, 
    formFactor = v3.string, 
    localUserModel = v3.optional(v3.table), 
    refresh = v3.callback, 
    networking = v3.any
});
v18.init = function(v19) --[[ Line: 43 ]] --[[ Name: init ]]
    -- upvalues: l_OmniFeedProps_0 (copy)
    v19.isMounted = false;
    v19.refreshSignalConnection = v19.props[l_OmniFeedProps_0.key].refreshSignal:connect(function() --[[ Line: 46 ]]
        -- upvalues: v19 (copy)
        if v19.isMounted then
            v19.props.refresh(v19.props.networking, v19.props.localUserModel);
        end;
    end);
end;
v18.didMount = function(v20) --[[ Line: 53 ]] --[[ Name: didMount ]]
    v20.isMounted = true;
end;
v18.render = function(v21) --[[ Line: 57 ]] --[[ Name: render ]]
    -- upvalues: l_FormFactor_0 (copy), l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 (copy), l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 (copy), v1 (copy), v15 (copy)
    local l_formFactor_0 = v21.props.formFactor;
    local v23 = nil;
    v23 = if l_formFactor_0 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0;
    return v1.createElement(v15, {
        sideMargin = v23
    });
end;
v18.willUnmount = function(v24) --[[ Line: 72 ]] --[[ Name: willUnmount ]]
    v24.isMounted = false;
    if v24.refreshSignalConnection then
        v24.refreshSignalConnection:disconnect();
        v24.refreshSignalConnection = nil;
    end;
end;
local v27 = l_memoize_0(function(v25, v26) --[[ Line: 81 ]]
    return v25[v26];
end);
v18 = v2.connect(function(v28, _) --[[ Line: 105 ]]
    -- upvalues: v27 (copy)
    return {
        formFactor = v28.FormFactor, 
        localUserModel = v27(v28.Users, v28.LocalUserId)
    };
end, function(v30) --[[ Line: 85 ]]
    -- upvalues: l_PreloadUsersThumbnail_0 (copy), l_AvatarThumbnailRequests_0 (copy), v4 (copy), l_SetNetworkingErrorToast_0 (copy)
    return {
        refresh = function(_, v32) --[[ Line: 86 ]]
            -- upvalues: v30 (copy), l_PreloadUsersThumbnail_0 (ref), l_AvatarThumbnailRequests_0 (ref), v4 (ref), l_SetNetworkingErrorToast_0 (ref)
            local v33 = {
                (v30(l_PreloadUsersThumbnail_0({
                    v32.id
                }, l_AvatarThumbnailRequests_0.HOME_HEADER_USER, nil)))
            };
            return v4.all(v33):andThen(function(v34) --[[ Line: 93 ]]
                -- upvalues: v4 (ref)
                return v4.resolve(v34);
            end, function(v35) --[[ Line: 95 ]]
                -- upvalues: v30 (ref), l_SetNetworkingErrorToast_0 (ref), v4 (ref)
                v30((l_SetNetworkingErrorToast_0(v35)));
                return v4.reject(v35);
            end);
        end
    };
end)(v18);
return (l_RoactServices_0.connect({
    networking = l_RoactNetworking_0
})(v18));