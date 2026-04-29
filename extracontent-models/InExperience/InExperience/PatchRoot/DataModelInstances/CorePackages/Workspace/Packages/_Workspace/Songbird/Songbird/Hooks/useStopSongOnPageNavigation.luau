local Songbird = script:FindFirstAncestor("Songbird")
local SignalsReact = require(Songbird.Parent.SignalsReact)
local MediaPlayback = require(Songbird.Parent.MediaPlayback)
local React = require(Songbird.Parent.React)
local getAudioPlaybackStore = MediaPlayback.getAudioPlaybackStore
local useEffect = React.useEffect
local useCallback = React.useCallback

return function(b1: boolean, p1: ((...any) -> ...any)?) --[[ useStopSongOnPageNavigation ]] -- line: 23
	-- upvalues: SignalsReact (copy), getAudioPlaybackStore (copy), useCallback (copy), useEffect (copy)
	local v10 = SignalsReact.useSignalState(getAudioPlaybackStore)
	local v11 = useCallback(function() -- line: 26
		-- upvalues: v10 (copy), p1 (copy)
		for _, v13 in v10.getPlayingAudioStores(false) do
			v13.stop()
		end

		if p1 then
			p1()
		end
	end, {
		v10,
		p1
	})

	useEffect(function() -- line: 35
		-- upvalues: b1 (copy), v11 (copy)
		if not b1 then
			v11()
		end
	end, {
		b1,
		v11
	})
	useEffect(function() -- line: 41
		-- upvalues: v11 (copy)
		return v11
	end, { v11 })
end
