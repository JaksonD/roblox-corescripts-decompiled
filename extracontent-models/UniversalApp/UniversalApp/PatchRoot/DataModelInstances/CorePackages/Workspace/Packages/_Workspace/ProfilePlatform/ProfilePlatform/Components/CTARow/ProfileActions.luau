local AcceptFriendRequestActions = require(script.AcceptFriendRequestActions)
local AddFriendActions = require(script.AddFriendActions)
local BlockActions = require(script.BlockActions)
local ChatAction = require(script.ChatAction)
local CommunityActions = require(script.CommunityActions)
local CurrencyTransferAction = require(script.CurrencyTransferAction)
local EditAliasAction = require(script.EditAliasAction)
local EditAppearanceActions = require(script.EditAppearanceActions)
local EditProfileAction = require(script.EditProfileAction)
local FollowActions = require(script.FollowActions)
local IgnoreFriendRequestAction = require(script.IgnoreFriendRequestAction)
local JoinExperienceAction = require(script.JoinExperienceAction)
local PendingFriendRequestAction = require(script.PendingFriendRequestAction)
local QrCodeAction = require(script.QrCodeAction)
local ReportAction = require(script.ReportAction)
local ShareProfileAction = require(script.ShareProfileAction)
local TrustedConnectionActions = require(script.TrustedConnectionActions)
local UnfriendAction = require(script.UnfriendAction)
local UnlockChatAction = require(script.UnlockChatAction)
local ViewAboutAction = require(script.ViewAboutAction)
local ViewPlatformProfileAction = require(script.ViewPlatformProfileAction)
local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")

require(ProfilePlatform.Common.Enums)
require(ProfilePlatform.Components.CTARow.Types)

local SupportedProfileTypes = require(script.SupportedProfileTypes)
local t1 = {}

for _, v26 in {
	AcceptFriendRequestActions,
	AddFriendActions,
	BlockActions,
	ChatAction,
	CommunityActions,
	CurrencyTransferAction,
	EditAliasAction,
	EditAppearanceActions,
	EditProfileAction,
	FollowActions,
	IgnoreFriendRequestAction,
	JoinExperienceAction,
	PendingFriendRequestAction,
	QrCodeAction,
	ReportAction,
	ShareProfileAction,
	TrustedConnectionActions,
	UnfriendAction,
	UnlockChatAction,
	ViewAboutAction,
	ViewPlatformProfileAction
} do
	for v27, v28 in v26 do
		assert(t1[v27] == nil, "Duplicate ProfileAction key: " .. tostring(v27))
		t1[v27] = function(p1) -- line: 55
			-- upvalues: v28 (copy), v27 (copy), SupportedProfileTypes (copy)
			local v36 = v28(p1)

			if v36 ~= nil then
				assert(type(v36.onActivated) == "table", v27 .. " has onActivated as " .. type(v36.onActivated) .. ", expected table")

				for v37 in v36.onActivated do
					local v38 = SupportedProfileTypes[v37]

					assert(v38 and table.find(v38, v27), v27 .. " has onActivated for " .. tostring(v37) .. " but is missing from SupportedProfileTypes")
				end
			end

			return v36
		end
	end
end

for v29, v30 in SupportedProfileTypes do
	for _, v32 in v30 do
		assert(t1[v32] ~= nil, v32 .. " is listed in SupportedProfileTypes for " .. tostring(v29) .. " but has no matching factory")
	end
end

return t1
