local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamNotifications");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagStreamNotificationUXDropdown_0 = require(l_Parent_0.SharedFlags).FFlagStreamNotificationUXDropdown;
local l_ixpHelper_0 = require(l_Parent_0.NotificationsCommon).ixpHelper;
local v4 = require(l_script_FirstAncestor_0.constants);
local v5 = game:DefineFastString("StreamNotificationUXExposureLayer", "Notifications.StreamNotificationUXExposure");
local v6 = game:DefineFastString("StreamNotificationUXDropdownVariant", "enableStreamDropdown");
local function _() --[[ Line: 20 ]] --[[ Name: getIsLargeScreen ]]
    -- upvalues: v4 (copy)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v8 = false;
    if l_CurrentCamera_0 ~= nil then
        v8 = l_CurrentCamera_0.ViewportSize.X >= v4.Modal.WidthLimit;
    end;
    return v8;
end;
local function _() --[[ Line: 25 ]] --[[ Name: getIsUserInTreatment ]]
    -- upvalues: l_ixpHelper_0 (copy), v5 (copy), v6 (copy)
    local v10 = l_ixpHelper_0.getIxpLayerData(v5);
    if v10 and v10[v6] ~= nil then
        return v10[v6] == true;
    else
        return false;
    end;
end;
return {
    getDropdownEnabled = function() --[[ Line: 36 ]] --[[ Name: getDropdownEnabled ]]
        -- upvalues: l_FFlagStreamNotificationUXDropdown_0 (copy), v4 (copy), l_ixpHelper_0 (copy), v5 (copy), v6 (copy)
        local l_l_FFlagStreamNotificationUXDropdown_0_0 = l_FFlagStreamNotificationUXDropdown_0;
        if l_l_FFlagStreamNotificationUXDropdown_0_0 then
            local l_CurrentCamera_1 = workspace.CurrentCamera;
            l_l_FFlagStreamNotificationUXDropdown_0_0 = false;
            if l_CurrentCamera_1 ~= nil then
                l_l_FFlagStreamNotificationUXDropdown_0_0 = l_CurrentCamera_1.ViewportSize.X >= v4.Modal.WidthLimit;
            end;
            if l_l_FFlagStreamNotificationUXDropdown_0_0 then
                l_CurrentCamera_1 = l_ixpHelper_0.getIxpLayerData(v5);
                if l_CurrentCamera_1 and l_CurrentCamera_1[v6] ~= nil then
                    return l_CurrentCamera_1[v6] == true;
                else
                    l_l_FFlagStreamNotificationUXDropdown_0_0 = false;
                end;
            end;
        end;
        return l_l_FFlagStreamNotificationUXDropdown_0_0;
    end, 
    logExposure = function() --[[ Line: 43 ]] --[[ Name: logExposure ]]
        -- upvalues: l_FFlagStreamNotificationUXDropdown_0 (copy), v4 (copy), l_ixpHelper_0 (copy), v5 (copy), v6 (copy)
        if l_FFlagStreamNotificationUXDropdown_0 then
            local l_CurrentCamera_2 = workspace.CurrentCamera;
            local v15 = false;
            if l_CurrentCamera_2 ~= nil then
                v15 = l_CurrentCamera_2.ViewportSize.X >= v4.Modal.WidthLimit;
            end;
            if v15 then
                v15 = l_ixpHelper_0.getIxpLayerData(v5);
                if v15 and v15[v6] ~= nil then
                    l_ixpHelper_0.logUserLayerExposure(v5);
                end;
            end;
        end;
    end
};