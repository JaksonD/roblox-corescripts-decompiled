local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.usePanel3DRenderStep);
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v6 = require(l_Parent_2.React);
local v7 = require(l_Parent_2.Roact);
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v9 = require(l_Parent_1.Core.Utility.GetEngineFeatureSafe);
local v10 = require(l_Parent_1.UIBloxConfig);
local v11 = v9("CurvedSurfaceGuisEnabled");
local v12 = {
    partSize = Vector2.new(10, 10), 
    virtualScreenSize = Vector2.new(10, 10), 
    offset = CFrame.new(0, 0, 0), 
    lerp = false, 
    tilt = 0, 
    anchoring = v2.AnchoringTypes.World, 
    faceCamera = false, 
    panelName = "PanelBase", 
    movementUpdateEvent = l_RunService_0.RenderStepped, 
    vrService = game:GetService("VRService"), 
    alwaysOnTop = true, 
    parent = workspace, 
    hidden = false, 
    curvature = 1, 
    zOffset = 0, 
    connectPanelManagerFunction = nil, 
    partRef = nil
};
return function(v13) --[[ Line: 44 ]] --[[ Name: Panel3D ]]
    -- upvalues: l_Object_0 (copy), v12 (copy), v6 (copy), v3 (copy), v2 (copy), v10 (copy), v7 (copy), v11 (copy)
    local v14 = l_Object_0.assign({}, v12, v13);
    local v15 = v14.partRef or v6.useRef(nil);
    local v16 = v6.useRef(nil);
    local v17 = v6.useRef(nil);
    v3(v14, v15);
    v6.useEffect(function() --[[ Line: 52 ]]
        -- upvalues: v14 (copy), v2 (ref), v16 (copy)
        if v14.anchoring ~= v2.AnchoringTypes.PanelManaged then
            return function() --[[ Line: 54 ]]

            end;
        elseif v14.connectPanelManagerFunction == nil then
            return function() --[[ Line: 58 ]]

            end;
        elseif v16 ~= nil and v14.connectPanelManagerFunction then
            v14.connectPanelManagerFunction(v16);
            return function() --[[ Line: 64 ]]
                -- upvalues: v14 (ref)
                v14.connectPanelManagerFunction(nil);
            end;
        else
            return function() --[[ Line: 69 ]]

            end;
        end;
    end, {
        v16, 
        v14.anchoring, 
        v14.connectPanelManagerFunction
    });
    if v10.enablePanel3DSurfaceGuiRef and v14.surfaceGuiRef then
        v6.useImperativeHandle(v14.surfaceGuiRef, function() --[[ Line: 74 ]]
            -- upvalues: v16 (copy)
            return v16.current;
        end, {
            v16
        });
    end;
    return v6.createElement("Folder", {
        ref = v17, 
        Archivable = false
    }, {
        WorkspacePortal = v6.createElement(v7.Portal, {
            target = v14.parent
        }, {
            GUIPart = if v14.hidden then nil else v6.createElement("Part", {
                Name = v14.panelName .. "_Part", 
                ref = v15, 
                Anchored = true, 
                CFrame = v14.offset * CFrame.Angles(math.rad(v14.tilt), 0, 0), 
                Size = Vector3.new(v14.partSize.X, v14.partSize.Y, 0.05), 
                Transparency = 1, 
                Color = Color3.new(0, 0, 0), 
                CanCollide = false, 
                CanTouch = false
            })
        }), 
        AppUI = v6.createElement("SurfaceGui", {
            Name = v14.panelName .. "_SurfaceGui", 
            ref = v16, 
            Adornee = v15, 
            Active = true, 
            Enabled = not v14.hidden, 
            CanvasSize = v14.virtualScreenSize, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            LightInfluence = 0, 
            children = v14.children, 
            AlwaysOnTop = v14.alwaysOnTop, 
            Shape = if v11 and v14.curvature ~= 0 then Enum.SurfaceGuiShape.CurvedHorizontally else nil, 
            HorizontalCurvature = if v11 then v14.curvature else nil, 
            ZOffset = v14.zOffset
        })
    });
end;