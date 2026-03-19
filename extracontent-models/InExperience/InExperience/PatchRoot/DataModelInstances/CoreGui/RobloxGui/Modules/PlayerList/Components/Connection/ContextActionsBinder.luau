local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Actions.SetPlayerListVisibility);
local v9 = require(l_Parent_0.Actions.ClosePlayerDropDown);
local v10 = require(l_Parent_0.Flags.FFlagPlayerListReduceRerenders);
local l_FFlagAddNewPlayerListMobileFocusNav_0 = v6.Flags.FFlagAddNewPlayerListMobileFocusNav;
local l_FFlagPlayerListUseMobileOnSmallDisplay_0 = v6.Flags.FFlagPlayerListUseMobileOnSmallDisplay;
local v13 = v3.PureComponent:extend("ContextActionsBinder");
local v14 = {
    Enum.UserInputType.Gamepad1, 
    Enum.UserInputType.Gamepad2, 
    Enum.UserInputType.Gamepad3, 
    Enum.UserInputType.Gamepad4, 
    Enum.UserInputType.Gamepad5, 
    Enum.UserInputType.Gamepad6, 
    Enum.UserInputType.Gamepad7, 
    Enum.UserInputType.Gamepad8
};
v13.init = function(v15) --[[ Line: 37 ]] --[[ Name: init ]]
    v15.boundPlayerListActions = false;
end;
v13.bindActions = function(v16) --[[ Line: 41 ]] --[[ Name: bindActions ]]
    -- upvalues: l_ContextActionService_0 (copy), l_FFlagPlayerListUseMobileOnSmallDisplay_0 (copy), l_GuiService_0 (copy), v14 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (copy)
    l_ContextActionService_0:BindCoreAction("RbxPlayerListToggle", function(_, v18, _) --[[ Line: 42 ]]
        -- upvalues: l_FFlagPlayerListUseMobileOnSmallDisplay_0 (ref), v16 (copy), l_GuiService_0 (ref)
        if l_FFlagPlayerListUseMobileOnSmallDisplay_0 and v16.props.displayOptions.isSmallTouchDevice then
            return Enum.ContextActionResult.Pass;
        elseif l_GuiService_0.MenuIsOpen then
            return Enum.ContextActionResult.Pass;
        elseif v18 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            v16.props.setVisibility(not v16.props.displayOptions.isVisible);
            return Enum.ContextActionResult.Sink;
        end;
    end, false, Enum.KeyCode.Tab);
    l_ContextActionService_0:BindCoreAction("RbxPlayerListStopMovement", function(_, _, _) --[[ Line: 59 ]]
        -- upvalues: v16 (copy)
        if v16.props.displayOptions.isVisible and v16.props.displayOptions.isTenFootInterface then
            return Enum.ContextActionResult.Sink;
        else
            return Enum.ContextActionResult.Pass;
        end;
    end, false, unpack(v14));
    l_ContextActionService_0:BindCoreAction("RbxPlayerListGamepadClose", function(_, v24, _) --[[ Line: 66 ]]
        -- upvalues: v16 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (ref)
        if v24 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        elseif not v16.props.displayOptions.isTenFootInterface and (not l_FFlagAddNewPlayerListMobileFocusNav_0 or not v16.props.displayOptions.isSmallTouchDevice) then
            return Enum.ContextActionResult.Pass;
        elseif l_FFlagAddNewPlayerListMobileFocusNav_0 and v16.props.playerDropDown.isVisible then
            v16.props.closePlayerDropDown();
            return Enum.ContextActionResult.Sink;
        else
            if l_FFlagAddNewPlayerListMobileFocusNav_0 then
                if v16.props.displayOptions.isVisible then
                    v16.props.setVisibility(false);
                    return Enum.ContextActionResult.Sink;
                end;
            elseif v16.props.displayOptions.isVisible and v16.props.displayOptions.isTenFootInterface then
                v16.props.setVisibility(false);
                return Enum.ContextActionResult.Sink;
            end;
            return Enum.ContextActionResult.Pass;
        end;
    end, false, Enum.KeyCode.ButtonB, if l_FFlagAddNewPlayerListMobileFocusNav_0 then Enum.KeyCode.ButtonB else Enum.KeyCode.ButtonStart);
    v16.boundPlayerListActions = true;
end;
v13.unbindActions = function(v26) --[[ Line: 101 ]] --[[ Name: unbindActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("RbxPlayerListToggle");
    l_ContextActionService_0:UnbindCoreAction("RbxPlayerListStopMovement");
    l_ContextActionService_0:UnbindCoreAction("RbxPlayerListGamepadClose");
    v26.boundPlayerListActions = false;
end;
v13.didMount = function(v27) --[[ Line: 108 ]] --[[ Name: didMount ]]
    v27:bindActions();
end;
v13.render = function(_) --[[ Line: 112 ]] --[[ Name: render ]]
    return nil;
end;
v13.willUnmount = function(v29) --[[ Line: 116 ]] --[[ Name: willUnmount ]]
    if v29.boundPlayerListActions then
        v29:unbindActions();
    end;
end;
local function v31(v30) --[[ Line: 122 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagAddNewPlayerListMobileFocusNav_0 (copy)
    return {
        displayOptions = v30.displayOptions, 
        playerDropDown = if l_FFlagAddNewPlayerListMobileFocusNav_0 then v30.playerDropDown else nil
    };
end;
local function v34(v32) --[[ Line: 129 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v8 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (copy), v9 (copy)
    return {
        setVisibility = function(v33) --[[ Line: 131 ]] --[[ Name: setVisibility ]]
            -- upvalues: v32 (copy), v8 (ref)
            return v32(v8(v33));
        end, 
        closePlayerDropDown = l_FFlagAddNewPlayerListMobileFocusNav_0 and function() --[[ Line: 135 ]]
            -- upvalues: v32 (copy), v9 (ref)
            return v32(v9());
        end or nil
    };
end;
if v10 then
    return v4.memo(v5.connect(v31, v34)(v13));
else
    return v5.connect(v31, v34)(v13);
end;