local RunService = game:GetService("RunService")
local scriptParent = script.Parent
local Constants = require(scriptParent.Constants)
local usePanel3DRenderStep = require(scriptParent.usePanel3DRenderStep)
local ParentParent = scriptParent.Parent.Parent
local ParentParentParent = ParentParent.Parent
local React = require(ParentParentParent.React)
local Roact = require(ParentParentParent.Roact)
local Object = require(ParentParentParent.LuauPolyfill).Object
local v10 = require(ParentParent.Core.Utility.GetEngineFeatureSafe)("CurvedSurfaceGuisEnabled")
local t1 = {
	partSize = Vector2.new(10, 10),
	virtualScreenSize = Vector2.new(10, 10),
	offset = CFrame.new(0, 0, 0),
	lerp = false,
	tilt = 0,
	anchoring = Constants.AnchoringTypes.World,
	faceCamera = false,
	panelName = "PanelBase",
	movementUpdateEvent = RunService.RenderStepped,
	vrService = game:GetService("VRService"),
	alwaysOnTop = true,
	parent = workspace,
	hidden = false,
	curvature = 1,
	zOffset = 0,
	connectPanelManagerFunction = nil,
	partRef = nil
}

return function(p1) --[[ Panel3D ]] -- line: 43
	-- upvalues: Object (copy), t1 (copy), React (copy), usePanel3DRenderStep (copy), Constants (copy), Roact (copy), v10 (copy)
	local v13 = Object.assign({}, t1, p1)
	local v14 = v13.partRef or React.useRef(nil)
	local v15 = React.useRef(nil)
	local v16 = React.useRef(nil)

	usePanel3DRenderStep(v13, v14)
	React.useEffect(function() -- line: 51
		-- upvalues: v13 (copy), Constants (copy), v15 (copy)
		if v13.anchoring ~= Constants.AnchoringTypes.PanelManaged then
			return function() -- line: 53
			end
		end

		if v13.connectPanelManagerFunction == nil then
			return function() -- line: 57
			end
		end

		if v15 ~= nil and v13.connectPanelManagerFunction then
			v13.connectPanelManagerFunction(v15)

			return function() -- line: 63
				-- upvalues: v13 (copy)
				v13.connectPanelManagerFunction(nil)
			end
		end

		return function() -- line: 68
		end
	end, {
		v15,
		v13.anchoring,
		v13.connectPanelManagerFunction
	})

	return React.createElement("Folder", {
		ref = v16,
		Archivable = false
	}, {
		WorkspacePortal = React.createElement(Roact.Portal, {
			target = v13.parent
		}, {
			GUIPart = if not v13.hidden then React.createElement("Part", {
				Name = v13.panelName .. "_Part",
				ref = v14,
				Anchored = true,
				CFrame = v13.offset * CFrame.Angles(math.rad(v13.tilt), 0, 0),
				Size = Vector3.new(v13.partSize.X, v13.partSize.Y, 0.05),
				Transparency = 1,
				Color = Color3.new(0, 0, 0),
				CanCollide = false,
				CanTouch = false
			}) else nil
		}),
		AppUI = React.createElement("SurfaceGui", {
			Name = v13.panelName .. "_SurfaceGui",
			ref = v15,
			Adornee = v14,
			Active = true,
			Enabled = not v13.hidden,
			CanvasSize = v13.virtualScreenSize,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			LightInfluence = 0,
			children = v13.children,
			AlwaysOnTop = v13.alwaysOnTop,
			Shape = if not v10 or v13.curvature == 0 then nil else Enum.SurfaceGuiShape.CurvedHorizontally,
			HorizontalCurvature = if not v10 then nil else v13.curvature,
			ZOffset = v13.zOffset
		})
	})
end
