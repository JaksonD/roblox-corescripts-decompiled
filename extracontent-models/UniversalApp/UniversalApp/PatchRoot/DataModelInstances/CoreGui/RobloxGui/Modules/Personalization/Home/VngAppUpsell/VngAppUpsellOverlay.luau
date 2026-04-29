local GuiService = game:GetService("GuiService")
local CorePackages = game:GetService("CorePackages")
local React = require(CorePackages.Packages.React)
local UIBlox = require(CorePackages.Packages.UIBlox)
local useStyle = UIBlox.Core.Style.useStyle
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local StyledTextLabel = UIBlox.App.Text.StyledTextLabel
local FullPageModal = UIBlox.App.Dialog.Modal.FullPageModal
local useLocalization = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local useRoactService = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local useDesignTokens = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local useDispatch = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local CloseCentralOverlay = require(CorePackages.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay
local useAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local FFlagVngAppUpsellPcLayout = require(CorePackages.Workspace.Packages.SharedFlags).FFlagVngAppUpsellPcLayout
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactLocalization = require(Modules.LuaApp.Services.RoactLocalization)
local v20 = game:DefineFastString("VngAppUpsellUrl", "https://www.roblox.com")
local v21 = game:DefineFastString("VngAppUpsellProTipTextEn", "")
local v22 = game:DefineFastString("VngAppUpsellProTipTextVn", "")

return function(t1: {[any]: any}) --[[ VngAppUpsellOverlay ]] -- line: 37
	-- upvalues: useStyle (copy), useDesignTokens (copy), FFlagVngAppUpsellPcLayout (copy), useAppPolicy (copy), useLocalization (copy), useRoactService (copy), AppLinking (copy), useDispatch (copy), useSelector (copy), React (copy), CloseCentralOverlay (copy), RoactLocalization (copy), v22 (copy), v21 (copy), GuiService (copy), FullPageModal (copy), ButtonType (copy), v20 (copy), StyledTextLabel (copy)
	local v24 = useStyle()
	local v25 = useDesignTokens()
	local v26 = not not FFlagVngAppUpsellPcLayout and useAppPolicy(function(p1) -- line: 41
		return p1.getVngAppUpsellPcLayout()
	end)
	local v27 = useLocalization({
		vngUpsellTitle = not v26 and "CommonUI.Features.Label.VNGMigrationTitle" or "CommonUI.Features.Label.VNGMigrationTitlePC",
		vngUpsellBody = not v26 and "CommonUI.Features.Label.VNGMigrationBody" or "CommonUI.Features.Label.VNGMigrationBodyPC",
		vngUpsellProtip = "CommonUI.Features.Label.VNGMigrationTip",
		vngUpsellButtonText = not v26 and "CommonUI.Features.Label.VNGMigrationGoButton" or "CommonUI.Features.Label.VNGMigrationGoButtonPC"
	})
	local v28 = useRoactService(AppLinking)
	local v29 = useDispatch()
	local v30 = useSelector(function(p2) -- line: 60
		return p2.ScreenSize
	end)
	local v31 = React.useCallback(function() -- line: 64
		-- upvalues: v29 (copy), CloseCentralOverlay (copy)
		v29(CloseCentralOverlay())
	end, {})
	local vngUpsellProtip = v27.vngUpsellProtip
	local Locale = useRoactService(RoactLocalization):GetLocale()

	if v22 ~= "" and Locale == "vi-vn" then
		vngUpsellProtip = v22
	elseif v21 ~= "" and Locale == "en-us" then
		vngUpsellProtip = v21
	end

	local SafeZoneOffsets = GuiService:GetSafeZoneOffsets()
	local Size_250 = v25.Global.Size_250
	local v36 = SafeZoneOffsets.top + Size_250
	local v37 = Size_250 + 186 + v25.Global.Size_400

	return React.createElement(FullPageModal, {
		screenSize = v30,
		title = v27.vngUpsellTitle,
		distanceFromTop = v36,
		onCloseClicked = if not t1.isDismissable then nil else v31,
		buttonStackProps = {
			buttons = {{
				buttonType = ButtonType.PrimarySystem,
				props = {
					onActivated = function() --[[ onActivated ]] -- line: 97
						-- upvalues: v20 (copy), v28 (copy)
						local v40 = v20

						v28:openURL(v40)
					end,
					text = v27.vngUpsellButtonText
				}
			}}
		}
	}, {
		ContentFrame = React.createElement("ScrollingFrame", {
			BackgroundTransparency = v24.Theme.BackgroundUIDefault.Transparency,
			BackgroundColor3 = v24.Theme.BackgroundUIDefault.Color,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0, 0),
			AnchorPoint = Vector2.new(0.5, 0),
			BorderSizePixel = 0,
			Selectable = not FFlagVngAppUpsellPcLayout and nil,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollBarThickness = 0,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.new(1, 0, 0, 0)
		}, {
			VngIcon = React.createElement("ImageLabel", {
				Size = UDim2.new(0, 186, 0, 186),
				BackgroundTransparency = 1,
				Image = not v26 and "rbxasset://textures/ui/LuaApp/icons/ic_launcher_vng_square_xxxhdpi.png" or "rbxasset://textures/ui/LuaApp/icons/pc_icon_vng_square_xxxhdpi.png",
				Position = UDim2.new(0.5, 0, 0, Size_250),
				AnchorPoint = Vector2.new(0.5, 0)
			}),
			Contents = React.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				Position = UDim2.new(0.5, 0, 0, v37),
				AnchorPoint = Vector2.new(0.5, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1
			}, {
				UIListLayout = React.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, Size_250)
				}),
				BodyText = React.createElement(StyledTextLabel, {
					layoutOrder = 1,
					automaticSize = Enum.AutomaticSize.Y,
					text = v27.vngUpsellBody,
					colorStyle = v24.Theme.TextEmphasis,
					fontStyle = v24.Font.HeadingSmall,
					size = UDim2.new(1, 0, 0, 0),
					textXAlignment = Enum.TextXAlignment.Center
				}),
				Protip = if v26 then nil else React.createElement(StyledTextLabel, {
					layoutOrder = 2,
					automaticSize = Enum.AutomaticSize.Y,
					text = vngUpsellProtip,
					colorStyle = v24.Theme.TextDefault,
					fontStyle = v24.Font.BodyLarge,
					size = UDim2.new(1, 0, 0, 0),
					textXAlignment = Enum.TextXAlignment.Center
				}),
				BottomPadding = React.createElement("Frame", {
					Size = UDim2.new(1, 0, 0, 1),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 4
				})
			})
		})
	})
end
