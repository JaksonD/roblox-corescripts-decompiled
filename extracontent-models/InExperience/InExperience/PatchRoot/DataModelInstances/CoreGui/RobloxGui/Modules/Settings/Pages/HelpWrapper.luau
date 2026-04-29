local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local LocalizationService = game:GetService("LocalizationService")
local Modules = RobloxGui.Modules
local HelpPage = require(CorePackages.Workspace.Packages.HelpPage)
local HelpReactView = HelpPage.HelpReactView
local SettingsPageFactory = require(Modules.Settings.SettingsPageFactory)
local v9 = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization.new(LocalizationService.RobloxLocaleId)
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local React = require(CorePackages.Packages.React)
local ReactRoblox = require(CorePackages.Packages.ReactRoblox)
local Foundation = require(CorePackages.Packages.Foundation)
local FoundationProvider = Foundation.FoundationProvider
local BuilderIcons = require(CorePackages.Packages.BuilderIcons)
local uiblox = BuilderIcons.Migration.uiblox
local Signals = require(CorePackages.Packages.Signals)
local SignalsReact = require(CorePackages.Packages.SignalsReact)
local FFlagAddIGMToSideSheet = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAddIGMToSideSheet
local FFlagRefactorHelpPage = HelpPage.Flags.FFlagRefactorHelpPage
local Constants = nil
local Utils = nil

if FFlagRefactorHelpPage then
	Utils = require(Modules.Settings.Integrations).Utils
	Constants = HelpPage.Constants
end

local u23 = nil
local v24, v25 = Signals.createSignal(false)

if FFlagRefactorHelpPage then
	return ((function() --[[ createHelpPage ]] -- line: 47
		-- upvalues: SettingsPageFactory (copy), Constants (ref), FFlagAddIGMToSideSheet (copy), uiblox (copy), BuilderIcons (copy), v9 (copy), u23 (ref), SignalsReact (copy), v24 (copy), React (copy), FoundationProvider (copy), Foundation (copy), Utils (ref), LocalizationProvider (copy), HelpReactView (copy), ReactRoblox (copy), v25 (copy)
		local v26 = SettingsPageFactory:CreateNewPage()

		v26.TabHeader.Name = Constants.HELP_PAGE.TAB_HEADER.NAME

		if FFlagAddIGMToSideSheet then
			v26.Page.Name = "Help"
		end

		local v27 = uiblox[Constants.HELP_PAGE.TAB_HEADER.ICON]

		v26.TabHeader.TabLabel.Icon.Text = v27.name
		v26.TabHeader.TabLabel.Icon.FontFace = BuilderIcons.Font[v27.variant]
		v26.TabHeader.TabLabel.Title.Text = v9:Format(Constants.HELP_PAGE.TAB_HEADER.TEXT)
		v26.Page:ClearAllChildren()
		v26.Displayed.Event:Connect(function() -- line: 91
			-- upvalues: u23 (ref), SignalsReact (copy), v24 (copy), React (copy), FoundationProvider (copy), Foundation (copy), Utils (ref), LocalizationProvider (copy), v9 (copy), HelpReactView (copy), ReactRoblox (copy), v26 (copy), v25 (copy)
			if not u23 then
				u23 = ReactRoblox.createRoot(v26.Page)

				if u23 then
					u23:render(React.createElement(function() -- line: 68
						-- upvalues: SignalsReact (copy), v24 (copy), React (copy), FoundationProvider (copy), Foundation (copy), Utils (ref), LocalizationProvider (copy), v9 (copy), HelpReactView (copy)
						if SignalsReact.useSignalState(v24) then
							return (React.createElement(FoundationProvider, {
								theme = Foundation.Enums.Theme.Dark,
								device = Utils.getDeviceType()
							}, {
								Child = React.createElement(LocalizationProvider, {
									localization = v9
								}, {
									Root = React.createElement(HelpReactView)
								})
							}))
						end

						return nil
					end))
				end
			end

			v25(true)

			if v26.HubRef.VersionContainer then
				v26.HubRef.VersionContainer.Visible = true
			end
		end)
		v26.Hidden.Event:Connect(function() -- line: 100
			-- upvalues: v25 (copy), v26 (copy)
			v25(false)

			if v26.HubRef.VersionContainer then
				v26.HubRef.VersionContainer.Visible = false
			end
		end)
		v26.Page.Size = UDim2.fromScale(1, 0)
		v26.Page.AutomaticSize = Enum.AutomaticSize.Y

		return v26
	end)())
end

return require(Modules.Settings.Pages.Help)
