local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_Modules_0.LuaApp.getCameraSettingsToFitModel);
local v7 = require(l_Modules_0.LuaApp.Components.Generic.ViewportFrame);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppContentProvider_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppContentProvider;
local v10 = Vector3.new(0, -300, 0, 0);
local function _() --[[ Line: 33 ]]
    -- upvalues: v10 (ref)
    local l_v10_0 = v10;
    v10 = v10 + Vector3.new(30, 0, 0, 0);
    return l_v10_0;
end;
local function _(v13) --[[ Line: 39 ]] --[[ Name: getRobloxAnimationId ]]
    return "http://www.roblox.com/asset/?id=" .. v13;
end;
local v15 = v5.interface({
    modelRef = v5.optional(v5.strictInterface({
        value = v5.instanceIsA("Model")
    })), 
    animationIds = v5.optional(v5.array(v5.string)), 
    pauseAnimations = v5.optional(v5.boolean), 
    cameraCFrameOffset = v5.optional(v5.CFrame), 
    topOffsetScale = v5.optional(v5.number), 
    bottomOffsetScale = v5.optional(v5.number), 
    cameraUpdatedCallback = v5.optional(v5.callback), 
    Size = v5.optional(v5.UDim2), 
    Position = v5.optional(v5.UDim2), 
    contentProvider = v5.any
});
local v16 = v4.PureComponent:extend("AvatarViewportFrame");
v16.defaultProps = {
    cameraCFrameOffset = CFrame.new(), 
    topOffsetScale = 0.01, 
    bottomOffsetScale = 0.01
};
v16.init = function(v17) --[[ Line: 81 ]] --[[ Name: init ]]
    -- upvalues: v10 (ref)
    v17.state = {
        cameraDistance = nil, 
        cameraFocusPoint = nil, 
        cameraLookVector = nil, 
        cameraUpVector = nil
    };
    v17.isMounted = false;
    v17.animationTracks = nil;
    v17.animationSpeeds = nil;
    v17.modelCFrameOrientation = CFrame.new();
    local l_v10_1 = v10;
    v10 = v10 + Vector3.new(30, 0, 0, 0);
    v17.modelPosition = l_v10_1;
    v17.gameModelFolder = nil;
    v17.gameModel = nil;
    v17.partsToCopy = {};
    v17.renderSteppedConnection = nil;
    v17.collectPartsRecursive = function(v19, v20) --[[ Line: 106 ]]
        -- upvalues: v17 (copy)
        if v19 == nil or v20 == nil then
            return;
        else
            local l_v19_Children_0 = v19:GetChildren();
            local l_v20_Children_0 = v20:GetChildren();
            for v23 = 1, #l_v19_Children_0 do
                local v24 = l_v19_Children_0[v23];
                local v25 = l_v20_Children_0[v23];
                if v24:IsA("BasePart") and v25:IsA("BasePart") then
                    table.insert(v17.partsToCopy, {
                        srcPart = v24, 
                        targetPart = v25
                    });
                    v24.Transparency = 1;
                end;
                v17.collectPartsRecursive(v24, v25);
            end;
            return;
        end;
    end;
