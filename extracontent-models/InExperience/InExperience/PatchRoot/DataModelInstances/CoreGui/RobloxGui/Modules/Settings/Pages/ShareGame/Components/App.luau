local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_ShareGame_0 = l_Modules_0.Settings.Pages.ShareGame;
local v8 = require(l_ShareGame_0.Constants);
local l_AppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies;
local l_EventStream_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
local v11 = require(l_ShareGame_0.Components.LayoutProvider);
local v12 = require(l_ShareGame_0.Components.ShareGameContainer);
local v13 = v4.PureComponent:extend("App");
local function v15(v14) --[[ Line: 23 ]] --[[ Name: wrapWithProviders ]]
    -- upvalues: v4 (copy), v11 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy)
    return v4.createElement(v11, nil, {
        PolicyProvider = v4.createElement(l_RoactAppPolicy_0.Provider, {
            policy = {
                l_AppFeaturePolicies_0
            }
        }, v14)
    });
end;
v13.render = function(v16) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v12 (copy), v8 (copy), v15 (copy)
    local l_analytics_0 = v16.props.analytics;
    local l_pageTarget_0 = v16.props.pageTarget;
    local v19 = nil;
    if v16.props.isPageOpen then
        v19 = v4.createElement(v12, {
            analytics = l_analytics_0, 
            zIndex = v8.SHARE_GAME_Z_INDEX
        });
    end;
    return v15({
        v4.createElement(v4.Portal, {
            target = l_pageTarget_0
        }, {
            ShareGamePageFrame = v19
        })
    });
end;
v13.didMount = function(v20) --[[ Line: 54 ]] --[[ Name: didMount ]]
    -- upvalues: l_EventStream_0 (copy), l_RbxAnalyticsService_0 (copy)
    v20.eventStream = l_EventStream_0.new(l_RbxAnalyticsService_0);
end;
v13.willUnmount = function(v21) --[[ Line: 58 ]] --[[ Name: willUnmount ]]
    v21.eventStream:releaseRBXEventStream();
end;
return v5.UNSTABLE_connect2(function(v22, _) --[[ Line: 62 ]]
    return {
        isPageOpen = v22.Page.IsOpen
    };
end)(v13);