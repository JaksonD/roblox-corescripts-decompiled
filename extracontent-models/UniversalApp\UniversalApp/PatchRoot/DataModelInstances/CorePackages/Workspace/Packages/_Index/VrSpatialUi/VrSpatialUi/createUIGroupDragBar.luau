local l_script_FirstAncestor_0 = script:FindFirstAncestor("VrSpatialUi");
local v1 = require(l_script_FirstAncestor_0.DragBar);
local v2 = require(l_script_FirstAncestor_0.Constants);
local l_CoreGui_0 = game:GetService("CoreGui");
return function(v4) --[[ Line: 9 ]]
    -- upvalues: l_CoreGui_0 (copy), v2 (copy), v1 (copy)
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Size = if v4.dragBarPartSize then Vector3.new(v4.dragBarPartSize.X, v4.dragBarPartSize.Y, 1.0E-5) else Vector3.new(0.6000000238418579, 0.11999999731779099, 9.999999747378752E-6, 0);
    l_Part_0.Name = v4.name .. "_DragBar";
    l_Part_0.Color = Color3.new(1, 1, 1);
    l_Part_0.Parent = workspace.CurrentCamera;
    l_Part_0.Anchored = true;
    l_Part_0.CanTouch = true;
    l_Part_0.CanCollide = false;
    l_Part_0.CastShadow = false;
    l_Part_0.Material = Enum.Material.Glass;
    l_Part_0.Transparency = 1;
    local l_DragDetector_0 = Instance.new("DragDetector");
    l_DragDetector_0.Enabled = true;
    l_DragDetector_0.Parent = l_Part_0;
    l_DragDetector_0.DragStyle = Enum.DragDetectorDragStyle.BestForDevice;
    local l_SurfaceGui_0 = Instance.new("SurfaceGui");
    l_SurfaceGui_0.Parent = l_CoreGui_0;
    l_SurfaceGui_0.Name = "dragBar_SurfaceGui";
    l_SurfaceGui_0.Enabled = true;
    l_SurfaceGui_0.CanvasSize = Vector2.new(l_Part_0.Size.X, l_Part_0.Size.Y) * v2.VR_PANEL_RESOLUTION_MULTIPLIER;
    l_SurfaceGui_0.AlwaysOnTop = true;
    l_SurfaceGui_0.Shape = Enum.SurfaceGuiShape.Flat;
    l_SurfaceGui_0.HorizontalCurvature = 0;
    l_SurfaceGui_0.Active = true;
    l_SurfaceGui_0.Adornee = l_Part_0;
    l_SurfaceGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    l_SurfaceGui_0.LightInfluence = 0;
    l_SurfaceGui_0.ZOffset = 0;
    l_SurfaceGui_0.Face = Enum.NormalId.Back;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Image = "rbxasset://textures/ui/InGameMenu/DragBar_Bright.png";
    l_ImageLabel_0.Parent = l_SurfaceGui_0;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.BackgroundColor3 = Color3.new(1, 1, 1);
    l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_ImageLabel_0.Position = UDim2.new(0.5, 0, 0.5, 0);
    l_ImageLabel_0.Size = UDim2.new(0.5, 0, 0.25, 0);
    l_ImageLabel_0.ImageColor3 = Color3.new(1, 1, 1);
    l_DragDetector_0.RunLocally = true;
    if v4.dragFunction then
        l_DragDetector_0.DragContinue:Connect(v4.dragFunction);
    end;
    if v4.dragStartFunction then
        l_DragDetector_0.DragStart:Connect(v4.dragStartFunction);
    end;
    if v4.dragEndFunction then
        l_DragDetector_0.DragEnd:Connect(v4.dragEndFunction);
    end;
    return (v1.new(l_Part_0, l_ImageLabel_0));
end;