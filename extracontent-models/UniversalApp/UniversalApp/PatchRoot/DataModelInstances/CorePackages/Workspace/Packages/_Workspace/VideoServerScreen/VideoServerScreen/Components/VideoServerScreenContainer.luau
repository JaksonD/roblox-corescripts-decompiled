local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Parent = script:FindFirstAncestor("VideoServerScreen").Parent
local enableAudioPlaybackInApp = require(Parent.MediaPlayback).enableAudioPlaybackInApp
local NotificationType = require(Parent.RobloxAppEnums).NotificationType
local Cryo = require(Parent.Cryo)
local Roact = require(Parent.Roact)
local React = require(Parent.React)
local useDispatch = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local ExperienceService = require(Parent.ExperienceService).ExperienceService
local NavigateBack = require(Parent.NavigationRodux).Thunks.NavigateBack
local useNavigation = require(Parent.Navigation).useNavigation
local useAppPolicy = require(Parent.UniversalAppPolicy).useAppPolicy
local VideoPlaybackCoordinator = require(Parent.VideoUtils).VideoPlaybackCoordinator
local FFlagLuaAppVideoPlaybackRefCount = require(Parent.SharedFlags).FFlagLuaAppVideoPlaybackRefCount

return function() --[[ VideoServerScreenContainer ]] -- line: 28
	-- upvalues: useNavigation (copy), useDispatch (copy), FFlagLuaAppVideoPlaybackRefCount (copy), React (copy), VideoPlaybackCoordinator (copy), useAppPolicy (copy), NavigateBack (copy), GuiService (copy), Cryo (copy), ExperienceService (copy), HttpService (copy), NotificationType (copy), RunService (copy), enableAudioPlaybackInApp (copy), Roact (copy)
	local v18 = useNavigation()
	local v19 = v18.getParam("placeId")
	local v20 = v18.getParam("launchSource")
	local v21 = v18.getParam("extraParams")
	local v22 = useDispatch()
	local v23 = if not FFlagLuaAppVideoPlaybackRefCount then VideoPlaybackCoordinator.default else React.useMemo(function() -- line: 36
		-- upvalues: VideoPlaybackCoordinator (copy)
		return VideoPlaybackCoordinator.new()
	end, {})
	local v24 = React.useRef(nil)
	local v25 = React.useRef(nil)
	local v26 = React.useRef(nil)
	local v27 = React.useRef(nil)
	local v28 = React.useRef(nil)
	local v29 = React.useRef(nil)
	local v30 = React.useRef(nil)
	local v31 = React.useRef(nil)
	local v32 = React.useRef(nil)
	local v33 = React.useRef(0)
	local v34 = React.useRef(nil)
	local v35 = React.useRef(nil)
	local v36 = useAppPolicy(function(p1) -- line: 58
		return p1.getThrottleFramerate()
	end)
	local v37 = React.useCallback(function() -- line: 62
		-- upvalues: v22 (copy), NavigateBack (copy)
		v22(NavigateBack(true))
	end, { v22 })
	local v38 = React.useCallback(function() -- line: 66
		-- upvalues: v28 (copy), v29 (copy)
		if v28.current then
			v28.current:Destroy()
			v28.current = nil
		end

		if v29.current then
			v29.current:Destroy()
			v29.current = nil
		end
	end, {})
	local v39 = React.useCallback(function() -- line: 77
		-- upvalues: v24 (copy), v25 (copy), v26 (copy), v27 (copy), v38 (copy), v28 (copy), v29 (copy)
		local current = v24.current
		local current2 = v25.current
		local current3 = v26.current
		local current4 = v27.current

		if not current or (not current2 or not current3 or not current4) then
			return
		end

		v38()

		local Wire = Instance.new("Wire")

		Wire.SourceInstance = current2
		Wire.TargetInstance = current3
		Wire.SourceName = "Output"
		Wire.TargetName = "Input"
		Wire.Parent = current
		v28.current = Wire

		local Wire2 = Instance.new("Wire")

		Wire2.SourceInstance = current2
		Wire2.TargetInstance = current4
		Wire2.SourceName = "Output"
		Wire2.TargetName = "Input"
		Wire2.Parent = current
		v29.current = Wire2
	end, { v38 })
	local v40 = React.useCallback(function() -- line: 102
		-- upvalues: v30 (copy), v31 (copy)
		if v30.current then
			v30.current:Disconnect()
			v30.current = nil
		end

		v31.current = nil
	end, {})
	local v41 = React.useCallback(function() -- line: 110
		-- upvalues: v40 (copy), v25 (copy), v31 (copy), v30 (copy), v37 (copy)
		v40()

		local current = v25.current

		if not current then
			return
		end

		v31.current = current.IsConnected
		v30.current = current:GetPropertyChangedSignal("IsConnected"):Connect(function() -- line: 117
			-- upvalues: current (copy), v31 (copy), v37 (copy)
			local IsConnected = current.IsConnected

			if v31.current == true and IsConnected == false then
				v37()
			end

			v31.current = IsConnected
		end)
	end, {
		v40,
		v37
	})
	local v42 = React.useCallback(function() -- line: 126
		-- upvalues: v35 (copy)
		if v35.current then
			v35.current:Disconnect()
			v35.current = nil
		end
	end, {})
	local v43 = React.useCallback(function() -- line: 133
		-- upvalues: v42 (copy), v35 (copy), GuiService (copy), v37 (copy)
		v42()
		v35.current = GuiService.ShowLeaveConfirmation:Connect(function() -- line: 135
			-- upvalues: v37 (copy)
			v37()
		end)
	end, {
		v42,
		v37
	})
	local v44 = React.useCallback(function() -- line: 140
		-- upvalues: v34 (copy)
		if v34.current then
			task.cancel(v34.current)
			v34.current = nil
		end
	end, {})
	local v45 = React.useCallback(function() -- line: 147
		-- upvalues: v32 (copy), v25 (copy)
		if v32.current then
			if v25.current then
				v25.current:Disconnect()
			end

			task.cancel(v32.current)
			v32.current = nil
		end
	end, {})
	local v46 = React.useCallback(function() -- line: 158
		-- upvalues: v25 (copy), v26 (copy), v39 (copy), v19 (copy), v21 (copy), Cryo (copy), v45 (copy), v33 (copy), v32 (copy), v20 (copy), ExperienceService (copy), v37 (copy), v41 (copy)
		if not v25.current or not v26.current then
			return false
		end

		v39()

		local current = v26.current
		local t1 = {
			placeId = v19,
			width = current.AbsoluteSize.X,
			height = current.AbsoluteSize.Y
		}

		if v21 then
			t1 = Cryo.Dictionary.join(t1, v21)
		end

		v45()

		local v58 = v33

		v58.current = v58.current + 1

		local current5 = v33.current

		v32.current = task.spawn(function() -- line: 180
			-- upvalues: v25 (copy), t1 (ref), v33 (copy), current5 (copy), v32 (copy), v19 (copy), v20 (copy), v21 (copy), Cryo (copy), ExperienceService (copy), v37 (copy), v41 (copy)
			local v61 = v25.current:ConnectAsync("", t1)

			if v33.current ~= current5 then
				return
			end

			v32.current = nil

			if not v61 then
				local t2 = {
					placeId = tonumber(v19),
					referralPage = v20
				}

				if v21 then
					t2 = Cryo.Dictionary.join(t2, v21)
				end

				ExperienceService:LaunchExperience(t2, v20)
				v37()

				return
			end

			v41()
		end)

		return true
	end, {
		v39,
		v45,
		v37,
		v41,
		v19,
		v20,
		v21
	})
	local v47 = React.useCallback(function() -- line: 210
		-- upvalues: v42 (copy), v44 (copy), v45 (copy), v25 (copy), GuiService (copy), HttpService (copy), NotificationType (copy), v40 (copy), v38 (copy), FFlagLuaAppVideoPlaybackRefCount (copy), v23 (copy), v36 (copy), RunService (copy)
		v42()
		v44()
		v45()

		if v25.current then
			v25.current:Disconnect()
		end

		GuiService:BroadcastNotification(HttpService:JSONEncode({
			hidden = false
		}), NotificationType.SET_STATUS_BAR_STYLE)
		v40()
		v38()

		if FFlagLuaAppVideoPlaybackRefCount then
			v23:cancelPlayback("VideoServerStream", "VideoServerStream finished")

			return
		end

		if v36 then
			RunService:setThrottleFramerateEnabled(true)
		end
	end, {
		v42,
		v44,
		v45,
		v40,
		v38,
		v36,
		if not FFlagLuaAppVideoPlaybackRefCount then nil else v23
	})

	React.useEffect(function() -- line: 240
		-- upvalues: enableAudioPlaybackInApp (copy), FFlagLuaAppVideoPlaybackRefCount (copy), v23 (copy), v36 (copy), RunService (copy), GuiService (copy), HttpService (copy), NotificationType (copy), v43 (copy), v46 (copy), v44 (copy), v34 (copy), v47 (copy)
		enableAudioPlaybackInApp()

		if FFlagLuaAppVideoPlaybackRefCount then
			v23:forcePlayback("VideoServerStream", "VideoServerStream started")
		elseif v36 then
			RunService:setThrottleFramerateEnabled(false)
		end

		GuiService:BroadcastNotification(HttpService:JSONEncode({
			hidden = true
		}), NotificationType.SET_STATUS_BAR_STYLE)
		v43()

		if not v46() then
			v44()
			v34.current = task.defer(function() -- line: 254
				-- upvalues: v34 (copy), v46 (copy)
				v34.current = nil
				v46()
			end)
		end

		return v47
	end, {
		v43,
		v46,
		v44,
		v47,
		v36,
		if not FFlagLuaAppVideoPlaybackRefCount then nil else v23
	})

	return Roact.createElement("ScreenGui", {
		DisplayOrder = 200,
		IgnoreGuiInset = true,
		ScreenInsets = Enum.ScreenInsets.None,
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		VideoServerScreenView = Roact.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.new(0, 0, 0),
			BorderSizePixel = 0,
			ref = v24
		}, {
			RealtimeMedia = Roact.createElement("RealtimeMedia", {
				ForwardInput = true,
				ref = v25
			}),
			VideoDisplay = Roact.createElement("VideoDisplay", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				ref = v26
			}),
			AudioDeviceOutput = Roact.createElement("AudioDeviceOutput", {
				ref = v27
			}),
			InputBlocker = Roact.createElement("ImageButton", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 3,
				AutoButtonColor = false,
				Modal = true
			})
		})
	})
end
