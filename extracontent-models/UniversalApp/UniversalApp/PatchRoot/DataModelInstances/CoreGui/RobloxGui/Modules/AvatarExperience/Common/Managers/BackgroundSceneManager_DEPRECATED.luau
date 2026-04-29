local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local NotificationService = game:GetService("NotificationService")
local CorePackages = game:GetService("CorePackages")
local InsertService = game:GetService("InsertService")
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local LightUtility = require(CorePackages.Packages.Thumbnailing).LightUtility
local Signals = require(CorePackages.Packages.Signals)
local ParticleEffectManager = require(Modules.AvatarExperience.Common.Managers.ParticleEffectManager)
local Utils = require(Modules.AvatarExperience.Common.Utils)
local GetFIntAvatarEditorParticleEmitterRateOverride = require(Modules.LuaApp.Flags.GetFIntAvatarEditorParticleEmitterRateOverride)
local FFlagUseUpdatedBackgroundSceneSettingsOnMobile = require(Modules.AvatarExperience.Flags.FFlagUseUpdatedBackgroundSceneSettingsOnMobile)
local FFlagAXGuardCharacterSpotLightSideAccess = require(Modules.AvatarExperience.Flags.FFlagAXGuardCharacterSpotLightSideAccess)
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local getSceneOverridesStore = require(CorePackages.Workspace.Packages.Style).getSceneOverridesStore
local v18 = game:DefineFastInt("AXSkyboxBlockerSizeX", 31)
local v19 = game:DefineFastInt("AXSkyboxBlockerSizeY", 175)
local v20 = game:DefineFastInt("AXSkyboxBlockerSizeZ", 400)
local v21 = game:DefineFastInt("AXSkyboxBlockerPositionX", -50)
local v22 = game:DefineFastInt("AXSkyboxBlockerPositionY", 77)
local v23 = game:DefineFastInt("AXSkyboxBlockerPositionZ", -9)
local FFlagAXPhotoboothFunctionality = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXPhotoboothFunctionality
local PhotoboothSceneData = require(Modules.AvatarExperience.Photobooth.Components.Scenes.PhotoboothSceneData)
local PhotoboothStoreBridge = require(CorePackages.Workspace.Packages.AvatarExperiencePhotobooth).PhotoboothStoreBridge
local Constants = require(Modules.AvatarExperience.Common.Constants)
local BackgroundType = Constants.BackgroundType
local ParticleType = Constants.ParticleType
local PagePlayParticleType = Constants.PagePlayParticleType
local PageBackgroundType = Constants.PageBackgroundType
local t1 = {}

t1.__index = t1

