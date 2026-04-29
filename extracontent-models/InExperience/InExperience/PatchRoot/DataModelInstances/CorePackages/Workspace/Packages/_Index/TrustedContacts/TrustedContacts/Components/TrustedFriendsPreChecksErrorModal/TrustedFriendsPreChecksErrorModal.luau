local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local TrustedContactsParent = TrustedContacts.Parent
local React = require(TrustedContactsParent.React)
local AppPage = require(TrustedContactsParent.RobloxAppEnums).AppPage
local Foundation = require(TrustedContactsParent.Foundation)
local Dialog = Foundation.Dialog
local DialogSize = Foundation.Enums.DialogSize

require(TrustedContacts.Common.Types)

return function(t1: {[any]: any}) --[[ TrustedFriendsPreChecksErrorModal ]] -- line: 19
	-- upvalues: React (copy), AppPage (copy), Dialog (copy), DialogSize (copy)
	local navigation = t1.navigation
	local externalNavigation = t1.externalNavigation
	local v11 = React.useCallback(function() -- line: 23
		-- upvalues: externalNavigation (copy)
		externalNavigation.closeModal()
	end, { externalNavigation.closeModal })
	local v12 = React.useCallback(function() -- line: 27
		-- upvalues: navigation (copy), AppPage (copy)
		navigation.replace(AppPage.TrustedFriendsUserModal, {})
	end, { navigation })

	return React.createElement(Dialog.Root, {
		size = DialogSize.Small
	}, {
		Title = React.createElement(Dialog.Title, {
			LayoutOrder = 1,
			text = "Something is wrong"
		}),
		Content = React.createElement(Dialog.Content, {
			LayoutOrder = 2
		}, {
			Text = React.createElement(Dialog.Text, {
				Text = "Something is really really wrong"
			})
		}),
		Buttons = React.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = "Cancel",
					onActivated = v11
				},
				{
					text = "Try again",
					onActivated = v12
				}
			}
		})
	})
end