end;
v16.updateCamera = function(v26) --[[ Line: 133 ]] --[[ Name: updateCamera ]]
    -- upvalues: v6 (copy)
    local l_modelRef_0 = v26.props.modelRef;
    local l_cameraCFrameOffset_0 = v26.props.cameraCFrameOffset;
    local l_topOffsetScale_0 = v26.props.topOffsetScale;
    local l_bottomOffsetScale_0 = v26.props.bottomOffsetScale;
    if l_modelRef_0 ~= nil then
        local v31 = v26.gameModel or l_modelRef_0.value;
        spawn(function() --[[ Line: 143 ]]
            -- upvalues: v26 (copy), v31 (copy), l_cameraCFrameOffset_0 (copy), v6 (ref), l_bottomOffsetScale_0 (copy), l_topOffsetScale_0 (copy)
            v26.props.contentProvider:PreloadAsync(v26.animationTracks or {});
            v26.props.contentProvider:PreloadAsync({
                v31
            });
            if (v26.gameModel or v26.props.modelRef.value) ~= v31 then
                return;
            else
                local _, v33 = v31:GetBoundingBox();
                local v34 = CFrame.fromMatrix(Vector3.new(), -v26.modelCFrameOrientation.rightVector, v26.modelCFrameOrientation.UpVector) * l_cameraCFrameOffset_0;
                local l_lookVector_0 = v34.lookVector;
                local l_upVector_0 = v34.upVector;
                local v37 = v6({
                    model = v31, 
                    cameraFieldOfView = 70, 
                    upVector = l_upVector_0, 
                    lookVector = l_lookVector_0, 
                    bottomOffset = l_bottomOffsetScale_0 * v33.Y, 
                    topOffset = l_topOffsetScale_0 * v33.Y
                });
                if v26.isMounted then
                    v26:setState({
                        cameraDistance = v37.distance, 
                        cameraFocusPoint = v37.focusPoint, 
                        cameraLookVector = l_lookVector_0, 
                        cameraUpVector = l_upVector_0
                    });
                end;
                if v26.props.cameraUpdatedCallback then
                    v26.props.cameraUpdatedCallback();
                end;
                return;
            end;
        end);
    end;
end;
v16.updateAnimation = function(v38) --[[ Line: 188 ]] --[[ Name: updateAnimation ]]
    -- upvalues: l_RunService_0 (copy)
    if v38.animationTracks ~= nil then
        v38:RemoveAllAnimations();
    end;
    if v38.gameModel ~= nil then
        v38.gameModel:Destroy();
        v38.gameModel = nil;
    end;
    local l_modelRef_1 = v38.props.modelRef;
    local l_animationIds_0 = v38.props.animationIds;
    if l_modelRef_1 == nil or l_animationIds_0 == nil or #l_animationIds_0 == 0 then
        return;
    else
        v38.gameModel = l_modelRef_1.value:Clone();
        if v38.gameModelFolder == nil then
            v38.gameModelFolder = Instance.new("Folder");
            v38.gameModelFolder.Name = "LuaApp-AvatarViewportFrameModel-" .. tostring(v38);
            v38.gameModelFolder.Parent = game.Workspace;
        end;
        v38.gameModel.Parent = v38.gameModelFolder;
        v38.gameModel:SetPrimaryPartCFrame(CFrame.new(v38.modelPosition));
        l_modelRef_1.value:SetPrimaryPartCFrame(CFrame.new(v38.modelPosition));
        v38.partsToCopy = {};
        v38.collectPartsRecursive(v38.gameModel, l_modelRef_1.value);
        local l_gameModel_0 = v38.gameModel;
        v38.animationTracks = {};
        for _, v43 in ipairs(l_animationIds_0) do
            local l_Animation_0 = Instance.new("Animation");
            l_Animation_0.AnimationId = "http://www.roblox.com/asset/?id=" .. v43;
            l_Animation_0.Parent = l_gameModel_0;
            local v45 = l_gameModel_0.Humanoid:LoadAnimation(l_Animation_0);
            v45:Play();
            table.insert(v38.animationTracks, v45);
        end;
        if v38.renderSteppedConnection == nil then
            v38.renderSteppedConnection = l_RunService_0.renderStepped:Connect(function() --[[ Line: 246 ]]
                -- upvalues: v38 (copy)
                if v38.gameModel == nil or v38.props.modelRef == nil or v38.props.pauseAnimations == true then
                    return;
                else
                    for _, v47 in ipairs(v38.partsToCopy) do
                        v47.targetPart.CFrame = v47.srcPart.CFrame;
                    end;
                    return;
                end;
            end);
        end;
        return;
    end;
end;
v16.PauseAnimations = function(v48) --[[ Line: 258 ]] --[[ Name: PauseAnimations ]]
    if v48.animationTracks ~= nil then
        v48.animationSpeeds = {};
        for v49, v50 in ipairs(v48.animationTracks) do
            v48.animationSpeeds[v49] = v50.Speed;
            v50:AdjustSpeed(0);
        end;
    end;
