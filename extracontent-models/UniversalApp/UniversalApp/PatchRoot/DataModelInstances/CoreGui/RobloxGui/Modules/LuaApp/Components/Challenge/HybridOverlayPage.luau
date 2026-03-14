local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_Modules_0.LuaApp.AppPage);
local v6 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v7 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local l_LoadingSpinner_0 = v4.App.Loading.LoadingSpinner;
local v9 = v2.PureComponent:extend(script.Name);
v9.init = function(v10) --[[ Line: 24 ]] --[[ Name: init ]]
    v10:setState({
        challengeDisplayed = false
    });
end;
v9.didMount = function(v11) --[[ Line: 30 ]] --[[ Name: didMount ]]
    v11.isMounted = true;
    local v12 = {
        challengeType = v11.props.challengeType, 
        challengeParameters = v11.props.challengeParameters, 
        onChallengeAbandoned = v11.props.onChallengeAbandoned, 
        onChallengeLoadFailed = v11.props.onChallengeLoadFailed, 
        onChallengeDisplayed = function() --[[ Line: 37 ]] --[[ Name: onChallengeDisplayed ]]
            -- upvalues: v11 (copy)
            v11:setState({
                challengeDisplayed = true
            });
        end, 
        onChallengeUnmounted = function() --[[ Line: 42 ]] --[[ Name: onChallengeUnmounted ]]
            -- upvalues: v11 (copy)
            v11.props.navigateBack();
        end, 
        forceWebViewVisible = v11.props.forceWebViewVisible
    };
    v11.props.navigateToChallengeWebView(v12);
end;
v9.willUnmount = function(v13) --[[ Line: 50 ]] --[[ Name: willUnmount ]]
    v13.isMounted = false;
end;
v9.render = function(v14) --[[ Line: 54 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_LoadingSpinner_0 (copy)
    local v15 = UDim2.fromOffset(v14.props.screenSize.X, v14.props.screenSize.Y);
    return v2.createElement("Frame", {
        Size = v15, 
        BackgroundTransparency = 0.2, 
        Active = true
    }, {
        Spinner = v2.createElement(l_LoadingSpinner_0, {
            anchorPoint = Vector2.new(0.5, 0.5), 
            position = UDim2.fromScale(0.5, 0.5), 
            size = UDim2.fromOffset(48, 48)
        })
    });
end;
return (v3.connect(function(v16, _) --[[ Line: 72 ]]
    return {
        screenSize = v16.ScreenSize
    };
end, function(v18) --[[ Line: 76 ]]
    -- upvalues: v6 (copy), v7 (copy), v5 (copy)
    return {
        navigateBack = function() --[[ Line: 78 ]] --[[ Name: navigateBack ]]
            -- upvalues: v18 (copy), v6 (ref)
            return v18(v6(true));
        end, 
        navigateToChallengeWebView = function(v19) --[[ Line: 81 ]] --[[ Name: navigateToChallengeWebView ]]
            -- upvalues: v18 (copy), v7 (ref), v5 (ref)
            return v18(v7({
                name = v5.ChallengeHybridWebView, 
                extraProps = v19
            }, true));
        end
    };
end)(v9));