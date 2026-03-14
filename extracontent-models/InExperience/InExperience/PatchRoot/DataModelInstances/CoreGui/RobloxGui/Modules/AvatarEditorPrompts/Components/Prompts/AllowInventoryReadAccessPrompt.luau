local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local v9 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_Parent_0 = script.Parent.Parent.Parent;
local v11 = require(l_Parent_0.Thunks.SetAllowInventoryReadAccess);
local v12 = v2.PureComponent:extend("AllowInventoryReadAccessPrompt");
v12.validateProps = v4.strictInterface({
    gameName = v4.string, 
    screenSize = v4.Vector2, 
    setAvatarReadAccessAllowed = v4.callback, 
    setAvatarReadAccessDenied = v4.callback
});
v12.render = function(v13) --[[ Line: 31 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_InteractiveAlert_0 (copy), v9 (copy), l_ButtonType_0 (copy)
    return v2.createElement(l_InteractiveAlert_0, {
        title = v9:FormatByKey("CoreScripts.AvatarEditorPrompts.InventoryReadAccessPromptTitle"), 
        bodyText = v9:FormatByKey("CoreScripts.AvatarEditorPrompts.InventoryReadAccessPromptText", {
            RBX_NAME = v13.props.gameName
        }), 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v13.props.setAvatarReadAccessDenied, 
                        text = v9:FormatByKey("CoreScripts.AvatarEditorPrompts.InventoryReadAccessPromptNo")
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v13.props.setAvatarReadAccessAllowed, 
                        text = v9:FormatByKey("CoreScripts.AvatarEditorPrompts.InventoryReadAccessPromptYes")
                    }, 
                    isDefaultChild = false
                }
            }
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v13.props.screenSize
    });
end;
return v3.connect(function(v14) --[[ Line: 65 ]] --[[ Name: mapStateToProps ]]
    return {
        gameName = v14.gameName, 
        screenSize = v14.screenSize
    };
end, function(v15) --[[ Line: 72 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v11 (copy)
    return {
        setAvatarReadAccessDenied = function() --[[ Line: 74 ]] --[[ Name: setAvatarReadAccessDenied ]]
            -- upvalues: v15 (copy), v11 (ref)
            return v15(v11(false));
        end, 
        setAvatarReadAccessAllowed = function() --[[ Line: 78 ]] --[[ Name: setAvatarReadAccessAllowed ]]
            -- upvalues: v15 (copy), v11 (ref)
            return v15(v11(true));
        end
    };
end)(v12);