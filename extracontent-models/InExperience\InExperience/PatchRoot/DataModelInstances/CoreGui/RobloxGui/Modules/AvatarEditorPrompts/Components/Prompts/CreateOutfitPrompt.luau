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
local v10 = require(l_Parent_0.Prompts.PromptWithAvatarViewport);
local v11 = require(l_Parent_1.Thunks.SignalCreateOutfitPermissionDenied);
local v12 = require(l_Parent_1.Actions.CreateOutfitConfirmed);
local v13 = require(l_Parent_1.Thunks.PerformCreateOutfit);
local v14 = require(l_Parent_1.AvatarEditorPromptsPolicy);
local v15 = v2.PureComponent:extend("CreateOutfitPrompt");
v15.validateProps = v4.strictInterface({
    humanoidDescription = v4.instanceOf("HumanoidDescription"), 
    rigType = v4.enum(Enum.HumanoidRigType), 
    createOutfitConfirmed = v4.callback, 
    signalCreateOutfitPermissionDenied = v4.callback, 
    performCreateOutfit = v4.callback, 
    showCustomOutfitNames = v4.boolean
});
v15.render = function(v16) --[[ Line: 41 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v10 (copy), v7 (copy), l_ButtonType_0 (copy)
    local v17 = nil;
    v17 = if v16.props.showCustomOutfitNames then v16.props.createOutfitConfirmed else v16.props.performCreateOutfit;
    return v2.createElement(v10, {
        humanoidDescription = v16.props.humanoidDescription, 
        rigType = v16.props.rigType, 
        title = v7:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptTitle"), 
        bodyText = v7:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptText"), 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v16.props.signalCreateOutfitPermissionDenied, 
                        text = v7:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptNo")
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v17, 
                        text = v7:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptYes")
                    }, 
                    isDefaultChild = false
                }
            }
        }
    });
end;
v15 = v3.connect(function(v18) --[[ Line: 77 ]] --[[ Name: mapStateToProps ]]
    return {
        humanoidDescription = v18.promptInfo.humanoidDescription, 
        rigType = v18.promptInfo.rigType
    };
end, function(v19) --[[ Line: 84 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v11 (copy), v12 (copy), v13 (copy)
    return {
        signalCreateOutfitPermissionDenied = function() --[[ Line: 86 ]] --[[ Name: signalCreateOutfitPermissionDenied ]]
            -- upvalues: v19 (copy), v11 (ref)
            return v19(v11);
        end, 
        createOutfitConfirmed = function() --[[ Line: 90 ]] --[[ Name: createOutfitConfirmed ]]
            -- upvalues: v19 (copy), v12 (ref)
            return v19(v12());
        end, 
        performCreateOutfit = function() --[[ Line: 94 ]] --[[ Name: performCreateOutfit ]]
            -- upvalues: v19 (copy), v13 (ref)
            return v19(v13(""));
        end
    };
end)(v15);
return (v14.connect(function(v20, _) --[[ Line: 102 ]]
    return {
        showCustomOutfitNames = v20.getCustomOutfitNames()
    };
end)(v15));