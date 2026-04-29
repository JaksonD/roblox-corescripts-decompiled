local EditProfileBackground = script:FindFirstAncestor("EditProfileBackground")
local EditProfileBackgroundParent = EditProfileBackground.Parent
local React = require(EditProfileBackgroundParent.React)
local Cryo = require(EditProfileBackgroundParent.Cryo)
local View = require(EditProfileBackgroundParent.Foundation).View
local useLocalUserId = require(EditProfileBackgroundParent.RobloxAppHooks).useLocalUserId
local useSelectedTheme = require(EditProfileBackgroundParent.RoactUtils).Hooks.useSelectedTheme
local getDisplayBackgroundId = require(EditProfileBackground.Common.BackgroundUtils).getDisplayBackgroundId
local ErrorTypes = require(EditProfileBackground.Analytics).ErrorTypes
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Promise = require(EditProfileBackgroundParent.Promise)
local UIBlox = require(EditProfileBackgroundParent.UIBlox)
local LoadableImage = UIBlox.App.Loading.LoadableImage
local LoadingSpinner = UIBlox.App.Loading.LoadingSpinner
local color3 = Color3.fromRGB(210, 210, 210)
local color3_2 = Color3.fromRGB(250, 250, 250)
local cFrame = CFrame.new((Vector3.new(0, 1000, 0)))
local FFlagPPVBackgroundUse2DAsLoadingState = require(EditProfileBackgroundParent.SharedFlags).FFlagPPVBackgroundUse2DAsLoadingState
local v21 = game:DefineFastFlag("PPVBackgroundUnthrottleProfileV2", false) and game:GetEngineFeature("IsGetThrottleFramerateEnabledAvailable")
local FFlagPPVEnable3DBackground = require(EditProfileBackgroundParent.SharedFlags).FFlagPPVEnable3DBackground
local FFlagPPVBackgroundPrefetchAvatar = require(EditProfileBackgroundParent.SharedFlags).FFlagPPVBackgroundPrefetchAvatar
local v24 = if not FFlagPPVBackgroundPrefetchAvatar then nil else require(EditProfileBackground.Common.AvatarModelPrefetch)
local v25 = game:DefineFastFlag("DisplayBackgroundUseToolAnimation", false)
local InsertService = game:GetService("InsertService")

local function playToolAnimation(p1) -- line: 95
	local Animate = p1:FindFirstChild("Animate")

	assert(Animate ~= nil, "Expected animate to always exist")

	local toolnone = Animate:FindFirstChild("toolnone")

	assert(toolnone ~= nil, "Expected tool animation to always exist")

	local v31 = toolnone:GetChildren()[1]

	if v31 == nil then
		return
	end

	assert(v31:IsA("Animation"), "Unexpected type for tool animation")

	local Humanoid = p1:FindFirstChild("Humanoid")

	assert(Humanoid ~= nil, "Expected humanoid to always exist")

	local Animator = Humanoid:FindFirstChild("Animator")

	assert(Animator ~= nil, "Expected Animator to always exist")
	assert(Animator:IsA("Animator"), "Animator should be of type Animator")

	local v34 = Animator:LoadAnimation(v31)

	v34.Looped = true
	v34:Play()
end

