local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local VideoUtils = script:FindFirstAncestor("VideoUtils")
local VideoUtilsParent = VideoUtils.Parent
local AppCommonLib = require(VideoUtilsParent.AppCommonLib)
local ArgCheck = require(VideoUtilsParent.ArgCheck)
local Signal = AppCommonLib.Signal

require(VideoUtils.Analytics.VideoAnalyticsTypes)

local getIsInstanceVisible = require(VideoUtils.getIsInstanceVisible)
local FFlagLuaAppEdpMediaGalleryFullScreen = require(VideoUtilsParent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local FFlagLuaAppFixVideoFramerateThrottlePolicy = require(VideoUtilsParent.SharedFlags).FFlagLuaAppFixVideoFramerateThrottlePolicy
local FFlagLuaAppHomeTouchAutoplay = require(VideoUtilsParent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppVideoPlaybackRefCount = require(VideoUtilsParent.SharedFlags).FFlagLuaAppVideoPlaybackRefCount
local t1 = {}

t1.__index = t1

if FFlagLuaAppFixVideoFramerateThrottlePolicy then
	t1.preferredFramerateThrottling = false
	t1.isSettingFramerateThrottleAllowedByPolicy = false
end

local n1 = 0

function t1.new() -- line: 71
	-- upvalues: Signal (copy), FFlagLuaAppFixVideoFramerateThrottlePolicy (copy), t1 (copy)
	local t2 = {
		changed = Signal.new(),
		playingVideoKey = nil,
		currentPlaybackSessionId = nil,
		currentplaybackSessionStartTime = nil,
		videoAnalytics = nil,
		playingVideoItemIndex = nil,
		videoDwellTaskHandles = {},
		preferredFramerateThrottling = not FFlagLuaAppFixVideoFramerateThrottlePolicy or nil
	}

	setmetatable(t2, t1)

	return t2
end

if FFlagLuaAppFixVideoFramerateThrottlePolicy then
	function t1.__setRunServiceThrottleFramerateEnabled(_, b1: boolean) -- line: 90
		-- upvalues: t1 (copy), RunService (copy)
		if not t1.isSettingFramerateThrottleAllowedByPolicy then
			return
		end

		RunService:setThrottleFramerateEnabled(b1)
	end
end

if FFlagLuaAppHomeTouchAutoplay then
	function t1.isPlaybackAllowed(_, b2: boolean, b3: boolean?) -- line: 103
		-- upvalues: FFlagLuaAppEdpMediaGalleryFullScreen (copy)
		if FFlagLuaAppEdpMediaGalleryFullScreen and b3 or not b2 then
			return false
		end

		return true
	end
end

function t1.isPlaybackCandidate(p3, b4: boolean, b5: boolean?, t3: {[any]: any}, t4: {[any]: any}, n2: number) -- line: 116
	-- upvalues: FFlagLuaAppHomeTouchAutoplay (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), getIsInstanceVisible (copy)
	if FFlagLuaAppHomeTouchAutoplay then
		if not p3:isPlaybackAllowed(b4, b5) then
			return false
		end
	elseif FFlagLuaAppEdpMediaGalleryFullScreen and b5 or not b4 then
		return false
	end

	return getIsInstanceVisible(t3.current, t4, n2)
end
function t1.forcePlayback(p4, s1: string, s2: string, n3: number?, p5) -- line: 138
	if s1 == p4.playingVideoKey then
		return
	end

	p4:__cancelCurrentPlayback(s2, n3, nil, p4.videoAnalytics)
	p4:requestPlayback(s1, false, 0, n3, p5)
end
function t1.requestPlayback(p6, s3: string, b6: boolean, n4: number, n5: number?, p7) -- line: 155
	if s3 == p6.playingVideoKey then
		return
	end

	if p6.videoDwellTaskHandles[s3] ~= nil then
		return
	end

	if b6 then
		local thread = task.delay(n4, function() -- line: 174
			-- upvalues: p6 (copy), s3 (copy), n5 (copy), p7 (copy)
			p6.videoDwellTaskHandles[s3] = nil
			p6:__startPlayback(s3, n5, p7)
		end)

		p6.videoDwellTaskHandles[s3] = thread

		return
	end

	p6:__startPlayback(s3, n5, p7)
end
function t1.__startPlayback(p8, s4: string, n6: number?, p9) -- line: 185
	-- upvalues: FFlagLuaAppFixVideoFramerateThrottlePolicy (copy), RunService (copy), FFlagLuaAppVideoPlaybackRefCount (copy), n1 (ref), HttpService (copy)
	if FFlagLuaAppFixVideoFramerateThrottlePolicy then
		p8:__setRunServiceThrottleFramerateEnabled(false)
	else
		RunService:setThrottleFramerateEnabled(false)
	end

	if FFlagLuaAppVideoPlaybackRefCount and p8.playingVideoKey == nil then
		n1 += 1
	end

	p8.playingVideoKey = s4
	p8.currentPlaybackSessionId = HttpService:GenerateGUID(false)
	p8.currentPlaybackSessionStartTime = tick()
	p8.videoAnalytics = p9
	p8.playingVideoItemIndex = n6

	if p9 then
		p9.reportVideoPlay(n6, p8.currentPlaybackSessionId)
	end

	p8.changed:fire(s4)
end
function t1.cancelPlayback(p10, s5: string, s6: string, n7: number?, p11) -- line: 215
	-- upvalues: FFlagLuaAppVideoPlaybackRefCount (copy), n1 (ref), FFlagLuaAppFixVideoFramerateThrottlePolicy (copy), t1 (copy), RunService (copy)
	if s5 == p10.playingVideoKey then
		p10:__cancelCurrentPlayback(s6, n7, nil, p11)
	elseif p10.videoDwellTaskHandles[s5] ~= nil then
		local v48 = p10.videoDwellTaskHandles[s5]

		task.cancel(v48)
		p10.videoDwellTaskHandles[s5] = nil
	end

	if if not FFlagLuaAppVideoPlaybackRefCount then p10.playingVideoKey == nil else n1 == 0 then
		if FFlagLuaAppFixVideoFramerateThrottlePolicy then
			p10:__setRunServiceThrottleFramerateEnabled(t1.preferredFramerateThrottling)

			return
		end

		RunService:setThrottleFramerateEnabled(p10.preferredFramerateThrottling)
	end
end
function t1.reset(p12, s7: string, _: number?, s8: string?, _) -- line: 241
	-- upvalues: FFlagLuaAppVideoPlaybackRefCount (copy), n1 (ref), FFlagLuaAppFixVideoFramerateThrottlePolicy (copy), t1 (copy), RunService (copy)
	if p12.playingVideoKey ~= nil then
		p12:__cancelCurrentPlayback(s7, p12.playingVideoItemIndex, s8, p12.videoAnalytics)
	end

	for _, v55 in p12.videoDwellTaskHandles do
		if v55 ~= nil then
			task.cancel(v55)
		end
	end

	p12.videoDwellTaskHandles = {}

	if not FFlagLuaAppVideoPlaybackRefCount or n1 == 0 then
		if FFlagLuaAppFixVideoFramerateThrottlePolicy then
			p12:__setRunServiceThrottleFramerateEnabled(t1.preferredFramerateThrottling)

			return
		end

		RunService:setThrottleFramerateEnabled(p12.preferredFramerateThrottling)
	end
end
function t1.__cancelCurrentPlayback(p14, s9: string, n9: number?, s10: string?, p15) -- line: 270
	-- upvalues: ArgCheck (copy), FFlagLuaAppVideoPlaybackRefCount (copy), n1 (ref)
	local currentPlaybackSessionStartTime = p14.currentPlaybackSessionStartTime

	if p15 then
		local timestamp = tick()

		ArgCheck.assert(currentPlaybackSessionStartTime and currentPlaybackSessionStartTime <= timestamp)

		local v63 = (not currentPlaybackSessionStartTime or not (currentPlaybackSessionStartTime <= timestamp)) and -1 or timestamp - currentPlaybackSessionStartTime

		p15.reportVideoEnd(n9, s9, p14.currentPlaybackSessionId, v63, s10)
	end

	if FFlagLuaAppVideoPlaybackRefCount and p14.playingVideoKey ~= nil then
		n1 -= 1
	end

	p14.playingVideoKey = nil
	p14.currentPlaybackSessionId = nil
	p14.currentPlaybackSessionStartTime = nil
	p14.videoAnalytics = nil
	p14.playingVideoItemIndex = nil
	p14.changed:fire(nil)
end

if FFlagLuaAppFixVideoFramerateThrottlePolicy then
	function t1.setIsSettingFramerateThrottleAllowedByPolicy(_, b7: boolean) -- line: 303
		-- upvalues: t1 (copy)
		t1.isSettingFramerateThrottleAllowedByPolicy = b7
	end
end

function t1.setPreferredFramerateThrottling(p17, b8: boolean) -- line: 311
	-- upvalues: FFlagLuaAppFixVideoFramerateThrottlePolicy (copy), t1 (copy)
	if FFlagLuaAppFixVideoFramerateThrottlePolicy then
		t1.preferredFramerateThrottling = b8

		return
	end

	p17.preferredFramerateThrottling = b8
end

if FFlagLuaAppVideoPlaybackRefCount then
	function t1.isAnyPlaying() -- line: 323
		-- upvalues: n1 (ref)
		return n1 > 0
	end
end

t1.default = t1.new()

return t1
