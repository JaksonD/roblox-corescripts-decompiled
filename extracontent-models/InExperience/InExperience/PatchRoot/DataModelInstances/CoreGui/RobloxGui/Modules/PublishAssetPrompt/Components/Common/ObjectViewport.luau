local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_Skeleton_0 = require(l_CorePackages_0.Packages.Foundation).Skeleton;
local l_withStyle_0 = v3.Style.withStyle;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local v7 = require(l_CorePackages_0.Packages.t);
local l_Images_0 = v3.App.ImageSet.Images;
local v9 = require(script.Parent.Parent.Parent.Constants);
local l_CharacterUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).CharacterUtility;
local l_CameraUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).CameraUtility;
local l_CFrameUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).CFrameUtility;
local l_EmoteUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).EmoteUtility;
local l_IconButton_0 = v3.App.Button.IconButton;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local v16 = l_Images_0["icons/actions/previewExpand"];
local v17 = l_Images_0["component_assets/dropshadow_25"];
local v18 = UDim2.new(0.4, 50, 0.15, 10);
local v19 = UDim2.new(0.5, 0, 1, 0);
local v20 = v2.PureComponent:extend("ObjectViewport");
v20.validateProps = v7.strictInterface({
    model = v7.optional(v7.instanceOf("Model")), 
    fieldOfView = v7.optional(v7.number), 
    isLoading = v7.optional(v7.boolean), 
    useFullBodyCameraSettings = v7.optional(v7.boolean), 
    openPreviewView = v7.optional(v7.callback), 
    LayoutOrder = v7.optional(v7.number), 
    isHumanoidModel = v7.optional(v7.boolean)
});
v20.createCamera = function(v21) --[[ Line: 48 ]] --[[ Name: createCamera ]]
    local l_Camera_0 = Instance.new("Camera");
    l_Camera_0.CameraType = Enum.CameraType.Scriptable;
    l_Camera_0.Parent = v21.worldModelRef:getValue();
    l_Camera_0.HeadLocked = true;
    l_Camera_0.VRTiltAndRollEnabled = true;
    return l_Camera_0;
end;
v20.init = function(v23) --[[ Line: 58 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v23.worldModelRef = v2.createRef();
    local v24, v25 = v2.createBinding(nil);
    v23.camera = v24;
    v23.updateCamera = v25;
    v23.isMounted = false;
end;
local function _(v26, v27) --[[ Line: 64 ]] --[[ Name: getCameraDistance ]]
    local l_X_0 = v27.X;
    local l_Y_0 = v27.Y;
    local l_Z_0 = v27.Z;
    local v31 = math.max(l_X_0, l_Y_0, l_Z_0);
    local v32 = 1 / math.tan(math.rad(v26) / 2);
    return v31 / 2 * v32 + l_Z_0 / 2;
end;
v20.setupViewportForAsset = function(v34) --[[ Line: 72 ]] --[[ Name: setupViewportForAsset ]]
    if not v34.props.model then
        return;
    else
        local v35 = v34.props.model:Clone();
        v35.Parent = v34.worldModelRef:getValue();
        local v36 = nil;
        local v37 = nil;
        if v35:IsA("Model") then
            v35:MoveTo((Vector3.new(0, 0, 0, 0)));
            v36 = v35:GetModelCFrame();
            v37 = v35:GetExtentsSize();
        else
            local l_v35_FirstChildWhichIsA_0 = v35:FindFirstChildWhichIsA("MeshPart", true);
            if not l_v35_FirstChildWhichIsA_0 then
                return;
            else
                l_v35_FirstChildWhichIsA_0.CFrame = CFrame.new(0, 0, 0);
                v36 = l_v35_FirstChildWhichIsA_0.CFrame;
                v37 = l_v35_FirstChildWhichIsA_0.Size;
            end;
        end;
        local l_lookVector_0 = v36.lookVector;
        local v40 = v34:createCamera();
        local v41 = if v34.props.fieldOfView then v34.props.fieldOfView else 30;
        local l_v37_0 = v37;
        local l_X_1 = l_v37_0.X;
        local l_Y_1 = l_v37_0.Y;
        local l_Z_1 = l_v37_0.Z;
        local v46 = math.max(l_X_1, l_Y_1, l_Z_1);
        local v47 = 1 / math.tan(math.rad(v41) / 2);
        local v48 = v46 / 2 * v47 + l_Z_1 / 2;
        l_v37_0 = Vector2.new(5, 20);
        l_X_1 = l_lookVector_0;
        l_Y_1 = math.rad(l_v37_0.X);
        l_Z_1 = math.rad(l_v37_0.Y);
        l_X_1 = CFrame.fromAxisAngle(Vector3.new(1, 0, 0, 0), l_Y_1):VectorToWorldSpace(l_X_1);
        l_X_1 = CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), l_Z_1):VectorToWorldSpace(l_X_1);
        v46 = v36.Position + l_X_1 * v48;
        v40.CFrame = CFrame.new(v46, v36.Position);
        v40.FieldOfView = v41;
        v34.updateCamera(v40);
        return;
    end;
