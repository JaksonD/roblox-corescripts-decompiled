local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CollectionService_0 = game:GetService("CollectionService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(script.Parent.sendUnifiedEventLogForInstance);
local v6 = require(script.Parent.UnifiedEventLogConstants);
local v7 = require(l_script_FirstAncestor_0.Store.UnifiedSelectionListStore);
local v8 = require(l_script_FirstAncestor_0.Lib.CartIdService);
local v9 = require(l_Parent_0.AvatarExperienceCommon);
local l_useSelectorSignal_0 = v9.Hooks.useSelectorSignal;
local l_selectSearchKeyword_0 = v9.State.Selectors.selectSearchKeyword;
local v12 = require(l_Parent_0.AvatarExperienceNavigation);
local l_useAvatarRoute_0 = v12.AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreenProperties_0 = v12.AvatarRoute.AvatarScreenProperties;
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents;
local function v19(v16) --[[ Line: 21 ]] --[[ Name: markLastActivated ]]
    -- upvalues: l_CollectionService_0 (copy), v6 (copy)
    for _, v18 in (l_CollectionService_0:GetTagged(v6.LAST_ACTIVATED_TAG_NAME)) do
        l_CollectionService_0:RemoveTag(v18, v6.LAST_ACTIVATED_TAG_NAME);
    end;
    l_CollectionService_0:AddTag(v16, v6.LAST_ACTIVATED_TAG_NAME);
end;
local function _(v20, v21) --[[ Line: 32 ]] --[[ Name: markSelectionListStatus ]]
    -- upvalues: v7 (copy)
    local l_v20_Attributes_0 = v20:GetAttributes();
    if v21 then
        v7.removeFromSelectionList(l_v20_Attributes_0);
        return;
    else
        v7.addToSelectionList(l_v20_Attributes_0);
        return;
    end;
end;
local function v27(v24) --[[ Line: 44 ]] --[[ Name: getChildButton ]]
    if not v24 then
        return nil;
    elseif v24:IsA("TextButton") or v24:IsA("ImageButton") or v24:IsA("GuiButton") then
        return v24;
    else
        for _, _ in v24:GetDescendants() do
            if v24:IsA("TextButton") or v24:IsA("ImageButton") or v24:IsA("GuiButton") then
                return v24;
            end;
        end;
        return nil;
    end;
end;
local function v29(v28) --[[ Line: 62 ]] --[[ Name: AnalyticsMetadataSelector ]]
    return v28.AvatarExperience.AnalyticsMetadata;
end;
local _ = function(v30, v31) --[[ Line: 66 ]]
    -- upvalues: v3 (copy), l_CollectionService_0 (copy), v6 (copy), v27 (copy), v19 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), v7 (copy), v4 (copy), l_AvatarScreenProperties_0 (copy), v8 (copy), v5 (copy)
    v3.useEffect(function() --[[ Line: 67 ]]
        -- upvalues: l_CollectionService_0 (ref), v6 (ref), v27 (ref), v19 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), v7 (ref), v30 (copy), v4 (ref), v31 (copy), l_AvatarScreenProperties_0 (ref), v8 (ref), v5 (ref)
        local v32 = {};
        v32.instanceAdded = l_CollectionService_0:GetInstanceAddedSignal(v6.TAG_NAME):Connect(function(v33) --[[ Line: 75 ]]
            -- upvalues: v27 (ref), v6 (ref), v19 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), v7 (ref), v30 (ref), v4 (ref), v31 (ref), l_AvatarScreenProperties_0 (ref), v8 (ref), v5 (ref), v32 (ref)
            local v34 = v27(v33);
            if v34 then
                v32[v33] = v34.Activated:Connect(function() --[[ Line: 78 ]]
                    -- upvalues: v33 (copy), v6 (ref), v19 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), v7 (ref), v30 (ref), v4 (ref), v31 (ref), l_AvatarScreenProperties_0 (ref), v8 (ref), v5 (ref)
                    local l_v33_Attributes_0 = v33:GetAttributes();
                    if l_v33_Attributes_0[v6.HAS_DEFERRED_ACTION] then
                        v19(v33);
                    end;
                    if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 and l_v33_Attributes_0[v6.HAS_DEFERRED_ACTION] and l_v33_Attributes_0[v6.IS_SELECTED] ~= nil then
                        local l_v33_0 = v33;
                        local v37 = l_v33_Attributes_0[v6.IS_SELECTED];
                        local l_l_v33_0_Attributes_0 = l_v33_0:GetAttributes();
                        if v37 then
                            v7.removeFromSelectionList(l_l_v33_0_Attributes_0);
                        else
                            v7.addToSelectionList(l_l_v33_0_Attributes_0);
                        end;
                    end;
                    local v39 = {};
                    if v30 then
                        v39 = v4.Dictionary.join(v30.getAnalyticsMetadata(false), {
                            keyword = v30.getSearchKeyword(false)
                        });
                    end;
                    if v31 and v31.current and v31.current.current then
                        local v40 = l_AvatarScreenProperties_0[v31.current.opaque.name];
                        if v40 and v40.analyticsData then
                            v39.surface = v40.analyticsData.unifiedLoggingSurface;
                        end;
                    end;
                    if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 and l_v33_Attributes_0[v6.HAS_DEFERRED_ACTION] then
                        v39.cartId = v8.getCartId();
                    end;
                    v5(v33, v39, {
                        includeScreenSize = true, 
                        includeElementSizeAndPosition = true
                    });
                end);
            end;
        end);
        v32.instanceRemoved = l_CollectionService_0:GetInstanceRemovedSignal(v6.TAG_NAME):Connect(function(v41) --[[ Line: 128 ]]
            -- upvalues: v32 (ref)
            local v42 = v32[v41];
            if v42 then
                v42:Disconnect();
            end;
            v32[v41] = nil;
        end);
        return function() --[[ Line: 137 ]]
            -- upvalues: v32 (ref)
            for _, v44 in v32 do
                v44:Disconnect();
            end;
            v32 = {};
        end;
    end, {});