local t2 = {
	Lighting = if not FFlagUseUpdatedBackgroundSceneSettingsOnMobile then {
		Brightness = 2,
		ColorShift_Bottom = Color3.fromRGB(232, 255, 146),
		ColorShift_Top = Color3.fromRGB(85, 136, 167),
		OutdoorAmbient = Color3.fromRGB(0, 0, 0),
		Ambient = Color3.fromRGB(170, 170, 170),
		ClockTime = 12,
		GeographicLatitude = 41.733,
		TimeOfDay = "12:00:00",
		FogColor = Color3.fromRGB(45, 46, 49),
		FogEnd = 92,
		FogStart = 20,
		Sky = {
			CelestialBodiesShown = true,
			StarCount = 3000
		}
	} else {
		Brightness = 2,
		ColorShift_Bottom = Color3.fromRGB(108, 94, 66),
		ColorShift_Top = Color3.fromRGB(94, 100, 172),
		ClockTime = 11,
		FogEnd = 92,
		GeographicLatitude = 24,
		OutdoorAmbient = Color3.fromRGB(0, 0, 0),
		TimeOfDay = "11:00:00"
	},
	Bloom = if not FFlagUseUpdatedBackgroundSceneSettingsOnMobile then {
		Intensity = 0.3,
		Size = 12,
		Threshold = 0.95
	} else {
		Intensity = 0.2,
		Size = 12,
		Threshold = 0.95
	},
	ColorCorrection = {
		Brightness = 0,
		Contrast = 0,
		Saturation = 0
	}
}
local t3 = {
	Lighting = {
		Brightness = 1,
		ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
		ColorShift_Top = Color3.fromRGB(0, 0, 0),
		OutdoorAmbient = Color3.fromRGB(127, 127, 127),
		Ambient = Color3.fromRGB(127, 127, 127),
		ClockTime = 14,
		GeographicLatitude = 41.733,
		TimeOfDay = "14:00:00",
		FogColor = Color3.fromRGB(192, 192, 192),
		FogEnd = 100000,
		FogStart = 0,
		Sky = {
			CelestialBodiesShown = true,
			StarCount = 3000
		}
	}
}
local t4 = {
	LightTheme = {
		AmbientLightColor = if not FFlagUseUpdatedBackgroundSceneSettingsOnMobile then nil else Color3.fromRGB(130, 130, 130),
		EnvironmentDiffuseScale = if not FFlagUseUpdatedBackgroundSceneSettingsOnMobile then nil else 0.2,
		EnvironmentSpecularScale = if not FFlagUseUpdatedBackgroundSceneSettingsOnMobile then nil else 1,
		FogStart = if not FFlagUseUpdatedBackgroundSceneSettingsOnMobile then nil else 30,
		BackPanelTextureColor = Color3.fromRGB(213, 213, 213),
		CloudsTextureColor = Color3.fromRGB(222, 222, 222),
		LargerShapesTextureColor = Color3.fromRGB(222, 222, 222),
		BasePlateColor = Color3.fromRGB(213, 213, 213),
		CharacterSpotLightBrightness = 6,
		FogColor = Color3.fromRGB(213, 213, 213),
		SkyboxAssetLocation = "rbxasset://textures/AvatarEditorImages/LightPixel.png",
		ParticleEmitterColorCatalogToAE = ColorSequence.new(Color3.fromRGB(171, 169, 161), Color3.fromRGB(158, 135, 120)),
		ParticleEmitterColorAEToCatalog = ColorSequence.new(Color3.fromRGB(158, 135, 120), Color3.fromRGB(171, 169, 161))
	},
	DarkTheme = {
		AmbientLightColor = if not FFlagUseUpdatedBackgroundSceneSettingsOnMobile then nil else Color3.fromRGB(180, 180, 180),
		EnvironmentDiffuseScale = if not FFlagUseUpdatedBackgroundSceneSettingsOnMobile then nil else 1,
		EnvironmentSpecularScale = if not FFlagUseUpdatedBackgroundSceneSettingsOnMobile then nil else 1,
		FogStart = if not FFlagUseUpdatedBackgroundSceneSettingsOnMobile then nil else 20,
		BackPanelTextureColor = Color3.fromRGB(83, 80, 82),
		CloudsTextureColor = Color3.fromRGB(100, 101, 108),
		LargerShapesTextureColor = Color3.fromRGB(100, 101, 108),
		BasePlateColor = Color3.fromRGB(83, 80, 82),
		CharacterSpotLightBrightness = 12,
		FogColor = Color3.fromRGB(55, 56, 59),
		SkyboxAssetLocation = "rbxasset://textures/ui/AvatarExperience/AvatarExperienceSkyboxDarkTheme.png",
		ParticleEmitterColorCatalogToAE = ColorSequence.new(Color3.fromRGB(79, 75, 79), Color3.fromRGB(51, 49, 52)),
		ParticleEmitterColorAEToCatalog = ColorSequence.new(Color3.fromRGB(51, 49, 52), Color3.fromRGB(79, 75, 79))
	}
}
local t5 = {
	LargerShapes = {
		TextureWallTransparency = 1,
		LargerShapesPosition = Vector3.new(-62.89799880981445, 6.96999979019165, -8.8149995803833),
		CloudsPosition = Vector3.new(-90, 20, 0),
		BaseplateTransparency = 0
	},
	Walls = {
		TextureWallTransparency = 0,
		LargerShapesPosition = Vector3.new(-62.89799880981445, -12.300000190734863, -8.8149995803833),
		CloudsPosition = Vector3.new(-90, 80, 0),
		BaseplateTransparency = 0
	},
	NoShapesNoWalls = {
		TextureWallTransparency = 1,
		LargerShapesPosition = Vector3.new(-62.89799880981445, -1000, -8.8149995803833),
		CloudsPosition = Vector3.new(-90, 1000, 0),
		BaseplateTransparency = 1
	}
}

