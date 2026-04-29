local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local TrustedContactsParent = TrustedContacts.Parent
local React = require(TrustedContactsParent.React)
local AppPage = require(TrustedContactsParent.RobloxAppEnums).AppPage
local Foundation = require(TrustedContactsParent.Foundation)
local IconSize = Foundation.Enums.IconSize
local useNavigation = require(TrustedContactsParent.Navigation).useNavigation
local TrustedContactsModalContainer = require(script.Parent.TrustedContactsModalContainer)
local useTriggerTfEligibilityCallback = require(script.Parent.useTriggerTfEligibilityCallback)

require(TrustedContacts.Common.Types)

return function(p1) --[[ TrustedFriendsCardPreChecksWrapper ]] -- line: 24
	-- upvalues: useNavigation (copy), React (copy), AppPage (copy), useTriggerTfEligibilityCallback (copy), Foundation (copy), IconSize (copy), TrustedContactsModalContainer (copy)
	local v11 = useNavigation()
	local userId = p1.userId
	local v13 = React.useCallback(function() -- line: 28
		-- upvalues: v11 (copy), AppPage (copy)
		v11.replace(AppPage.TrustedFriendsPreChecksErrorModal, {})
	end, { v11 })
	local v14 = React.useCallback(function() -- line: 32
		-- upvalues: v11 (copy), AppPage (copy)
		v11.replace(AppPage.TrustedFriendsAgeCheckPrologue, {})
	end, {
		v11,
		v13
	})
	local v15, v16 = React.useState(false)
	local v17 = React.useCallback(function() -- line: 38
		-- upvalues: v16 (copy)
		v16(true)
	end, {})

	useTriggerTfEligibilityCallback({
		userId = userId,
		onShowTfCard = v17,
		onTriggerAgePrecheck = v14,
		onError = v13
	})

	if not v15 then
		return React.createElement(Foundation.View, {
			tag = "position-center-center auto-xy"
		}, {
			LoadingIcon = React.createElement(Foundation.Loading, {
				LayoutOrder = 1,
				size = IconSize.Large
			})
		})
	end

	return React.createElement(TrustedContactsModalContainer, p1)
end
