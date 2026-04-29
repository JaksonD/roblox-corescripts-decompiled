local CorePackages = game:GetService("CorePackages")
local Theme = require(CorePackages.Packages.Foundation).Enums.Theme

local function buildOverrides(p1, p2, p3, p4) -- line: 9
	-- upvalues: Theme (copy)
	local v10 = p1 == Theme.Dark
	local t1 = {}

	for v12, v13 in p2 do
		t1["Color." .. v12] = v13
		t1[if not v10 then "LightMode." .. v12 else "DarkMode." .. v12] = v13
	end

	for v14, v15 in p3 do
		t1["Inverse." .. v14] = v15
		t1[if not v10 then "DarkMode." .. v14 else "LightMode." .. v14] = v15
	end

	for v16, v17 in p4 do
		t1[v16] = v17
	end

	return t1
end

local t2 = {
	Kids = {
		[Theme.Dark] = {
			["Surface.Surface_0"] = "Color.Extended.Blue.Blue_1300",
			["Surface.Surface_100"] = "Color.Extended.Blue.Blue_1200",
			["Surface.Surface_200"] = "Color.Extended.Blue.Blue_1100",
			["Surface.Surface_300"] = "Color.Extended.Blue.Blue_1000",
			["OverMedia.OverMedia_0.Color3"] = "Color.Extended.Blue.Blue_1300.Color3",
			["OverMedia.OverMedia_100.Color3"] = "Color.Extended.Blue.Blue_1200.Color3",
			["OverMedia.OverMedia_200.Color3"] = "Color.Extended.Blue.Blue_1100.Color3",
			["OverMedia.OverMedia_300.Color3"] = "Color.Extended.Blue.Blue_1000.Color3",
			["Content.Emphasis"] = "Color.Extended.Gray.Gray_100",
			["Content.Default"] = "Color.Extended.Gray.Gray_400",
			["Content.Muted"] = "Color.Extended.Gray.Gray_500",
			["Content.Link"] = "Color.Extended.Blue.Blue_200",
			["System.Contrast"] = "Color.Extended.Gray.Gray_100",
			["System.Neutral"] = "Color.Extended.Gray.Gray_500",
			["System.Success"] = "Color.Extended.Green.Green_500",
			["System.Warning"] = "Color.Extended.Yellow.Yellow_400",
			["System.Alert"] = "Color.Extended.Red.Red_700",
			["ActionEmphasis.Background"] = "Color.Extended.Blue.Blue_200",
			["ActionEmphasis.Foreground"] = "Color.Extended.Blue.Blue_1300",
			["Common.NavigationBar"] = "Color.Extended.Blue.Blue_1300"
		},
		[Theme.Light] = {
			["Surface.Surface_0"] = "Color.Extended.Blue.Blue_100",
			["Surface.Surface_100"] = "Color.Extended.Blue.Blue_200",
			["Surface.Surface_200"] = "Color.Extended.Blue.Blue_100",
			["Surface.Surface_300"] = "Color.Extended.Blue.Blue_200",
			["Stroke.Emphasis.Color3"] = "Color.Extended.Blue.Blue_1100.Color3",
			["Stroke.Default.Color3"] = "Color.Extended.Blue.Blue_1100.Color3",
			["Stroke.Muted.Color3"] = "Color.Extended.Blue.Blue_1100.Color3",
			["Shift.Shift_100.Color3"] = "Color.Extended.Blue.Blue_1100.Color3",
			["Shift.Shift_200.Color3"] = "Color.Extended.Blue.Blue_1100.Color3",
			["Shift.Shift_300.Color3"] = "Color.Extended.Blue.Blue_1100.Color3",
			["Shift.Shift_400.Color3"] = "Color.Extended.Blue.Blue_1100.Color3",
			["OverMedia.OverMedia_0.Color3"] = "Color.Extended.Blue.Blue_300.Color3",
			["OverMedia.OverMedia_100.Color3"] = "Color.Extended.Blue.Blue_400.Color3",
			["OverMedia.OverMedia_200.Color3"] = "Color.Extended.Blue.Blue_300.Color3",
			["OverMedia.OverMedia_300.Color3"] = "Color.Extended.Blue.Blue_400.Color3",
			["Content.Emphasis"] = "Color.Extended.Black.Black_95",
			["Content.Default"] = "Color.Extended.Gray.Gray_800",
			["Content.Muted"] = "Color.Extended.Gray.Gray_700",
			["Content.Link"] = "Color.Extended.Blue.Blue_800",
			["System.Contrast"] = "Color.Extended.Black.Black_95",
			["System.Neutral"] = "Color.Extended.Gray.Gray_700",
			["System.Emphasis"] = "Color.Extended.Blue.Blue_700",
			["System.Success"] = "Color.Extended.Green.Green_800",
			["System.Warning"] = "Color.Extended.Yellow.Yellow_600",
			["System.Alert"] = "Color.Extended.Red.Red_800",
			["Common.NavigationBar"] = "Color.Extended.Blue.Blue_100",
			["Common.Shimmer.Color3"] = "Color.Extended.Blue.Blue_1100.Color3"
		}
	},
	StartMode = {
		[Theme.Dark] = {
			["Surface.Surface_0"] = "Color.Extended.Gray.Gray_1000",
			["Surface.Surface_100"] = "Color.Extended.Gray.Gray_900",
			["Surface.Surface_200"] = "Color.Extended.Gray.Gray_800",
			["Surface.Surface_300"] = "Color.Extended.Gray.Gray_700",
			["Content.Emphasis"] = "Color.Extended.Gray.Gray_100",
			["Content.Default"] = "Color.Extended.Gray.Gray_400",
			["Content.Muted"] = "Color.Extended.Gray.Gray_500",
			["Content.Link"] = "Color.Extended.Blue.Blue_500",
			["System.Contrast"] = "Color.Extended.Gray.Gray_100",
			["System.Neutral"] = "Color.Extended.Gray.Gray_500",
			["System.Emphasis"] = "Color.Extended.Blue.Blue_700",
			["System.Success"] = "Color.Extended.Green.Green_500",
			["System.Warning"] = "Color.Extended.Yellow.Yellow_400",
			["System.Alert"] = "Color.Extended.Red.Red_800",
			["Common.NavigationBar"] = "Color.Extended.Gray.Gray_1000"
		},
		[Theme.Light] = {
			["Surface.Surface_0"] = "Color.Extended.Gray.Gray_100",
			["Surface.Surface_100"] = "Color.Extended.White.White_100",
			["Surface.Surface_200"] = "Color.Extended.Gray.Gray_100",
			["Surface.Surface_300"] = "Color.Extended.White.White_100",
			["Content.Emphasis"] = "Color.Extended.Gray.Gray_1000",
			["Content.Default"] = "Color.Extended.Gray.Gray_700",
			["Content.Muted"] = "Color.Extended.Gray.Gray_600",
			["Content.Link"] = "Color.Extended.Blue.Blue_800",
			["System.Contrast"] = "Color.Extended.Gray.Gray_1000",
			["System.Neutral"] = "Color.Extended.Gray.Gray_700",
			["System.Emphasis"] = "Color.Extended.Blue.Blue_700",
			["System.Success"] = "Color.Extended.Green.Green_500",
			["System.Warning"] = "Color.Extended.Yellow.Yellow_600",
			["System.Alert"] = "Color.Extended.Red.Red_800",
			["Common.NavigationBar"] = "Color.Extended.Gray.Gray_100"
		}
	}
}
local t3 = {
	Kids = {
		[Theme.Dark] = {
			["Semantic.Color.Background.Default"] = "Color.Extended.Blue.Blue_1300",
			["Semantic.Color.Background.Contrast"] = "Color.Extended.Blue.Blue_1200",
			["Semantic.Color.Background.Muted"] = "Color.Extended.Blue.Blue_1100",
			["Semantic.Color.BackgroundUi.Default"] = "Color.Extended.Blue.Blue_1000",
			["Semantic.Color.Text.Emphasis"] = "Color.Extended.Gray.Gray_100",
			["Semantic.Color.Text.Default"] = "Color.Extended.Gray.Gray_400",
			["Semantic.Color.Text.Muted"] = "Color.Extended.Gray.Gray_500",
			["Semantic.Color.Text.Link"] = "Color.Extended.Blue.Blue_200",
			["Semantic.Color.Icon.Emphasis"] = "Color.Extended.Gray.Gray_100",
			["Semantic.Color.Icon.Default"] = "Color.Extended.Gray.Gray_500"
		},
		[Theme.Light] = {
			["Semantic.Color.Background.Default"] = "Color.Extended.Blue.Blue_100",
			["Semantic.Color.Background.Contrast"] = "Color.Extended.Blue.Blue_200",
			["Semantic.Color.Background.Muted"] = "Color.Extended.Blue.Blue_100",
			["Semantic.Color.BackgroundUi.Default"] = "Color.Extended.Blue.Blue_200",
			["Semantic.Color.Text.Emphasis"] = "Color.Extended.Black.Black_95",
			["Semantic.Color.Text.Default"] = "Color.Extended.Gray.Gray_800",
			["Semantic.Color.Text.Muted"] = "Color.Extended.Gray.Gray_700",
			["Semantic.Color.Text.Link"] = "Color.Extended.Blue.Blue_800",
			["Semantic.Color.Icon.Emphasis"] = "Color.Extended.Black.Black_95",
			["Semantic.Color.Icon.Default"] = "Color.Extended.Gray.Gray_800"
		}
	},
	StartMode = {
		[Theme.Dark] = {
			["Semantic.Color.Background.Default"] = "Color.Extended.Gray.Gray_1000",
			["Semantic.Color.Background.Contrast"] = "Color.Extended.Gray.Gray_900",
			["Semantic.Color.Background.Muted"] = "Color.Extended.Gray.Gray_800",
			["Semantic.Color.BackgroundUi.Default"] = "Color.Extended.Gray.Gray_700",
			["Semantic.Color.Text.Emphasis"] = "Color.Extended.Gray.Gray_100",
			["Semantic.Color.Text.Default"] = "Color.Extended.Gray.Gray_400",
			["Semantic.Color.Text.Muted"] = "Color.Extended.Gray.Gray_500",
			["Semantic.Color.Text.Link"] = "Color.Extended.Blue.Blue_500",
			["Semantic.Color.Icon.Emphasis"] = "Color.Extended.Gray.Gray_100",
			["Semantic.Color.Icon.Default"] = "Color.Extended.Gray.Gray_500"
		},
		[Theme.Light] = {
			["Semantic.Color.Background.Default"] = "Color.Extended.Gray.Gray_100",
			["Semantic.Color.Background.Contrast"] = "Color.Extended.White.White_100",
			["Semantic.Color.Background.Muted"] = "Color.Extended.Gray.Gray_100",
			["Semantic.Color.BackgroundUi.Default"] = "Color.Extended.White.White_100",
			["Semantic.Color.Text.Emphasis"] = "Color.Extended.Gray.Gray_1000",
			["Semantic.Color.Text.Default"] = "Color.Extended.Gray.Gray_700",
			["Semantic.Color.Text.Muted"] = "Color.Extended.Gray.Gray_600",
			["Semantic.Color.Text.Link"] = "Color.Extended.Blue.Blue_800",
			["Semantic.Color.Icon.Emphasis"] = "Color.Extended.Gray.Gray_1000",
			["Semantic.Color.Icon.Default"] = "Color.Extended.Gray.Gray_700"
		}
	}
}

return {
	Kids = {
		[Theme.Dark] = buildOverrides(Theme.Dark, t2.Kids[Theme.Dark], t2.Kids[Theme.Light], t3.Kids[Theme.Dark]),
		[Theme.Light] = buildOverrides(Theme.Light, t2.Kids[Theme.Light], t2.Kids[Theme.Dark], t3.Kids[Theme.Light])
	},
	StartMode = {
		[Theme.Dark] = buildOverrides(Theme.Dark, t2.StartMode[Theme.Dark], t2.StartMode[Theme.Light], t3.StartMode[Theme.Dark]),
		[Theme.Light] = buildOverrides(Theme.Light, t2.StartMode[Theme.Light], t2.StartMode[Theme.Dark], t3.StartMode[Theme.Light])
	}
}