function t1.new(p1, p2, p3) -- line: 189
	-- upvalues: t1 (copy), ParticleEffectManager (copy), Lighting (copy), ReplicatedStorage (copy), FFlagAXPhotoboothFunctionality (copy), ParticleType (copy), t5 (copy), NotificationService (copy)
	local t6 = {}

	setmetatable(t6, t1)
	t6.connections = {}
	t6.store = p1
	t6.networking = p2
	t6.avatarRoute = p3
	t6.ParticleEffectManager = ParticleEffectManager.new(p1, p3)
	t6.colorCorrection = Lighting:FindFirstChild("ColorCorrection")

	if not t6.colorCorrection then
		t6.colorCorrection = Instance.new("ColorCorrectionEffect")
		t6.colorCorrection.Parent = Lighting
	end

	t6.bloom = Lighting:FindFirstChild("Bloom")

	if not t6.bloom then
		t6.bloom = Instance.new("BloomEffect")
		t6.bloom.Parent = Lighting
	end

	t6.newBackgroundScene = ReplicatedStorage:WaitForChild("AvatarSceneNew")
	t6.currentScene = nil

	if FFlagAXPhotoboothFunctionality then
		t6.currentSceneLighting = nil
	end

	t6.particleStorage = {
		[ParticleType.CatalogToAvatarEditor] = {
			largeParticleEmitter = t6.newBackgroundScene.CatalogToAvatarEditorPFX.BIGBOIS,
			smallParticleEmitter = t6.newBackgroundScene.CatalogToAvatarEditorPFX.SmolBois
		},
		[ParticleType.AvatarEditorToCatalog] = {
			largeParticleEmitter = t6.newBackgroundScene.AvatarEditorToCatalogPFX.BIGBOIS,
			smallParticleEmitter = t6.newBackgroundScene.AvatarEditorToCatalogPFX.SmolBois
		}
	}
	t6.newBackgroundScene.BackPanel.Transparency = t5.LargerShapes.TextureWallTransparency
	t6:setupTweening()

	local v41 = NotificationService.SelectedTheme or nil

	t6:updateTheme(string.lower(v41))

	return t6
end
function t1.setupTweening(p4) -- line: 240
	-- upvalues: TweenService (copy), t5 (copy)
	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0)
	local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Elastic, Enum.EasingDirection.In, 0, false, 0)
	local tweenInfo3 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0)
	local t7 = {
		Transparency = 0
	}
	local t8 = {
		Transparency = 1
	}

	p4.wallAppearTween = TweenService:Create(p4.newBackgroundScene.BackPanel.TextureWall, tweenInfo3, t7)
	p4.wallDisappearTween = TweenService:Create(p4.newBackgroundScene.BackPanel.TextureWall, tweenInfo3, t8)
	p4.floorAppearTween = TweenService:Create(p4.newBackgroundScene.BackPanel.TextureFloor, tweenInfo3, t7)
	p4.floorDisappearTween = TweenService:Create(p4.newBackgroundScene.BackPanel.TextureFloor, tweenInfo3, t8)
	p4.largerShapesAppearTween = TweenService:Create(p4.newBackgroundScene.LargerShapes, tweenInfo, {
		Position = t5.LargerShapes.LargerShapesPosition
	})
	p4.largerShapesDisappearTween = TweenService:Create(p4.newBackgroundScene.LargerShapes, tweenInfo2, {
		Position = t5.Walls.LargerShapesPosition
	})
	p4.cloudsAppearTween = TweenService:Create(p4.newBackgroundScene.Clouds, tweenInfo, {
		Position = t5.LargerShapes.CloudsPosition
	})
	p4.cloudsDisappearTween = TweenService:Create(p4.newBackgroundScene.Clouds, tweenInfo2, {
		Position = t5.Walls.CloudsPosition
	})
	p4.allTweens = {
		p4.wallAppearTween,
		p4.wallDisappearTween,
		p4.floorAppearTween,
		p4.floorDisappearTween,
		p4.largerShapesAppearTween,
		p4.largerShapesDisappearTween,
		p4.cloudsAppearTween,
		p4.cloudsDisappearTween
	}
