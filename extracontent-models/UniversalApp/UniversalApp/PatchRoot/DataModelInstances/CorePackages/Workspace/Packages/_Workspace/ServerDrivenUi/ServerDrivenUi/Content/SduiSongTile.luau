local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local ServerDrivenUiParent = ServerDrivenUi.Parent
local React = require(ServerDrivenUiParent.React)
local useTokens = require(ServerDrivenUiParent.Foundation).Hooks.useTokens
local Cryo = require(ServerDrivenUiParent.Cryo)
local useSongAlbumArt = require(ServerDrivenUiParent.Songbird).useSongAlbumArt
local SduiCoreSystem = require(ServerDrivenUiParent.SduiCoreSystem)
local SduiActionType = SduiCoreSystem.SduiActionType
local executeAction = SduiCoreSystem.executeAction
local SduiTile = require(ServerDrivenUi.Content.SduiTile)
local SduiTileFooter = require(ServerDrivenUi.Content.SduiTileFooter)

return React.memo(function(p1) --[[ SduiSongTile ]] -- line: 28
	-- upvalues: useTokens (copy), useSongAlbumArt (copy), React (copy), SduiActionType (copy), executeAction (copy), SduiTileFooter (copy), SduiTile (copy), Cryo (copy)
	local v13 = useTokens()
	local songId = p1.songId
	local v15 = useSongAlbumArt(songId)
	local v16 = if not p1.image or p1.image == "" then v15.value else p1.image
	local v17 = React.useCallback(function() -- line: 35
		-- upvalues: p1 (copy), SduiActionType (copy), songId (copy), executeAction (copy)
		if p1.onActivated then
			p1.onActivated()

			return
		end

		local t1 = {
			actionType = SduiActionType.OpenSongDetail,
			actionParams = {
				songId = songId
			}
		}

		executeAction(t1, p1.analyticsContext, p1.sduiContext)
	end, {
		p1.onActivated,
		p1.sduiContext,
		p1.analyticsContext,
		songId
	})
	local v18 = React.useMemo(function() -- line: 49
		-- upvalues: p1 (copy), React (copy), SduiTileFooter (copy)
		if p1.footerComponent then
			return p1.footerComponent
		end

		return React.createElement(SduiTileFooter, {
			leftText = p1.artistText,
			testId = "--sdui-song-tile-footer-artist"
		})
	end, {
		p1.footerComponent,
		p1.artistText,
		v13
	})

	return React.createElement(SduiTile, Cryo.Dictionary.join(p1, {
		image = v16,
		onActivated = v17,
		footerComponent = v18,
		testId = "--sdui-song-tile"
	}))
end)
