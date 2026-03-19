local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Packages.tutils);
local v9 = require(l_Modules_0.LuaApp.Actions.SetBoundInputs);
local v10 = require(l_Modules_0.LuaApp.Actions.MaybeClearBoundInputs);
local v11 = v4.PureComponent:extend("BoundInputsUpdater");
v11.validateProps = v7.strictInterface({
    focusController = v7.table, 
    setBoundInputs = v7.callback, 
    maybeClearBoundInputs = v7.callback
});
v11.disconnectEvent = function(v12) --[[ Line: 25 ]] --[[ Name: disconnectEvent ]]
    if v12.disconnect ~= nil then
        v12.disconnect();
        v12.disconnect = nil;
    end;
end;
v11.subscribeEvent = function(v13) --[[ Line: 32 ]] --[[ Name: subscribeEvent ]]
    -- upvalues: v8 (copy)
    v13.disconnect = v13.props.focusController.subscribeToBoundInputsChanged(function(v14) --[[ Line: 33 ]]
        -- upvalues: v8 (ref), v13 (copy)
        if next(v14) ~= nil then
            if not v8.deepEqual(v14, v13.lastBoundInputs) then
                v13.props.setBoundInputs(v14, v13.props.focusController);
            end;
            v13.lastBoundInputs = v14;
        end;
    end);
    local v15 = v13.props.focusController.getBoundInputs();
    if next(v15) ~= nil then
        v13.props.setBoundInputs(v15, v13.props.focusController);
    end;
end;
v11.didMount = function(v16) --[[ Line: 49 ]] --[[ Name: didMount ]]
    v16:subscribeEvent();
end;
v11.render = function(_) --[[ Line: 53 ]] --[[ Name: render ]]
    return nil;
end;
v11.didUpdate = function(v18, v19) --[[ Line: 57 ]] --[[ Name: didUpdate ]]
    if v18.props.focusController ~= v19.focusController then
        v18:disconnectEvent();
        v18:subscribeEvent();
    end;
end;
v11.willUnmount = function(v20) --[[ Line: 65 ]] --[[ Name: willUnmount ]]
    v20:disconnectEvent();
    v20.props.maybeClearBoundInputs(v20.props.focusController);
end;
v11 = v6.connect(nil, function(v21) --[[ Line: 70 ]]
    -- upvalues: v9 (copy), v10 (copy)
    return {
        setBoundInputs = function(v22, v23) --[[ Line: 72 ]] --[[ Name: setBoundInputs ]]
            -- upvalues: v21 (copy), v9 (ref)
            v21(v9(v22, v23));
        end, 
        maybeClearBoundInputs = function(v24) --[[ Line: 75 ]] --[[ Name: maybeClearBoundInputs ]]
            -- upvalues: v21 (copy), v10 (ref)
            v21(v10(v24));
        end
    };
end)(v11);
return function(v25) --[[ Line: 81 ]]
    -- upvalues: v5 (copy), v4 (copy), v11 (ref), v3 (copy)
    return v5.withFocusController(function(v26) --[[ Line: 82 ]]
        -- upvalues: v4 (ref), v11 (ref), v3 (ref), v25 (copy)
        return v4.createElement(v11, v3.Dictionary.join(v25, {
            focusController = v26
        }));
    end);
end;