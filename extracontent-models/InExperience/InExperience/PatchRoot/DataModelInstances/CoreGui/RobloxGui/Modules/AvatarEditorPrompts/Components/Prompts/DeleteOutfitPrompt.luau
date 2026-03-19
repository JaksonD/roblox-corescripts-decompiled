local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_LoadableImage_0 = v5.App.Loading.LoadableImage;
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local v10 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_Parent_0 = script.Parent.Parent.Parent;
local v12 = require(l_Parent_0.Thunks.SignalDeleteOutfitPermissionDenied);
local v13 = require(l_Parent_0.Thunks.PerformDeleteOutfit);
local v14 = require(l_Parent_0.AvatarEditorPromptsPolicy);
local v15 = v2.PureComponent:extend("DeleteOutfitPrompt");
v15.validateProps = v4.strictInterface({
    screenSize = v4.Vector2, 
    outfitId = v4.integer, 
    outfitName = v4.string, 
    performDeleteOutfit = v4.callback, 
    signalDeleteOutfitPermissionDenied = v4.callback, 
    showCustomOutfitNames = v4.boolean
});
v15.init = function(v16) --[[ Line: 43 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_LoadableImage_0 (copy)
    v16.renderAlertMiddleContent = function() --[[ Line: 44 ]]
        -- upvalues: v16 (copy), v2 (ref), l_LoadableImage_0 (ref)
        local v17 = "rbxthumb://type=Outfit&id=" .. v16.props.outfitId .. "&w=150&h=150";
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 150)
        }, {
            Thumnail = v2.createElement(l_LoadableImage_0, {
                Position = UDim2.fromScale(0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Size = UDim2.fromOffset(150, 150), 
                BackgroundTransparency = 1, 
                Image = v17, 
                useShimmerAnimationWhileLoading = true, 
                showFailedStateWhenLoadingFailed = true
            })
        });
    end;
end;
v15.render = function(v18) --[[ Line: 64 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v19 = nil;
    v19 = if v18.props.showCustomOutfitNames then v10:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptText", {
        RBX_NAME = v18.props.outfitName
    }) else v10:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptTextNoName");
    return v2.createElement(l_InteractiveAlert_0, {
        title = v10:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptTitle"), 
        bodyText = v19, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v18.props.signalDeleteOutfitPermissionDenied, 
                        text = v10:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptNo")
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v18.props.performDeleteOutfit, 
                        text = v10:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptYes")
                    }, 
                    isDefaultChild = false
                }
            }
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v18.props.screenSize, 
        middleContent = v18.renderAlertMiddleContent, 
        isMiddleContentFocusable = false
    });
end;
v15 = v3.connect(function(v20) --[[ Line: 103 ]] --[[ Name: mapStateToProps ]]
    return {
        screenSize = v20.screenSize, 
        outfitId = v20.promptInfo.outfitId, 
        outfitName = v20.promptInfo.outfitName
    };
end, function(v21) --[[ Line: 111 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v12 (copy), v13 (copy)
    return {
        signalDeleteOutfitPermissionDenied = function() --[[ Line: 113 ]] --[[ Name: signalDeleteOutfitPermissionDenied ]]
            -- upvalues: v21 (copy), v12 (ref)
            return v21(v12);
        end, 
        performDeleteOutfit = function() --[[ Line: 117 ]] --[[ Name: performDeleteOutfit ]]
            -- upvalues: v21 (copy), v13 (ref)
            return v21(v13);
        end
    };
end)(v15);
return (v14.connect(function(v22, _) --[[ Line: 125 ]]
    return {
        showCustomOutfitNames = v22.getCustomOutfitNames()
    };
end)(v15));