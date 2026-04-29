local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local TrustedContactsParent = TrustedContacts.Parent
local React = require(TrustedContactsParent.React)
local Foundation = require(TrustedContactsParent.Foundation)
local Dialog = Foundation.Dialog
local DialogSize = Foundation.Enums.DialogSize
local AppPage = require(TrustedContactsParent.RobloxAppEnums).AppPage
local AccessResponseEnum = require(TrustedContactsParent.AmpUpsell).AmpEnums.AccessResponseEnum

require(TrustedContacts.Common.Types)

local VIEW_TF_ELIGIBILITY_CHECK = require(TrustedContacts.Common.VIEW_TF_ELIGIBILITY_CHECK)

return function(t1: {[any]: any}) --[[ TrustedFriendsAgeCheckPrologue ]] -- line: 23
	-- upvalues: React (copy), VIEW_TF_ELIGIBILITY_CHECK (copy), AccessResponseEnum (copy), AppPage (copy), Dialog (copy), DialogSize (copy)
	local externalNavigation = t1.externalNavigation
	local navigation = t1.navigation
	local v13, v14 = React.useState(false)
	local v15 = React.useCallback(function() -- line: 29
		-- upvalues: externalNavigation (copy)
		externalNavigation.closeModal()
	end, { externalNavigation.closeModal })
	local v16 = React.useCallback(function() -- line: 33
		-- upvalues: v14 (copy), externalNavigation (copy), VIEW_TF_ELIGIBILITY_CHECK (copy), AccessResponseEnum (copy), navigation (copy), AppPage (copy)
		v14(true)
		externalNavigation.openAmpWizard({
			featureName = VIEW_TF_ELIGIBILITY_CHECK.featureName,
			nameSpace = VIEW_TF_ELIGIBILITY_CHECK.nameSpace,
			entryPointEventCtx = "",
			completionCallback = function(p1, _) --[[ completionCallback ]] -- line: 40
				-- upvalues: AccessResponseEnum (copy), navigation (copy), AppPage (copy)
				if p1 == AccessResponseEnum.Granted then
					navigation.replace(AppPage.TrustedFriendsUserModal, {})

					return
				end

				navigation.replace(AppPage.TrustedFriendsPreChecksErrorModal, {})
			end
		})
	end, {
		externalNavigation.openAmpWizard,
		navigation
	})

	if v13 then
		return nil
	end

	return React.createElement(Dialog.Root, {
		size = DialogSize.Small
	}, {
		Title = React.createElement(Dialog.Title, {
			LayoutOrder = 1,
			text = "We need to check something first"
		}),
		Content = React.createElement(Dialog.Content, {
			LayoutOrder = 2
		}, {
			Text = React.createElement(Dialog.Text, {
				Text = "Please click correct button"
			})
		}),
		Buttons = React.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = "Cancel",
					onActivated = v15
				},
				{
					text = "Start age check",
					onActivated = v16
				}
			}
		})
	})
end