return function(t1: {[any]: any}) --[[ BackgroundDisplay ]] -- line: 121
	-- upvalues: useLocalUserId (copy), useSelectedTheme (copy), React (copy), v21 (copy), FFlagPPVEnable3DBackground (copy), InsertService (copy), getDisplayBackgroundId (copy), color3 (copy), color3_2 (copy), RunService (copy), v25 (copy), playToolAnimation (copy), Promise (copy), FFlagPPVBackgroundPrefetchAvatar (copy), v24 (copy), Players (copy), Cryo (copy), ErrorTypes (copy), cFrame (copy), UserInputService (copy), View (copy), FFlagPPVBackgroundUse2DAsLoadingState (copy), LoadableImage (copy), LoadingSpinner (copy)
	local v36 = useLocalUserId()
	local v37 = t1.userId or v36 and tonumber(v36)
	local v38 = useSelectedTheme()
	local v39 = React.useRef(nil)
	local v40 = React.useRef(nil)
	local v41 = React.useRef(nil)
	local v42 = React.useRef(nil)
	local v43, v44 = React.useState(true)
	local v45 = if not v21 then nil else React.useRef(nil)

	if FFlagPPVEnable3DBackground then
		React.useEffect(function() -- line: 135
			-- upvalues: t1 (copy), InsertService (copy), getDisplayBackgroundId (copy), v38 (copy), v40 (copy), v39 (copy), color3 (copy), color3_2 (copy)
			task.defer(function() -- line: 137
				-- upvalues: t1 (copy), InsertService (copy), getDisplayBackgroundId (copy), v38 (copy), v40 (copy), v39 (copy), color3 (copy), color3_2 (copy)
				if not t1.currentBackgroundId then
					return
				end

				local ok, result = pcall(function() -- line: 142
					-- upvalues: InsertService (copy), getDisplayBackgroundId (copy), t1 (copy), v38 (copy)
					return InsertService:LoadAsset(getDisplayBackgroundId(t1.currentBackgroundId, v38))
				end)

				if ok and result then
					if v40.current then
						for _, v in pairs(v40.current:GetChildren()) do
							if v.Name ~= "Character" then
								v:Destroy()
							end
						end
					end

					local Model = Instance.new("Model")

					Model.Name = "BackgroundModel"
					Model.Parent = v40.current

					for _, v in pairs(result:GetChildren()) do
						v.Parent = Model
					end

					Model:PivotTo(CFrame.new(0, 7, -4.5))
					result:Destroy()

					local current = v39.current

					if current then
						current.Ambient = color3
						current.LightColor = color3_2
						current.LightDirection = Vector3.new(-0.5, 0.20000000298023224, 0.20000000298023224)
					end
				end
			end)
		end, { t1.currentBackgroundId })
	end

	if v21 then
		React.useEffect(function() -- line: 179
			-- upvalues: v45 (copy), RunService (copy)
			v45.current = RunService:getThrottleFramerateEnabled()
			RunService:setThrottleFramerateEnabled(false)

			return function() -- line: 182
				-- upvalues: RunService (copy), v45 (copy)
				RunService:setThrottleFramerateEnabled(v45.current or true)
			end
		end, {})
	end

	local v46 = React.useCallback(function(p2, p3) -- line: 188
		-- upvalues: v25 (copy), playToolAnimation (copy)
		if not p2 or not p3 then
			return
		end

		local RightHand = p2:FindFirstChild("RightHand")

		if not RightHand or not RightHand:IsA("BasePart") then
			return
		end

		local RightGripAttachment = RightHand:FindFirstChild("RightGripAttachment")

		if not RightGripAttachment or not RightGripAttachment:IsA("Attachment") then
			return
		end

		local RightShoulder = nil

		if not v25 then
			RightShoulder = p2:FindFirstChild("RightShoulder", true)

			if not RightShoulder or not RightShoulder:IsA("Motor6D") then
				return
			end
		end

		local Handle = p3:FindFirstChild("Handle")

		if not Handle or not Handle:IsA("BasePart") then
			return
		end

		for _, v in ipairs(p3:GetDescendants()) do
			if v:IsA("Script") or v:IsA("LocalScript") then
				v.Disabled = true
			end
		end

		p3.Parent = p2

		if v25 then
			playToolAnimation(p2)
		else
			RightShoulder.C0 = RightShoulder.C0 * CFrame.Angles(1.5707963267948966, 0, 0)
		end

		Handle.CFrame = RightGripAttachment.WorldCFrame

		local Weld = Instance.new("Weld")

		Weld.Parent = p3
		Weld.Part0 = Handle
		Weld.Part1 = RightHand
		Weld.C0 = p3.Grip
		Weld.C1 = RightGripAttachment.CFrame
	end, {})
	local v47 = React.useCallback(function(p4, p5) -- line: 238
		if not p4 or not p5 then
			return
		end

		local v59 = p4:FindFirstChild("Right Arm")

		if not v59 or not v59:IsA("BasePart") then
			return
		end

		local RightGripAttachment = v59:FindFirstChild("RightGripAttachment")

		if not RightGripAttachment or not RightGripAttachment:IsA("Attachment") then
			return
		end

		local v61 = p4:FindFirstChild("Right Shoulder", true)

		if not v61 or not v61:IsA("Motor6D") then
			return
		end

		local Handle = p5:FindFirstChild("Handle")

		if not Handle or not Handle:IsA("BasePart") then
			return
		end

		for _, v in ipairs(p5:GetDescendants()) do
			if v:IsA("Script") or v:IsA("LocalScript") then
				v.Disabled = true
			end
		end

		p5.Parent = p4
		v61.C0 = v61.C0 * CFrame.Angles(0, 0, 1.5707963267948966)
		Handle.CFrame = RightGripAttachment.WorldCFrame

		local v65 = CFrame.new(0, -1, 0) * CFrame.Angles(-1.5707963267948966, 0, 0)
		local Weld = Instance.new("Weld")

		Weld.Parent = p5
		Weld.Part0 = Handle
		Weld.Part1 = v59
		Weld.C0 = p5.Grip
		Weld.C1 = v65
	end, {})

	React.useEffect(function() -- line: 275
		-- upvalues: v37 (copy), v44 (copy), Promise (copy), FFlagPPVBackgroundPrefetchAvatar (copy), v24 (copy), Players (copy), InsertService (copy), Cryo (copy), t1 (copy), ErrorTypes (copy), v40 (copy), cFrame (copy), v42 (copy), v46 (copy), v47 (copy), v21 (copy), UserInputService (copy)
		task.defer(function() -- line: 277
			-- upvalues: v37 (copy), v44 (copy), Promise (copy), FFlagPPVBackgroundPrefetchAvatar (copy), v24 (copy), Players (copy), InsertService (copy), Cryo (copy), t1 (copy), ErrorTypes (copy), v40 (copy), cFrame (copy), v42 (copy), v46 (copy), v47 (copy), v21 (copy), UserInputService (copy)
			if not v37 then
				return
			end

			v44(true)

			local u75 = Promise.resolve(nil)
			local u76 = Promise.resolve(nil)
			local v77 = if not FFlagPPVBackgroundPrefetchAvatar then Promise.new(function(p6, p7) -- line: 288
				-- upvalues: Players (copy), v37 (copy)
				local ok, result = pcall(function() -- line: 289
					-- upvalues: Players (copy), v37 (copy)
					if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
						return Players:CreateHumanoidModelFromUserIdAsync(v37)
					end

					return game.Players:CreateHumanoidModelFromUserId(v37)
				end)

				if ok and result then
					p6(result)

					return
				end

				p7("CharacterModelCreationFailed")
			end) else v24.get(v37)
			local v78 = Promise.new(function(p8) -- line: 303
				-- upvalues: v37 (copy), u75 (ref), Promise (copy), InsertService (copy), Cryo (copy), u76 (ref)
				local ok, result = pcall(function() -- line: 304
					-- upvalues: v37 (copy)
					return game.Players:GetCharacterAppearanceInfoAsync(v37)
				end)

				if ok and result then
					if result.emotes and #result.emotes > 0 then
						u75 = Promise.new(function(p9) -- line: 309
							-- upvalues: InsertService (copy), result (copy)
							local ok2, result2 = pcall(function() -- line: 310
								-- upvalues: InsertService (copy), result (copy)
								return (InsertService:LoadAsset(result.emotes[1].assetId):FindFirstChildOfClass("Animation"))
							end)

							p9(if not ok2 then nil else result2)
						end)
					end

					if result.assets then
						local v99 = Cryo.List.findWhere(result.assets, function(p10) -- line: 319
							return p10.assetType.name == "Gear"
						end)

						if v99 then
							local v100 = result.assets[v99]

							u76 = Promise.new(function(p11) -- line: 324
								-- upvalues: InsertService (copy), v100 (copy)
								local ok3, result3 = pcall(function() -- line: 325
									-- upvalues: InsertService (copy), v100 (copy)
									return InsertService:LoadAsset(v100.id):FindFirstChildOfClass("Tool")
								end)

								p11(if not ok3 or (not result3 or not result3:IsA("Tool")) then nil else result3)
							end)
						end
					end
				end

				p8(if not ok then nil else result)
			end)
			local v79, v80 = Promise.all({
				v77,
				v78:catch(function() -- line: 344
					return nil
				end)
			}):await()

			if not v79 then
				if t1.analytics then
					t1.analytics.fireAnalyticsEvent("EditProfileBackgroundFailure", {
						errorType = ErrorTypes.CharacterModelCreationFailed
					})
				end

				v44(false)

				return
			end

			local v81 = v80[1]
			local v82 = v80[2]

			if FFlagPPVBackgroundPrefetchAvatar then
				v24.clear(v37)
			end

			v81.Name = "Character"
			v81.Parent = v40.current

			if v81.PrimaryPart then
				v81.PrimaryPart.CFrame = cFrame
			end

			v42.current = v81

			if v82 then
				local _, v84 = u76:await()

				if v84 then
					local playerAvatarType = v82.playerAvatarType

					if playerAvatarType == "R15" then
						v46(v81, v84)
					elseif playerAvatarType == "R6" then
						v47(v81, v84)
					end
				end
			end

			local Humanoid = v81:FindFirstChild("Humanoid")

			if Humanoid then
				Promise.race({
					Promise.fromEvent(Humanoid.ClusterCompositionFinished),
					Promise.delay(3)
				}):await()
			end

			if v81.PrimaryPart then
				v81.PrimaryPart.CFrame = CFrame.lookAt(Vector3.new(0, 0, 0), (Vector3.new(0, 0, -10)))

				local v87 = v81:FindFirstChild("RightFoot") or v81:FindFirstChild("Right Leg")

				if v87 and v87:IsA("BasePart") then
					local v88 = v87.Position.Y - v87.Size.Y / 2
					local v89 = v81.PrimaryPart.Position.Y + (-3 - v88)

					v81.PrimaryPart.CFrame = CFrame.lookAt(Vector3.new(0, v89, 0), (Vector3.new(0, 0, -10)))
				end
			end

			v44(false)

			if v21 or UserInputService.PreferredInput ~= Enum.PreferredInput.Touch then
				local ok, _ = pcall(function() -- line: 415
					-- upvalues: u75 (ref), v81 (copy)
					local _, v102 = u75:await()
					local Animation1 = v81:FindFirstChild("Animate"):FindFirstChild("idle"):FindFirstChild("Animation1")
					local Animator = v81:FindFirstChild("Humanoid"):FindFirstChild("Animator")

					if Animation1 and (Animator and Animator:IsA("Animator")) then
						local v105 = Animator:LoadAnimation(Animation1)

						if v102 then
							local v106 = Animator:LoadAnimation(v102)

							v106.Looped = false
							v106:Play()
							v106.Stopped:Connect(function() -- line: 430
								-- upvalues: v105 (copy)
								v105:Play()
							end)

							return
						end

						v105:Play()
					end
				end)

				if not ok and t1.analytics then
					t1.analytics.fireAnalyticsEvent("EditProfileBackgroundFailure", {
						errorType = ErrorTypes.CharacterAnimationFailed
					})
				end
			end
		end)
	end, { v37 })
	React.useEffect(function() -- line: 451
		-- upvalues: v39 (copy), v41 (copy)
		if v39.current and v41.current then
			v39.current.CurrentCamera = v41.current
		end
	end)

	return React.createElement(View, {
		Size = UDim2.new(1, 0, 0, t1.height),
		ZIndex = 2
	}, {
		Background = React.createElement("ViewportFrame", {
			Size = UDim2.fromScale(1, 1),
			ref = v39,
			Ambient = color3,
			LightColor = color3_2,
			BackgroundTransparency = 1
		}, {
			WorldModel = React.createElement("WorldModel", {
				ref = v40
			}),
			Camera = React.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				CFrame = CFrame.lookAt(Vector3.new(0, 0, -8), (Vector3.new(0, 1, 10))),
				ref = v41
			})
		}),
		LoadingFrame = v43 and React.createElement(View, {
			tag = "size-full-full",
			ZIndex = 2
		}, { if not FFlagPPVBackgroundUse2DAsLoadingState then React.createElement(LoadingSpinner, {
			size = UDim2.fromOffset(48, 48),
			position = UDim2.fromScale(0.5, 0.5),
			anchorPoint = Vector2.new(0.5, 0.5)
		}) else React.createElement(LoadableImage, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, -24),
			Size = UDim2.new(1, -48, 1, -48),
			ScaleType = Enum.ScaleType.Fit,
			BackgroundTransparency = 1,
			Image = t1.userThumbnail,
			useShimmerAnimationWhileLoading = true,
			ZIndex = 2
		}) })
	})
end
