local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.Otter);
local v4 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v5 = v1.PureComponent:extend("IntroScroll");
v5.validateProps = v2.strictInterface({
    childWidgetIndex = v2.string, 
    scrollingFrameRef = v2.table, 
    updateCanvasPosition = v2.callback
});
v5.init = function(v6) --[[ Line: 26 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v6.initMotorValue = 0;
    v6.motor = v3.createSingleMotor(0);
    v6.motor:onStep(function(v7) --[[ Line: 29 ]]
        -- upvalues: v6 (copy)
        v6.props.updateCanvasPosition(Vector2.new(v7, 0));
    end);
end;
v5.didUpdate = function(v8, v9, _) --[[ Line: 34 ]] --[[ Name: didUpdate ]]
    -- upvalues: v3 (copy)
    if v8.props.childWidgetIndex and v8.props.childWidgetIndex ~= v9.childWidgetIndex then
        local l_current_0 = v8.props.scrollingFrameRef.current;
        local v12 = math.clamp(l_current_0.AbsoluteCanvasSize.X - l_current_0.AbsoluteSize.X, 0, l_current_0.AbsoluteSize.X * 0.25);
        v8.motor:setGoal(v3.instant(v12));
        v8.motor:step(0);
        v8.motor:setGoal(v8:getGoal());
    end;
end;
v5.getGoal = function(_, _) --[[ Line: 50 ]] --[[ Name: getGoal ]]
    -- upvalues: v3 (copy), v4 (copy)
    return v3.spring(0, v4);
end;
v5.render = function(_) --[[ Line: 54 ]] --[[ Name: render ]]
    return nil;
end;
v5.willUnmount = function(v16) --[[ Line: 58 ]] --[[ Name: willUnmount ]]
    if v16.motor then
        v16.motor:destroy();
        v16.motor = nil;
    end;
end;
return v5;