end;
v16.UnPauseAnimations = function(v51) --[[ Line: 268 ]] --[[ Name: UnPauseAnimations ]]
    if v51.animationTracks ~= nil and v51.animationSpeeds ~= nil then
        for v52, v53 in ipairs(v51.animationTracks) do
            v53:AdjustSpeed(v51.animationSpeeds[v52]);
        end;
        v51.animationSpeeds = nil;
    end;
end;
v16.RemoveAllAnimations = function(v54) --[[ Line: 277 ]] --[[ Name: RemoveAllAnimations ]]
    if v54.animationTracks ~= nil then
        for _, v56 in ipairs(v54.animationTracks) do
            v56:Stop();
        end;
        v54.animationTracks = nil;
        v54.animationSpeeds = nil;
    end;
end;
v16.updateModelPosition = function(v57) --[[ Line: 292 ]] --[[ Name: updateModelPosition ]]
    local l_modelRef_2 = v57.props.modelRef;
    if l_modelRef_2 then
        l_modelRef_2.value:SetPrimaryPartCFrame(v57.modelCFrameOrientation + v57.modelPosition);
    end;
end;
v16.didMount = function(v59) --[[ Line: 300 ]] --[[ Name: didMount ]]
    v59.isMounted = true;
    v59:updateModelPosition();
    v59:updateAnimation();
    v59:updateCamera();
end;
v16.didUpdate = function(v60, v61) --[[ Line: 308 ]] --[[ Name: didUpdate ]]
    if v61.modelRef ~= v60.props.modelRef or v61.animationIds ~= v60.props.animationIds then
        v60:updateModelPosition();
        v60:updateAnimation();
        v60:updateCamera();
    end;
    if v61.pauseAnimations ~= v60.props.pauseAnimations then
        if v60.props.pauseAnimations == true then
            v60:PauseAnimations();
            return;
        else
            v60:UnPauseAnimations();
        end;
    end;
end;
v16.render = function(v62) --[[ Line: 324 ]] --[[ Name: render ]]
    -- upvalues: v15 (copy), v3 (copy), v4 (copy), v7 (copy)
    assert(v15(v62.props));
    local l_modelRef_3 = v62.props.modelRef;
    local l_cameraDistance_0 = v62.state.cameraDistance;
    local l_cameraFocusPoint_0 = v62.state.cameraFocusPoint;
    local l_cameraLookVector_0 = v62.state.cameraLookVector;
    local l_cameraUpVector_0 = v62.state.cameraUpVector;
    local v68 = v3.Dictionary.join(v62.props, {
        modelRef = v3.None, 
        animationIds = v3.None, 
        pauseAnimations = v3.None, 
        cameraCFrameOffset = v3.None, 
        topOffsetScale = v3.None, 
        bottomOffsetScale = v3.None, 
        cameraUpdatedCallback = v3.None, 
        contentProvider = v3.None
    });
    return v4.createElement(v7, {
        regularProps = v68, 
        modelRef = l_modelRef_3, 
        cameraDistance = l_cameraDistance_0, 
        cameraFocusPoint = l_cameraFocusPoint_0, 
        cameraLookVector = l_cameraLookVector_0, 
        cameraUpVector = l_cameraUpVector_0
    });
end;
v16.willUnmount = function(v69) --[[ Line: 354 ]] --[[ Name: willUnmount ]]
    v69.isMounted = false;
    if v69.gameModel ~= nil then
        v69.gameModel:Destroy();
        v69.gameModel = nil;
    end;
    if v69.gameModelFolder ~= nil then
        v69.gameModelFolder:Destroy();
        v69.gameModelFolder = nil;
    end;
    if v69.renderSteppedConnection ~= nil then
        v69.renderSteppedConnection:Disconnect();
        v69.renderSteppedConnection = nil;
    end;
end;
return (l_RoactServices_0.connect({
    contentProvider = l_AppContentProvider_0
})(v16));