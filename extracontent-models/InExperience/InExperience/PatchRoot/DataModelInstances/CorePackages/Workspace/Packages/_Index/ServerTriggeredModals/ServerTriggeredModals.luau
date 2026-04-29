local SharedFlags = require(script.Parent.SharedFlags)
local SduiV2 = require(script.SduiV2)
local FFlagLuaAppsServerTriggeredModals = SharedFlags.FFlagLuaAppsServerTriggeredModals
local FFlagEnableProfileCompletion = SharedFlags.FFlagEnableProfileCompletion
local FFlagEnableSduiV2HomepagePrompts = SharedFlags.FFlagEnableSduiV2HomepagePrompts

return {
	["jest.config"] = script["jest.config"],
	CheckForSduiModal = if not FFlagLuaAppsServerTriggeredModals then nil else require(script.CheckForSduiModal),
	SduiModal = if not FFlagLuaAppsServerTriggeredModals then nil else require(script.SduiModal),
	PromptsContainer = if not FFlagEnableSduiV2HomepagePrompts then nil else require(script.PromptsContainer),
	CheckForPrompts = if not FFlagEnableSduiV2HomepagePrompts then nil else require(script.CheckForPrompts),
	fetchPrompts = if not FFlagEnableProfileCompletion then nil else SduiV2.fetchPrompts,
	PromptsEntryPoint = if not FFlagEnableProfileCompletion then nil else SduiV2.PromptsEntryPoint,
	reportPromptImpression = if not FFlagEnableProfileCompletion then nil else require(script.reportPromptImpression)
}
