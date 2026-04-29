local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local React = require(ProfilePlatformParent.React)
local Foundation = require(ProfilePlatformParent.Foundation)
local useScreenSize = require(ProfilePlatformParent.RobloxAppHooks).useScreenSize
local View = Foundation.View
local LoadableImage = require(ProfilePlatformParent.UIBlox).App.Loading.LoadableImage
local Enums = require(ProfilePlatform.Common.Enums)

return function(t1: {[any]: any}) --[[ CoverPhoto ]] -- line: 34
	-- upvalues: Enums (copy), useScreenSize (copy), React (copy), View (copy), LoadableImage (copy)
	local v13 = t1.profileFormFactorInfo.formFactor == Enums.ProfileFormFactor.Wide
	local v14 = t1.profileFormFactorInfo.formFactor == Enums.ProfileFormFactor.PeekView
	local isFullView = t1.profileFormFactorInfo.isFullView
	local v16 = useScreenSize()
	local v17 = React.useMemo(function() -- line: 40
		-- upvalues: v14 (copy)
		if v14 then
			return 393
		end

		return 456
	end, {
		v14,
		isFullView,
		t1.peekViewOpenPercent
	})
	local v18 = React.useMemo(function() -- line: 48
		-- upvalues: v14 (copy), isFullView (copy), t1 (copy), v17 (copy)
		if v14 and not isFullView then
			return t1.peekViewOpenPercent * 98 + 295
		end

		return v17
	end, {
		v14,
		isFullView,
		t1.peekViewOpenPercent,
		v17
	})
	local v19 = v18 - 100
	local v20 = v18 - t1.parallaxOffset
	local v21 = v19 - t1.parallaxOffset
	local v22 = if not isFullView then UDim.new(1, 0) else UDim.new(0, v16.X)

	return React.createElement(View, {
		LayoutOrder = t1.layoutOrder,
		Size = UDim2.new(v22, UDim.new(0, v19)),
		ZIndex = -1
	}, {
		ParallaxWrapper = React.createElement(View, {
			Size = UDim2.new(1, 0, 0, v21),
			Position = UDim2.new(0, 0, 0, t1.parallaxOffset)
		}, {
			CoverPhotoWrapper = React.createElement(View, {
				Size = UDim2.new(1, 0, 0, v20),
				ClipsDescendants = true
			}, {
				CoverPhoto = React.createElement(LoadableImage, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					Image = t1.coverPhotoThumbnail,
					Position = UDim2.fromScale(0.5, 0.5),
					ScaleType = Enum.ScaleType.Crop,
					Size = UDim2.new(1, 0, 0, v17),
					useShimmerAnimationWhileLoading = true
				})
			}),
			GradientWrapper = React.createElement(View, {
				Size = UDim2.new(1, 0, 0, 100),
				Position = UDim2.new(0, 0, 0, v21),
				tag = not v13 and not isFullView and "bg-surface-100" or "bg-surface-0"
			}, {
				Gradient = React.createElement("UIGradient", {
					Rotation = 270,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 0),
						NumberSequenceKeypoint.new(0.25, 0),
						NumberSequenceKeypoint.new(0.5, 0.1),
						NumberSequenceKeypoint.new(0.75, 0.5),
						NumberSequenceKeypoint.new(1, 1)
					})
				})
			})
		})
	})
end
