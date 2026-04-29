local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local enumerate = require(Parent.enumerate)
local AvatarExperienceFlags = require(Parent.AvatarExperienceFlags)
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlags.FFlagAXCustomizeMakeupSupport
local FFlagAXCatalogMakeupSupport = AvatarExperienceFlags.FFlagAXCatalogMakeupSupport
local FFlagAXCatalogM41Props = AvatarExperienceFlags.FFlagAXCatalogM41Props
local FFlagAXAddHDCatalogTab = AvatarExperienceFlags.FFlagAXAddHDCatalogTab

return enumerate(script.Name, {
	Featured = "Featured",
	Recommended = "Recommended",
	Characters = "Characters",
	Avatars = "Avatars",
	Clothing = "Clothing",
	Accessories = "Accessories",
	Head = "Head",
	Body = "Body",
	Makeup = if not FFlagAXCustomizeMakeupSupport and not FFlagAXCatalogMakeupSupport then nil else "Makeup",
	AllAnimations = "AllAnimations",
	Emotes = "Emotes",
	Props = if not FFlagAXCatalogM41Props then nil else "Props",
	HighDefinition = if not FFlagAXAddHDCatalogTab then nil else "HighDefinition"
})
