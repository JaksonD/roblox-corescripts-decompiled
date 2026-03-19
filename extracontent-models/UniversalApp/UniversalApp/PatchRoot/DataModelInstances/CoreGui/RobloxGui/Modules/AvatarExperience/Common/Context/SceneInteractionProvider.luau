local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.Common.Util.makeEvents);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(script.Parent.SceneInteractionCallbacksContext);
local v5 = require(script.Parent.SceneInteractionEventsContext);
local v6 = v3.PureComponent:extend("SceneInteractionProvider");
v6.init = function(v7) --[[ Line: 14 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    local v8, v9, v10 = v2({
        "panByDistance", 
        "panByPixels", 
        "rotateByRadians", 
        "rotateByPixels", 
        "setAngularVelocityByPixels", 
        "zoomStraight", 
        "zoomToPoint"
    });
    v7.events = v8;
    v7.callbacks = v9;
    v7.cleanups = v10;
end;
v6.render = function(v11) --[[ Line: 26 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy)
    return v3.createElement(v4.Provider, {
        value = v11.callbacks
    }, {
        SceneInteractionEventsProvider = v3.createElement(v5.Provider, {
            value = v11.events
        }, v11.props[v3.Children])
    });
end;
v6.willUnmount = function(v12) --[[ Line: 36 ]] --[[ Name: willUnmount ]]
    for _, v14 in v12.cleanups do
        v14();
    end;
end;
return v6;