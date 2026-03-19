local l_Parent_0 = script:FindFirstAncestor("SduiSharedUtilities").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_Parent_0.SduiCoreSystem);
local l_SduiLogger_0 = v3.SduiLogger;
local l_SduiErrors_0 = v3.SduiErrors;
local l_useCollectionLayoutConfig_0 = require(l_Parent_0.CollectionViews).useCollectionLayoutConfig;
local l_getSduiServiceDependenciesStore_0 = v3.getSduiServiceDependenciesStore;
local l_CollectionItemSize_0 = require(l_Parent_0.CollectionViews).CollectionViewTypes.CollectionItemSize;
local l_FFlagSduiCoreBadgeDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiCoreBadgeDetailsSupport;
local v10 = {
    numColumns = 3, 
    fractionalItemAmount = 0, 
    columnGap = 24, 
    sideMargin = 24, 
    verticalPadding = 16
};
return function(v11, v12, v13) --[[ Line: 40 ]] --[[ Name: useCreateClientBindingSduiContext ]]
    -- upvalues: l_useCollectionLayoutConfig_0 (copy), l_FFlagSduiCoreBadgeDetailsSupport_0 (copy), v1 (copy), v2 (copy), v10 (copy), l_CollectionItemSize_0 (copy), l_SduiLogger_0 (copy), l_SduiErrors_0 (copy), l_getSduiServiceDependenciesStore_0 (copy)
    local v14 = l_useCollectionLayoutConfig_0(v12, if l_FFlagSduiCoreBadgeDetailsSupport_0 then v13 else nil);
    local v15 = nil;
    local v16 = v1.useMemo(function() --[[ Line: 50 ]]
        -- upvalues: v2 (ref), v10 (ref)
        return v2.createSignal(v10);
    end, {});
    v15 = v1.useCallback(function(v17) --[[ Line: 55 ]]
        -- upvalues: v2 (ref), v14 (copy), l_CollectionItemSize_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), v11 (copy), v16 (copy)
        return v2.createComputed(function(v18) --[[ Line: 56 ]]
            -- upvalues: v14 (ref), v17 (copy), l_CollectionItemSize_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), v11 (ref), v16 (ref)
            if v14 then
                return (v14[v17] or v14[l_CollectionItemSize_0.Small])(v18);
            else
                l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.NoPageLayoutConfig, {
                    message = ("No page layout config available for %*, returning default config"):format(v11)
                }, v11);
                return (v16(v18));
            end;
        end);
    end, {
        v14
    });
    return (v1.useMemo(function() --[[ Line: 74 ]]
        -- upvalues: l_getSduiServiceDependenciesStore_0 (ref), v11 (copy), v15 (ref)
        return {
            dependencies = l_getSduiServiceDependenciesStore_0().getDependencies(v11), 
            appPage = v11, 
            getPageLayoutConfig = v15
        };
    end, {
        v11, 
        v15
    }));
end;