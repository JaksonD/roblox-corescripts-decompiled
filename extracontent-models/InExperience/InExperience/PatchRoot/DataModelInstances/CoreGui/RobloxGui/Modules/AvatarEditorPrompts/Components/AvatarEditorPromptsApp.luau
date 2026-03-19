local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local v8 = require(l_CorePackages_0.Packages.t);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v10 = require(script.Parent.Connection);
local l_Prompts_0 = script.Parent.Prompts;
local v12 = require(l_Prompts_0.AllowInventoryReadAccessPrompt);
local v13 = require(l_Prompts_0.SaveAvatarPrompt);
local v14 = require(l_Prompts_0.SaveAvatarTimeoutPrompt);
local v15 = require(l_Prompts_0.CreateOutfitPrompt);
local v16 = require(l_Prompts_0.EnterOutfitNamePrompt);
local v17 = require(l_Prompts_0.SetFavoritePrompt);
local v18 = require(l_Prompts_0.DeleteOutfitPrompt);
local v19 = require(l_Prompts_0.RenameOutfitPrompt);
local v20 = require(l_Prompts_0.UpdateOutfitPrompt);
local l_FFlagAXAvatarTimeoutFlowIE_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Parent_0 = script.Parent.Parent;
local v24 = require(l_Parent_0.PromptType);
local v25 = require(l_Parent_0.Actions.ScreenSizeUpdated);
local v26 = {
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
local v27 = {
    [v24.AllowInventoryReadAccess] = v12, 
    [v24.SaveAvatar] = v13, 
    [v24.CreateOutfit] = v15, 
    [v24.EnterOutfitName] = v16, 
    [v24.SetFavorite] = v17, 
    [v24.DeleteOutfit] = v18, 
    [v24.RenameOutfit] = v19, 
    [v24.UpdateOutfit] = v20
};
if l_FFlagAXAvatarTimeoutFlowIE_0 then
    v27[v24.SaveAvatarTimeout] = v14;
end;
local v28 = v5.PureComponent:extend("AvatarEditorPromptsApp");
v28.validateProps = v8.strictInterface({
    promptType = v8.optional(v8.userdata), 
    screenSizeUpdated = v8.callback
});
v28.init = function(v29) --[[ Line: 75 ]] --[[ Name: init ]]
    -- upvalues: v26 (copy), l_UserInputService_0 (copy), v7 (copy)
    v29:setState({
        isGamepad = v26[l_UserInputService_0:GetLastInputType()] or false
    });
    v29.absoluteSizeChanged = function(v30) --[[ Line: 80 ]]
        -- upvalues: v29 (copy)
        v29.props.screenSizeUpdated(v30.AbsoluteSize);
    end;
    v29.focusController = v7.createFocusController();
    v29.selectedCoreGuiObject = nil;
    v29.selectedGuiObject = nil;
end;
v28.render = function(v31) --[[ Line: 90 ]] --[[ Name: render ]]
    -- upvalues: v27 (copy), v5 (copy), v10 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v26 (copy), v7 (copy)
    local v32 = nil;
    if v31.props.promptType then
        local v33 = v27[v31.props.promptType];
        if v33 then
            v32 = v5.createElement(v33);
        else
            error("Unexpected prompt type!");
        end;
    end;
    if v32 == nil then
        return nil;
    else
        return (v5.createElement("ScreenGui", {
            IgnoreGuiInset = true, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            AutoLocalize = false, 
            DisplayOrder = -1, 
            [v5.Change.AbsoluteSize] = v31.absoluteSizeChanged
        }, {
            Connection = v5.createElement(v10), 
            LastInputTypeConnection = v5.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.LastInputTypeChanged, 
                callback = function(v34) --[[ Line: 115 ]] --[[ Name: callback ]]
                    -- upvalues: v31 (copy), v26 (ref)
                    v31:setState({
                        isGamepad = v26[v34] or false
                    });
                end
            }) or nil, 
            PromptFrame = v5.createElement(v7.Focusable.Frame, {
                focusController = v31.focusController, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                Prompt = v32
            }) or nil
        }));
    end;
end;
v28.revertSelectedGuiObject = function(v35) --[[ Line: 133 ]] --[[ Name: revertSelectedGuiObject ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_CoreGui_0 (copy), l_GuiService_0 (copy)
    local v36 = l_LocalPlayer_0 and l_LocalPlayer_0:FindFirstChildWhichIsA("PlayerGui");
    if v35.selectedCoreGuiObject and v35.selectedCoreGuiObject:IsDescendantOf(l_CoreGui_0) then
        l_GuiService_0.SelectedCoreObject = v35.selectedCoreGuiObject;
    elseif v35.selectedGuiObject and v35.selectedGuiObject:IsDescendantOf(v36) then
        l_GuiService_0.SelectedObject = v35.selectedGuiObject;
        l_GuiService_0.SelectedCoreObject = nil;
    else
        l_GuiService_0.SelectedCoreObject = nil;
    end;
    v35.selectedCoreGuiObject = nil;
    v35.selectedGuiObject = nil;
end;
v28.didUpdate = function(v37, v38, v39) --[[ Line: 149 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GuiService_0 (copy)
    local v40 = v37.state.isGamepad and v37.props.promptType ~= nil;
    if v40 ~= (v39.isGamepad and v38.promptType ~= nil) then
        if v40 then
            v37.selectedCoreGuiObject = l_GuiService_0.SelectedCoreObject;
            v37.selectedGuiObject = l_GuiService_0.SelectedObject;
            l_GuiService_0.SelectedObject = nil;
            v37.focusController.captureFocus();
            return;
        else
            v37.focusController.releaseFocus();
            if v37.state.isGamepad then
                v37:revertSelectedGuiObject();
            end;
        end;
    end;
end;
v28.willUnmount = function(v41) --[[ Line: 168 ]] --[[ Name: willUnmount ]]
    if v41.state.isGamepad then
        v41:revertSelectedGuiObject();
    end;
end;
return v6.connect(function(v42) --[[ Line: 174 ]] --[[ Name: mapStateToProps ]]
    return {
        promptType = v42.promptInfo.promptType
    };
end, function(v43) --[[ Line: 180 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v25 (copy)
    return {
        screenSizeUpdated = function(v44) --[[ Line: 182 ]] --[[ Name: screenSizeUpdated ]]
            -- upvalues: v43 (copy), v25 (ref)
            return v43(v25(v44));
        end
    };
end)(v28);