end
function t1.updateTheme(p5, p6) -- line: 303
	-- upvalues: t4 (copy), SharedFlags (copy), getSceneOverridesStore (copy), FFlagUseUpdatedBackgroundSceneSettingsOnMobile (copy), Lighting (copy), ParticleType (copy)
	p5.theme = p6

	local LightTheme = t4.LightTheme

	if p6 == "dark" then
		LightTheme = t4.DarkTheme
	end

	if SharedFlags.FFlagEnableCoreContentTheme then
		p5.sceneOverrides = getSceneOverridesStore().getSceneOverrides()

		if p5.sceneOverrides then
			LightTheme = table.clone(LightTheme)
			LightTheme.BackPanelTextureColor = p5.sceneOverrides.BackPanel
			LightTheme.CloudsTextureColor = p5.sceneOverrides.Clouds
			LightTheme.LargerShapesTextureColor = p5.sceneOverrides.LargerShapes
			LightTheme.BasePlateColor = p5.sceneOverrides.Baseplate
			LightTheme.FogStart = p5.sceneOverrides.FogStart
			LightTheme.FogEnd = p5.sceneOverrides.FogEnd
		end
	end

	for _, v52 in p5.newBackgroundScene.BackPanel:GetChildren() do
		v52.Color3 = LightTheme.BackPanelTextureColor
	end

	for _, v54 in p5.newBackgroundScene.Clouds:GetChildren() do
		v54.Color3 = LightTheme.CloudsTextureColor
	end

	for _, v56 in p5.newBackgroundScene.LargerShapes:GetChildren() do
		v56.Color3 = LightTheme.LargerShapesTextureColor
	end

	p5.newBackgroundScene.Baseplate.Color = LightTheme.BasePlateColor

	local SkyboxBlocker = p5.newBackgroundScene:FindFirstChild("SkyboxBlocker")

	if SkyboxBlocker then
		if SharedFlags.FFlagEnableCoreContentTheme and p5.sceneOverrides then
			SkyboxBlocker.Transparency = p5.sceneOverrides.SkyboxBlockerTransparency
			SkyboxBlocker.Color = p5.sceneOverrides.SkyboxBlockerColor
		else
			SkyboxBlocker.Transparency = 1
		end
	end

	if FFlagUseUpdatedBackgroundSceneSettingsOnMobile or SharedFlags.FFlagEnableCoreContentTheme then
		if LightTheme.AmbientLightColor ~= nil then
			Lighting.Ambient = LightTheme.AmbientLightColor
		end

		if LightTheme.EnvironmentDiffuseScale ~= nil then
			Lighting.EnvironmentDiffuseScale = LightTheme.EnvironmentDiffuseScale
		end

		if LightTheme.EnvironmentSpecularScale ~= nil then
			Lighting.EnvironmentSpecularScale = LightTheme.EnvironmentSpecularScale
		end

		if LightTheme.FogStart ~= nil then
			Lighting.FogStart = LightTheme.FogStart
		end

		if LightTheme.FogEnd ~= nil then
			Lighting.FogEnd = LightTheme.FogEnd
		end
	else
		p5.newBackgroundScene.CharacterSpotLight.SpotLight.Brightness = LightTheme.CharacterSpotLightBrightness
	end

	Lighting.FogColor = LightTheme.FogColor

	for v58, v59 in p5.particleStorage do
		for _, v61 in v59 do
			v61.Color = if v58 ~= ParticleType.AvatarEditorToCatalog then LightTheme.ParticleEmitterColorCatalogToAE else LightTheme.ParticleEmitterColorAEToCatalog
		end
	end
end
function t1.setLighting(p7, p8) -- line: 380
	-- upvalues: Lighting (copy), FFlagUseUpdatedBackgroundSceneSettingsOnMobile (copy), SharedFlags (copy), FFlagAXGuardCharacterSpotLightSideAccess (copy)
	Lighting.Brightness = p8.Lighting.Brightness
	Lighting.ColorShift_Bottom = p8.Lighting.ColorShift_Bottom
	Lighting.ColorShift_Top = p8.Lighting.ColorShift_Top
	Lighting.OutdoorAmbient = p8.Lighting.OutdoorAmbient

	if not FFlagUseUpdatedBackgroundSceneSettingsOnMobile then
		Lighting.Ambient = p8.Lighting.Ambient
	end

	Lighting.ClockTime = p8.Lighting.ClockTime
	Lighting.GeographicLatitude = p8.Lighting.GeographicLatitude
	Lighting.TimeOfDay = p8.Lighting.TimeOfDay
	Lighting.FogEnd = if not SharedFlags.FFlagEnableCoreContentTheme or not p7.sceneOverrides then p8.Lighting.FogEnd else p7.sceneOverrides.FogEnd

	if not FFlagUseUpdatedBackgroundSceneSettingsOnMobile then
		Lighting.FogStart = if not SharedFlags.FFlagEnableCoreContentTheme or not p7.sceneOverrides then p8.Lighting.FogStart else p7.sceneOverrides.FogStart
	end

	if FFlagUseUpdatedBackgroundSceneSettingsOnMobile then
		p7.newBackgroundScene.CharacterSpotLight.SpotLight.Enabled = false

		if FFlagAXGuardCharacterSpotLightSideAccess then
			local CharacterSpotLight_Left = p7.newBackgroundScene:FindFirstChild("CharacterSpotLight_Left")

			if CharacterSpotLight_Left and CharacterSpotLight_Left:FindFirstChild("SpotLight") then
				CharacterSpotLight_Left.SpotLight.Enabled = true
			end

			local CharacterSpotLight_Right = p7.newBackgroundScene:FindFirstChild("CharacterSpotLight_Right")

			if CharacterSpotLight_Right and CharacterSpotLight_Right:FindFirstChild("SpotLight") then
				CharacterSpotLight_Right.SpotLight.Enabled = true
			end
		else
			p7.newBackgroundScene.CharacterSpotLight_Left.SpotLight.Enabled = true
			p7.newBackgroundScene.CharacterSpotLight_Right.SpotLight.Enabled = true
		end
	end

	if p8.Bloom then
		if p7.bloom then
			p7.bloom.Enabled = true
			p7.bloom.Intensity = p8.Bloom.Intensity
			p7.bloom.Size = p8.Bloom.Size
			p7.bloom.Threshold = p8.Bloom.Threshold
		end
	elseif p7.bloom then
		p7.bloom.Enabled = false
	end

	if p8.ColorCorrection then
		if p7.colorCorrection then
			p7.colorCorrection.Enabled = true
			p7.colorCorrection.Brightness = p8.ColorCorrection.Brightness
			p7.colorCorrection.Contrast = p8.ColorCorrection.Contrast
			p7.colorCorrection.Saturation = p8.ColorCorrection.Saturation

			return
		end
	elseif p7.colorCorrection then
		p7.colorCorrection.Enabled = false
	end
