local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SelfieQr");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CoreScriptsRootProvider_0 = require(l_Parent_0.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Roact);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local v8 = require(l_script_FirstAncestor_0.SelfieQRConnection);
local l_requestInternalWrapper_0 = require(l_Parent_0.Http).NetworkLayers.requestInternalWrapper;
local v10 = {};
local v11 = false;
local function v15(v12, v13) --[[ Line: 18 ]]
    -- upvalues: v4 (copy), l_CoreScriptsRootProvider_0 (copy), l_RoactServices_0 (copy), l_RoactNetworking_0 (copy), l_requestInternalWrapper_0 (copy), l_HttpService_0 (copy), v5 (copy)
    local v14 = v4.createElement(l_CoreScriptsRootProvider_0, {}, {
        RoactServicesProvider = v4.createElement(l_RoactServices_0.ServiceProvider, {
            services = {
                [l_RoactNetworking_0] = l_requestInternalWrapper_0(l_HttpService_0)
            }
        }, v13)
    });
    v14 = v4.createElement("Folder", nil, v14);
    return v5.mount(v14, v12, "SelfieQRRoot");
end;
v10.createFactory = function() --[[ Line: 32 ]] --[[ Name: createFactory ]]
    -- upvalues: v11 (ref), v15 (copy), v4 (copy), v8 (copy)
    local v16 = {};
    v16.mountCoreUI = function(v17) --[[ Line: 34 ]]
        -- upvalues: v11 (ref), v16 (copy), v15 (ref), v4 (ref), v8 (ref)
        if v11 then
            return;
        else
            v11 = true;
            v16._coreUiHandle = v15(v17, {
                SelfieQR = v4.createElement(v8, {})
            });
            return;
        end;
    end;
    return v16;
end;
return v10;