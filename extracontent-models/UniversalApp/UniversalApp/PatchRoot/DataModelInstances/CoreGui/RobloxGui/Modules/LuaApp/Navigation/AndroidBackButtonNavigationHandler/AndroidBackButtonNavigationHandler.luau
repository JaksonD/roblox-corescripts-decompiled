local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.LuaApp.Navigation.AndroidBackButtonConnection);
local v4 = v2.PureComponent:extend("AndroidBackButtonNavigationHandler");
v4.defaultProps = {
    androidBackButtonConnection = function() --[[ Line: 9 ]] --[[ Name: androidBackButtonConnection ]]
        -- upvalues: v3 (copy)
        return v3();
    end
};
v4.init = function(v5) --[[ Line: 14 ]] --[[ Name: init ]]
    v5.androidBackButtonConnection = v5.props.androidBackButtonConnection();
    v5.onBackButtonPressed = function() --[[ Line: 17 ]]
        -- upvalues: v5 (copy)
        if v5.props.disabled then
            return;
        elseif v5.props.canGoBackInRN and v5.props.navigateBackInRN then
            v5.props.navigateBackInRN();
            return;
        elseif v5.props.canGoBackInAppRoute then
            v5.props.navigateBackInAppRoute();
            return;
        else
            v5.androidBackButtonConnection.showExitDialog();
            return;
        end;
    end;
end;
v4.didMount = function(v6) --[[ Line: 31 ]] --[[ Name: didMount ]]
    v6.androidBackButtonConnection.connect(v6.onBackButtonPressed);
end;
v4.didUpdate = function(v7, v8) --[[ Line: 35 ]] --[[ Name: didUpdate ]]
    if not v8.isVisible and v7.props.isVisible then
        v7.androidBackButtonConnection.connect(v7.onBackButtonPressed);
        return;
    else
        if v8.isVisible and not v7.props.isVisible then
            v7.androidBackButtonConnection.disconnect();
        end;
        return;
    end;
end;
v4.willUnmount = function(v9) --[[ Line: 43 ]] --[[ Name: willUnmount ]]
    v9.androidBackButtonConnection.disconnect();
end;
v4.render = function(_) --[[ Line: 47 ]] --[[ Name: render ]]
    return nil;
end;
return v4;