end
function t1.startLighting(p9) -- line: 452
	-- upvalues: t2 (copy)
	p9:setLighting(t2)
end
function t1.updateLighting(p10, p11) -- line: 456
	-- upvalues: AvatarScreen (copy), t3 (copy), LightUtility (copy), t2 (copy)
	if p11 == AvatarScreen.ProfilePictureEditorFinal then
		p10:setLighting(t3)

		if not game.Workspace:FindFirstChild("ThumbnailLightAnchor_0") then
			local CurrentCharacter = p10.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter

			if CurrentCharacter then
				LightUtility.AddDefaultPointLightRelativeTo(CurrentCharacter.HumanoidRootPart.CFrame)

				return
			end
		end
	else
		p10:setLighting(t2)

		local ThumbnailLightAnchor_0 = game.Workspace:FindFirstChild("ThumbnailLightAnchor_0")

		if ThumbnailLightAnchor_0 then
			ThumbnailLightAnchor_0:Destroy()
		end
	end
end
function t1.playParticleEmitters(p12, p13) -- line: 479
	-- upvalues: PagePlayParticleType (copy), ParticleType (copy)
	if PagePlayParticleType[p13] == ParticleType.CatalogToAvatarEditor then
		task.spawn(function() -- line: 481
			-- upvalues: p12 (copy), ParticleType (copy)
			for _, v142 in p12.particleStorage[ParticleType.CatalogToAvatarEditor] do
				v142.Parent = p12.newBackgroundScene.CatalogToAvatarEditorPFX
				v142.Enabled = true
			end

			wait(1)

			for _, v144 in p12.particleStorage[ParticleType.CatalogToAvatarEditor] do
				v144.Enabled = false
			end
		end)

		return
	end

	if PagePlayParticleType[p13] == ParticleType.AvatarEditorToCatalog then
		task.spawn(function() -- line: 493
			-- upvalues: p12 (copy), ParticleType (copy)
			for _, v146 in p12.particleStorage[ParticleType.AvatarEditorToCatalog] do
				v146.Parent = p12.newBackgroundScene.AvatarEditorToCatalogPFX
				v146.Enabled = true
			end

			wait(1)

			for _, v148 in p12.particleStorage[ParticleType.AvatarEditorToCatalog] do
				v148.Enabled = false
			end
		end)
	end
end
function t1.getCurrentPage(p14) -- line: 507
	return p14.avatarRoute.current.name
end
function t1.animateBackground(p15, p16) -- line: 511
	task.spawn(function() -- line: 512
		-- upvalues: p15 (copy), p16 (copy)
		p15.wallDisappearTween:Play()
		p15.floorDisappearTween:Play()
		p15:playParticleEmitters(p16)
		wait(0.2)
		p15.largerShapesAppearTween:Play()
		wait(0.2)
		p15.cloudsAppearTween:Play()
	end)
