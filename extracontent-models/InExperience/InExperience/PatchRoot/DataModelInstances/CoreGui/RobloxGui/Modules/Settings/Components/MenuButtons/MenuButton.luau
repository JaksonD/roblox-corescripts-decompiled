local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local Utility = require(RobloxGui.Modules.Settings.Utility)
local React = require(CorePackages.Packages.React)
local Foundation = require(CorePackages.Packages.Foundation)
local Responsive = require(CorePackages.Workspace.Packages.Responsive)
local CoreScriptsRoactCommon = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon)
local useTokens = Foundation.Hooks.useTokens
local View = Foundation.View
local FoundationText = Foundation.Text
local FoundationImage = Foundation.Image
local PopoverSide = Foundation.Enums.PopoverSide
local Traversal = CoreScriptsRoactCommon.Traversal
local TraversalHistoryMenu = require(RobloxGui.Modules.Settings.Components.Traversal.TraversalHistoryMenu)
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAddTraversalHistoryReactMenuButtons = require(RobloxGui.Modules.Settings.Flags.FFlagAddTraversalHistoryReactMenuButtons)
local FIntRelocateMobileMenuButtonsVariant = require(RobloxGui.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant)
local FFlagMenuButtonsUseKeyImages = require(RobloxGui.Modules.Settings.Flags.FFlagMenuButtonsUseKeyImages)
local FFlagFixTraversalHistoryMenuFixesV3 = Traversal.Flags.FFlagFixTraversalHistoryMenuFixesV3
local FFlagIEMFocusNavSupportNewButtons = require(RobloxGui.Modules.Settings.Flags.FFlagIEMFocusNavSupportNewButtons)
local FFlagGamepadIconSupportCheck = SharedFlags.FFlagGamepadIconSupportCheck

local function KeyLabelIcon(s1: string?, b1: boolean) -- line: 55
	-- upvalues: useTokens (copy), React (copy), View (copy), FoundationText (copy)
	local v31 = useTokens()
	local createElement = React.createElement
	local v33 = View
	local t1 = {
		LayoutOrder = 1
	}
	local t2 = {
		Color3 = v31.Color.ActionStandard.Background.Color3
	}
	local v37

	if b1 then
		local BackgroundTransparency = v31.Color.ActionStandard.Background.Transparency

		v37 = BackgroundTransparency + (1 - BackgroundTransparency) * 0.5
	else
		v37 = v31.Color.ActionStandard.Background.Transparency
	end

	t2.Transparency = v37
	t1.backgroundStyle = t2
	t1.tag = "size-1000-700 row align-x-center align-y-center radius-medium"

	local t3 = {}
	local createElement2 = React.createElement
	local v40 = FoundationText
	local t4 = {
		Text = s1
	}
	local t5 = {
		Color3 = v31.Color.ActionStandard.Foreground.Color3
	}
	local v44

	if b1 then
		local ForegroundTransparency = v31.Color.ActionStandard.Foreground.Transparency

		v44 = ForegroundTransparency + (1 - ForegroundTransparency) * 0.5
	else
		v44 = v31.Color.ActionStandard.Foreground.Transparency
	end

	t5.Transparency = v44
	t4.textStyle = t5
	t4.tag = "text-title-small"
	t3.HotkeyText = createElement2(v40, t4)

	return createElement(v33, t1, t3)
end
local function Hint(p1) -- line: 77
	-- upvalues: FIntRelocateMobileMenuButtonsVariant (copy), Utility (copy), FFlagMenuButtonsUseKeyImages (copy), Responsive (copy), React (copy), FoundationImage (copy), KeyLabelIcon (copy)
	if FIntRelocateMobileMenuButtonsVariant == 2 and Utility:IsSmallTouchScreen() then
		return nil
	end

	if FFlagMenuButtonsUseKeyImages and (p1.lastInput == Responsive.Input.Pointer or p1.lastInput == Responsive.Input.Directional) then
		return React.createElement(FoundationImage, {
			Image = if p1.lastInput ~= Responsive.Input.Directional then p1.keyboardButtonImageHint else p1.gamepadButtonImageHint,
			imageStyle = {
				Color3 = p1.foregroundStyle.Color3,
				Transparency = if not p1.isDisabled then p1.foregroundStyle.Transparency else 0.5
			},
			tag = {
				["size-800"] = not p1.isSmall,
				["size-700"] = p1.isSmall
			}
		})
	end

	if p1.lastInput == Responsive.Input.Pointer then
		return KeyLabelIcon(p1.keyboardHint, p1.isDisabled)
	end

	if p1.lastInput == Responsive.Input.Directional then
		return React.createElement(FoundationImage, {
			Image = p1.gamepadButtonImageHint,
			imageStyle = {
				Color3 = p1.foregroundStyle.Color3,
				Transparency = if not p1.isDisabled then p1.foregroundStyle.Transparency else 0.5
			},
			tag = {
				["size-600"] = not p1.isSmall,
				["size-500"] = p1.isSmall
			}
		})
	end

	return nil
