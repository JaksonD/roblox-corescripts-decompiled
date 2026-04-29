local GamepadService = game:GetService("GamepadService")
local GuiService = game:GetService("GuiService")
local CoreGuiCommon = script:FindFirstAncestor("CoreGuiCommon")
local CoreGuiCommonParent = CoreGuiCommon.Parent
local Chrome = require(CoreGuiCommonParent.Chrome)
local Foundation = require(CoreGuiCommonParent.Foundation)
local Localization = require(CoreGuiCommonParent.Localization)
local React = require(CoreGuiCommonParent.React)
local SignalsReact = require(CoreGuiCommonParent.SignalsReact)
local useLocalization = Localization.Hooks.useLocalization
local FocusOnChrome = Chrome.FocusUtils.FocusOnChrome
local GetUiSelectorSignalStore = require(CoreGuiCommon.Stores).GetUiSelectorSignalStore
local BaseMenu = Foundation.UNSTABLE.BaseMenu
local InputSize = Foundation.Enums.InputSize

return function(_: {[any]: any}) --[[ InExperienceUiSelector ]] -- line: 27
	-- upvalues: SignalsReact (copy), GetUiSelectorSignalStore (copy), React (copy), useLocalization (copy), GuiService (copy), FocusOnChrome (copy), GamepadService (copy), Foundation (copy), BaseMenu (copy), InputSize (copy)
	local v16 = SignalsReact.useSignalState(GetUiSelectorSignalStore)
	local v17 = SignalsReact.useSignalState(v16.getVisibility)
	local v18 = React.useRef(nil)
	local v19 = React.useRef(nil)
	local v20 = useLocalization({
		robloxMenu = "CoreScripts.InGameMenu.Controls.RobloxMenu",
		uiNavToggle = "CoreScripts.InGameMenu.GameSettings.UINavToggle"
	})

	React.useEffect(function() -- line: 37
		-- upvalues: v17 (copy), v19 (copy), GuiService (copy)
		if v17 and v19.current then
			GuiService.SelectedCoreObject = v19.current

			return
		end

		if not v17 then
			GuiService.SelectedCoreObject = nil
		end
	end, { v17 })

	local v21 = React.useMemo(function() -- line: 45
		-- upvalues: v20 (copy), v19 (copy), v16 (copy), FocusOnChrome (copy), GuiService (copy), GamepadService (copy)
		return {
			{
				id = "RobloxMenu",
				text = v20.robloxMenu,
				ref = v19,
				onActivated = function() --[[ onActivated ]] -- line: 51
					-- upvalues: v16 (copy), FocusOnChrome (copy)
					v16.setVisibility(false)
					FocusOnChrome()
				end
			},
			{
				id = "UiNavigationMode",
				text = v20.uiNavToggle,
				onActivated = function() --[[ onActivated ]] -- line: 59
					-- upvalues: v16 (copy), GuiService (copy), GamepadService (copy)
					v16.setVisibility(false)
					GuiService.SelectedCoreObject = nil

					local _, _ = pcall(function() -- line: 62
						-- upvalues: GamepadService (copy)
						GamepadService:AutoSelectGui()
					end)
				end
			}
		}
	end, {
		v16,
		v20
	})

	if v17 then
		return (React.createElement(Foundation.View, {
			tag = "position-center-center anchor-center-center auto-xy radius-medium bg-surface-200",
			ref = v18,
			selectionGroup = {
				SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
				SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
				SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
				SelectionBehaviorUp = Enum.SelectionBehavior.Stop
			},
			testId = "in-experience-ui-selector"
		}, {
			Menu = React.createElement(BaseMenu.Root, {
				items = v21,
				size = InputSize.Medium,
				radius = Foundation.Enums.Radius.Medium
			})
		}))
	end

	return nil
end
