local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_t_0 = v1.t;
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_ControllerBar_0 = require(l_CorePackages_0.Packages.UIBlox).App.Bar.ControllerBar;
local v6 = require(script.Parent.Parent.Actions.SetControllerBarHeight);
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Localization.withLocalization);
local v9 = require(script.Parent.Parent.Resources.Constants);
local v10 = l_Roact_0.PureComponent:extend("IGMControllerBar");
local v11 = {
    cancel = "CoreScripts.InGameMenu.ControllerBar.Cancel", 
    respawn = "CoreScripts.InGameMenu.ControllerBar.Respawn", 
    openMoreMenu = "CoreScripts.InGameMenu.ControllerBar.OpenMoreMenu", 
    closeMoreMenu = "CoreScripts.InGameMenu.ControllerBar.CloseMoreMenu", 
    back = "CoreScripts.InGameMenu.ControllerBar.Back", 
    respawnCharacter = "CoreScripts.InGameMenu.ControllerBar.RespawnCharacter", 
    leave = "CoreScripts.InGameMenu.ControllerBar.Leave"
};
v10.validateProps = l_t_0.strictInterface({
    isMenuOpen = l_t_0.boolean, 
    isMainPageMoreMenuOpen = l_t_0.boolean, 
    currentPage = l_t_0.string, 
    respawnDialogOpen = l_t_0.boolean, 
    inputType = l_t_0.string, 
    screenSize = l_t_0.Vector2, 
    setControllerBarHeight = l_t_0.callback
});
v10.didMount = function(v12) --[[ Line: 39 ]] --[[ Name: didMount ]]
    -- upvalues: v11 (copy), v9 (copy)
    if v12:getHints(v11) then
        v12.props.setControllerBarHeight(v9.ControllerBarHeight);
        return;
    else
        v12.props.setControllerBarHeight(0);
        return;
    end;
end;
v10.didUpdate = function(v13) --[[ Line: 48 ]] --[[ Name: didUpdate ]]
    -- upvalues: v11 (copy), v9 (copy)
    if v13:getHints(v11) then
        v13.props.setControllerBarHeight(v9.ControllerBarHeight);
        return;
    else
        v13.props.setControllerBarHeight(0);
        return;
    end;
end;
v10.willUnmount = function(v14) --[[ Line: 57 ]] --[[ Name: willUnmount ]]
    v14.props.setControllerBarHeight(0);
end;
v10.getHints = function(v15, v16) --[[ Line: 61 ]] --[[ Name: getHints ]]
    -- upvalues: v9 (copy)
    if v15.props.inputType == v9.InputType.Gamepad then
        if v15.props.respawnDialogOpen then
            return {
                leftHint = {
                    text = v16.cancel, 
                    keyCode = Enum.KeyCode.ButtonB
                }, 
                rightHints = {
                    {
                        text = v16.respawn, 
                        keyCode = Enum.KeyCode.ButtonA
                    }
                }
            };
        elseif v15.props.isMenuOpen and v15.props.currentPage == "MainPage" then
            local v17 = nil;
            v17 = if not v15.props.isMainPageMoreMenuOpen then v16.openMoreMenu else v16.closeMoreMenu;
            return {
                leftHint = {
                    text = v16.back, 
                    keyCode = Enum.KeyCode.ButtonB
                }, 
                rightHints = {
                    {
                        text = v17, 
                        keyCode = Enum.KeyCode.ButtonL3
                    }, 
                    {
                        text = v16.respawnCharacter, 
                        keyCode = Enum.KeyCode.ButtonY
                    }, 
                    {
                        text = v16.leave, 
                        keyCode = Enum.KeyCode.ButtonX
                    }
                }
            };
        end;
    end;
    return nil;
end;
v10.render = function(v18) --[[ Line: 111 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v11 (copy), l_Roact_0 (copy), l_ControllerBar_0 (copy)
    return v8(v11)(function(v19) --[[ Line: 112 ]]
        -- upvalues: v18 (copy), l_Roact_0 (ref), l_ControllerBar_0 (ref)
        local v20 = v18:getHints(v19);
        if v20 then
            return l_Roact_0.createElement(l_ControllerBar_0, v20);
        else
            return nil;
        end;
    end);
end;
return l_RoactRodux_0.connect(function(v21, _) --[[ Line: 122 ]] --[[ Name: mapStateToProps ]]
    return {
        isMenuOpen = v21.isMenuOpen, 
        isMainPageMoreMenuOpen = v21.isMainPageMoreMenuOpen, 
        currentPage = v21.menuPage, 
        respawnDialogOpen = v21.respawn.dialogOpen, 
        inputType = v21.displayOptions.inputType, 
        screenSize = v21.screenSize
    };
end, function(v23) --[[ Line: 133 ]]
    -- upvalues: v6 (copy)
    return {
        setControllerBarHeight = function(v24) --[[ Line: 135 ]] --[[ Name: setControllerBarHeight ]]
            -- upvalues: v23 (copy), v6 (ref)
            v23(v6(v24));
        end
    };
end)(v10);