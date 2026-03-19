local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_CameraUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).CameraUtility;
local l_MannequinUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).MannequinUtility;
local v6 = require(script.Parent.Parent.Parent.Parent.Constants);
local v7 = v1.PureComponent:extend("AvatarPartViewport");
v7.validateProps = v2.strictInterface({
    LayoutOrder = v2.optional(v2.number), 
    asset = v2.union(v2.table, v2.instanceOf("MeshPart"), v2.instanceOf("Accessory")), 
    viewportSize = v2.optional(v2.Vector2)
});
v7.init = function(v8) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v8.camera = nil;
    v8.modelRef = v1.createRef();
    local v9, v10 = v1.createBinding(nil);
    v8.camera = v9;
    v8.updateCamera = v10;
end;
v7.createViewportCamera = function(v11) --[[ Line: 40 ]] --[[ Name: createViewportCamera ]]
    local l_Camera_0 = Instance.new("Camera");
    l_Camera_0.Parent = v11.modelRef:getValue();
    l_Camera_0.CameraType = Enum.CameraType.Scriptable;
    l_Camera_0.HeadLocked = true;
    l_Camera_0.VRTiltAndRollEnabled = true;
    return l_Camera_0;
end;
v7.addBodyPartMannequinToViewport = function(v13) --[[ Line: 51 ]] --[[ Name: addBodyPartMannequinToViewport ]]
    -- upvalues: l_MannequinUtility_0 (copy), l_CameraUtility_0 (copy)
    local v14, v15, v16 = l_MannequinUtility_0.CreateBodyPartMannequin(v13.props.asset, false);
    local v17, v18 = l_MannequinUtility_0.SetupBodyPartMannequin(v14, v15, v16, v13.props.asset);
    v16.Parent = v13.modelRef:getValue();
    local v19 = v13:createViewportCamera();
    l_CameraUtility_0.SetupBodyPartCamera(v16, v17, v18, v19);
    v13.updateCamera(v19);
end;
v7.addHeadModelToViewport = function(v20) --[[ Line: 63 ]] --[[ Name: addHeadModelToViewport ]]
    -- upvalues: l_MannequinUtility_0 (copy), l_CameraUtility_0 (copy)
    local v21 = l_MannequinUtility_0.CreateHeadModel(v20.props.asset);
    v21.Parent = v20.modelRef:getValue();
    local v22 = v20:createViewportCamera();
    l_CameraUtility_0.SetupHeadCamera(v21, v22);
    v20.updateCamera(v22);
end;
v7.addAccessoryToViewport = function(v23) --[[ Line: 72 ]] --[[ Name: addAccessoryToViewport ]]
    -- upvalues: l_CameraUtility_0 (copy)
    local l_asset_0 = v23.props.asset;
    local l_Model_0 = Instance.new("Model");
    l_asset_0.Parent = l_Model_0;
    l_Model_0.Parent = v23.modelRef:getValue();
    local v26 = v23:createViewportCamera();
    l_CameraUtility_0.SetupAccessoryCamera(l_Model_0, v26);
    v23.updateCamera(v26);
end;
v7.didMount = function(v27) --[[ Line: 82 ]] --[[ Name: didMount ]]
    local l_asset_1 = v27.props.asset;
    if typeof(l_asset_1) == "Instance" then
        if l_asset_1:IsA("MeshPart") then
            v27:addHeadModelToViewport();
            return;
        else
            v27:addAccessoryToViewport();
            return;
        end;
    else
        v27:addBodyPartMannequinToViewport();
        return;
    end;
end;
v7.render = function(v29) --[[ Line: 95 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v6 (copy), v1 (copy)
    return l_withStyle_0(function(v30) --[[ Line: 96 ]]
        -- upvalues: v29 (copy), v6 (ref), v1 (ref)
        local l_Theme_0 = v30.Theme;
        local v32 = if v29.props.viewportSize then v29.props.viewportSize else v6.ItemCardWidthLandscape;
        return v1.createElement("Frame", {
            LayoutOrder = v29.props.LayoutOrder, 
            BackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
            BackgroundTransparency = l_Theme_0.PlaceHolder.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.fromOffset(v32, v32), 
            ZIndex = 0
        }, {
            UICorner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }), 
            AspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1, 
                AspectType = Enum.AspectType.FitWithinMaxSize, 
                DominantAxis = Enum.DominantAxis.Width
            }), 
            ViewportFrame = v1.createElement("ViewportFrame", {
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                ImageTransparency = 0, 
                BackgroundTransparency = 1, 
                LightColor = v6.ViewportLightColor, 
                Ambient = v6.ViewportLightAmbient, 
                LightDirection = v6.ViewportLightDirection, 
                CurrentCamera = v29.camera
            }, {
                UICorner = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 10)
                }), 
                WorldModel = v1.createElement("WorldModel", {
                    [v1.Ref] = v29.modelRef
                })
            })
        });
    end);
end;
return v7;