end;
v20.setupViewport = function(v49) --[[ Line: 130 ]] --[[ Name: setupViewport ]]
    -- upvalues: l_EmoteUtility_0 (copy), l_RunService_0 (copy), l_CFrameUtility_0 (copy), l_CharacterUtility_0 (copy), l_CameraUtility_0 (copy)
    local v50 = v49.props.model:Clone();
    assert(v50.PrimaryPart, "The Model should have a PrimaryPart for setting up Camera");
    v50.Parent = v49.worldModelRef:getValue();
    v50:MoveTo((Vector3.new(0, 0, 0, 0)));
    local l_useFullBodyCameraSettings_0 = v49.props.useFullBodyCameraSettings;
    if l_useFullBodyCameraSettings_0 then
        l_EmoteUtility_0.SetPlayerCharacterPoseWithMoodFallback(v50);
        l_RunService_0.PostSimulation:Wait();
        if not v49.isMounted then
            return;
        end;
    end;
    local v52 = v49:createCamera();
    local v53 = nil;
    if l_useFullBodyCameraSettings_0 then
        local v54 = l_CFrameUtility_0.CalculateTargetCFrame(v50.Head.CFrame);
        v53 = v54 - v54.Position + v50.PrimaryPart.CFrame.Position;
    else
        v53 = v50.PrimaryPart.CFrame;
    end;
    local v55, v56 = l_CharacterUtility_0.CalculateModelExtents(v50, v53);
    local v57 = {
        optFieldOfView = if v49.props.fieldOfView then v49.props.fieldOfView else 30, 
        targetCFrame = v53, 
        minExtent = v55, 
        maxExtent = v56, 
        extentScale = 1
    };
    if l_useFullBodyCameraSettings_0 then
        v57.optCameraXRot = l_CameraUtility_0.XRotForFullBody;
        v57.optCameraDistanceScale = l_CameraUtility_0.DistanceScaleForFullBody;
        v57.extentScale = l_CameraUtility_0.DefaultBodyMarginScale;
    else
        v57.optCameraYRot = 25;
    end;
    l_CameraUtility_0.SetupCamera(v52, v57);
    v49.updateCamera(v52);
end;
v20.didMount = function(v58) --[[ Line: 174 ]] --[[ Name: didMount ]]
    v58.isMounted = true;
    task.spawn(function() --[[ Line: 176 ]]
        -- upvalues: v58 (copy)
        if not v58.props.isLoading then
            if v58.props.isHumanoidModel then
                v58:setupViewport();
                return;
            else
                v58:setupViewportForAsset();
            end;
        end;
    end);
end;
v20.didUpdate = function(v59, v60) --[[ Line: 187 ]] --[[ Name: didUpdate ]]
    if v60.isLoading and not v59.props.isLoading then
        task.spawn(function() --[[ Line: 190 ]]
            -- upvalues: v59 (copy)
            if v59.props.isHumanoidModel then
                v59:setupViewport();
                return;
            else
                v59:setupViewportForAsset();
                return;
            end;
        end);
    end;
end;
v20.render = function(v61) --[[ Line: 200 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v2 (copy), v9 (copy), l_IconButton_0 (copy), v16 (copy), l_IconSize_0 (copy), l_ImageSetLabel_0 (copy), v19 (copy), v17 (copy), v18 (copy), l_Skeleton_0 (copy)
    return l_withStyle_0(function(v62) --[[ Line: 201 ]]
        -- upvalues: v61 (copy), v2 (ref), v9 (ref), l_IconButton_0 (ref), v16 (ref), l_IconSize_0 (ref), l_ImageSetLabel_0 (ref), v19 (ref), v17 (ref), v18 (ref), l_Skeleton_0 (ref)
        local l_Theme_0 = v62.Theme;
        if not v61.props.isLoading then
            return v2.createElement("Frame", {
                BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
                BackgroundTransparency = 0, 
                Size = UDim2.new(1, v9.PromptSidePadding * 2, 0, 240), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                LayoutOrder = v61.props.LayoutOrder
            }, {
                ViewportFrame = v2.createElement("ViewportFrame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    LightColor = v9.ViewportLightColor, 
                    Ambient = v9.ViewportLightAmbient, 
                    LightDirection = v9.ViewportLightDirection, 
                    CurrentCamera = v61.camera
                }, {
                    WorldModel = v2.createElement("WorldModel", {
                        [v2.Ref] = v61.worldModelRef
                    })
                }), 
                ExpandPreviewButton = v61.props.openPreviewView and v2.createElement(l_IconButton_0, {
                    position = UDim2.new(1, -v9.PromptSidePadding, 1, 0), 
                    anchorPoint = Vector2.new(1, 1), 
                    icon = v16, 
                    iconSize = l_IconSize_0.Medium, 
                    onActivated = v61.props.openPreviewView
                }), 
                Gradient = v2.createElement("UIGradient", {
                    Rotation = 90, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, l_Theme_0.BackgroundMuted.Color), 
                        ColorSequenceKeypoint.new(1, l_Theme_0.BackgroundMuted.Color)
                    }), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1), 
                        NumberSequenceKeypoint.new(0.7, 0.75), 
                        NumberSequenceKeypoint.new(1, 1)
                    })
                }), 
                DropShadow = v2.createElement(l_ImageSetLabel_0, {
                    Position = v19, 
                    AnchorPoint = Vector2.new(0.5, 1), 
                    Image = v17, 
                    BackgroundTransparency = 1, 
                    ImageTransparency = 0.5, 
                    Size = v18, 
                    ZIndex = 0
                })
            });
        else
            return (v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, v9.PromptSidePadding * 2, 0, 240), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                LayoutOrder = v61.props.LayoutOrder
            }));
        end;
    end);
end;
v20.willUnmount = function(v64) --[[ Line: 267 ]] --[[ Name: willUnmount ]]
    v64.isMounted = false;
end;
return v20;