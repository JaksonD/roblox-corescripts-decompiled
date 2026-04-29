local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Roact = require(CorePackages.Packages.Roact)
local RoactRodux = require(CorePackages.Packages.RoactRodux)
local UIBlox = require(CorePackages.Packages.UIBlox)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local getSafeAreaSize = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local FFlagAXMigrateResellersInputBindingsToRoactGamepad = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMigrateResellersInputBindingsToRoactGamepad

require(Modules.AvatarExperience.Common.AvatarExperienceState)

local Overlay = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.Overlay
local v10 = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus and game:DefineFastFlag("AXMigrateCenteredModalViewToAutoFocus", false)
local withStyle = UIBlox.Style.withStyle

require(CorePackages.Packages.React)

local function getWindowSize(t1: {[any]: any}) -- line: 45
	-- upvalues: getSafeAreaSize (copy)
	if t1.wideMode then
		local v14 = math.min(getSafeAreaSize(t1.screenSize, t1.globalGuiInset).X.Offset, 640)

		return UDim2.new(0, v14, 1, 0)
	end

	return UDim2.fromScale(1, 1)
end

return (RoactRodux.connect(function(p1, _) --[[ mapStateToProps ]] -- line: 90
	-- upvalues: FormFactor (copy)
	return {
		wideMode = p1.FormFactor == FormFactor.WIDE,
		screenSize = p1.ScreenSize,
		globalGuiInset = p1.GlobalGuiInset
	}
end, nil)(function(t2: {[any]: any}) -- line: 57
	-- upvalues: getWindowSize (copy), Roact (copy), withStyle (copy), FFlagAXMigrateResellersInputBindingsToRoactGamepad (copy), v10 (copy), Overlay (copy)
	local v16 = getWindowSize(t2)
	local v17 = t2[Roact.Children]

	if not t2.wideMode then
		return Roact.createFragment(v17)
	end

	return withStyle(function(p3) -- line: 65
		-- upvalues: Roact (copy), FFlagAXMigrateResellersInputBindingsToRoactGamepad (copy), t2 (copy), v10 (copy), Overlay (copy), v16 (copy), v17 (copy)
		return Roact.createElement("TextButton", {
			ref = if not FFlagAXMigrateResellersInputBindingsToRoactGamepad then nil else t2.forwardRef,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p3.Theme.Overlay.Transparency,
			BackgroundColor3 = p3.Theme.Overlay.Color,
			Active = true,
			AutoButtonColor = false,
			Text = " ",
			Selectable = not v10 and nil
		}, {
			Window = Roact.createElement(not v10 and "Frame" or Overlay, {
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 0),
				Size = v16,
				BackgroundTransparency = if not t2.backgroundTransparency then p3.Theme.BackgroundDefault.Transparency else t2.backgroundTransparency,
				BackgroundColor3 = p3.Theme.BackgroundDefault.Color,
				BorderSizePixel = 0
			}, v17)
		})
	end)
end))
