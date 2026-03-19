local l_Parent_0 = script:FindFirstAncestor("TrustedContacts").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.SharedFlags);
local v3 = require(script.Parent.TrustedContactsModalContainer);
local l_FFlagTCShareLinkSenderUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkSenderUI;
local l_FFlagTCShareLinkReceiverUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkReceiverUI;
return function(v6) --[[ Line: 19 ]]
    -- upvalues: v1 (copy), v3 (copy), l_FFlagTCShareLinkSenderUI_0 (copy), l_FFlagTCShareLinkReceiverUI_0 (copy), v2 (copy)
    return v1.createElement("ScreenGui", {
        Enabled = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        DisplayOrder = 11
    }, {
        v1.createElement(v3, {
            userId = v6.navigation.getParam("userId"), 
            onRequestAccepted = v6.navigation.getParam("onRequestAccepted"), 
            onRequestSent = v6.navigation.getParam("onRequestSent"), 
            onClosed = v6.navigation.getParam("onClosed"), 
            source = v6.navigation.getParam("source"), 
            modalVariantOverride = if not not l_FFlagTCShareLinkSenderUI_0 or l_FFlagTCShareLinkReceiverUI_0 then v6.navigation.getParam("modalVariantOverride") else nil, 
            sentFromQrCode = if v2.FFlagProfilePlatformTrustedConnectionsMVP then v6.navigation.getParam("sentFromQrCode") else nil, 
            tokens = if l_FFlagTCShareLinkReceiverUI_0 then v6.navigation.getParam("tokens") else nil
        })
    });
end;