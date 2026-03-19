local l_CorePackages_0 = game:GetService("CorePackages");
local l_VRService_0 = game:GetService("VRService");
local v2 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_t_0 = v2.t;
local l_Parent_0 = script.Parent.Parent;
local v6 = require(script.Parent.IGMControllerBar2);
local v7 = require(l_Parent_0.Localization.withLocalization);
local v8 = l_Roact_0.PureComponent:extend("IGMMainPageControllerBar");
v8.validateProps = l_t_0.strictInterface({
    canCaptureFocus = l_t_0.boolean, 
    isMainPageMoreMenuOpen = l_t_0.boolean
});
v8.render = function(v9) --[[ Line: 19 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), l_VRService_0 (copy), l_Roact_0 (copy), v6 (copy)
    if v9.props.canCaptureFocus then
        return v7({
            openMoreMenu = "CoreScripts.InGameMenu.ControllerBar.OpenMoreMenu", 
            closeMoreMenu = "CoreScripts.InGameMenu.ControllerBar.CloseMoreMenu", 
            back = "CoreScripts.InGameMenu.ControllerBar.Back", 
            respawnCharacter = "CoreScripts.InGameMenu.ControllerBar.RespawnCharacter", 
            leave = "CoreScripts.InGameMenu.ControllerBar.Leave"
        })(function(v10) --[[ Line: 27 ]]
            -- upvalues: l_VRService_0 (ref), v9 (copy), l_Roact_0 (ref), v6 (ref)
            local v11 = nil;
            v11 = if not l_VRService_0.VREnabled then {
                {
                    text = v9.props.isMainPageMoreMenuOpen and v10.closeMoreMenu or v10.openMoreMenu, 
                    keyCode = Enum.KeyCode.ButtonL3
                }, 
                {
                    text = v10.respawnCharacter, 
                    keyCode = Enum.KeyCode.ButtonY
                }, 
                {
                    text = v10.leave, 
                    keyCode = Enum.KeyCode.ButtonX
                }
            } else {
                {
                    text = v10.respawnCharacter, 
                    keyCode = Enum.KeyCode.ButtonY
                }, 
                {
                    text = v10.leave, 
                    keyCode = Enum.KeyCode.ButtonX
                }
            };
            return l_Roact_0.createElement(v6, {
                leftHint = {
                    text = v10.back, 
                    keyCode = Enum.KeyCode.ButtonB
                }, 
                rightHints = v11
            });
        end);
    else
        return nil;
    end;
end;
return v8;