end
local function ButtonText(p2) -- line: 111
	-- upvalues: React (copy), FoundationText (copy)
	return React.createElement(FoundationText, {
		Text = p2.text,
		LayoutOrder = 2,
		textStyle = {
			Color3 = p2.foregroundStyle.Color3,
			Transparency = if not p2.isDisabled then p2.foregroundStyle.Transparency else 0.5
		},
		tag = {
			["auto-x"] = true,
			["text-title-medium"] = not p2.isSmall,
			["text-title-small"] = p2.isSmall,
			["content-action-standard"] = not p2.isEmphasized,
			["content-action-soft-emphasis"] = p2.isEmphasized
		}
	})
end
local function supportsButton(s2: string, p3) -- line: 146
	-- upvalues: FFlagGamepadIconSupportCheck (copy), Responsive (copy), UserInputService (copy)
	if not FFlagGamepadIconSupportCheck or (not p3 or s2 ~= Responsive.Input.Directional) then
		return true
	end

	return UserInputService:GamepadSupports(UserInputService:GetLastInputType(), p3)
end

return React.memo(function(t6: {[any]: any}) --[[ MenuButton ]] -- line: 153
	-- upvalues: useTokens (copy), FFlagIEMFocusNavSupportNewButtons (copy), FFlagAddTraversalHistoryReactMenuButtons (copy), React (copy), supportsButton (copy), FFlagGamepadIconSupportCheck (copy), UserInputService (copy), View (copy), Hint (copy), FFlagMenuButtonsUseKeyImages (copy), ButtonText (copy), FIntRelocateMobileMenuButtonsVariant (copy), Utility (copy), Responsive (copy), FoundationImage (copy), KeyLabelIcon (copy), FoundationText (copy), TraversalHistoryMenu (copy), FFlagFixTraversalHistoryMenuFixesV3 (copy), PopoverSide (copy)
	local v50 = useTokens()
	local v51 = if not FFlagIEMFocusNavSupportNewButtons then if not FFlagAddTraversalHistoryReactMenuButtons then nil else React.useRef(nil) else t6.buttonRef
	local v52 = if not t6.isEmphasized then v50.Color.ActionStandard.Background else v50.Color.ActionSoftEmphasis.Background
	local v53 = if not t6.isEmphasized then v50.Color.ActionStandard.Foreground else v50.Color.ActionSoftEmphasis.Foreground
	local v54, v55 = React.useState(supportsButton(t6.lastInput, t6.gamepadButton))

	React.useEffect(function() -- line: 163
		-- upvalues: FFlagGamepadIconSupportCheck (copy), t6 (copy), UserInputService (copy), v55 (copy), supportsButton (copy)
		local connection = nil

		if FFlagGamepadIconSupportCheck and t6.gamepadButton then
			connection = UserInputService.LastInputTypeChanged:Connect(function() -- line: 166
				-- upvalues: v55 (copy), supportsButton (copy), t6 (copy)
				v55(supportsButton(t6.lastInput, t6.gamepadButton))
			end)
		end

		return function() -- line: 171
			-- upvalues: connection (ref)
			if connection then
				connection:Disconnect()
			end
		end
	end, {
		t6.gamepadButton,
		t6.lastInput
	})

	local createElement = React.createElement
	local v57 = View
	local t7 = {
		onActivated = t6.onActivated,
		isDisabled = t6.isDisabled,
		LayoutOrder = t6.layoutOrder
	}
	local t8 = {
		Color3 = v52.Color3
	}
	local v61

	if t6.isDisabled then
		local Transparency = v52.Transparency

		v61 = Transparency + (1 - Transparency) * 0.5
	else
		v61 = v52.Transparency
	end

	t8.Transparency = v61
	t7.backgroundStyle = t8
	t7.tag = {
		["fill auto-x row align-y-center align-x-center gap-small radius-medium"] = true,
		["size-0-1200"] = not t6.isSmall,
		["size-0-1000"] = t6.isSmall,
		["bg-action-standard"] = not t6.isEmphasized,
		["bg-action-soft-emphasis"] = t6.isEmphasized
	}
	t7.ref = if not FFlagAddTraversalHistoryReactMenuButtons and not FFlagIEMFocusNavSupportNewButtons then nil else v51
	t7.Selectable = not not FFlagIEMFocusNavSupportNewButtons or nil

	return createElement(v57, t7, {
		Button = if not FFlagAddTraversalHistoryReactMenuButtons then nil else React.createElement(View, {
			tag = "auto-xy row align-y-center align-x-center grow gap-small"
		}, {
			Hint = if not not FFlagGamepadIconSupportCheck and not v54 then nil else React.createElement(Hint, {
				lastInput = t6.lastInput,
				keyboardHint = if not FFlagMenuButtonsUseKeyImages then t6.keyboardHint else nil,
				gamepadButtonImageHint = t6.gamepadButtonImageHint,
				keyboardButtonImageHint = if not FFlagMenuButtonsUseKeyImages then nil else t6.keyboardButtonImageHint,
				isDisabled = t6.isDisabled,
				foregroundStyle = v53,
				isSmall = t6.isSmall
			}),
			ButtonText = React.createElement(ButtonText, {
				text = t6.text,
				isDisabled = t6.isDisabled,
				foregroundStyle = v53,
				isEmphasized = t6.isEmphasized,
				isSmall = t6.isSmall
			})
		}),
		Hint = if FFlagGamepadIconSupportCheck and not v54 or FFlagAddTraversalHistoryReactMenuButtons then nil else if FIntRelocateMobileMenuButtonsVariant ~= 2 or not Utility:IsSmallTouchScreen() then if not FFlagMenuButtonsUseKeyImages or t6.lastInput ~= Responsive.Input.Pointer and t6.lastInput ~= Responsive.Input.Directional then if t6.lastInput ~= Responsive.Input.Pointer then if t6.lastInput ~= Responsive.Input.Directional then nil else React.createElement(FoundationImage, {
			Image = t6.gamepadButtonImageHint,
			imageStyle = {
				Color3 = v53.Color3,
				Transparency = if not t6.isDisabled then v53.Transparency else 0.5
			},
			tag = {
				["size-600"] = not t6.isSmall,
				["size-500"] = t6.isSmall
			}
		}) else KeyLabelIcon(t6.keyboardHint, t6.isDisabled) else React.createElement(FoundationImage, {
			Image = if t6.lastInput ~= Responsive.Input.Directional then t6.keyboardButtonImageHint else t6.gamepadButtonImageHint,
			imageStyle = {
				Color3 = v53.Color3,
				Transparency = if not t6.isDisabled then v53.Transparency else 0.5
			},
			tag = {
				["size-800"] = not t6.isSmall,
				["size-700"] = t6.isSmall
			}
		}) else nil,
		ButtonText = if FFlagAddTraversalHistoryReactMenuButtons then nil else React.createElement(FoundationText, {
			Text = t6.text,
			LayoutOrder = 2,
			textStyle = {
				Color3 = v53.Color3,
				Transparency = if not t6.isDisabled then v53.Transparency else 0.5
			},
			tag = {
				["auto-x"] = true,
				["text-title-medium"] = not t6.isSmall,
				["text-title-small"] = t6.isSmall,
				["content-action-standard"] = not t6.isEmphasized,
				["content-action-soft-emphasis"] = t6.isEmphasized
			}
		}),
		TraversalHistoryMenu = if not FFlagAddTraversalHistoryReactMenuButtons or not t6.addTraversalHistoryMenu then nil else React.createElement(TraversalHistoryMenu, {
			anchorRef = v51,
			idleButtonStateIsDown = true,
			currentPageChangeSignal = t6.currentPageChangeSignal,
			isDarkOnDarkMode = true,
			menuSide = if not FFlagFixTraversalHistoryMenuFixesV3 then nil else if not t6.isSmall then PopoverSide.Top else PopoverSide.Bottom
		})
	})
end)
