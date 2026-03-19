local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Roact_0 = require(l_Parent_0.PurchasePromptDeps).Roact;
local l_MouseIconOverrideService_0 = require(l_Parent_0.CoreScriptsCommon).MouseIconOverrideService;
local v5 = require(l_script_FirstAncestor_0.Actions.SetGamepadEnabled);
local v6 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v7 = require(l_script_FirstAncestor_0.connectToStore);
local v8 = require(script.Parent.ExternalEventConnection);
local v9 = {
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true
};
local v10 = l_Roact_0.Component:extend("InputTypeManager");
v10.init = function(v11) --[[ Line: 31 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy)
    local l_setGamepadEnabled_0 = v11.props.setGamepadEnabled;
    v11.dispatchOnChange = function(v13) --[[ Line: 34 ]]
        -- upvalues: v9 (ref), v11 (copy), l_setGamepadEnabled_0 (copy)
        local v14 = nil;
        v14 = v9[v13] and true or false;
        if v14 == v11.props.gamepadEnabled then
            return;
        else
            l_setGamepadEnabled_0(v14);
            return;
        end;
    end;
    v11.cursorOverridden = false;
end;
v10.render = function(v15) --[[ Line: 50 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v8 (copy), l_UserInputService_0 (copy)
    return l_Roact_0.createElement(v8, {
        event = l_UserInputService_0.LastInputTypeChanged, 
        callback = v15.dispatchOnChange
    });
end;
v10.didUpdate = function(v16, v17, _) --[[ Line: 57 ]] --[[ Name: didUpdate ]]
    -- upvalues: v6 (copy), l_MouseIconOverrideService_0 (copy)
    local v19 = false;
    if v17.promptState == v6.None then
        v19 = v16.props.promptState ~= v6.None;
    end;
    local v20 = false;
    if v17.promptState ~= v6.None then
        v20 = v16.props.promptState == v6.None;
    end;
    local v21 = v16.props.promptState ~= v6.None;
    local v22 = v16.props.gamepadEnabled and Enum.OverrideMouseIconBehavior.ForceHide or Enum.OverrideMouseIconBehavior.ForceShow;
    if v21 and v17.gamepadEnabled ~= v16.props.gamepadEnabled then
        if v16.cursorOverridden then
            l_MouseIconOverrideService_0.pop("PurchasePromptOverrideKey");
        end;
        l_MouseIconOverrideService_0.push("PurchasePromptOverrideKey", v22);
        v16.cursorOverridden = true;
        return;
    elseif v19 then
        l_MouseIconOverrideService_0.push("PurchasePromptOverrideKey", v22);
        v16.cursorOverridden = true;
        return;
    else
        if v20 then
            l_MouseIconOverrideService_0.pop("PurchasePromptOverrideKey");
            v16.cursorOverridden = false;
        end;
        return;
    end;
end;
return (v7(function(v23) --[[ Line: 84 ]] --[[ Name: mapStateToProps ]]
    return {
        promptState = v23.promptState, 
        gamepadEnabled = v23.gamepadEnabled
    };
end, function(v24) --[[ Line: 91 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v5 (copy)
    return {
        setGamepadEnabled = function(v25) --[[ Line: 93 ]] --[[ Name: setGamepadEnabled ]]
            -- upvalues: v24 (copy), v5 (ref)
            v24(v5(v25));
        end
    };
end)(v10));