end
function t1.transitionWithTweens(p17, p18) -- line: 523
	-- upvalues: AvatarScreen (copy), FFlagUseUpdatedBackgroundSceneSettingsOnMobile (copy)
	if p18 == AvatarScreen.AvatarEditor or p18 == AvatarScreen.MySharedAvatars then
		p17:animateBackground(AvatarScreen.AvatarEditor)

		if p18 == AvatarScreen.MySharedAvatars then
			p17:animateBackground(AvatarScreen.MySharedAvatars)
		end
	elseif p18 == AvatarScreen.ProfilePictureEditorEmotes then
		p17:animateBackground(AvatarScreen.ProfilePictureEditorEmotes)
	elseif FFlagUseUpdatedBackgroundSceneSettingsOnMobile and p18 == AvatarScreen.Catalog then
		p17:animateBackground(AvatarScreen.Catalog)
	elseif p18 == AvatarScreen.Catalog or p18 == AvatarScreen.AvatarExperienceLandingPage then
		task.spawn(function() -- line: 534
			-- upvalues: p18 (copy), AvatarScreen (copy), p17 (copy)
			if p18 ~= AvatarScreen.AvatarExperienceLandingPage then
				p17:playParticleEmitters(AvatarScreen.Catalog)
			end

			p17.largerShapesDisappearTween:Play()
			wait(0.2)
			p17.cloudsDisappearTween:Play()
			wait(0.1)
			p17.wallAppearTween:Play()
			p17.floorAppearTween:Play()
		end)
	end

	local v78 = p17:getModelInformationForAppPage(p18)

	if v78 then
		p17.newBackgroundScene.Baseplate.Transparency = v78.BaseplateTransparency

		return
	end

	p17.newBackgroundScene.Baseplate.Transparency = 0
end
function t1.getModelInformationForAppPage(_, p20) -- line: 556
	-- upvalues: PageBackgroundType (copy), BackgroundType (copy), t5 (copy)
	if PageBackgroundType[p20] == BackgroundType.LargerShapes then
		return t5.LargerShapes
	end

	if PageBackgroundType[p20] == BackgroundType.NoShapesNoWalls then
		return t5.NoShapesNoWalls
	end

	if PageBackgroundType[p20] == BackgroundType.Walls then
		return t5.Walls
	end

	return nil
end
function t1.transitionInstant(p21, p22) -- line: 567
	-- upvalues: PagePlayParticleType (copy), ParticleType (copy)
	for _, v84 in p21.allTweens do
		v84:Cancel()
	end

	if PagePlayParticleType[p22] == ParticleType.None then
		for _, v86 in p21.particleStorage do
			for _, v88 in v86 do
				v88.Enabled = false
				v88.Parent = nil
			end
		end
	end

	local v89 = p21:getModelInformationForAppPage(p22)

	if v89 then
		p21.newBackgroundScene.BackPanel.TextureFloor.Transparency = v89.TextureWallTransparency
		p21.newBackgroundScene.BackPanel.TextureWall.Transparency = v89.TextureWallTransparency
		p21.newBackgroundScene.LargerShapes.Position = v89.LargerShapesPosition
		p21.newBackgroundScene.Clouds.Position = v89.CloudsPosition
		p21.newBackgroundScene.Baseplate.Transparency = v89.BaseplateTransparency
	end
end
function t1.update(p23, _, _, p26, p27) -- line: 601
	-- upvalues: AvatarScreen (copy), FFlagUseUpdatedBackgroundSceneSettingsOnMobile (copy), Utils (copy), FFlagAXPhotoboothFunctionality (copy)
	local name = p26.current.name
	local name2 = p27.current.name
	local name3 = p27.opaque.name
	local t9 = {
		[AvatarScreen.Catalog] = not FFlagUseUpdatedBackgroundSceneSettingsOnMobile,
		[AvatarScreen.AvatarEditor] = not FFlagUseUpdatedBackgroundSceneSettingsOnMobile,
		[AvatarScreen.MySharedAvatars] = not FFlagUseUpdatedBackgroundSceneSettingsOnMobile,
		[AvatarScreen.ProfilePictureEditorEmotes] = true
	}
	local v99 = false

	if t9[name] then
		if name ~= name2 and t9[name2] then
			v99 = true
		elseif name ~= name3 and t9[name3] then
			v99 = true
		end
	end

	p23.ParticleEffectManager:setAvatarRoute(p26)

	local v100 = name == AvatarScreen.AvatarExperienceLandingPage or name2 == AvatarScreen.AvatarExperienceLandingPage
	local v101 = name == AvatarScreen.AvatarEditor or name2 == AvatarScreen.AvatarEditor
	local v102 = name == AvatarScreen.Catalog or name2 == AvatarScreen.Catalog
	local v103 = Utils.isAvatarBackground(name)
	local v104 = name == AvatarScreen.ProfilePictureEditorEmotes or name2 == AvatarScreen.ProfilePictureEditorEmotes
	local v105 = v100 and (v102 or (v101 or v104))

	if name ~= name2 then
		if v99 or v105 then
			p23:transitionWithTweens(name)
		else
			p23:transitionInstant(name)

			if v103 then
				p23:playParticleEmitters(name)
			end
		end
	end

	if name ~= name2 then
		if FFlagAXPhotoboothFunctionality and p23.currentSceneLighting then
			return
		end

		p23:updateLighting(name)
	end
