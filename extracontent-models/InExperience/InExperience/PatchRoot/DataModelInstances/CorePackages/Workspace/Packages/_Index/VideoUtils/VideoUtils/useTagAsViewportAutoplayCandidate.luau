local CollectionService = game:GetService("CollectionService")
local VideoUtils = script:FindFirstAncestor("VideoUtils")
local VideoUtilsParent = VideoUtils.Parent
local React = require(VideoUtilsParent.React)

require(script.Parent.FeedVideoPlaybackContext)

local VideoEndReason = require(VideoUtils.Analytics.Enums).VideoEndReason
local ViewportAutoplayCandidateTag = require(script.Parent.ViewportAutoplayCandidateTag)
local FFlagLuaAppTileVideoCandidateOnly = require(VideoUtilsParent.SharedFlags).FFlagLuaAppTileVideoCandidateOnly
local FFlagLuaAppFixHiddenTileVideoCleanup = require(VideoUtilsParent.SharedFlags).FFlagLuaAppFixHiddenTileVideoCleanup

return function(t1: {[any]: any}, p1, b1: boolean?, b2: boolean?) --[[ useTagAsViewportAutoplayCandidate ]] -- line: 17
	-- upvalues: React (copy), FFlagLuaAppTileVideoCandidateOnly (copy), FFlagLuaAppFixHiddenTileVideoCleanup (copy), CollectionService (copy), ViewportAutoplayCandidateTag (copy), VideoEndReason (copy)
	local v13 = if not p1 then nil else p1.viewportVideoAutoplayController

	React.useEffect(function() -- line: 28
		-- upvalues: v13 (copy), FFlagLuaAppTileVideoCandidateOnly (copy), b1 (copy), FFlagLuaAppFixHiddenTileVideoCleanup (copy), b2 (copy), t1 (copy), CollectionService (copy), ViewportAutoplayCandidateTag (copy), VideoEndReason (copy)
		if not v13 then
			return
		end

		if FFlagLuaAppTileVideoCandidateOnly and not b1 then
			return
		end

		if FFlagLuaAppFixHiddenTileVideoCleanup and b2 then
			return
		end

		local current = t1.current

		if not current then
			return
		end

		CollectionService:AddTag(current, ViewportAutoplayCandidateTag)

		return function() -- line: 50
			-- upvalues: CollectionService (copy), current (copy), ViewportAutoplayCandidateTag (copy), v13 (copy), VideoEndReason (copy)
			CollectionService:RemoveTag(current, ViewportAutoplayCandidateTag)
			v13:resetIfActiveInstance(current, VideoEndReason.Unmounted)
		end
	end, {
		v13,
		t1,
		if not FFlagLuaAppTileVideoCandidateOnly then nil else b1,
		if not FFlagLuaAppFixHiddenTileVideoCleanup then nil else b2
	})
end
