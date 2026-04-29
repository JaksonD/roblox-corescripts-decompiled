local GameTile = script:FindFirstAncestor("GameTile")
local GameTileParent = GameTile.Parent
local flaggedMutedError = require(GameTileParent.Loggers).flaggedMutedError
local useTokens = require(GameTileParent.Foundation).Hooks.useTokens
local React = require(GameTileParent.React)
local GameTileConstants = require(GameTile.GameTileConstants)
local GameTileOverlayBadge = require(GameTile.Overlays.GameTileOverlayBadge)

require(GameTile.GameTileTypes)

local TileBadgeIconNamesByType = GameTileConstants.TileBadgeIconNamesByType
local TileBadgeComponentTypeValues = GameTileConstants.TileBadgeComponentTypeValues

local function getBadgeStyleOptions(p1, p2) -- line: 19
	-- upvalues: TileBadgeComponentTypeValues (copy), flaggedMutedError (copy)
	local t1 = {
		[TileBadgeComponentTypeValues.Pill] = {
			backgroundColorStyle = p1.Color.Extended.White.White_90,
			contentColorStyle = p1.LightMode.Content.Emphasis,
			cornerRadius = UDim.new(1, 0),
			verticalPadding = p1.Size.Size_150
		},
		[TileBadgeComponentTypeValues.RoundedRectangle] = {
			backgroundColorStyle = p1.Color.Extended.Black.Black_90,
			contentColorStyle = p1.DarkMode.Content.Emphasis,
			cornerRadius = UDim.new(0.2, 0),
			verticalPadding = p1.Size.Size_100
		}
	}
	local v14 = p2 and t1[p2]

	if p2 ~= nil and not v14 then
		flaggedMutedError("GameTileOverlayBadgeInvalidComponentTypeError", `Unsupported game tile badge component type: { p2 }`)
	end

	return v14 or t1[TileBadgeComponentTypeValues.Pill]
end

return React.memo(function(t2: {[any]: any}) --[[ GameTileThumbnailBadges ]] -- line: 47
	-- upvalues: useTokens (copy), React (copy), GameTileConstants (copy), flaggedMutedError (copy), TileBadgeIconNamesByType (copy), GameTileOverlayBadge (copy), getBadgeStyleOptions (copy)
	local v16 = useTokens()
	local Medium = v16.Padding.Medium
	local v18, v19 = React.useBinding(0)
	local v20 = React.useCallback(function(p3) -- line: 55
		-- upvalues: v19 (copy), Medium (ref)
		local AbsoluteSizeX = p3.AbsoluteSize.X

		v19(AbsoluteSizeX - Medium * 2)
	end, { Medium })
	local t3 = {}

	for v22, v23 in t2.tileBadgesByPosition do
		local v24 = nil
		local v25 = nil
		local v26 = GameTileConstants.TileBadgePositionCalculators[v22]

		if v26 then
			v24, v25 = v26(Medium)
		else
			flaggedMutedError("GameTileOverlayBadgeInvalidPositionError", `Unsupported game tile badge position: { v22 }`)
		end

		if #v23 > 0 then
			local v27 = v23[1]
			local t4 = nil

			if v27.icons and #v27.icons > 0 then
				t4 = {}

				for _, v30 in v27.icons do
					local v31 = TileBadgeIconNamesByType[v30]

					if v31 then
						table.insert(t4, v31)
					else
						warn(`Unsupported game tile badge icon type: { v30 }`)
					end
				end
			end

			t3[v22 .. "TileBadge"] = React.createElement(GameTileOverlayBadge, {
				Position = v24,
				AnchorPoint = v25,
				maxWidthBinding = v18,
				icons = t4,
				text = v27.text,
				styleOptions = getBadgeStyleOptions(v16, v27.tileBadgeComponentType)
			})
		end
	end

	return React.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[React.Change.AbsoluteSize] = v20
	}, t3)
end)
