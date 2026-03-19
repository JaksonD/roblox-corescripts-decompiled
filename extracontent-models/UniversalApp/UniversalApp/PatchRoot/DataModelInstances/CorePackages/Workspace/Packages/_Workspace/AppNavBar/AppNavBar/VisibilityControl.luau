local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Otter);
local v4 = {
    dampingRatio = 1, 
    frequency = 3, 
    restingVelocityLimit = 0.1, 
    restingPositionLimit = 0.1
};
local v5 = {
    binding = nil, 
    motor = nil
};
v5.__index = v5;
v5.create = function(v6) --[[ Line: 33 ]] --[[ Name: create ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy)
    local v7, v8 = v2.createBinding(v6);
    local v9 = v3.createSingleMotor(v6);
    v9:onStep(v8);
    local v10 = {
        binding = v7, 
        motor = v9
    };
    setmetatable(v10, v5);
    return v10;
end;
v5.destroy = function(v11) --[[ Line: 47 ]] --[[ Name: destroy ]]
    v11.motor:destroy();
end;
v5.getBinding = function(v12) --[[ Line: 51 ]] --[[ Name: getBinding ]]
    return v12.binding;
end;
v5.show = function(v13) --[[ Line: 55 ]] --[[ Name: show ]]
    -- upvalues: v3 (copy), v4 (copy)
    v13.motor:setGoal(v3.spring(1, v4));
end;
v5.hide = function(v14) --[[ Line: 59 ]] --[[ Name: hide ]]
    -- upvalues: v3 (copy), v4 (copy)
    v14.motor:setGoal(v3.spring(0, v4));
end;
v5.update = function(v15, v16) --[[ Line: 63 ]] --[[ Name: update ]]
    -- upvalues: v3 (copy)
    local v17 = math.clamp(v15.binding:getValue() + v16, 0, 1);
    v15.motor:setGoal(v3.instant(v17));
end;
v5.finishUp = function(v18) --[[ Line: 69 ]] --[[ Name: finishUp ]]
    if v18.binding:getValue() < 0.5 then
        v18:hide();
        return;
    else
        v18:show();
        return;
    end;
end;
local v19 = {
    enabled = false, 
    header = nil, 
    footer = nil, 
    footerVisible = false, 
    connections = nil, 
    touching = false, 
    moving = false, 
    touchPositionY = 0, 
    scrollDistance = 50
};
v19.__index = v19;
local v20 = nil;
v19.onTouchMoved = function(v21, v22) --[[ Line: 104 ]] --[[ Name: onTouchMoved ]]
    local v23 = v22 / v21.scrollDistance;
    if v21.footerVisible then
        v21.footer:update(v23);
    end;
    v21.header:update(v23);
end;
v19.onTouchEnded = function(v24) --[[ Line: 114 ]] --[[ Name: onTouchEnded ]]
    if v24.footerVisible then
        v24.footer:finishUp();
    end;
    v24.header:finishUp();
end;
v19.connectTouch = function(v25) --[[ Line: 123 ]] --[[ Name: connectTouch ]]
    -- upvalues: l_UserInputService_0 (copy)
    if v25.connections ~= nil then
        return;
    else
        v25.connections = {};
        v25.connections.started = l_UserInputService_0.TouchStarted:Connect(function(v26) --[[ Line: 128 ]]
            -- upvalues: v25 (copy)
            v25.touching = true;
            v25.touchPositionY = v26.Position.Y;
        end);
        v25.connections.moved = l_UserInputService_0.TouchMoved:Connect(function(v27) --[[ Line: 132 ]]
            -- upvalues: v25 (copy)
            if not v25.touching then
                return;
            else
                local l_Y_0 = v27.Position.Y;
                if not v25.moving then
                    if math.abs(l_Y_0 - v25.touchPositionY) > 10 then
                        v25.moving = true;
                        v25.touchPositionY = l_Y_0;
                    end;
                    return;
                else
                    local v29 = l_Y_0 - v25.touchPositionY;
                    v25.touchPositionY = l_Y_0;
                    v25:onTouchMoved(v29);
                    return;
                end;
            end;
        end);
        v25.connections.ended = l_UserInputService_0.TouchEnded:Connect(function(_) --[[ Line: 148 ]]
            -- upvalues: v25 (copy)
            if not v25.touching then
                return;
            else
                v25.touching = false;
                v25.moving = false;
                v25:onTouchEnded();
                return;
            end;
        end);
        return;
    end;
end;
v19.disconnectTouch = function(v31) --[[ Line: 158 ]] --[[ Name: disconnectTouch ]]
    if v31.connections == nil then
        return;
    else
        for _, v33 in pairs(v31.connections) do
            v33:Disconnect();
        end;
        v31.connections = nil;
        return;
    end;
end;
v19.isEnabled = function(v34) --[[ Line: 171 ]] --[[ Name: isEnabled ]]
    return v34.enabled;
end;
v19.setEnabled = function(v35, v36) --[[ Line: 178 ]] --[[ Name: setEnabled ]]
    if v35.enabled == v36 then
        return;
    else
        v35.enabled = v36;
        if v36 then
            v35:connectTouch();
            return;
        else
            v35:disconnectTouch();
            return;
        end;
    end;
end;
v19.setFooterVisible = function(v37, v38) --[[ Line: 193 ]] --[[ Name: setFooterVisible ]]
    if v37.footerVisible == v38 then
        return;
    else
        v37.footerVisible = v38;
        if v38 then
            v37.footer:show();
            return;
        else
            v37.footer:hide();
            return;
        end;
    end;
end;
v19.getHeaderBinding = function(v39) --[[ Line: 208 ]] --[[ Name: getHeaderBinding ]]
    return v39.header:getBinding();
end;
v19.getFooterBinding = function(v40) --[[ Line: 215 ]] --[[ Name: getFooterBinding ]]
    return v40.footer:getBinding();
end;
v19.show = function(v41) --[[ Line: 222 ]] --[[ Name: show ]]
    v41.header:show();
    if v41.footerVisible then
        v41.footer:show();
    end;
end;
v19.hide = function(v42) --[[ Line: 232 ]] --[[ Name: hide ]]
    v42.header:hide();
    if v42.footerVisible then
        v42.footer:hide();
    end;
end;
v19.getInstance = function() --[[ Line: 242 ]] --[[ Name: getInstance ]]
    -- upvalues: v20 (ref), v19 (copy)
    if not v20 then
        v20 = {};
        setmetatable(v20, v19);
        v20:initialize();
    end;
    return v20;
end;
v19.initialize = function(v43) --[[ Line: 252 ]] --[[ Name: initialize ]]
    -- upvalues: v5 (copy)
    v43.header = v5.create(1);
    v43.footer = v5.create(0);
end;
v19.destroy = function(v44) --[[ Line: 262 ]] --[[ Name: destroy ]]
    -- upvalues: v20 (ref)
    v44.header:destroy();
    v44.footer:destroy();
    v44:disconnectTouch();
    v20 = nil;
end;
v19.setScrollDistance = function(v45, v46) --[[ Line: 272 ]] --[[ Name: setScrollDistance ]]
    if v46 == 0 then
        return;
    else
        v45.scrollDistance = v46;
        return;
    end;
end;
return {
    isEnabled = function() --[[ Line: 284 ]] --[[ Name: isEnabled ]]
        -- upvalues: v19 (copy)
        return v19.getInstance():isEnabled();
    end, 
    setEnabled = function(v47) --[[ Line: 287 ]] --[[ Name: setEnabled ]]
        -- upvalues: v19 (copy)
        v19.getInstance():setEnabled(v47);
    end, 
    getHeaderBinding = function() --[[ Line: 290 ]] --[[ Name: getHeaderBinding ]]
        -- upvalues: v19 (copy)
        return v19.getInstance():getHeaderBinding();
    end, 
    getFooterBinding = function() --[[ Line: 293 ]] --[[ Name: getFooterBinding ]]
        -- upvalues: v19 (copy)
        return v19.getInstance():getFooterBinding();
    end, 
    setFooterVisible = function(v48) --[[ Line: 296 ]] --[[ Name: setFooterVisible ]]
        -- upvalues: v19 (copy)
        v19.getInstance():setFooterVisible(v48);
    end, 
    show = function() --[[ Line: 299 ]] --[[ Name: show ]]
        -- upvalues: v19 (copy)
        v19.getInstance():show();
    end, 
    hide = function() --[[ Line: 302 ]] --[[ Name: hide ]]
        -- upvalues: v19 (copy)
        v19.getInstance():hide();
    end, 
    destroy = function() --[[ Line: 305 ]] --[[ Name: destroy ]]
        -- upvalues: v19 (copy)
        v19.getInstance():destroy();
    end, 
    setScrollDistance = function(v49) --[[ Line: 308 ]] --[[ Name: setScrollDistance ]]
        -- upvalues: v19 (copy)
        v19.getInstance():setScrollDistance(v49);
    end
};