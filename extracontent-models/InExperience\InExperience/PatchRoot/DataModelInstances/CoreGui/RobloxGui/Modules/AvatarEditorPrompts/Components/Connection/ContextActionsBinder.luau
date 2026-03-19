local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent.Parent;
local v7 = require(l_Parent_0.Thunks.CloseOpenPrompt);
local v8 = v3.PureComponent:extend("ContextActionsBinder");
v8.validateProps = v5.strictInterface({
    promptOpen = v5.boolean, 
    closeOpenPrompt = v5.callback
});
v8.init = function(v9) --[[ Line: 27 ]] --[[ Name: init ]]
    v9.actionsBound = false;
end;
v8.bindActions = function(v10) --[[ Line: 31 ]] --[[ Name: bindActions ]]
    -- upvalues: l_ContextActionService_0 (copy), l_GuiService_0 (copy)
    if v10.actionsBound then
        return;
    else
        v10.actionsBound = true;
        l_ContextActionService_0:BindCoreAction("CloseAvatarEditorPrompt", function(_, v12, _) --[[ Line: 38 ]]
            -- upvalues: l_GuiService_0 (ref), v10 (copy)
            if l_GuiService_0.MenuIsOpen then
                return Enum.ContextActionResult.Pass;
            elseif v12 ~= Enum.UserInputState.Begin then
                return Enum.ContextActionResult.Pass;
            else
                v10.props.closeOpenPrompt();
                return Enum.ContextActionResult.Sink;
            end;
        end, false, Enum.KeyCode.Escape);
        return;
    end;
end;
v8.unbindActions = function(v14) --[[ Line: 51 ]] --[[ Name: unbindActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    if not v14.actionsBound then
        return;
    else
        v14.actionsBound = false;
        l_ContextActionService_0:UnbindCoreAction("CloseAvatarEditorPrompt");
        return;
    end;
end;
v8.didMount = function(v15) --[[ Line: 61 ]] --[[ Name: didMount ]]
    if v15.props.promptOpen then
        v15:bindActions();
    end;
end;
v8.render = function(_) --[[ Line: 67 ]] --[[ Name: render ]]
    return nil;
end;
v8.didUpdate = function(v17, v18, _) --[[ Line: 71 ]] --[[ Name: didUpdate ]]
    if v17.props.promptOpen ~= v18.promptOpen then
        if v17.props.promptOpen then
            v17:bindActions();
            return;
        else
            v17:unbindActions();
        end;
    end;
end;
v8.willUnmount = function(v20) --[[ Line: 81 ]] --[[ Name: willUnmount ]]
    if v20.actionsBound then
        v20:unbindActions();
    end;
end;
return v4.connect(function(v21) --[[ Line: 87 ]] --[[ Name: mapStateToProps ]]
    return {
        promptOpen = v21.promptInfo.promptType ~= nil
    };
end, function(v22) --[[ Line: 93 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v7 (copy)
    return {
        closeOpenPrompt = function() --[[ Line: 95 ]] --[[ Name: closeOpenPrompt ]]
            -- upvalues: v22 (copy), v7 (ref)
            return v22(v7);
        end
    };
end)(v8);