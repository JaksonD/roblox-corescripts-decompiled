local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local v9 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v12 = require(l_Parent_0.Prompts.PromptWithTextField);
local v13 = require(l_Parent_1.Thunks.SignalRenameOutfitPermissionDenied);
local v14 = require(l_Parent_1.Thunks.PerformRenameOutfit);
local v15 = require(l_Parent_1.AvatarEditorPromptsPolicy);
local v16 = v2.PureComponent:extend("RenameOutfitNamePrompt");
v16.validateProps = v4.strictInterface({
    outfitId = v4.integer, 
    outfitName = v4.string, 
    screenSize = v4.Vector2, 
    signalRenameOutfitPermissionDenied = v4.callback, 
    performRenameOutfit = v4.callback, 
    showCustomOutfitNames = v4.boolean
});
v16.init = function(v17) --[[ Line: 43 ]] --[[ Name: init ]]
    v17:setState({
        outfitName = "", 
        alertPosition = UDim2.fromScale(0.5, 0.5)
    });
    v17.textUpdated = function(v18) --[[ Line: 49 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            outfitName = v18
        });
    end;
    v17.confirmRenameOutfit = function() --[[ Line: 55 ]]
        -- upvalues: v17 (copy)
        v17.props.performRenameOutfit(v17.state.outfitName);
    end;
end;
v16.render = function(v19) --[[ Line: 60 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_InteractiveAlert_0 (copy), v9 (copy), l_ButtonType_0 (copy), v12 (copy)
    if not v19.props.showCustomOutfitNames then
        return v2.createElement(l_InteractiveAlert_0, {
            title = v9:FormatByKey("CoreScripts.AvatarEditorPrompts.DisabledRenameOutfitPromptTitle"), 
            bodyText = v9:FormatByKey("CoreScripts.AvatarEditorPrompts.DisabledRenameOutfitPromptText"), 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v19.props.signalRenameOutfitPermissionDenied, 
                            text = v9:FormatByKey("CoreScripts.AvatarEditorPrompts.DisabledRenameOutfitPromptOkay")
                        }, 
                        isDefaultChild = true
                    }
                }
            }, 
            position = UDim2.fromScale(0.5, 0.5), 
            screenSize = v19.props.screenSize, 
            isMiddleContentFocusable = false
        });
    else
        return v2.createElement(v12, {
            fieldText = v19.state.outfitName, 
            onFieldTextUpdated = v19.textUpdated, 
            title = v9:FormatByKey("CoreScripts.AvatarEditorPrompts.RenameOutfitNamePromptTitle"), 
            bodyText = v9:FormatByKey("CoreScripts.AvatarEditorPrompts.RenameOutfitPromptText", {
                RBX_NAME = v19.props.outfitName
            }), 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v19.props.signalRenameOutfitPermissionDenied, 
                            text = v9:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptNo")
                        }, 
                        isDefaultChild = true
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isDisabled = v19.state.outfitName == "", 
                            onActivated = v19.confirmRenameOutfit, 
                            text = v9:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptYes")
                        }, 
                        isDefaultChild = false
                    }
                }
            }
        });
    end;
end;
v16 = v3.connect(function(v20) --[[ Line: 119 ]] --[[ Name: mapStateToProps ]]
    return {
        outfitId = v20.promptInfo.outfitId, 
        outfitName = v20.promptInfo.outfitName, 
        screenSize = v20.screenSize
    };
end, function(v21) --[[ Line: 127 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v13 (copy), v14 (copy)
    return {
        signalRenameOutfitPermissionDenied = function() --[[ Line: 129 ]] --[[ Name: signalRenameOutfitPermissionDenied ]]
            -- upvalues: v21 (copy), v13 (ref)
            return v21(v13);
        end, 
        performRenameOutfit = function(v22) --[[ Line: 133 ]] --[[ Name: performRenameOutfit ]]
            -- upvalues: v21 (copy), v14 (ref)
            return v21(v14(v22));
        end
    };
end)(v16);
return (v15.connect(function(v23, _) --[[ Line: 141 ]]
    return {
        showCustomOutfitNames = v23.getCustomOutfitNames()
    };
end)(v16));