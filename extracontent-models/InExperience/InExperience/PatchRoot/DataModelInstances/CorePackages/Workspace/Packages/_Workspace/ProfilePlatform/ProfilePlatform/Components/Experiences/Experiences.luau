local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactUtils);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_dependencyArray_0 = v4.Hooks.dependencyArray;
local l_RoactAnalyticsCommonGameEvents_0 = require(l_Parent_0.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v9 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_ContentType_0 = require(l_Parent_0.UnifiedLogging).ContentType;
local v11 = require(l_Parent_0.Cryo);
local v12 = require(l_script_FirstAncestor_0.BaseComponents.CollectionGridViews.SquareCollectionGridView);
local v13 = require(l_script_FirstAncestor_0.Common.Enums);
local v14 = require(l_script_FirstAncestor_0.Hooks.Tiles.useRenderExperienceTile);
local v15 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v16 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v17 = require(l_script_FirstAncestor_0.Hooks.formatExperienceDetailsForImpressions);
local v18 = require(l_script_FirstAncestor_0.Hooks.useGenerateImpressionsTag);
local v19 = require(l_script_FirstAncestor_0.Hooks.useSendItemImpressions);
local v20 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v23 = require(l_Parent_0.Foundation);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_useTextSizeOffset_0 = v23.Hooks.useTextSizeOffset;
local v26 = game:DefineFastInt("CommunityProfileAffiliatedExperienceTelemetryThrottlePermyriad", 0);
local function _(v27) --[[ Line: 44 ]] --[[ Name: getTextSizeAdjustedSquareExperienceTileHeight ]]
    return function(v28) --[[ Line: 45 ]]
        -- upvalues: v27 (copy)
        return v28 + 80 + v27 * 3;
    end;
end;
return function(v30) --[[ Line: 50 ]] --[[ Name: Experiences ]]
    -- upvalues: l_useTextSizeOffset_0 (copy), v3 (copy), v15 (copy), v16 (copy), l_useRoactService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), v18 (copy), v13 (copy), v17 (copy), v19 (copy), l_ContentType_0 (copy), v20 (copy), v26 (copy), l_TelemetryService_0 (copy), l_AppPage_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v14 (copy), l_useLocalization_0 (copy), v9 (copy), v11 (copy), v12 (copy)
    local l_experienceDetails_0 = v30.experienceDetails;
    local v32 = nil;
    local v33 = nil;
    v32 = l_useTextSizeOffset_0();
    v33 = v3.useMemo(function() --[[ Line: 54 ]]
        -- upvalues: v32 (ref)
        local l_v32_0 = v32;
        return function(v35) --[[ Line: 45 ]]
            -- upvalues: l_v32_0 (copy)
            return v35 + 80 + l_v32_0 * 3;
        end;
    end, {
        v32
    });
    local v36 = v15();
    local v37 = v16();
    local v38 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v39 = v18(v13.Components.Experiences);
    local v40 = v3.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: v17 (ref), l_experienceDetails_0 (copy)
        return v17(l_experienceDetails_0);
    end, {
        l_experienceDetails_0
    });
    local v41 = v19(v40, 3, l_ContentType_0.Game, v30.layoutOrder, v13.Components.Experiences);
    local v48 = v3.useCallback(function(v42, v43, v44) --[[ Line: 75 ]]
        -- upvalues: v36 (copy), v20 (ref), v26 (ref), v37 (copy), l_TelemetryService_0 (ref), l_experienceDetails_0 (copy), v38 (copy), l_AppPage_0 (ref), v30 (copy)
        v36.fireAnalyticsEvent(v20.ExperienceOpened, {
            experienceId = v42.experienceId, 
            positionInComponent = v43
        });
        local v45 = {
            eventName = "communityAffiliatedExperienceClick", 
            backends = {
                "EventIngest"
            }, 
            throttlingPercentage = v26, 
            lastUpdated = {
                25, 
                6, 
                5
            }, 
            description = "Event fired from the client every time an experience is clicked from a community profile", 
            links = "https://github.rbx.com/Roblox/proto-schemas/pull/6250"
        };
        local v46 = {
            community_id = v37.profileId, 
            affiliationType = "owner", 
            place_id = v42.rootPlaceId, 
            universe_id = v42.experienceId
        };
        l_TelemetryService_0:LogEvent(v45, {
            customFields = v46
        });
        local v47 = 0;
        if l_experienceDetails_0 then
            v47 = #l_experienceDetails_0;
        end;
        v38.reportOpenGameDetailFromProfile(v42.rootPlaceId, v43, v47, v42.experienceId, l_AppPage_0.ProfilePlatform, v30.layoutOrder, v44 or 1, nil);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v36, 
        l_experienceDetails_0, 
        v38, 
        v30.layoutOrder
    } else l_dependencyArray_0(v36, l_experienceDetails_0, v38, v30.layoutOrder));
    local v49 = v14(v39, "ProfileExperienceTile", v48, true);
    local v50 = l_useLocalization_0({
        title = v9.Experiences
    });
    return if not l_experienceDetails_0 or v11.isEmpty(l_experienceDetails_0) then nil else v3.createElement(v12, {
        getItemHeight = v33, 
        hideHeaderButton = true, 
        maxNumRows = 1, 
        items = l_experienceDetails_0, 
        layoutOrder = v30.layoutOrder, 
        renderItem = v49, 
        title = v50.title, 
        impressionsTag = v39, 
        sendImpressions = v41, 
        overrides = {
            numColumns = 3
        }
    });
end;