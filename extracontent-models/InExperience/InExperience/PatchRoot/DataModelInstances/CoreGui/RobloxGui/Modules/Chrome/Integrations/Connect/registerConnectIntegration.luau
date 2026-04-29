local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local React = require(CorePackages.Packages.React)
local Service = require(Chrome.Service)
local ConnectIcon = require(script.Parent.ConnectIcon)
local AppChat = require(CorePackages.Workspace.Packages.AppChat)
local Responsive = require(CorePackages.Workspace.Packages.Responsive)
local InExperienceAppChatModal = AppChat.App.InExperienceAppChatModal
local ChromeIntegrationUtils = require(Chrome.Integrations.ChromeIntegrationUtils)
local LocalStore = require(Chrome.ChromeShared.Service.LocalStore)
local GetFStringConnectTooltipLocalStorageKey = require(Chrome.Flags.GetFStringConnectTooltipLocalStorageKey)
local MouseIconOverrideService = require(CorePackages.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local Symbol = require(CorePackages.Workspace.Packages.AppCommonLib).Symbol
local FocusUtils = require(CorePackages.Workspace.Packages.Chrome).FocusUtils
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local v16 = game:DefineFastFlag("AppChatInExpUseUnibarNotification", false)
local v17 = game:DefineFastFlag("ConnectIntegrationCheckForDirectionalInput", false)
local FFlagEnableAppChatFocusableFixes = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAppChatFocusableFixes
local GetFFlagIsSquadEnabled = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled

return function(s1: string, n1: number) -- line: 32
	-- upvalues: GetFFlagIsSquadEnabled (copy), Service (copy), SideSheetPlacement (copy), FFlagEnableAppChatFocusableFixes (copy), InExperienceAppChatModal (copy), ChromeIntegrationUtils (copy), v17 (copy), Responsive (copy), FocusUtils (copy), LocalStore (copy), GetFStringConnectTooltipLocalStorageKey (copy), React (copy), ConnectIcon (copy), v16 (copy), Symbol (copy), MouseIconOverrideService (copy)
	local v22 = s1 == "connect_unibar" and GetFFlagIsSquadEnabled()
	local v23 = Service:register({
		id = s1,
		sideSheetPlacement = if s1 ~= "connect_unibar" then SideSheetPlacement.Vertical else SideSheetPlacement.Unibar,
		label = not GetFFlagIsSquadEnabled() and "Feature.Chat.Label.RobloxChat" or "Feature.Squads.Label.Party",
		activated = function() --[[ activated ]] -- line: 41
			-- upvalues: FFlagEnableAppChatFocusableFixes (copy), InExperienceAppChatModal (copy), ChromeIntegrationUtils (copy), v17 (copy), Responsive (copy), FocusUtils (copy), LocalStore (copy), GetFStringConnectTooltipLocalStorageKey (copy)
			if FFlagEnableAppChatFocusableFixes then
				if InExperienceAppChatModal:getVisible() then
					InExperienceAppChatModal.default:setVisible(false)
				else
					ChromeIntegrationUtils.dismissRobloxMenuAndRun(function() -- line: 46
						-- upvalues: v17 (copy), Responsive (copy), FocusUtils (copy), InExperienceAppChatModal (copy)
						if v17 then
							if Responsive.GetInputModeStore(false).getLastInputType(false) == Responsive.Input.Directional then
								FocusUtils.FocusOffChrome()
							end

							InExperienceAppChatModal.default:setVisible(true)

							return
						end

						FocusUtils.FocusOffChrome(function() -- line: 54
							-- upvalues: InExperienceAppChatModal (copy)
							InExperienceAppChatModal.default:setVisible(true)
						end)
					end)
				end
			else
				InExperienceAppChatModal:toggleVisibility()
			end

			LocalStore.storeForLocalPlayer(GetFStringConnectTooltipLocalStorageKey(), true)
		end,
		isActivated = function() --[[ isActivated ]] -- line: 65
			-- upvalues: InExperienceAppChatModal (copy)
			return InExperienceAppChatModal:getVisible()
		end,
		components = {
			Icon = function(p1) --[[ Icon ]] -- line: 69
				-- upvalues: React (copy), ConnectIcon (copy), s1 (copy), v16 (copy), v22 (copy)
				return React.createElement(ConnectIcon, {
					integrationId = s1,
					isIconVisible = p1.visible,
					shouldShowCustomBadge = not v16,
					isSquadIndicatorEnabled = v22
				})
			end
		},
		initialAvailability = n1
	})

	if v16 then
		if v22 then
			InExperienceAppChatModal.default.currentSquadIdSignal.Event:Connect(function(p2) -- line: 93
				-- upvalues: InExperienceAppChatModal (copy), v23 (copy)
				local unreadCount = InExperienceAppChatModal.default.unreadCount
				local v33 = p2 ~= ""

				if unreadCount == 0 or v33 then
					v23.notification:clear()

					return
				end

				v23.notification:fireCount(unreadCount)
			end)
			InExperienceAppChatModal.default.unreadCountSignal.Event:Connect(function(p3) -- line: 97
				-- upvalues: InExperienceAppChatModal (copy), v23 (copy)
				local v35 = InExperienceAppChatModal.default.currentSquadId ~= ""

				if p3 == 0 or v35 then
					v23.notification:clear()

					return
				end

				v23.notification:fireCount(p3)
			end)

			local unreadCount = InExperienceAppChatModal.default.unreadCount
			local v25 = InExperienceAppChatModal.default.currentSquadId ~= ""

			if unreadCount == 0 or v25 then
				v23.notification:clear()
			else
				v23.notification:fireCount(unreadCount)
			end
		else
			InExperienceAppChatModal.default.unreadCountSignal.Event:Connect(function(p4) -- line: 114
				-- upvalues: v23 (copy)
				if p4 == 0 then
					v23.notification:clear()

					return
				end

				v23.notification:fireCount(p4)
			end)

			local unreadCount = InExperienceAppChatModal.default.unreadCount

			if unreadCount == 0 then
				v23.notification:clear()
			else
				v23.notification:fireCount(unreadCount)
			end
		end
	end

	local v27 = Symbol.named("InExperienceRobloxConnect")

	InExperienceAppChatModal.default.visibilitySignal.Event:Connect(function(p5) -- line: 124
		-- upvalues: MouseIconOverrideService (copy), v27 (copy)
		if p5 then
			MouseIconOverrideService.push(v27, Enum.OverrideMouseIconBehavior.ForceShow)

			return
		end

		MouseIconOverrideService.pop(v27)
	end)

	return v23
end
