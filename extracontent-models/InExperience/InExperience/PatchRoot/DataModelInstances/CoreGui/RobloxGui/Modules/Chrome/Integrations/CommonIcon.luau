local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local Foundation = require(CorePackages.Packages.Foundation)
local React = require(CorePackages.Packages.React)
local UIBlox = require(CorePackages.Packages.UIBlox)
local useStyle = UIBlox.Core.Style.useStyle
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local Images = UIBlox.App.ImageSet.Images
local Constants = require(Chrome.ChromeShared.Unibar.Constants)

require(Chrome.ChromeShared.Service.ChromeUtils)

local SubMenuContext = require(Chrome.ChromeShared.Unibar.SubMenuContext)
local IconVariant = Foundation.Enums.IconVariant
local IconSize = Foundation.Enums.IconSize
local IconName = Foundation.Enums.IconName
local FFlagTokenizeUnibarConstantsWithStyleProvider = require(Chrome.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local useMappedSignal = require(Chrome.ChromeShared.Hooks.useMappedSignal)
local UnibarStyle = require(CorePackages.Workspace.Packages.Chrome).UnibarStyle
local FFlagAddIGMToSideSheet = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAddIGMToSideSheet

function CommonIconComponent(p1) -- line: 35
	-- upvalues: FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), Constants (copy), useMappedSignal (copy), useStyle (copy), React (copy), SubMenuContext (copy), FFlagAddIGMToSideSheet (copy), IconName (copy), Foundation (copy), IconSize (copy), IconVariant (copy), Images (copy), ImageSetLabel (copy)
	local v20 = if not FFlagTokenizeUnibarConstantsWithStyleProvider then Constants.ICON_SIZE else UnibarStyle.use().ICON_SIZE
	local v21 = not not p1.activeSignalValue and (useMappedSignal(p1.activeSignalValue) or false)
	local icon = p1.icon

	if v21 and p1.iconOn then
		icon = p1.iconOn
	end

	local v23 = useStyle()
	local v24 = React.useContext(SubMenuContext)
	local IconEmphasisColor = v23.Theme.IconEmphasis.Color
	local IconEmphasisTransparency = v23.Theme.IconEmphasis.Transparency

	if FFlagAddIGMToSideSheet and IconName[p1.icon] ~= nil then
		local v27 = if not v24 then {
			Color3 = IconEmphasisColor,
			Transparency = IconEmphasisTransparency
		} else v24:map(function(p2) -- line: 58
			-- upvalues: IconEmphasisColor (copy), IconEmphasisTransparency (copy)
			return {
				Color3 = IconEmphasisColor,
				Transparency = IconEmphasisTransparency + (1 - IconEmphasisTransparency) * (1 - p2)
			}
		end)

		return React.createElement(Foundation.Icon, {
			name = IconName[p1.icon],
			size = IconSize.Large,
			style = v27,
			variant = if not v21 then IconVariant.Regular else IconVariant.Filled
		})
	end

	if typeof(icon) == "string" and icon:sub(1, 11) ~= "rbxasset://" then
		icon = Images[icon]
	end

	return React.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		Image = icon,
		Size = UDim2.new(0, v20, 0, v20),
		ImageColor3 = IconEmphasisColor,
		ImageTransparency = if not v24 then IconEmphasisTransparency else v24:map(function(p3) -- line: 89
			-- upvalues: IconEmphasisTransparency (copy)
			return IconEmphasisTransparency + (1 - IconEmphasisTransparency) * (1 - p3)
		end)
	})
end
function CommonIcon(p4, p5, p6) -- line: 96
	-- upvalues: React (copy)
	return React.createElement(CommonIconComponent, {
		icon = p4,
		iconOn = p5,
		activeSignalValue = p6
	})
end

return CommonIcon
