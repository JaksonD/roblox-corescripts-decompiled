local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local React = require(Parent.React)
local UIBlox = require(Parent.UIBlox)
local VerticalTile = UIBlox.App.Tile.VerticalTile
local VerticalTileThumbnail = UIBlox.App.Tile.VerticalTileThumbnail
local FFlagLuaAppGameTileLockedBadge = require(Parent.SharedFlags).FFlagLuaAppGameTileLockedBadge

return function(t1: {[any]: any}) --[[ AppFeaturedTile ]] -- line: 33
	-- upvalues: FFlagLuaAppGameTileLockedBadge (copy), React (copy), VerticalTileThumbnail (copy), VerticalTile (copy)
	local v8 = t1.hasBackground or false
	local n1 = 0

	if t1.renderActionRow then
		n1 = not t1.hasBackground and 40 or 48
	end

	local v10 = if not FFlagLuaAppGameTileLockedBadge then nil else t1.thumbnailOverlay
	local v11 = React.useCallback(function() -- line: 44
		-- upvalues: React (copy), VerticalTileThumbnail (copy), v8 (copy), t1 (copy), FFlagLuaAppGameTileLockedBadge (copy), v10 (copy)
		local v12 = React.createElement(VerticalTileThumbnail, {
			aspectRatio = 1,
			isTopRounded = true,
			isBottomRounded = not v8,
			thumbnail = t1.thumbnail
		})

		if FFlagLuaAppGameTileLockedBadge and v10 then
			return React.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				SizeConstraint = Enum.SizeConstraint.RelativeXX,
				BackgroundTransparency = 1
			}, {
				Thumbnail = v12,
				ThumbnailOverlay = React.createElement("Frame", {
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					ZIndex = 2
				}, {
					Content = v10
				})
			})
		end

		return v12
	end, {
		if not FFlagLuaAppGameTileLockedBadge then t1.hasBackground else v8,
		t1.thumbnail,
		v10
	})

	return React.createElement(VerticalTile, {
		hasOutline = t1.hasOutline,
		hasBackground = v8,
		isHoverEnabled = v8,
		isOverlayVisible = v8,
		onActivated = t1.onActivated,
		renderTopContent = v11,
		renderBottomContent = t1.renderBottomPanel,
		renderFooterRow = t1.renderActionRow,
		reservedBottomHeight = n1
	})
end
