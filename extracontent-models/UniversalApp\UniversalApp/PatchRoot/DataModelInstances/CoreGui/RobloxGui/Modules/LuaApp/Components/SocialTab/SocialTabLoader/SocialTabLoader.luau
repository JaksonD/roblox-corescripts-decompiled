local l_CorePackages_0 = game:GetService("CorePackages");
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v5 = require(script:FindFirstAncestor("SocialTab").SocialTab);
local l_SocialTabEntryPoint_0 = v5.Components.SocialTabEntryPoint;
local l_Context_0 = v5.Context;
local v8 = v2.PureComponent:extend("SocialTabLoader");
v8.defaultProps = {
    receivedCanShowUserAlias = nil, 
    showUserAlias = nil, 
    renderSocialTab = function(v9) --[[ Line: 18 ]] --[[ Name: renderSocialTab ]]
        -- upvalues: v2 (copy), l_SocialTabEntryPoint_0 (copy), l_Logger_0 (copy)
        return v2.createElement(l_SocialTabEntryPoint_0, {
            isVisible = v9.isVisible, 
            parameters = v9.parameters, 
            logger = l_Logger_0, 
            setTabBarVisible = v9.setTabBarVisible, 
            signal = v9.signal, 
            rnBypassActionSignalSocialTab = v9.rnBypassActionSignalSocialTab, 
            androidBackButtonConnection = v9.androidBackButtonConnection, 
            closeDrawer = v9.closeDrawer, 
            initialRouteName = v9.initialRouteName
        });
    end
};
v8.init = function(v10) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: l_memoize_0 (copy), v2 (copy), v3 (copy)
    v10.renderSocialTab = l_memoize_0(function(v11) --[[ Line: 34 ]]
        -- upvalues: v2 (ref), v10 (copy), v3 (ref)
        return v2.createFragment({
            content = v2.createElement(v10.props.renderSocialTab, v3.Dictionary.join(v11 or {}, {
                closeDrawer = v10.props.closeDrawer
            }))
        });
    end);
end;
v8.render = function(v12) --[[ Line: 46 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Context_0 (copy)
    return v2.createElement(l_Context_0.Consumer, {
        render = v12.renderSocialTab
    });
end;
v8.didMount = function(v13) --[[ Line: 52 ]] --[[ Name: didMount ]]
    v13.props.receivedCanShowUserAlias(v13.props.showUserAlias);
end;
v8.didUpdate = function(v14, v15) --[[ Line: 56 ]] --[[ Name: didUpdate ]]
    if v15.showUserAlias ~= v14.props.showUserAlias then
        v14.props.receivedCanShowUserAlias(v14.props.showUserAlias);
    end;
end;
return v8;