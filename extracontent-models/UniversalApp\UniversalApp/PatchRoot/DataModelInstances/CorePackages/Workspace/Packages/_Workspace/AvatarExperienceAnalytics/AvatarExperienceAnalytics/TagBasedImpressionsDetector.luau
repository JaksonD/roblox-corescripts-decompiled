local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent;
local l_CollectionService_0 = game:GetService("CollectionService");
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(script.Parent.UnifiedEventLogConstants);
local v5 = require(script.Parent.UnifiedEventLogEnums);
local v6 = require(script.Parent.AvatarExperienceScreenSizeImpressionsDetector);
local v7 = require(l_Parent_0.AvatarExperienceNavigation);
local l_useAvatarRoute_0 = v7.AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreenProperties_0 = v7.AvatarRoute.AvatarScreenProperties;
local v10 = require(script.Parent.sendUnifiedEventLogForInstance);
local v11 = require(l_Parent_0.AvatarExperienceCommon);
local l_useSelectorSignal_0 = v11.Hooks.useSelectorSignal;
local l_selectSearchKeyword_0 = v11.State.Selectors.selectSearchKeyword;
local l_FFlagAXItemDetailsIxpExposure_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXItemDetailsIxpExposure;
local function v16(v15) --[[ Line: 31 ]] --[[ Name: AnalyticsMetadataSelector ]]
    return v15.AvatarExperience.AnalyticsMetadata;
end;
return function(v17) --[[ Line: 35 ]]
    -- upvalues: l_FFlagAXItemDetailsIxpExposure_0 (copy), l_useAvatarRoute_0 (copy), l_useSelectorSignal_0 (copy), l_selectSearchKeyword_0 (copy), v16 (copy), v3 (copy), l_AvatarScreenProperties_0 (copy), v10 (copy), v2 (copy), v5 (copy), l_CollectionService_0 (copy), v4 (copy), v6 (copy)
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    if not l_FFlagAXItemDetailsIxpExposure_0 then
        v18 = l_useAvatarRoute_0();
        v19 = l_useSelectorSignal_0(l_selectSearchKeyword_0);
        v20 = l_useSelectorSignal_0(v16);
    end;
    local v21 = v3.useRef({});
    local v22 = nil;
    if l_FFlagAXItemDetailsIxpExposure_0 then
        v22 = v3.useRef({});
    end;
    local v24 = v3.useCallback(function(v23) --[[ Line: 51 ]]
        -- upvalues: v21 (copy)
        return not v21.current[v23:GetFullName()];
    end, {});
    local v35 = v3.useCallback(function(v25) --[[ Line: 56 ]]
        -- upvalues: v21 (copy), l_FFlagAXItemDetailsIxpExposure_0 (ref), v22 (ref), l_AvatarScreenProperties_0 (ref), v18 (ref), v10 (ref), v2 (ref), v20 (ref), v5 (ref), v19 (ref), v17 (copy)
        local v26 = {};
        for _, v28 in v25 do
            local l_v28_FullName_0 = v28:GetFullName();
            if not v21.current[l_v28_FullName_0] then
                if l_FFlagAXItemDetailsIxpExposure_0 then
                    v26[l_v28_FullName_0] = v28;
                    if not v22.current[l_v28_FullName_0] then
                        v22.current[l_v28_FullName_0] = v28.AncestryChanged:Connect(function() --[[ Line: 69 ]]
                            -- upvalues: v28 (copy), v21 (ref), l_v28_FullName_0 (copy), v22 (ref)
                            if not v28.Parent then
                                v21.current[l_v28_FullName_0] = nil;
                                if v22.current[l_v28_FullName_0] then
                                    v22.current[l_v28_FullName_0]:Disconnect();
                                    v22.current[l_v28_FullName_0] = nil;
                                end;
                            end;
                        end);
                    end;
                else
                    local v30 = l_AvatarScreenProperties_0[v18.current.name];
                    v10(v28, v2.Dictionary.join(v20(false), {
                        action = v5.MarketplaceUnifiedAction.ITEM_IMPRESSION, 
                        surface = if v30 and v30.analyticsData then v30.analyticsData.unifiedLoggingSurface else nil, 
                        keyword = v19(false)
                    }), {
                        includeScreenSize = true, 
                        includeElementSizeAndPosition = true
                    });
                end;
                v21.current[l_v28_FullName_0] = true;
            end;
        end;
        if l_FFlagAXItemDetailsIxpExposure_0 and next(v26) and v17.extensions then
            for _, v32 in v26 do
                for _, v34 in v17.extensions do
                    v34({
                        visibleInstance = v32
                    });
                end;
            end;
        end;
    end, if l_FFlagAXItemDetailsIxpExposure_0 then {
        v17.extensions
    } else {
        v18, 
        v19, 
        v20
    });
    if l_FFlagAXItemDetailsIxpExposure_0 then
        v3.useEffect(function() --[[ Line: 121 ]]
            -- upvalues: v22 (ref)
            return function() --[[ Line: 122 ]]
                -- upvalues: v22 (ref)
                for _, v37 in v22.current do
                    if v37 then
                        v37:Disconnect();
                    end;
                end;
                v22.current = {};
            end;
        end, {});
    end;
    local v38 = v3.useCallback(function() --[[ Line: 133 ]]
        -- upvalues: l_CollectionService_0 (ref), v4 (ref)
        return l_CollectionService_0:GetTagged(v4.TAG_NAME);
    end, {});
    return v3.createElement(v6, {
        parentRef = v17.parentRef, 
        pageFilter = v17.pageFilter, 
        onRequestImpressionsSignal = v17.requestImpressionsSignal, 
        filterImpressionFunc = v24, 
        onImpressionsDetected = v35, 
        collectObjectsFunc = v38
    });
end;