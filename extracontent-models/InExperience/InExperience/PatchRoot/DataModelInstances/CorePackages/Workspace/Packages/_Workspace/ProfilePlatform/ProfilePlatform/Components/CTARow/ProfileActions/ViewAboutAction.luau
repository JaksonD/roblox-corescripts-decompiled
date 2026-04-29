local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local SharedFlags = require(ProfilePlatformParent.SharedFlags)
local AppPage = require(ProfilePlatformParent.RobloxAppEnums).AppPage
local NavigateDown = require(ProfilePlatformParent.NavigationRodux).Thunks.NavigateDown
local Enums = require(ProfilePlatform.Common.Enums)

require(ProfilePlatform.Components.CTARow.Types)

local EventNames = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = Enums.ProfileTypes
local FFlagProfilePlatformNewProfileHeader = SharedFlags.FFlagProfilePlatformNewProfileHeader

return {
	[Enums.ProfileActions.ViewAbout] = if not FFlagProfilePlatformNewProfileHeader then nil else function(p1) -- line: 20
		-- upvalues: Enums (copy), ProfileTypes (copy), EventNames (copy), NavigateDown (copy), AppPage (copy)
		return {
			text = p1.localized[Enums.ProfileActions.ViewAbout],
			onActivated = {
				[ProfileTypes.User] = function() -- line: 24
					-- upvalues: p1 (copy), EventNames (copy), NavigateDown (copy), AppPage (copy)
					p1.analytics.fireAnalyticsEvent(EventNames.CTAButtonViewFullProfile, {
						buttonSurface = p1.buttonSurface
					})
					p1.dispatch(NavigateDown({
						name = AppPage.AboutDetailsSheet,
						extraProps = {
							sections = p1.aboutSections
						}
					}))
				end
			}
		}
	end
}
