local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_AvatarCreationService_0 = game:GetService("AvatarCreationService");
local v3 = require(l_Parent_1.FocusNavigationUtils);
local v4 = require(l_Parent_1.ReactUtils);
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_0.SelfieConsentPrompt);
local l_FocusRoot_0 = v3.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v3.FocusNavigableSurfaceIdentifierEnum;
local l_useEventConnection_0 = v4.useEventConnection;
local function v12(v10) --[[ Line: 21 ]]
    -- upvalues: v5 (copy), l_useEventConnection_0 (copy), l_AvatarCreationService_0 (copy)
    local v11 = v5.useCallback(function() --[[ Line: 22 ]]
        -- upvalues: v10 (copy)
        v10.displaySelfieConsent(true);
    end);
    l_useEventConnection_0(l_AvatarCreationService_0.OpenSelfieConsent, v11);
    return v5.createElement(v5.Fragment, {}, {});
end;
return function(_) --[[ Line: 29 ]]
    -- upvalues: v5 (copy), v6 (copy), v12 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local v14, v15 = v5.useState(false);
    local v16 = nil;
    if v14 then
        v16 = v5.createElement(v6, {
            displaySelfieConsent = v15
        });
    end;
    return v5.createElement(v5.Fragment, {}, {
        EventListener = v5.createElement(v12, {
            displaySelfieConsent = v15
        }), 
        FocusNavigationCoreScriptsWrapper = if v16 ~= nil then v5.createElement(l_FocusRoot_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
            isIsolated = true, 
            isAutoFocusRoot = true
        }, {
            Prompt = v16
        }) else nil
    });
end;