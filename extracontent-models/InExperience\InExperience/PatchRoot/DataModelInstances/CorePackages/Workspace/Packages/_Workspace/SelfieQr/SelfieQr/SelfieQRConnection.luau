local l_AvatarCreationService_0 = game:GetService("AvatarCreationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SelfieQr");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.FocusNavigationUtils);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.ReactUtils);
local v6 = require(l_script_FirstAncestor_0.SelfieQRCode);
local l_FocusRoot_0 = v3.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v3.FocusNavigableSurfaceIdentifierEnum;
local l_useEventConnection_0 = v5.useEventConnection;
local function v14(v10) --[[ Line: 21 ]]
    -- upvalues: v4 (copy), l_useEventConnection_0 (copy), l_AvatarCreationService_0 (copy)
    local v13 = v4.useCallback(function(v11, v12) --[[ Line: 22 ]]
        -- upvalues: v10 (copy)
        v10.displaySelfieQRCode(true);
        v10.jobData.url = v11;
        v10.jobData.jobId = v12;
    end);
    l_useEventConnection_0(l_AvatarCreationService_0.OpenSelfieQRCode, v13);
    return v4.createElement(v4.Fragment, {}, {});
end;
return function(_) --[[ Line: 31 ]]
    -- upvalues: v4 (copy), v6 (copy), v14 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local v16, v17 = v4.useState(false);
    local l_current_0 = v4.useRef({
        url = "", 
        jobId = ""
    }).current;
    local v19 = nil;
    if v16 then
        v19 = v4.createElement(v6, {
            displaySelfieQRCode = v17, 
            url = l_current_0.url, 
            jobId = l_current_0.jobId
        });
    end;
    return v4.createElement(v4.Fragment, {}, {
        EventListener = v4.createElement(v14, {
            displaySelfieQRCode = v17, 
            jobData = l_current_0
        }), 
        FocusNavigationCoreScriptsWrapper = if v19 ~= nil then v4.createElement(l_FocusRoot_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
            isIsolated = true, 
            isAutoFocusRoot = true
        }, {
            Dialog = v19
        }) else nil
    });
end;