end;
return {
    useUnifiedEventListener = function() --[[ Line: 147 ]]
        -- upvalues: l_useSelectorSignal_0 (copy), v29 (copy), l_selectSearchKeyword_0 (copy), l_useAvatarRoute_0 (copy), v3 (copy), l_CollectionService_0 (copy), v6 (copy), v27 (copy), v19 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), v7 (copy), v4 (copy), l_AvatarScreenProperties_0 (copy), v8 (copy), v5 (copy)
        local v46 = l_useSelectorSignal_0(v29);
        local v47 = l_useSelectorSignal_0(l_selectSearchKeyword_0);
        local v48 = l_useAvatarRoute_0();
        local v49 = v3.useRef(v48);
        v3.useEffect(function() --[[ Line: 153 ]]
            -- upvalues: v49 (copy), v48 (copy)
            v49.current = v48;
        end, {
            v48
        });
        local v50 = {
            getAnalyticsMetadata = v46, 
            getSearchKeyword = v47
        };
        v3.useEffect(function() --[[ Line: 67 ]]
            -- upvalues: l_CollectionService_0 (ref), v6 (ref), v27 (ref), v19 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), v7 (ref), v50 (copy), v4 (ref), v49 (copy), l_AvatarScreenProperties_0 (ref), v8 (ref), v5 (ref)
            local v51 = {};
            v51.instanceAdded = l_CollectionService_0:GetInstanceAddedSignal(v6.TAG_NAME):Connect(function(v52) --[[ Line: 75 ]]
                -- upvalues: v27 (ref), v6 (ref), v19 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), v7 (ref), v50 (ref), v4 (ref), v49 (ref), l_AvatarScreenProperties_0 (ref), v8 (ref), v5 (ref), v51 (ref)
                local v53 = v27(v52);
                if v53 then
                    v51[v52] = v53.Activated:Connect(function() --[[ Line: 78 ]]
                        -- upvalues: v52 (copy), v6 (ref), v19 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), v7 (ref), v50 (ref), v4 (ref), v49 (ref), l_AvatarScreenProperties_0 (ref), v8 (ref), v5 (ref)
                        local l_v52_Attributes_0 = v52:GetAttributes();
                        if l_v52_Attributes_0[v6.HAS_DEFERRED_ACTION] then
                            v19(v52);
                        end;
                        if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 and l_v52_Attributes_0[v6.HAS_DEFERRED_ACTION] and l_v52_Attributes_0[v6.IS_SELECTED] ~= nil then
                            local l_v52_0 = v52;
                            local v56 = l_v52_Attributes_0[v6.IS_SELECTED];
                            local l_l_v52_0_Attributes_0 = l_v52_0:GetAttributes();
                            if v56 then
                                v7.removeFromSelectionList(l_l_v52_0_Attributes_0);
                            else
                                v7.addToSelectionList(l_l_v52_0_Attributes_0);
                            end;
                        end;
                        local v58 = {};
                        if v50 then
                            v58 = v4.Dictionary.join(v50.getAnalyticsMetadata(false), {
                                keyword = v50.getSearchKeyword(false)
                            });
                        end;
                        if v49 and v49.current and v49.current.current then
                            local v59 = l_AvatarScreenProperties_0[v49.current.opaque.name];
                            if v59 and v59.analyticsData then
                                v58.surface = v59.analyticsData.unifiedLoggingSurface;
                            end;
                        end;
                        if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 and l_v52_Attributes_0[v6.HAS_DEFERRED_ACTION] then
                            v58.cartId = v8.getCartId();
                        end;
                        v5(v52, v58, {
                            includeScreenSize = true, 
                            includeElementSizeAndPosition = true
                        });
                    end);
                end;
            end);
            v51.instanceRemoved = l_CollectionService_0:GetInstanceRemovedSignal(v6.TAG_NAME):Connect(function(v60) --[[ Line: 128 ]]
                -- upvalues: v51 (ref)
                local v61 = v51[v60];
                if v61 then
                    v61:Disconnect();
                end;
                v51[v60] = nil;
            end);
            return function() --[[ Line: 137 ]]
                -- upvalues: v51 (ref)
                for _, v63 in v51 do
                    v63:Disconnect();
                end;
                v51 = {};
            end;
        end, {});
    end, 
    useUnifiedEventListenerInExperience = function() --[[ Line: 163 ]]
        -- upvalues: v3 (copy), l_CollectionService_0 (copy), v6 (copy), v27 (copy), v19 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), v7 (copy), v4 (copy), l_AvatarScreenProperties_0 (copy), v8 (copy), v5 (copy)
        local l_useEffect_0 = v3.useEffect;
        local v65 = nil;
        local v66 = nil;
        l_useEffect_0(function() --[[ Line: 67 ]]
            -- upvalues: l_CollectionService_0 (ref), v6 (ref), v27 (ref), v19 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), v7 (ref), v65 (copy), v4 (ref), v66 (copy), l_AvatarScreenProperties_0 (ref), v8 (ref), v5 (ref)
            local v67 = {};
            v67.instanceAdded = l_CollectionService_0:GetInstanceAddedSignal(v6.TAG_NAME):Connect(function(v68) --[[ Line: 75 ]]
                -- upvalues: v27 (ref), v6 (ref), v19 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), v7 (ref), v65 (ref), v4 (ref), v66 (ref), l_AvatarScreenProperties_0 (ref), v8 (ref), v5 (ref), v67 (ref)
                local v69 = v27(v68);
                if v69 then
                    v67[v68] = v69.Activated:Connect(function() --[[ Line: 78 ]]
                        -- upvalues: v68 (copy), v6 (ref), v19 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), v7 (ref), v65 (ref), v4 (ref), v66 (ref), l_AvatarScreenProperties_0 (ref), v8 (ref), v5 (ref)
                        local l_v68_Attributes_0 = v68:GetAttributes();
                        if l_v68_Attributes_0[v6.HAS_DEFERRED_ACTION] then
                            v19(v68);
                        end;
                        if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 and l_v68_Attributes_0[v6.HAS_DEFERRED_ACTION] and l_v68_Attributes_0[v6.IS_SELECTED] ~= nil then
                            local l_v68_0 = v68;
                            local v72 = l_v68_Attributes_0[v6.IS_SELECTED];
                            local l_l_v68_0_Attributes_0 = l_v68_0:GetAttributes();
                            if v72 then
                                v7.removeFromSelectionList(l_l_v68_0_Attributes_0);
                            else
                                v7.addToSelectionList(l_l_v68_0_Attributes_0);
                            end;
                        end;
                        local v74 = {};
                        if v65 then
                            v74 = v4.Dictionary.join(v65.getAnalyticsMetadata(false), {
                                keyword = v65.getSearchKeyword(false)
                            });
                        end;
                        if v66 and v66.current and v66.current.current then
                            local v75 = l_AvatarScreenProperties_0[v66.current.opaque.name];
                            if v75 and v75.analyticsData then
                                v74.surface = v75.analyticsData.unifiedLoggingSurface;
                            end;
                        end;
                        if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 and l_v68_Attributes_0[v6.HAS_DEFERRED_ACTION] then
                            v74.cartId = v8.getCartId();
                        end;
                        v5(v68, v74, {
                            includeScreenSize = true, 
                            includeElementSizeAndPosition = true
                        });
                    end);
                end;
            end);
            v67.instanceRemoved = l_CollectionService_0:GetInstanceRemovedSignal(v6.TAG_NAME):Connect(function(v76) --[[ Line: 128 ]]
                -- upvalues: v67 (ref)
                local v77 = v67[v76];
                if v77 then
                    v77:Disconnect();
                end;
                v67[v76] = nil;
            end);
            return function() --[[ Line: 137 ]]
                -- upvalues: v67 (ref)
                for _, v79 in v67 do
                    v79:Disconnect();
                end;
                v67 = {};
            end;
        end, {});
    end
};