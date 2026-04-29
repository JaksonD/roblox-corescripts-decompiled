local GameTile = script:FindFirstAncestor("GameTile")
local GameTileParent = GameTile.Parent
local mutedError = require(GameTileParent.Loggers).mutedError
local flaggedMutedError = require(GameTileParent.Loggers).flaggedMutedError

require(GameTile.GameTileTypes)

local TileBadgePositionCalculators = require(GameTile.GameTileConstants).TileBadgePositionCalculators

return function(p1) --[[ getValidTileBadges ]] -- line: 26
	-- upvalues: TileBadgePositionCalculators (copy), flaggedMutedError (copy), mutedError (copy)
	local t1 = {}

	for v10, v11 in p1 do
		local v12 = TileBadgePositionCalculators[v10] ~= nil

		if not v12 then
			flaggedMutedError("GameTileOverlayBadgeInvalidPositionError", `Unsupported game tile badge position: { v10 }`)
		end

		if v12 and #v11 > 0 then
			local v13 = v11[1]

			if v13.tileBadgeType and v13.analyticsId then
				t1[v10] = { v11[1] }
			else
				mutedError("Invalid tile badge metadata.")
			end
		end
	end

	return t1
end
