local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactCompat);
local l_RoactNetworking_0 = require(l_Parent_1.RoactServiceTags).RoactNetworking;
local l_RoactServices_0 = require(l_Parent_1.RoactServices).RoactServices;
local l_requestInternalWrapper_0 = require(l_Parent_1.Http).NetworkLayers.requestInternalWrapper;
local l_CoreScriptsRootProvider_0 = require(l_Parent_1.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v9 = require(l_Parent_0.Components.CoreUI.GroupInExperiencePrompts);
local v10 = {};
local function v13(v11, v12) --[[ Line: 27 ]]
    -- upvalues: v4 (copy), v3 (copy), l_CoreScriptsRootProvider_0 (copy), l_RoactServices_0 (copy), l_RoactNetworking_0 (copy), l_requestInternalWrapper_0 (copy), l_HttpService_0 (copy)
    return v4.mount(v3.createElement(l_CoreScriptsRootProvider_0, {}, {
        RoactServicesProvider = v3.createElement(l_RoactServices_0.ServiceProvider, {
            services = {
                [l_RoactNetworking_0] = l_requestInternalWrapper_0(l_HttpService_0)
            }
        }, v12)
    }), v11, "GroupsInExperienceRoot");
end;
v10.createApp = function() --[[ Line: 41 ]] --[[ Name: createApp ]]
    -- upvalues: v13 (copy), v3 (copy), v9 (copy), v4 (copy)
    local v14 = {
        _coreUiHandle = nil
    };
    v14.mountCoreUI = function(v15) --[[ Line: 46 ]]
        -- upvalues: v14 (copy), v13 (ref), v3 (ref), v9 (ref)
        v14._coreUiHandle = v13(v15, {
            GroupInExperiencePrompts = v3.createElement(v9)
        });
    end;
    v14.unMountCoreUI = function() --[[ Line: 52 ]]
        -- upvalues: v14 (copy), v4 (ref)
        if v14._coreUiHandle then
            v4.unmount(v14._coreUiHandle);
            v14._coreUiHandle = nil;
        end;
    end;
    return v14;
end;
return v10;