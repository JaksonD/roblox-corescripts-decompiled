local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_Parent_0 = script.Parent.Parent;
local v5 = require(script.Parent.IGMControllerBar2);
local v6 = require(l_Parent_0.Resources.Constants);
local v7 = require(l_Parent_0.Localization.withLocalization);
local v8 = l_Roact_0.PureComponent:extend("IGMRespawnControllerBar");
v8.validateProps = l_t_0.strictInterface({
    inputType = l_t_0.string
});
v8.render = function(v9) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v7 (copy), l_Roact_0 (copy), v5 (copy)
    if v9.props.inputType == v6.InputType.Gamepad then
        return v7({
            cancel = "CoreScripts.InGameMenu.ControllerBar.Cancel", 
            respawn = "CoreScripts.InGameMenu.ControllerBar.Respawn"
        })(function(v10) --[[ Line: 23 ]]
            -- upvalues: l_Roact_0 (ref), v5 (ref)
            return l_Roact_0.createElement(v5, {
                leftHint = {
                    text = v10.cancel, 
                    keyCode = Enum.KeyCode.ButtonB
                }, 
                rightHints = {
                    {
                        text = v10.respawn, 
                        keyCode = Enum.KeyCode.ButtonA
                    }
                }
            });
        end);
    else
        return nil;
    end;
end;
return v8;