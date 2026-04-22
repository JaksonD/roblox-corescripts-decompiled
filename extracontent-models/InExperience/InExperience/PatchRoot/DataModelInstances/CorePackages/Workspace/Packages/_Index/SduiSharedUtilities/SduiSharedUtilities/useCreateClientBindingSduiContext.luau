local l_Parent_0 = script:FindFirstAncestor("SduiSharedUtilities").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_Parent_0.SduiCoreSystem);
local l_SduiLogger_0 = v3.SduiLogger;
local l_SduiErrors_0 = v3.SduiErrors;
local l_useCollectionLayoutConfig_0 = require(l_Parent_0.CollectionViews).useCollectionLayoutConfig;
local l_getSduiServiceDependenciesStore_0 = v3.getSduiServiceDependenciesStore;
local l_CollectionItemSize_0 = require(l_Parent_0.CollectionViews).CollectionViewTypes.CollectionItemSize;
local v9 = require(l_Parent_0.SharedFlags);
local l_FFlagSduiCoreBadgeDetailsSupport_0 = v9.FFlagSduiCoreBadgeDetailsSupport;
local l_FFlagLuaAppCompositionSduiEnabled_0 = v9.FFlagLuaAppCompositionSduiEnabled;
local l_FFlagLuaAppCompositionAlways_0 = v9.FFlagLuaAppCompositionAlways;
local l_FFlagSduiChartsSupport_0 = v9.FFlagSduiChartsSupport;
local v14 = {
    numColumns = 3, 
    fractionalItemAmount = 0, 
    columnGap = 24, 
    sideMargin = 24, 
    verticalPadding = 16
};
return function(v15, v16, v17, v18) --[[ Line: 42 ]] --[[ Name: useCreateClientBindingSduiContext ]]
    -- upvalues: l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSduiEnabled_0 (copy), v1 (copy), v2 (copy), v14 (copy), l_useCollectionLayoutConfig_0 (copy), l_FFlagSduiCoreBadgeDetailsSupport_0 (copy), l_CollectionItemSize_0 (copy), l_SduiLogger_0 (copy), l_SduiErrors_0 (copy), l_getSduiServiceDependenciesStore_0 (copy), l_FFlagSduiChartsSupport_0 (copy)
    local v19 = nil;
    local v20 = nil;
    if not l_FFlagLuaAppCompositionAlways_0 then
        if l_FFlagLuaAppCompositionSduiEnabled_0 then
            v20 = v1.useCallback(function(_) --[[ Line: 55 ]]
                -- upvalues: v2 (ref), v14 (ref)
                return v2.createComputed(function(_) --[[ Line: 56 ]]
                    -- upvalues: v14 (ref)
                    return v14;
                end);
            end, {});
        else
            v19 = l_useCollectionLayoutConfig_0(v16, if l_FFlagSduiCoreBadgeDetailsSupport_0 then v17 else nil);
            v20 = v1.useCallback(function(v23) --[[ Line: 65 ]]
                -- upvalues: v2 (ref), v19 (ref), l_CollectionItemSize_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), v15 (copy), v14 (ref)
                return v2.createComputed(function(v24) --[[ Line: 66 ]]
                    -- upvalues: v19 (ref), v23 (copy), l_CollectionItemSize_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), v15 (ref), v14 (ref)
                    if v19 then
                        return (v19[v23] or v19[l_CollectionItemSize_0.Small])(v24);
                    else
                        l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.NoPageLayoutConfig, {
                            message = ("No page layout config available for %*, returning default config"):format(v15)
                        }, v15);
                        return v14;
                    end;
                end);
            end, {
                v19, 
                v15
            });
        end;
    end;
    return (v1.useMemo(function() --[[ Line: 84 ]]
        -- upvalues: l_getSduiServiceDependenciesStore_0 (ref), v15 (copy), v20 (ref), l_FFlagLuaAppCompositionSduiEnabled_0 (ref), l_FFlagSduiChartsSupport_0 (ref), v18 (copy)
        return {
            dependencies = l_getSduiServiceDependenciesStore_0().getDependencies(v15), 
            appPage = v15, 
            getPageLayoutConfig = v20, 
            appCompositionEnabled = l_FFlagLuaAppCompositionSduiEnabled_0 and true or nil, 
            dataUpdatedTimestamp = if l_FFlagSduiChartsSupport_0 then v18 else nil
        };
    end, {
        v15, 
        v20, 
        if l_FFlagSduiChartsSupport_0 then v18 else nil
    }));
end;