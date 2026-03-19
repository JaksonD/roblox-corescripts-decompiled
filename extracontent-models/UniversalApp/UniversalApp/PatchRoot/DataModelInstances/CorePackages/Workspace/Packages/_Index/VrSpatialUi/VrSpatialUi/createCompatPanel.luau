local l_script_FirstAncestor_0 = script:FindFirstAncestor("VrSpatialUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_game_EngineFeature_0 = game:GetEngineFeature("CurvedSurfaceGuisEnabled");
local v4 = require(l_script_FirstAncestor_0.Constants);
local l_SpatialUIType_0 = v4.SpatialUIType;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_VRService_0 = game:GetService("VRService");
local v8 = {
    spatialPanelProps = nil, 
    screenGuiProps = nil, 
    type = l_SpatialUIType_0.ScreenUI
};
local v9 = {
    Name = "ScreenGui", 
    ResetOnSpawn = false, 
    DisplayOrder = 0, 
    ZIndexBehavior = nil
};
local v10 = {
    name = "", 
    partSize = v4.DEFAULT_VR_PANEL_SIZE, 
    virtualScreenSize = v4.DEFAULT_VR_PANEL_SIZE * v4.VR_PANEL_RESOLUTION_MULTIPLIER, 
    cframe = CFrame.new(0, 0, 0), 
    alwaysOnTop = true, 
    hidden = false, 
    curvature = 1, 
    transparency = 1
};
local function v13(v11) --[[ Line: 36 ]] --[[ Name: createPanelPart ]]
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Name = v11.name .. "_Part";
    l_Part_0.CFrame = v11.cframe;
    l_Part_0.CastShadow = false;
    l_Part_0.Size = Vector3.new(v11.partSize.X, v11.partSize.Y, 0.002);
    l_Part_0.Transparency = if v11.transparency then v11.transparency else 1;
    l_Part_0.Color = Color3.new(0, 0, 0);
    l_Part_0.CanCollide = false;
    l_Part_0.CanTouch = false;
    l_Part_0.Anchored = true;
    l_Part_0.Parent = workspace;
    return l_Part_0;
end;
local function v23(v14) --[[ Line: 51 ]] --[[ Name: createPanel ]]
    -- upvalues: l_Object_0 (copy), v8 (copy), l_SpatialUIType_0 (copy), v10 (copy), v13 (copy), l_CoreGui_0 (copy), l_game_EngineFeature_0 (copy), v9 (copy)
    local v15 = l_Object_0.assign({}, v8, v14);
    if v15.type == l_SpatialUIType_0.SpatialUIPartOnly then
        local v16 = l_Object_0.assign({}, v10, v15.spatialPanelProps);
        local v17 = v13(v16);
        return {
            type = v15.type, 
            panelObject = v17
        };
    elseif v15.type == l_SpatialUIType_0.SpatialUI then
        local v18 = l_Object_0.assign({}, v10, v15.spatialPanelProps);
        local v19 = v13(v18);
        local l_SurfaceGui_0 = Instance.new("SurfaceGui");
        l_SurfaceGui_0.Parent = l_CoreGui_0;
        l_SurfaceGui_0.Name = v18.name .. "_SurfaceGui";
        l_SurfaceGui_0.Enabled = not v18.hidden;
        l_SurfaceGui_0.CanvasSize = v18.virtualScreenSize;
        l_SurfaceGui_0.AlwaysOnTop = v18.alwaysOnTop;
        l_SurfaceGui_0.Shape = if l_game_EngineFeature_0 and v18.curvature ~= 0 then Enum.SurfaceGuiShape.CurvedHorizontally else Enum.SurfaceGuiShape.Flat;
        l_SurfaceGui_0.HorizontalCurvature = if l_game_EngineFeature_0 then v18.curvature else 0;
        l_SurfaceGui_0.Active = true;
        l_SurfaceGui_0.Adornee = v19;
        l_SurfaceGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        l_SurfaceGui_0.LightInfluence = 0;
        l_SurfaceGui_0.ZOffset = 0;
        l_SurfaceGui_0.Face = Enum.NormalId.Back;
        return {
            type = v15.type, 
            panelObject = l_SurfaceGui_0
        };
    elseif v15.type == l_SpatialUIType_0.ScreenUI then
        local v21 = l_Object_0.assign({}, v9, v15.screenGuiProps);
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Parent = l_CoreGui_0;
        l_ScreenGui_0.Name = v21.Name;
        l_ScreenGui_0.ResetOnSpawn = v21.ResetOnSpawn;
        l_ScreenGui_0.DisplayOrder = v21.DisplayOrder;
        if v21.ZIndexBehavior then
            l_ScreenGui_0.ZIndexBehavior = v21.ZIndexBehavior;
        end;
        return {
            type = v15.type, 
            panelObject = l_ScreenGui_0
        };
    else
        print("Invalid panel type: " .. tostring(v15.type));
        return nil;
    end;
end;
return function(v24) --[[ Line: 105 ]]
    -- upvalues: l_VRService_0 (copy), v23 (copy), v4 (copy), l_SpatialUIType_0 (copy)
    if l_VRService_0.VREnabled then
        local v25 = v23(v4.COMPAT_PANEL_PROPS_MAP[v24.panelType]);
        if v25 == nil then
            return nil;
        else
            return {
                panelObject = v25.panelObject, 
                uiType = v25.type, 
                panelType = v24.panelType, 
                panelPositionProps = v4.SPATIAL_PANEL_POSITION_PROPS_MAP[v24.panelType], 
                headScale = 1
            };
        end;
    else
        local v26 = v23({
            type = l_SpatialUIType_0.ScreenUI, 
            screenGuiProps = v24.screenGuiProps
        });
        if v26 == nil then
            return nil;
        else
            return {
                panelObject = v26.panelObject, 
                uiType = v26.type, 
                panelType = v24.panelType, 
                panelPositionProps = nil
            };
        end;
    end;
end;