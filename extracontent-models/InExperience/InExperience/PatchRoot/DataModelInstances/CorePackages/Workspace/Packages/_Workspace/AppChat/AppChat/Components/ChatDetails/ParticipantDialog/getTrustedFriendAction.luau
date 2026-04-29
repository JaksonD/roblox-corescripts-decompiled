local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local Promise = require(AppChatParent.Promise)
local SharedFlags = require(AppChatParent.SharedFlags)
local Sources = require(AppChatParent.SocialLuaAnalytics).Analytics.Enums.Sources
local getProfileTrustedFriendActions = require(AppChat.Http.getProfileTrustedFriendActions)
local FFlagProfilePlatformAddTC = SharedFlags.FFlagProfilePlatformAddTC
local FFlagTCShareLinkSenderUI = SharedFlags.FFlagTCShareLinkSenderUI
local v9 = game:DefineFastFlag("PendingIncomingTrustedConnection", false)

local function normalizeTrustedFriendAction(t1: {[any]: any}) -- line: 37
	-- upvalues: FFlagProfilePlatformAddTC (copy), FFlagTCShareLinkSenderUI (copy), Sources (copy), v9 (copy)
	for _, v17 in t1 do
		if v17 == "RemoveTrustedConnection" then
			return {
				rawActionType = v17,
				actionType = "RemoveTrustedConnection",
				isDisabled = false,
				modalVariantOverride = nil
			}
		end

		if v17 ~= "AddTrustedConnection" then
			if v17 == "AddTrustedConnectionViaLink" then
				if not FFlagTCShareLinkSenderUI then
					continue
				end

				local ShareLinkSender = Sources.ShareLinkSender

				return {
					rawActionType = v17,
					actionType = "AddTrustedConnection",
					isDisabled = false,
					modalVariantOverride = ShareLinkSender
				}
			end

			if v17 == "PendingTrustedConnection" then
				if not FFlagProfilePlatformAddTC then
					continue
				end

				return {
					rawActionType = v17,
					actionType = "AddTrustedConnection",
					isDisabled = true,
					modalVariantOverride = nil
				}
			end

			if v17 == "AddIncomingTrustedConnection" then
				if not FFlagProfilePlatformAddTC then
					continue
				end

				return {
					rawActionType = v17,
					actionType = "AddIncomingTrustedConnection",
					isDisabled = false,
					modalVariantOverride = nil
				}
			end

			if v17 ~= "PendingIncomingTrustedConnection" or not v9 then
				continue
			end

			return {
				rawActionType = v17,
				actionType = "AddIncomingTrustedConnection",
				isDisabled = true,
				modalVariantOverride = nil
			}
		end

		if FFlagProfilePlatformAddTC then
			return {
				rawActionType = v17,
				actionType = "AddTrustedConnection",
				isDisabled = false,
				modalVariantOverride = nil
			}
		end
	end

	return nil
end

return function(s1: string) --[[ getTrustedFriendAction ]] -- line: 67
	-- upvalues: Promise (copy), getProfileTrustedFriendActions (copy), normalizeTrustedFriendAction (copy)
	if s1 == "" then
		return Promise.resolve(nil)
	end

	return getProfileTrustedFriendActions(s1):andThen(function(p1) -- line: 73
		-- upvalues: normalizeTrustedFriendAction (copy)
		return (normalizeTrustedFriendAction(p1))
	end):catch(function() -- line: 76
		return nil
	end)
end
