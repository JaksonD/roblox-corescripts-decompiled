local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_LoadingSpinner_0 = v7.App.Loading.LoadingSpinner;
local v12 = v4.PureComponent:extend("AvatarLoadingSpinner");
v12.validateProps = v6.interface({
    currentCharacter = v6.optional(v6.instanceIsA("Model")), 
    layeredClothingLoading = v6.boolean, 
    hasAvatarData = v6.boolean, 
    ppeEmoteLoading = v6.optional(v6.boolean)
});
v12.init = function(v13) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    v13.containerRef = v4.createRef();
    local v14, v15 = v4.createBinding(nil);
    v13.characterScreenPosition = v14;
    v13.updateCharacterScreenPosition = v15;
    v14, v15 = v4.createBinding(nil);
    v13.containerPositon = v14;
    v13.updateContainerPosition = v15;
    v13.positionBinding = v4.joinBindings({
        characterScreenPosition = v13.characterScreenPosition, 
        containerPositon = v13.containerPositon
    }):map(function(v16) --[[ Line: 49 ]]
        local l_characterScreenPosition_0 = v16.characterScreenPosition;
        local l_containerPositon_0 = v16.containerPositon;
        if not l_characterScreenPosition_0 or not l_containerPositon_0 then
            return UDim2.fromScale(0.5, 0.5);
        else
            return (UDim2.fromOffset(l_characterScreenPosition_0.X - l_containerPositon_0.X, l_characterScreenPosition_0.Y - l_containerPositon_0.Y));
        end;
    end);
    v13.absolutePositionChanged = function(v19) --[[ Line: 67 ]]
        -- upvalues: v13 (copy)
        v13.updateContainerPosition(v19.AbsolutePosition);
    end;
    v13.renderStepped = function() --[[ Line: 71 ]]
        -- upvalues: v13 (copy)
        v13:updateSpinnerPosition();
    end;
end;
v12.shouldRender = function(v20) --[[ Line: 76 ]] --[[ Name: shouldRender ]]
    return v20.props.ppeEmoteLoading or v20.props.layeredClothingLoading or not v20.props.hasAvatarData;
end;
v12.render = function(v21) --[[ Line: 80 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_LoadingSpinner_0 (copy), l_ExternalEventConnection_0 (copy), l_RunService_0 (copy)
    if v21:shouldRender() then
        return v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            [v4.Change.AbsolutePosition] = v21.absolutePositionChanged, 
            [v4.Ref] = v21.containerRef
        }, {
            LoadingSpinner = v4.createElement(l_LoadingSpinner_0, {
                size = UDim2.fromOffset(48, 48), 
                position = v21.positionBinding, 
                anchorPoint = Vector2.new(0.5, 0.5)
            }), 
            RenderSteppedConnection = v4.createElement(l_ExternalEventConnection_0, {
                event = l_RunService_0.RenderStepped, 
                callback = v21.renderStepped
            })
        });
    else
        return nil;
    end;
end;
v12.didMount = function(v22) --[[ Line: 104 ]] --[[ Name: didMount ]]
    if v22.containerRef:getValue() then
        v22.absolutePositionChanged(v22.containerRef:getValue());
    end;
    v22:updateSpinnerPosition();
end;
v12.updateSpinnerPosition = function(v23) --[[ Line: 112 ]] --[[ Name: updateSpinnerPosition ]]
    -- upvalues: l_Workspace_0 (copy)
    if not v23.props.currentCharacter or not v23.props.hasAvatarData then
        return;
    else
        local l_BoundingBox_0, _ = v23.props.currentCharacter:GetBoundingBox();
        local v26 = l_Workspace_0.CurrentCamera:WorldToScreenPoint(l_BoundingBox_0.Position);
        v23.updateCharacterScreenPosition(v26);
        return;
    end;
end;
v12.didUpdate = function(v27, v28) --[[ Line: 123 ]] --[[ Name: didUpdate ]]
    local v29 = v27.props.layeredClothingLoading and not v28.layeredClothingLoading;
    local v30 = v27.props.currentCharacter ~= v28.currentCharacter;
    local v31 = v27.props.ppeEmoteLoading and not v28.ppeEmoteLoading;
    if v29 or v30 or v31 then
        v27:updateSpinnerPosition();
    end;
end;
return (v5.connect(function(v32, _) --[[ Line: 133 ]] --[[ Name: mapStateToProps ]]
    local v34 = v32.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.ppeEmoteLoadingCount > 0;
    return {
        currentCharacter = v32.AvatarExperience.AvatarScene.Character.CurrentCharacter, 
        layeredClothingLoading = v32.AvatarExperience.AvatarScene.Character.ApplyingLayeredClothing, 
        hasAvatarData = v32.AvatarExperience.AvatarEditor.HasAvatarData, 
        ppeEmoteLoading = v34
    };
end, nil)(v12));