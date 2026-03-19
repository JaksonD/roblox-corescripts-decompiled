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
local l_useTextSizeOffset_0 = require(l_Parent_0.Foundation).Hooks.useTextSizeOffset;
local v24 = game:DefineFastInt("CommunityProfileAffiliatedExperienceTelemetryThrottlePermyriad", 0);
local function _(v25) --[[ Line: 42 ]] --[[ Name: getTextSizeAdjustedSquareExperienceTileHeight ]]
    return function(v26) --[[ Line: 43 ]]
        -- upvalues: v25 (copy)
        return v26 + 80 + v25 * 3;
    end;
end;
return function(v28) --[[ Line: 48 ]] --[[ Name: Experiences ]]
    -- upvalues: l_useTextSizeOffset_0 (copy), v3 (copy), v15 (copy), v16 (copy), l_useRoactService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), v18 (copy), v13 (copy), v17 (copy), v19 (copy), l_ContentType_0 (copy), v20 (copy), v24 (copy), l_TelemetryService_0 (copy), l_AppPage_0 (copy), l_dependencyArray_0 (copy), v14 (copy), l_useLocalization_0 (copy), v9 (copy), v11 (copy), v12 (copy)
    local l_experienceDetails_0 = v28.experienceDetails;
    local v30 = nil;
    local v31 = nil;
    v30 = l_useTextSizeOffset_0();
    v31 = v3.useMemo(function() --[[ Line: 52 ]]
        -- upvalues: v30 (ref)
        local l_v30_0 = v30;
        return function(v33) --[[ Line: 43 ]]
            -- upvalues: l_v30_0 (copy)
            return v33 + 80 + l_v30_0 * 3;
        end;
    end, {
        v30
    });
    local v34 = v15();
    local v35 = v16();
    local v36 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v37 = v18(v13.Components.Experiences);
    local v38 = v3.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: v17 (ref), l_experienceDetails_0 (copy)
        return v17(l_experienceDetails_0);
    end, {
        l_experienceDetails_0
    });
    local v39 = v19(v38, 3, l_ContentType_0.Game, v28.layoutOrder, v13.Components.Experiences);
    local v46 = v3.useCallback(function(v40, v41, v42) --[[ Line: 72 ]]
        -- upvalues: v34 (copy), v20 (ref), v24 (ref), v35 (copy), l_TelemetryService_0 (ref), l_experienceDetails_0 (copy), v36 (copy), l_AppPage_0 (ref), v28 (copy)
        v34.fireAnalyticsEvent(v20.ExperienceOpened, {
            experienceId = v40.experienceId, 
            positionInComponent = v41
        });
        local v43 = {
            eventName = "communityAffiliatedExperienceClick", 
            backends = {
                "EventIngest"
            }, 
            throttlingPercentage = v24, 
            lastUpdated = {
                25, 
                6, 
                5
            }, 
            description = "Event fired from the client every time an experience is clicked from a community profile", 
            links = "https://github.rbx.com/Roblox/proto-schemas/pull/6250"
        };
        local v44 = {
            community_id = v35.profileId, 
            affiliationType = "owner", 
            place_id = v40.rootPlaceId, 
            universe_id = v40.experienceId
        };
        l_TelemetryService_0:LogEvent(v43, {
            customFields = v44
        });
        local v45 = 0;
        if l_experienceDetails_0 then
            v45 = #l_experienceDetails_0;
        end;
        v36.reportOpenGameDetailFromProfile(v40.rootPlaceId, v41, v45, v40.experienceId, l_AppPage_0.ProfilePlatform, v28.layoutOrder, v42 or 1, nil);
    end, l_dependencyArray_0(v34, l_experienceDetails_0, v36, v28.layoutOrder));
    local v47 = v14(v37, "ProfileExperienceTile", v46, true);
    local v48 = l_useLocalization_0({
        title = v9.Experiences
    });
    return if not l_experienceDetails_0 or v11.isEmpty(l_experienceDetails_0) then nil else v3.createElement(v12, {
        getItemHeight = v31, 
        hideHeaderButton = true, 
        maxNumRows = 1, 
        items = l_experienceDetails_0, 
        layoutOrder = v28.layoutOrder, 
        renderItem = v47, 
        title = v48.title, 
        impressionsTag = v37, 
        sendImpressions = v39, 
        overrides = {
            numColumns = 3
        }
    });
end;