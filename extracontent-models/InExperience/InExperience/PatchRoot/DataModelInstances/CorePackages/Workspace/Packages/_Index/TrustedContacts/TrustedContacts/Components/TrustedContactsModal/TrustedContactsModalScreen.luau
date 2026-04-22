local l_script_FirstAncestor_0 = script:FindFirstAncestor("TrustedContacts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SharedFlags);
local v4 = require(script.Parent.TrustedContactsModalContainer);
local l_FFlagTCShareLinkSenderUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkSenderUI;
local l_FFlagTCShareLinkReceiverUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkReceiverUI;
local l_FFlagTCUnifyNavigationEntry_0 = require(l_Parent_0.SharedFlags).FFlagTCUnifyNavigationEntry;
local l_FFlagTCModalUpdateButtons_0 = require(l_Parent_0.SharedFlags).FFlagTCModalUpdateButtons;
local _ = require(l_script_FirstAncestor_0.Common.Types);
return function(v10) --[[ Line: 18 ]]
    -- upvalues: l_FFlagTCUnifyNavigationEntry_0 (copy), l_FFlagTCShareLinkSenderUI_0 (copy), l_FFlagTCShareLinkReceiverUI_0 (copy), v3 (copy), v2 (copy), v4 (copy), l_FFlagTCModalUpdateButtons_0 (copy)
    local v11 = nil;
    local v12 = nil;
    if l_FFlagTCUnifyNavigationEntry_0 then
        v11 = v10.screenProps.modalProps;
        v12 = v10.screenProps.externalNavigation;
    else
        local l_navigation_0 = v10.navigation;
        v11 = {
            userId = l_navigation_0.getParam("userId"), 
            onRequestAccepted = l_navigation_0.getParam("onRequestAccepted"), 
            onRequestSent = l_navigation_0.getParam("onRequestSent"), 
            onClosed = l_navigation_0.getParam("onClosed"), 
            source = l_navigation_0.getParam("source"), 
            modalVariantOverride = if not not l_FFlagTCShareLinkSenderUI_0 or l_FFlagTCShareLinkReceiverUI_0 then l_navigation_0.getParam("modalVariantOverride") else nil, 
            sentFromQrCode = if v3.FFlagProfilePlatformTrustedConnectionsMVP then l_navigation_0.getParam("sentFromQrCode") else nil, 
            tokens = if l_FFlagTCShareLinkReceiverUI_0 then l_navigation_0.getParam("tokens") else nil
        };
    end;
    return v2.createElement("ScreenGui", {
        Enabled = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        DisplayOrder = 11
    }, {
        v2.createElement(v4, {
            userId = v11.userId, 
            onRequestAccepted = v11.onRequestAccepted, 
            onRequestSent = v11.onRequestSent, 
            source = v11.source, 
            modalVariantOverride = v11.modalVariantOverride, 
            sentFromQrCode = v11.sentFromQrCode, 
            tokens = v11.tokens, 
            isVerticallyConstrained = if l_FFlagTCUnifyNavigationEntry_0 then v11.isVerticallyConstrained else nil, 
            onAcknowledged = if l_FFlagTCUnifyNavigationEntry_0 then v11.onAcknowledged else nil, 
            onRemovedTrustedConnection = if l_FFlagTCModalUpdateButtons_0 then nil else v11.onRemovedTrustedConnection, 
            onClosed = if l_FFlagTCUnifyNavigationEntry_0 then nil else v11.onClosed, 
            externalNavigation = if l_FFlagTCUnifyNavigationEntry_0 then v12 else nil
        })
    });
end;