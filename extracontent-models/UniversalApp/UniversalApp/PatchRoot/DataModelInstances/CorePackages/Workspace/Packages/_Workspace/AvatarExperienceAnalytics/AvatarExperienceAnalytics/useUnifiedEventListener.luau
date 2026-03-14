local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent;
local l_CollectionService_0 = game:GetService("CollectionService");
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(script.Parent.sendUnifiedEventLogForInstance);
local v5 = require(script.Parent.UnifiedEventLogConstants);
local v6 = require(l_Parent_0.AvatarExperienceCommon);
local l_useSelectorSignal_0 = v6.Hooks.useSelectorSignal;
local l_selectSearchKeyword_0 = v6.State.Selectors.selectSearchKeyword;
local v9 = require(l_Parent_0.AvatarExperienceNavigation);
local l_useAvatarRoute_0 = v9.AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreenProperties_0 = v9.AvatarRoute.AvatarScreenProperties;
local function v15(v12) --[[ Line: 16 ]] --[[ Name: markLastActivated ]]
    -- upvalues: l_CollectionService_0 (copy), v5 (copy)
    for _, v14 in (l_CollectionService_0:GetTagged(v5.LAST_ACTIVATED_TAG_NAME)) do
        l_CollectionService_0:RemoveTag(v14, v5.LAST_ACTIVATED_TAG_NAME);
    end;
    l_CollectionService_0:AddTag(v12, v5.LAST_ACTIVATED_TAG_NAME);
end;
local function v19(v16) --[[ Line: 27 ]] --[[ Name: getChildButton ]]
    if not v16 then
        return nil;
    elseif v16:IsA("TextButton") or v16:IsA("ImageButton") or v16:IsA("GuiButton") then
        return v16;
    else
        for _, _ in v16:GetDescendants() do
            if v16:IsA("TextButton") or v16:IsA("ImageButton") or v16:IsA("GuiButton") then
                return v16;
            end;
        end;
        return nil;
    end;
end;
local function v21(v20) --[[ Line: 45 ]] --[[ Name: AnalyticsMetadataSelector ]]
    return v20.AvatarExperience.AnalyticsMetadata;
end;
local _ = function(v22, v23) --[[ Line: 49 ]]
    -- upvalues: v2 (copy), l_CollectionService_0 (copy), v5 (copy), v19 (copy), v15 (copy), v3 (copy), l_AvatarScreenProperties_0 (copy), v4 (copy)
    v2.useEffect(function() --[[ Line: 50 ]]
        -- upvalues: l_CollectionService_0 (ref), v5 (ref), v19 (ref), v15 (ref), v22 (copy), v3 (ref), v23 (copy), l_AvatarScreenProperties_0 (ref), v4 (ref)
        local v24 = {};
        v24.instanceAdded = l_CollectionService_0:GetInstanceAddedSignal(v5.TAG_NAME):Connect(function(v25) --[[ Line: 58 ]]
            -- upvalues: v19 (ref), v5 (ref), v15 (ref), v22 (ref), v3 (ref), v23 (ref), l_AvatarScreenProperties_0 (ref), v4 (ref), v24 (ref)
            local v26 = v19(v25);
            if v26 then
                v24[v25] = v26.Activated:Connect(function() --[[ Line: 61 ]]
                    -- upvalues: v25 (copy), v5 (ref), v15 (ref), v22 (ref), v3 (ref), v23 (ref), l_AvatarScreenProperties_0 (ref), v4 (ref)
                    if v25:GetAttributes()[v5.HAS_DEFERRED_ACTION] then
                        v15(v25);
                    end;
                    local v27 = {};
                    if v22 then
                        v27 = v3.Dictionary.join(v22.getAnalyticsMetadata(false), {
                            keyword = v22.getSearchKeyword(false)
                        });
                    end;
                    if v23 and v23.current and v23.current.current then
                        local v28 = l_AvatarScreenProperties_0[v23.current.opaque.name];
                        if v28 and v28.analyticsData then
                            v27.surface = v28.analyticsData.unifiedLoggingSurface;
                        end;
                    end;
                    v4(v25, v27, {
                        includeScreenSize = true, 
                        includeElementSizeAndPosition = true
                    });
                end);
            end;
        end);
        v24.instanceRemoved = l_CollectionService_0:GetInstanceRemovedSignal(v5.TAG_NAME):Connect(function(v29) --[[ Line: 94 ]]
            -- upvalues: v24 (ref)
            local v30 = v24[v29];
            if v30 then
                v30:Disconnect();
            end;
            v24[v29] = nil;
        end);
        return function() --[[ Line: 103 ]]
            -- upvalues: v24 (ref)
            for _, v32 in v24 do
                v32:Disconnect();
            end;
            v24 = {};
        end;
    end, {});