end
function t1.start(p28) -- line: 660
	-- upvalues: SharedFlags (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy), v23 (copy), NotificationService (copy), FFlagAXPhotoboothFunctionality (copy), getSceneOverridesStore (copy), Signals (copy), PhotoboothStoreBridge (copy), FFlagUseUpdatedBackgroundSceneSettingsOnMobile (copy), GetFIntAvatarEditorParticleEmitterRateOverride (copy), ReplicatedStorage (copy), AvatarScreen (copy), Utils (copy)
	p28.colorCorrection.TintColor = Color3.fromRGB(255, 255, 255)

	if SharedFlags.FFlagEnableCoreContentTheme and not p28.newBackgroundScene:FindFirstChild("SkyboxBlocker") then
		local clone = p28.newBackgroundScene.BackPanel:Clone()

		clone.Name = "SkyboxBlocker"
		clone.Material = Enum.Material.SmoothPlastic
		clone.Size = Vector3.new(v18, v19, v20)
		clone.Position = Vector3.new(v21, v22, v23)

		for _, v109 in clone:GetChildren() do
			v109:Destroy()
		end

		clone.Parent = p28.newBackgroundScene
	end

	p28:updateTheme(p28.theme)

	local name = p28.avatarRoute.current.name
	local v111 = string.lower(NotificationService.SelectedTheme)

	if v111 ~= p28.theme then
		p28:updateTheme(v111)
	end

	table.insert(p28.connections, p28.store.changed:connect(function(p29, p30) -- line: 687
		-- upvalues: p28 (copy)
		local avatarRoute = p28.avatarRoute

		p28:update(p29, p30, avatarRoute, avatarRoute)
	end))
	table.insert(p28.connections, NotificationService:GetPropertyChangedSignal("SelectedTheme"):Connect(function() -- line: 695
		-- upvalues: FFlagAXPhotoboothFunctionality (copy), p28 (copy), NotificationService (copy)
		if FFlagAXPhotoboothFunctionality and (p28.currentScene and p28.currentSceneLighting) then
			return
		end

		p28:updateTheme(string.lower(NotificationService.SelectedTheme))
	end))

	if SharedFlags.FFlagEnableCoreContentTheme then
		table.insert(p28.connections, {
			disconnect = getSceneOverridesStore().subscribe(function(_) -- line: 709
				-- upvalues: p28 (copy)
				p28:updateTheme(p28.theme)
			end)
		})
	end

	if FFlagAXPhotoboothFunctionality then
		table.insert(p28.connections, Signals.createEffect(function(p32) -- line: 719
			-- upvalues: PhotoboothStoreBridge (copy), p28 (copy)
			local v154 = PhotoboothStoreBridge.getStore()

			if not v154 then
				return
			end

			local v155 = v154.getSelectedSceneId(p32)

			p28.changeSceneTask = task.spawn(function() -- line: 727
				-- upvalues: p28 (copy), v155 (copy)
				p28:pickScene(v155)
			end)
		end))
	end

	local n1 = 20

	p28.newBackgroundScene.BlobShadow.Decal.Transparency = 0.4

	if FFlagUseUpdatedBackgroundSceneSettingsOnMobile then
		local BlobShadowSize = p28.newBackgroundScene.BlobShadow.Size
		local v114 = math.sqrt(BlobShadowSize.X * BlobShadowSize.Z * 0.7)

		p28.newBackgroundScene.BlobShadow.Size = Vector3.new(v114, BlobShadowSize.Y, v114)
		p28.newBackgroundScene.BlobShadow.Position = Vector3.new(0, -0.10000000149011612, 0)
	end

	local num = tonumber(GetFIntAvatarEditorParticleEmitterRateOverride())

	if num > 0 then
		n1 = num
	end

	for _, v117 in p28.particleStorage do
		for _, v119 in v117 do
			v119.Rate = n1
		end
	end

	p28:startLighting()

	if FFlagAXPhotoboothFunctionality then
		if not ReplicatedStorage:FindFirstChild("PhotoboothScenes") then
			p28.scenesFolder = Instance.new("Folder")
			p28.scenesFolder.Parent = ReplicatedStorage
			p28.scenesFolder.Name = "PhotoboothScenes"
		end

		p28:pickScene()
	else
		p28.newBackgroundScene.Parent = game.Workspace
	end

	if name == AvatarScreen.AvatarEditor or name == AvatarScreen.AvatarExperienceLandingPage or name == AvatarScreen.Catalog or Utils.isAvatarBackground(name) or name == AvatarScreen.ProfilePictureEditorEmotes then
		p28:transitionInstant(name)
	end

	p28.ParticleEffectManager:start()

	if Utils.isAvatarBackground(name) then
		p28:playParticleEmitters(name)
	end
