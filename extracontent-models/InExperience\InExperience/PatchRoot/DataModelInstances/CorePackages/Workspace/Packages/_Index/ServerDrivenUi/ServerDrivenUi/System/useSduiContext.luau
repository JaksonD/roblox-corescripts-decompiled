local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_CollectionItemSize_0 = require(l_Parent_0.CollectionViews).CollectionViewTypes.CollectionItemSize;
local v4 = require(l_Parent_0.Signals);
local v5 = require(l_Parent_0.SduiCoreSystem);
local v6 = require(l_script_FirstAncestor_0.System.SduiComponentDefinitions);
local l_SduiInstrumentation_0 = v5.SduiInstrumentation;
local l_SduiLogger_0 = v5.SduiLogger;
local l_SduiTemplateRegistry_0 = v5.SduiTemplateRegistry;
local v10 = require(l_script_FirstAncestor_0.DataStore.useSduiDataStore);
local l_SduiErrors_0 = v5.SduiErrors;
local l_FFlagLuaAppLayoutParamsInContext_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLayoutParamsInContext;
local v13 = {
    numColumns = 3, 
    fractionalItemAmount = 0, 
    columnGap = 24, 
    sideMargin = 24, 
    verticalPadding = 16
};
local v14 = require(l_script_FirstAncestor_0.System.useSduiDependencies);
return function(v15) --[[ Line: 52 ]] --[[ Name: useSduiContext ]]
    -- upvalues: v2 (copy), l_SduiInstrumentation_0 (copy), v14 (copy), v6 (copy), l_SduiTemplateRegistry_0 (copy), v10 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), v4 (copy), v13 (copy), l_CollectionItemSize_0 (copy), l_SduiLogger_0 (copy), l_SduiErrors_0 (copy)
    local v16 = v2.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: l_SduiInstrumentation_0 (ref)
        return l_SduiInstrumentation_0.new();
    end, {});
    v16:startTimerFlow("useSduiContext");
    local v17 = v14(v16);
    local v18 = v2.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: v15 (copy), v6 (ref)
        return v15.componentDefinitions or v6.new();
    end, {
        v15.componentDefinitions
    });
    local v19 = v2.useMemo(function() --[[ Line: 66 ]]
        -- upvalues: l_SduiTemplateRegistry_0 (ref), v15 (copy)
        return l_SduiTemplateRegistry_0.new(v15.templates);
    end, {
        v15.templates
    });
    local v20 = v10();
    local v21 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local v22 = v2.useMemo(function() --[[ Line: 74 ]]
            -- upvalues: v4 (ref), v13 (ref)
            return v4.createSignal(v13);
        end, {});
        local l_v22_0 = v22 --[[ copy: 7 -> 8 ]];
        v21 = v2.useCallback(function(v24) --[[ Line: 78 ]]
            -- upvalues: v4 (ref), v15 (copy), l_CollectionItemSize_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), l_v22_0 (copy)
            return v4.createComputed(function(v25) --[[ Line: 79 ]]
                -- upvalues: v15 (ref), v24 (copy), l_CollectionItemSize_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), l_v22_0 (ref)
                if v15.pageLayoutConfig then
                    return (v15.pageLayoutConfig[v24] or v15.pageLayoutConfig[l_CollectionItemSize_0.Small])(v25);
                else
                    l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.NoPageLayoutConfig, {
                        message = ("No page layout config available for %*, returning default config"):format(v15.appPage)
                    }, v15.appPage);
                    return (l_v22_0(v25));
                end;
            end);
        end, {
            v15.pageLayoutConfig
        });
    end;
    local v27 = v2.useMemo(function() --[[ Line: 96 ]]
        -- upvalues: v17 (copy), v15 (copy), v18 (copy), v19 (copy), v20 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (ref), v21 (ref)
        local v26 = {
            dependencies = v17, 
            appPage = v15.appPage, 
            dataUpdatedTimestamp = v15.dataUpdatedTimestamp, 
            componentDefinitions = v18, 
            templateRegistry = v19, 
            dataStore = v20, 
            getPageLayoutConfig = if l_FFlagLuaAppLayoutParamsInContext_0 then v21 else nil
        };
        setmetatable(v26, {
            __tostring = function() --[[ Line: 108 ]] --[[ Name: __tostring ]]
                return "SduiContext";
            end
        });
        return v26;
    end, {
        v17, 
        v15.appPage, 
        v15.dataUpdatedTimestamp, 
        v18, 
        v19, 
        v20, 
        if l_FFlagLuaAppLayoutParamsInContext_0 then v21 else nil
    });
    v16:stopTimerFlow("useSduiContext", v27);
    return v27;
end;