end;
return {
    useUnifiedEventListener = function() --[[ Line: 113 ]]
        -- upvalues: l_useSelectorSignal_0 (copy), v21 (copy), l_selectSearchKeyword_0 (copy), l_useAvatarRoute_0 (copy), v2 (copy), l_CollectionService_0 (copy), v5 (copy), v19 (copy), v15 (copy), v3 (copy), l_AvatarScreenProperties_0 (copy), v4 (copy)
        local v34 = l_useSelectorSignal_0(v21);
        local v35 = l_useSelectorSignal_0(l_selectSearchKeyword_0);
        local v36 = l_useAvatarRoute_0();
        local v37 = v2.useRef(v36);
        v2.useEffect(function() --[[ Line: 119 ]]
            -- upvalues: v37 (copy), v36 (copy)
            v37.current = v36;
        end, {
            v36
        });
        local v38 = {
            getAnalyticsMetadata = v34, 
            getSearchKeyword = v35
        };
        v2.useEffect(function() --[[ Line: 50 ]]
            -- upvalues: l_CollectionService_0 (ref), v5 (ref), v19 (ref), v15 (ref), v38 (copy), v3 (ref), v37 (copy), l_AvatarScreenProperties_0 (ref), v4 (ref)
            local v39 = {};
            v39.instanceAdded = l_CollectionService_0:GetInstanceAddedSignal(v5.TAG_NAME):Connect(function(v40) --[[ Line: 58 ]]
                -- upvalues: v19 (ref), v5 (ref), v15 (ref), v38 (ref), v3 (ref), v37 (ref), l_AvatarScreenProperties_0 (ref), v4 (ref), v39 (ref)
                local v41 = v19(v40);
                if v41 then
                    v39[v40] = v41.Activated:Connect(function() --[[ Line: 61 ]]
                        -- upvalues: v40 (copy), v5 (ref), v15 (ref), v38 (ref), v3 (ref), v37 (ref), l_AvatarScreenProperties_0 (ref), v4 (ref)
                        if v40:GetAttributes()[v5.HAS_DEFERRED_ACTION] then
                            v15(v40);
                        end;
                        local v42 = {};
                        if v38 then
                            v42 = v3.Dictionary.join(v38.getAnalyticsMetadata(false), {
                                keyword = v38.getSearchKeyword(false)
                            });
                        end;
                        if v37 and v37.current and v37.current.current then
                            local v43 = l_AvatarScreenProperties_0[v37.current.opaque.name];
                            if v43 and v43.analyticsData then
                                v42.surface = v43.analyticsData.unifiedLoggingSurface;
                            end;
                        end;
                        v4(v40, v42, {
                            includeScreenSize = true, 
                            includeElementSizeAndPosition = true
                        });
                    end);
                end;
            end);
            v39.instanceRemoved = l_CollectionService_0:GetInstanceRemovedSignal(v5.TAG_NAME):Connect(function(v44) --[[ Line: 94 ]]
                -- upvalues: v39 (ref)
                local v45 = v39[v44];
                if v45 then
                    v45:Disconnect();
                end;
                v39[v44] = nil;
            end);
            return function() --[[ Line: 103 ]]
                -- upvalues: v39 (ref)
                for _, v47 in v39 do
                    v47:Disconnect();
                end;
                v39 = {};
            end;
        end, {});
    end, 
    useUnifiedEventListenerInExperience = function() --[[ Line: 129 ]]
        -- upvalues: v2 (copy), l_CollectionService_0 (copy), v5 (copy), v19 (copy), v15 (copy), v3 (copy), l_AvatarScreenProperties_0 (copy), v4 (copy)
        local l_useEffect_0 = v2.useEffect;
        local v49 = nil;
        local v50 = nil;
        l_useEffect_0(function() --[[ Line: 50 ]]
            -- upvalues: l_CollectionService_0 (ref), v5 (ref), v19 (ref), v15 (ref), v49 (copy), v3 (ref), v50 (copy), l_AvatarScreenProperties_0 (ref), v4 (ref)
            local v51 = {};
            v51.instanceAdded = l_CollectionService_0:GetInstanceAddedSignal(v5.TAG_NAME):Connect(function(v52) --[[ Line: 58 ]]
                -- upvalues: v19 (ref), v5 (ref), v15 (ref), v49 (ref), v3 (ref), v50 (ref), l_AvatarScreenProperties_0 (ref), v4 (ref), v51 (ref)
                local v53 = v19(v52);
                if v53 then
                    v51[v52] = v53.Activated:Connect(function() --[[ Line: 61 ]]
                        -- upvalues: v52 (copy), v5 (ref), v15 (ref), v49 (ref), v3 (ref), v50 (ref), l_AvatarScreenProperties_0 (ref), v4 (ref)
                        if v52:GetAttributes()[v5.HAS_DEFERRED_ACTION] then
                            v15(v52);
                        end;
                        local v54 = {};
                        if v49 then
                            v54 = v3.Dictionary.join(v49.getAnalyticsMetadata(false), {
                                keyword = v49.getSearchKeyword(false)
                            });
                        end;
                        if v50 and v50.current and v50.current.current then
                            local v55 = l_AvatarScreenProperties_0[v50.current.opaque.name];
                            if v55 and v55.analyticsData then
                                v54.surface = v55.analyticsData.unifiedLoggingSurface;
                            end;
                        end;
                        v4(v52, v54, {
                            includeScreenSize = true, 
                            includeElementSizeAndPosition = true
                        });
                    end);
                end;
            end);
            v51.instanceRemoved = l_CollectionService_0:GetInstanceRemovedSignal(v5.TAG_NAME):Connect(function(v56) --[[ Line: 94 ]]
                -- upvalues: v51 (ref)
                local v57 = v51[v56];
                if v57 then
                    v57:Disconnect();
                end;
                v51[v56] = nil;
            end);
            return function() --[[ Line: 103 ]]
                -- upvalues: v51 (ref)
                for _, v59 in v51 do
                    v59:Disconnect();
                end;
                v51 = {};
            end;
        end, {});
    end
};