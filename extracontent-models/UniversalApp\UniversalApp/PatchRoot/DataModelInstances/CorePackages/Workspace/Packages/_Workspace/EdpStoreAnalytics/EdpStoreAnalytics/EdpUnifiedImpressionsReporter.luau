local l_script_FirstAncestor_0 = script:FindFirstAncestor("EdpStoreAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.AvatarExperienceAnalytics);
local l_UnifiedEventLogEnums_0 = v3.UnifiedEventLogEnums;
local l_UnifiedLoggingSurface_0 = require(l_Parent_0.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface;
local l_sendUnifiedEventLogForInstance_0 = v3.sendUnifiedEventLogForInstance;
local v7 = require(l_script_FirstAncestor_0.Constants);
return function(v8) --[[ Line: 14 ]] --[[ Name: EdpUnifiedImpressionsReporter ]]
    -- upvalues: l_sendUnifiedEventLogForInstance_0 (copy), v2 (copy), l_UnifiedEventLogEnums_0 (copy), v7 (copy), l_UnifiedLoggingSurface_0 (copy)
    return function(v9) --[[ Line: 15 ]]
        -- upvalues: l_sendUnifiedEventLogForInstance_0 (ref), v2 (ref), l_UnifiedEventLogEnums_0 (ref), v8 (copy), v7 (ref), l_UnifiedLoggingSurface_0 (ref)
        local l_visibleInstance_0 = v9.visibleInstance;
        local v11 = l_visibleInstance_0:GetAttributes() or {};
        l_sendUnifiedEventLogForInstance_0(l_visibleInstance_0, v2.Dictionary.join(v11, {
            action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_IMPRESSION, 
            surface = if v8 == v7.StoreEnums.LocationType.Edp then l_UnifiedLoggingSurface_0.EDP_PREVIEW else l_UnifiedLoggingSurface_0.EDP_STORE
        }), {
            includeScreenSize = true, 
            includeElementSizeAndPosition = true
        });
    end;
end;