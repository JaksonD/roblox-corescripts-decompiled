local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactCompat);
local l_RoactNetworking_0 = require(l_Parent_1.RoactServiceTags).RoactNetworking;
local l_RoactServices_0 = require(l_Parent_1.RoactServices).RoactServices;
local l_requestInternalWrapper_0 = require(l_Parent_1.Http).NetworkLayers.requestInternalWrapper;
local l_CoreScriptsRootProvider_0 = require(l_Parent_1.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v9 = require(l_Parent_0.Components.CoreUI.EventInExperiencePrompts);
local v10 = game:DefineFastFlag("EventsInExperienceAppFixStyleLink", false);
local v11 = {};
local function v15(v12, v13) --[[ Line: 29 ]]
    -- upvalues: v3 (copy), l_CoreScriptsRootProvider_0 (copy), l_RoactServices_0 (copy), l_RoactNetworking_0 (copy), l_requestInternalWrapper_0 (copy), l_HttpService_0 (copy), v10 (copy), v4 (copy)
    local v14 = v3.createElement(l_CoreScriptsRootProvider_0, {}, {
        RoactServicesProvider = v3.createElement(l_RoactServices_0.ServiceProvider, {
            services = {
                [l_RoactNetworking_0] = l_requestInternalWrapper_0(l_HttpService_0)
            }
        }, v13)
    });
    if v10 then
        v14 = v3.createElement("Folder", nil, v14);
    end;
    return v4.mount(v14, v12, "EventsInExperienceRoot");
end;
v11.createApp = function() --[[ Line: 43 ]] --[[ Name: createApp ]]
    -- upvalues: v15 (copy), v3 (copy), v9 (copy), v4 (copy)
    local v16 = {
        _coreUiHandle = nil
    };
    v16.mountCoreUI = function(v17) --[[ Line: 48 ]]
        -- upvalues: v16 (copy), v15 (ref), v3 (ref), v9 (ref)
        v16._coreUiHandle = v15(v17, {
            EventInExperiencePrompts = v3.createElement(v9)
        });
    end;
    v16.unMountCoreUI = function() --[[ Line: 54 ]]
        -- upvalues: v16 (copy), v4 (ref)
        if v16._coreUiHandle then
            v4.unmount(v16._coreUiHandle);
            v16._coreUiHandle = nil;
        end;
    end;
    return v16;
end;
return v11;