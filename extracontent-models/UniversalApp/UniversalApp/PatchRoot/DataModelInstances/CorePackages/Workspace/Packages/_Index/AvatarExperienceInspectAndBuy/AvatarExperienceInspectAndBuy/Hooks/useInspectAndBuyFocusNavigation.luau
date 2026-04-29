local GuiService = game:GetService("GuiService")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local AvatarExperienceInspectAndBuyParent = AvatarExperienceInspectAndBuy.Parent
local React = require(AvatarExperienceInspectAndBuyParent.React)
local useSelector = require(AvatarExperienceInspectAndBuyParent.RoactUtils).Hooks.RoactRodux.useSelector
local FocusNavigationUtils = require(AvatarExperienceInspectAndBuyParent.FocusNavigationUtils)

require(AvatarExperienceInspectAndBuy.Types)

local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtils.FocusNavigableSurfaceIdentifierEnum
local FocusNavigableSurfaceRegistry = FocusNavigationUtils.FocusNavigableSurfaceRegistry
local useRegisterFocusNavigableSurface = FocusNavigableSurfaceRegistry.useRegisterFocusNavigableSurface
local useDeRegisterFocusNavigableSurface = FocusNavigableSurfaceRegistry.useDeRegisterFocusNavigableSurface
local useAutoFocus = FocusNavigationUtils.useAutoFocus
local useDescendantHasFocus = FocusNavigationUtils.useDescendantHasFocus
local useLastInputMode = FocusNavigationUtils.useLastInputMode

local function selectItemBeingPurchased(p1) -- line: 52
	return p1.itemBeingPurchased
end

return function() --[[ useInspectAndBuyFocusNavigation ]] -- line: 56
	-- upvalues: React (copy), useSelector (copy), selectItemBeingPurchased (copy), useRegisterFocusNavigableSurface (copy), useDeRegisterFocusNavigableSurface (copy), useAutoFocus (copy), useDescendantHasFocus (copy), useLastInputMode (copy), MarketplaceService (copy), Players (copy), FocusNavigableSurfaceIdentifierEnum (copy), GuiService (copy)
	local v18, v19 = React.useState(nil)
	local v20, v21 = React.useState(false)
	local v22 = useSelector(selectItemBeingPurchased)
	local v23 = v22 and v22.itemId ~= nil
	local v24 = useRegisterFocusNavigableSurface()
	local v25 = useDeRegisterFocusNavigableSurface()
	local v26 = useAutoFocus({ v18 }, 0.1)
	local v27 = useDescendantHasFocus(v18)
	local v28 = useLastInputMode() == "Focus"
	local v29 = v23 or v20

	React.useEffect(function() -- line: 77
		-- upvalues: MarketplaceService (copy), Players (copy), v21 (copy)
		local connection = MarketplaceService.PromptBulkPurchaseRequested:Connect(function(p2) -- line: 78
			-- upvalues: Players (copy), v21 (copy)
			if p2 == Players.LocalPlayer then
				v21(true)
			end
		end)
		local connection2 = MarketplaceService.PromptBulkPurchaseFinished:Connect(function(p3) -- line: 83
			-- upvalues: Players (copy), v21 (copy)
			if p3 == Players.LocalPlayer then
				v21(false)
			end
		end)

		return function() -- line: 89
			-- upvalues: connection (copy), connection2 (copy)
			connection:Disconnect()
			connection2:Disconnect()
		end
	end, {})
	React.useEffect(function() -- line: 96
		-- upvalues: v29 (copy), v25 (copy), FocusNavigableSurfaceIdentifierEnum (copy), v18 (copy), GuiService (copy), v24 (copy)
		if v29 then
			v25(FocusNavigableSurfaceIdentifierEnum.CentralOverlay, v18)
			GuiService:RemoveSelectionGroup("InspectAndBuyApp")

			return function() -- line: 102
			end
		end

		if v18 then
			v24(FocusNavigableSurfaceIdentifierEnum.CentralOverlay, v18)
			GuiService:AddSelectionParent("InspectAndBuyApp", v18)
		else
			v25(FocusNavigableSurfaceIdentifierEnum.CentralOverlay, v18)
			GuiService:RemoveSelectionGroup("InspectAndBuyApp")
			GuiService.SelectedCoreObject = nil
		end

		return function() -- line: 114
			-- upvalues: v25 (copy), FocusNavigableSurfaceIdentifierEnum (copy), v18 (copy), GuiService (copy)
			v25(FocusNavigableSurfaceIdentifierEnum.CentralOverlay, v18)
			GuiService:RemoveSelectionGroup("InspectAndBuyApp")
			GuiService.SelectedCoreObject = nil
		end
	end, {
		v18,
		v29,
		v25,
		v24
	})

	local v30 = v28 and (v18 and (not v27 and not v29))

	React.useEffect(function() -- line: 124
		-- upvalues: v30 (copy), v26 (copy)
		local u33 = nil

		if v30 then
			u33 = v26()
		end

		return function() -- line: 129
			-- upvalues: u33 (ref)
			if u33 then
				u33.cancel()
			end
		end
	end, {
		v30,
		v26
	})

	return {
		setFocusRef = v19,
		focusNavigationProps = {
			SelectionGroup = true,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop
		}
	}
end