end

if FFlagAXPhotoboothFunctionality then
	function t1.updateSceneLighting(p33, p34) -- line: 787
		-- upvalues: Lighting (copy)
		if not p34 then
			p33.currentSceneLighting = nil
			p33:startLighting()
			p33:updateTheme(p33.theme)

			return
		end

		p33.currentSceneLighting = p34

		for _, v123 in {
			"Brightness",
			"Ambient",
			"ColorShift_Top",
			"ColorShift_Bottom",
			"OutdoorAmbient",
			"ShadowSoftness",
			"ClockTime",
			"FogStart",
			"FogEnd",
			"FogColor"
		} do
			if p34[v123] ~= nil then
				Lighting[v123] = p34[v123]
			end
		end
	end
	function t1.pickScene(t10: {[any]: any}, s1: string) -- line: 821
		-- upvalues: PhotoboothStoreBridge (copy), PhotoboothSceneData (copy), ReplicatedStorage (copy), InsertService (copy)
		if t10.changeSceneTask then
			task.cancel(t10.changeSceneTask)
		end

		if not s1 then
			local v126 = PhotoboothStoreBridge.getStore()

			s1 = not v126 and "" or v126.getSelectedSceneId(false)
		end

		local v127 = PhotoboothSceneData.PHOTOBOOTH_SCENES[s1]

		if not v127 then
			warn("BackgroundSceneManager: Unknown scene ID:", s1)

			return
		end

		if t10.currentScene then
			t10.currentScene.Parent = t10.scenesFolder
			t10.currentScene = nil
		end

		if s1 == "" then
			t10.newBackgroundScene.Parent = game.Workspace
			t10.currentScene = nil
			t10:updateSceneLighting(nil)
			t10:updateTheme(t10.theme)
		else
			t10.newBackgroundScene.Parent = ReplicatedStorage

			if v127.asset then
				local id

				if t10.scenesFolder:FindFirstChild(v127.id) then
					id = t10.scenesFolder:FindFirstChild(v127.id)
				else
					id = InsertService:LoadLocalAsset(v127.asset)
					id.Name = v127.id
					id.Parent = t10.scenesFolder

					if v127.position then
						id:SetPrimaryPartCFrame(CFrame.new(v127.position))
					end

					if v127.rotation then
						id:SetPrimaryPartCFrame(id:GetPrimaryPartCFrame() * v127.rotation)
					end
				end

				t10.currentScene = id
				t10.currentScene.Parent = game.Workspace

				if v127.lighting then
					t10:updateSceneLighting(v127.lighting)
				else
					t10:updateSceneLighting(nil)
					t10:updateTheme(t10.theme)
				end
			end
		end

		t10.changeSceneTask = nil
	end
end

function t1.stop(p35) -- line: 897
	-- upvalues: FFlagAXPhotoboothFunctionality (copy), ReplicatedStorage (copy), ParticleType (copy)
	for _, v131 in p35.connections do
		if FFlagAXPhotoboothFunctionality and typeof(v131) == "function" then
			v131()
		else
			v131:disconnect()
		end
	end

	if FFlagAXPhotoboothFunctionality and p35.currentScene then
		p35.currentScene.Parent = p35.scenesFolder
	end

	p35.connections = {}
	p35.newBackgroundScene.Parent = ReplicatedStorage
	p35.ParticleEffectManager:stop()

	for v132, v133 in p35.particleStorage do
		for _, v135 in v133 do
			v135.Parent = if v132 ~= ParticleType.AvatarEditorToCatalog then p35.newBackgroundScene.CatalogToAvatarEditorPFX else p35.newBackgroundScene.AvatarEditorToCatalogPFX
		end
	end
end
function t1.onDestroy(p36) -- line: 924
	p36.ParticleEffectManager:onDestroy()
end
function t1.updateAvatarRoute(p37, p38, p39) -- line: 928
	p37.avatarRoute = p38

	local v140 = p37.store:getState()

	p37:update(v140, v140, p38, p39)
end

return t1
