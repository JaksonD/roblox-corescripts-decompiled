local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_ButtonType_0 = require(l_CorePackages_0.Packages.UIBlox).App.Button.Enum.ButtonType;
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local v7 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v10 = require(l_Parent_1.Thunks.SignalUpdateOutfitPermissionDenied);
local v11 = require(l_Parent_1.Thunks.PerformUpdateOutfit);
local v12 = require(l_Parent_0.Prompts.PromptWithAvatarViewport);
local v13 = require(l_Parent_1.AvatarEditorPromptsPolicy);
local v14 = v2.PureComponent:extend("UpdateOutfitPrompt");
v14.validateProps = v4.strictInterface({
    screenSize = v4.Vector2, 
    humanoidDescription = v4.instanceOf("HumanoidDescription"), 
    rigType = v4.enum(Enum.HumanoidRigType), 
    outfitName = v4.string, 
    signalUpdateOutfitPermissionDenied = v4.callback, 
    performUpdateOutfit = v4.callback, 
    showCustomOutfitNames = v4.boolean
});
v14.render = function(v15) --[[ Line: 45 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v2 (copy), v12 (copy), l_ButtonType_0 (copy)
    local v16 = nil;
    v16 = if v15.props.showCustomOutfitNames then v7:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptText", {
        RBX_NAME = v15.props.outfitName
    }) else v7:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptTextNoOutfitName");
    return v2.createElement(v12, {
        humanoidDescription = v15.props.humanoidDescription, 
        rigType = v15.props.rigType, 
        title = v7:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptTitle"), 
        bodyText = v16, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v15.props.signalUpdateOutfitPermissionDenied, 
                        text = v7:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptNo")
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v15.props.performUpdateOutfit, 
                        text = v7:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptYes")
                    }, 
                    isDefaultChild = false
                }
            }
        }
    });
end;
v14 = v3.connect(function(v17) --[[ Line: 83 ]] --[[ Name: mapStateToProps ]]
    return {
        screenSize = v17.screenSize, 
        humanoidDescription = v17.promptInfo.humanoidDescription, 
        rigType = v17.promptInfo.rigType, 
        outfitName = v17.promptInfo.outfitName
    };
end, function(v18) --[[ Line: 92 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v10 (copy), v11 (copy)
    return {
        signalUpdateOutfitPermissionDenied = function() --[[ Line: 94 ]] --[[ Name: signalUpdateOutfitPermissionDenied ]]
            -- upvalues: v18 (copy), v10 (ref)
            return v18(v10);
        end, 
        performUpdateOutfit = function() --[[ Line: 98 ]]
            -- upvalues: v18 (copy), v11 (ref)
            return v18(v11);
        end or nil
    };
end)(v14);
return (v13.connect(function(v19, _) --[[ Line: 106 ]]
    return {
        showCustomOutfitNames = v19.getCustomOutfitNames()
    };
end)(v14));