local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v6.Enums.AvatarScreen;
local l_RouteInfo_0 = v6.AvatarRoute.RouteInfo;
local l_AvatarRoute_0 = v6.AvatarRoute.AvatarRoute;
local l_AvatarRouteContext_0 = v6.AvatarRoute.Context.AvatarRouteContext;
local v11 = require(l_Modules_0.LuaApp.AppPage);
local v12 = require(l_Modules_0.LuaApp.AppPageProperties);
local v13 = require(l_Modules_0.AvatarExperience.Common.isComponent);
local v14 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v15 = require(l_Modules_0.AvatarExperience.Common.withContextValue);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.LuaApp.Reducers.Navigation);
local l_SwitchTab_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SwitchTab;
local function _(v19) --[[ Line: 51 ]] --[[ Name: isAvatarRoute ]]
    -- upvalues: l_AvatarScreen_0 (copy), l_SwitchTab_0 (copy)
    local v20 = true;
    if v19 ~= l_AvatarScreen_0.AvatarExperienceRoot then
        v20 = v19 == l_SwitchTab_0.AvatarExperienceTab;
    end;
    return v20;
end;
return function(v22) --[[ Line: 55 ]]
    -- upvalues: v14 (copy), v13 (copy), v12 (copy), l_AvatarScreen_0 (copy), v11 (copy), v5 (copy), l_RouteInfo_0 (copy), v3 (copy), l_SwitchTab_0 (copy), l_AvatarRoute_0 (copy), v4 (copy), v15 (copy), l_AvatarRouteContext_0 (copy)
    v14.assert(v13(v22), "withAppRoute must be called with a Roact component");
    local function v27(v23) --[[ Line: 59 ]] --[[ Name: opaquePageFromRoute ]]
        -- upvalues: v12 (ref), l_AvatarScreen_0 (ref)
        for v24 = #v23, 1, -1 do
            local v25 = v23[v24];
            local v26 = v12[v25.name];
            if v26 == nil or not v26.renderUnderlyingPage then
                return v25;
            end;
        end;
        return {
            name = l_AvatarScreen_0.None
        };
    end;
    local function _(v28) --[[ Line: 78 ]] --[[ Name: isAvatarExperienceWrapper ]]
        -- upvalues: v11 (ref)
        local v29 = true;
        if v28.name ~= v11.AvatarExperienceWrapper then
            v29 = v28.name == v11.AvatarExperienceWrapperTransparent;
        end;
        return v29;
    end;
    local function v36(v31) --[[ Line: 86 ]] --[[ Name: routeInfoFromPage ]]
        -- upvalues: v11 (ref), v5 (ref), l_RouteInfo_0 (ref)
        local l_name_0 = v31.name;
        local l_l_name_0_0 = l_name_0;
        if v31.detail then
            l_l_name_0_0 = l_l_name_0_0 .. ":" .. v31.detail;
        end;
        local v34 = v31.extraProps or {};
        local v35 = true;
        if v31.name ~= v11.AvatarExperienceWrapper then
            v35 = v31.name == v11.AvatarExperienceWrapperTransparent;
        end;
        if v35 then
            l_name_0 = v34.routeName;
            v34 = v34.params;
        end;
        v34 = v5.Dictionary.join(v34, {
            detail = v31.detail
        });
        return l_RouteInfo_0.new(l_name_0, l_l_name_0_0, v34);
    end;
    local v37 = v3.PureComponent:extend("AppRouteWrapper");
    v37.getAvatarRoute = function(v38) --[[ Line: 106 ]] --[[ Name: getAvatarRoute ]]
        -- upvalues: l_AvatarScreen_0 (ref), l_SwitchTab_0 (ref), v27 (copy), l_AvatarRoute_0 (ref), v36 (copy), v11 (ref)
        local l_currentNavigationRoute_0 = v38.props.currentNavigationRoute;
        local v40 = l_currentNavigationRoute_0[#l_currentNavigationRoute_0];
        local l_name_1 = v40.name;
        local v42 = true;
        if l_name_1 ~= l_AvatarScreen_0.AvatarExperienceRoot then
            v42 = l_name_1 == l_SwitchTab_0.AvatarExperienceTab;
        end;
        if v42 then
            return v38.props.avatarRoute;
        else
            v42 = v27(l_currentNavigationRoute_0);
            local l_name_2 = v42.name;
            l_name_1 = true;
            if l_name_2 ~= l_AvatarScreen_0.AvatarExperienceRoot then
                l_name_1 = l_name_2 == l_SwitchTab_0.AvatarExperienceTab;
            end;
            if l_name_1 then
                l_name_1 = v38.props.avatarRoute;
                return l_AvatarRoute_0.new({
                    current = v36(v40), 
                    opaque = l_name_1.opaque, 
                    isVisible = true, 
                    isOverlayVisible = v38.props.centralOverlayShowing
                });
            else
                l_name_1 = l_AvatarRoute_0.new;
                l_name_2 = {
                    current = v36(v40), 
                    opaque = v36(v42)
                };
                local v44 = true;
                if v40.name ~= v11.AvatarExperienceWrapper then
                    v44 = v40.name == v11.AvatarExperienceWrapperTransparent;
                end;
                if not v44 then
                    v44 = true;
                    if v42.name ~= v11.AvatarExperienceWrapper then
                        v44 = v42.name == v11.AvatarExperienceWrapperTransparent;
                    end;
                end;
                l_name_2.isVisible = v44;
                l_name_2.isOverlayVisible = v38.props.centralOverlayShowing;
                return l_name_1(l_name_2);
            end;
        end;
    end;
    v37.render = function(v45) --[[ Line: 141 ]] --[[ Name: render ]]
        -- upvalues: v3 (ref), v22 (copy), v5 (ref)
        local v46 = v45:getAvatarRoute();
        return v3.createElement(v22, v5.Dictionary.join(v45.props, {
            avatarRoute = v46, 
            currentNavigationRoute = v5.None, 
            centralOverlayShowing = v5.None
        }));
    end;
    local v52 = v4.connect(function(v47, v48) --[[ Line: 154 ]] --[[ Name: mapStateToProps ]]
        local v49 = nil;
        local v50 = nil;
        v49 = v47.Navigation.history[#v47.Navigation.history];
        v50 = v47.CentralOverlay.OverlayType ~= nil;
        local v51 = v48.avatarRoute or v47.AvatarExperience.AvatarScene.AvatarRoute;
        return {
            currentNavigationRoute = v49, 
            avatarRoute = v51, 
            centralOverlayShowing = v50
        };
    end, nil)(v37);
    return (v15(v52, l_AvatarRouteContext_0.Consumer, "avatarRoute", {
        required = false
    }));
end;