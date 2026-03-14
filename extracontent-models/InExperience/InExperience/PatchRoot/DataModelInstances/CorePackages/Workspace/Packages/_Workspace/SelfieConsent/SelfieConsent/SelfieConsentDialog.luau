local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_CoreScriptsRootProvider_0 = require(l_Parent_1.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactCompat);
local l_RoactNetworking_0 = require(l_Parent_1.RoactServiceTags).RoactNetworking;
local l_RoactServices_0 = require(l_Parent_1.RoactServices).RoactServices;
local v8 = require(l_Parent_0.SelfieConsentConnection);
local l_requestInternalWrapper_0 = require(l_Parent_1.Http).NetworkLayers.requestInternalWrapper;
local v10 = {};
local function v14(v11, v12) --[[ Line: 18 ]]
    -- upvalues: v4 (copy), l_CoreScriptsRootProvider_0 (copy), l_RoactServices_0 (copy), l_RoactNetworking_0 (copy), l_requestInternalWrapper_0 (copy), l_HttpService_0 (copy), v5 (copy)
    local v13 = v4.createElement(l_CoreScriptsRootProvider_0, {}, {
        RoactServicesProvider = v4.createElement(l_RoactServices_0.ServiceProvider, {
            services = {
                [l_RoactNetworking_0] = l_requestInternalWrapper_0(l_HttpService_0)
            }
        }, v12)
    });
    v13 = v4.createElement("Folder", nil, v13);
    return v5.mount(v13, v11, "SelfieConsentRoot");
end;
v10.createDialog = function() --[[ Line: 30 ]] --[[ Name: createDialog ]]
    -- upvalues: v14 (copy), v4 (copy), v8 (copy)
    local v15 = {};
    v15.mountCoreUI = function(v16) --[[ Line: 33 ]]
        -- upvalues: v15 (copy), v14 (ref), v4 (ref), v8 (ref)
        v15._coreUiHandle = v14(v16, {
            SelfieConsent = v4.createElement(v8, {})
        });
    end;
    return v15;
end;
return v10;