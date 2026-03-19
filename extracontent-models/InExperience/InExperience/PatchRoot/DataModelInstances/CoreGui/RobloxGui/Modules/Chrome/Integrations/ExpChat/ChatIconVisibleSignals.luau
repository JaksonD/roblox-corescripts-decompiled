local l_CorePackages_0 = game:GetService("CorePackages");
local l_Packages_0 = l_CorePackages_0.Packages;
local v2 = require(l_Packages_0.Signals);
local v3 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_GetFFlagExpChatGuacChatDisabledReason_0 = v3.GetFFlagExpChatGuacChatDisabledReason;
local l_FFlagExpChatWindowSyncUnibar_0 = v3.FFlagExpChatWindowSyncUnibar;
local l_FFlagEnableAEGIS2CommsFAEUpsell_0 = v3.FFlagEnableAEGIS2CommsFAEUpsell;
local v7 = game:DefineFastFlag("ExpChatOnShowIconChatAvailabilityStatus", false);
local v8 = nil;
if v7 then
    v8 = require(l_CorePackages_0.Workspace.Packages.ExpChat).Stores.GetChatStatusStore;
end;
local v9 = nil;
if l_GetFFlagExpChatGuacChatDisabledReason_0() then
    v9 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy);
end;
local function v29(v10) --[[ Line: 23 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_FFlagExpChatWindowSyncUnibar_0 (copy), l_GetFFlagExpChatGuacChatDisabledReason_0 (copy), v9 (ref), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (copy), v7 (copy)
    local v11, v12 = v2.createSignal(true);
    local v13, v14 = v2.createSignal(false);
    local v15, v16 = v2.createSignal(false);
    local v17, v18 = v2.createSignal(false);
    local v19 = nil;
    local v20 = nil;
    if l_FFlagExpChatWindowSyncUnibar_0 then
        local v21, v22 = v2.createSignal(false);
        v19 = v21;
        v20 = v22;
    end;
    local v23 = false;
    if l_GetFFlagExpChatGuacChatDisabledReason_0() and v9 then
        v23 = v9.getAppFeaturePolicies().getExperienceChatAvailability() == "regionLocked";
    end;
    local v24 = l_FFlagEnableAEGIS2CommsFAEUpsell_0 and v7;
    local v26 = v2.createComputed(function(v25) --[[ Line: 41 ]]
        -- upvalues: v11 (copy), v24 (copy), v13 (copy), l_FFlagExpChatWindowSyncUnibar_0 (ref), v17 (copy), v15 (copy), v19 (ref), v10 (copy), l_GetFFlagExpChatGuacChatDisabledReason_0 (ref), v23 (ref)
        if not v11(v25) then
            return false;
        elseif not v24 and v13(v25) then
            return true;
        elseif not l_FFlagExpChatWindowSyncUnibar_0 and v17(v25) then
            return true;
        elseif not l_FFlagExpChatWindowSyncUnibar_0 and v15(v25) then
            return true;
        elseif l_FFlagExpChatWindowSyncUnibar_0 and v19(v25) then
            return true;
        elseif v24 and v10.getChatStatus(v25) ~= "NoOne" then
            return true;
        elseif l_GetFFlagExpChatGuacChatDisabledReason_0() and v23 then
            return true;
        else
            return false;
        end;
    end);
    local v27 = nil;
    if l_FFlagExpChatWindowSyncUnibar_0 then
        v27 = v2.createComputed(function(v28) --[[ Line: 73 ]]
            -- upvalues: v26 (copy), v19 (ref)
            if v26(v28) and v19(v28) then
                return true;
            else
                return false;
            end;
        end);
    end;
    return {
        getIsChatIconVisible = v26, 
        getIsChatWindowVisible = v27, 
        setCoreGuiEnabled = v12, 
        setLocalUserChat = v14, 
        setChatActiveCalledByDeveloper = v16, 
        setVisibleViaChatSelector = v18, 
        setGameSettingsChatVisible = v20
    };
end;
return {
    new = v29, 
    default = v29(if v7 then v8(false) else nil)
};