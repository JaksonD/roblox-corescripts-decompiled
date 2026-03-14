local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_getFStringSocialUserSearchResultsPageLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFStringSocialUserSearchResultsPageLayer;
local l_FFlagPlayerSearchEnableOnlineFrequents_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents;
local l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagPlayerSearchEnableOnlineFrequentsForAll;
local v8 = v2.PureComponent:extend("UserSearchResultsPageLayerExposure");
v8.init = function(v9) --[[ Line: 25 ]] --[[ Name: init ]]
    v9.state = {
        layerExposedOnMount = false
    };
end;
v8.didMount = function(v10) --[[ Line: 31 ]] --[[ Name: didMount ]]
    v10:setState({
        layerExposedOnMount = true
    });
end;
v8.render = function(v11) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy)
    if v11.state.layerExposedOnMount then
        return (v11.props.renderChild(v3.Dictionary.join(v11.props, {
            renderChild = v3.None
        })));
    else
        return nil;
    end;
end;
return v4.connectUserLayer({
    l_getFStringSocialUserSearchResultsPageLayer_0()
}, function(v12, _) --[[ Line: 47 ]]
    -- upvalues: l_getFStringSocialUserSearchResultsPageLayer_0 (copy), l_FFlagPlayerSearchEnableOnlineFrequents_0 (copy), l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 (copy)
    local v14 = v12[l_getFStringSocialUserSearchResultsPageLayer_0()] or {};
    return {
        enablePresenceIndicator = v14.enable_presence_indicator, 
        enableOnlineFrequents = if not l_FFlagPlayerSearchEnableOnlineFrequents_0 or l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 then nil else v14.enableOnlineFrequents
    };
end)(v8);