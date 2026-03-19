local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.tutils);
local v4 = require(l_Parent_0.RoactUtils);
local _ = require(l_Parent_0.CollectionViews);
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local v7 = require(l_script_FirstAncestor_0.Rodux.SduiConfigReducer);
local v8 = require(l_script_FirstAncestor_0.System.useSduiContext);
local v9 = require(l_script_FirstAncestor_0.DataStore.getSduiFeedStore);
local v10 = require(l_script_FirstAncestor_0.System.processCollectionConfig);
local v11 = require(l_script_FirstAncestor_0.DataStore.getItemCollectionKey);
local _ = require(l_Parent_0.SduiCoreSystem);
local l_FFlagLuaAppLayoutParamsInContext_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLayoutParamsInContext;
local l_FFlagLuaAppUseEffectInSignalPreprocessing_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUseEffectInSignalPreprocessing;
return function(v15, v16, v17) --[[ Line: 26 ]] --[[ Name: useSduiContextFromRoduxAndProcessConfigs ]]
    -- upvalues: l_useSelector_0 (copy), v7 (copy), v3 (copy), v8 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_FFlagLuaAppUseEffectInSignalPreprocessing_0 (copy), v2 (copy), v9 (copy), v11 (copy), v10 (copy)
    local v18 = v17 or v15;
    local v22 = l_useSelector_0(function(v19) --[[ Line: 33 ]]
        -- upvalues: v7 (ref), v18 (copy)
        local v20 = {};
        local v21 = v19.Personalization[v7.key][v18];
        if v21 then
            v20.templates = v21.rootConfig and v21.rootConfig.templates or nil;
            v20.dataUpdatedTimestamp = v21.dataUpdatedTimestamp;
            v20.itemCollections = v21.itemCollections;
        end;
        return v20;
    end, v3.shallowEqual);
    local v23 = v8({
        appPage = v15, 
        templates = v22.templates, 
        dataUpdatedTimestamp = v22.dataUpdatedTimestamp, 
        pageLayoutConfig = if l_FFlagLuaAppLayoutParamsInContext_0 then v16 else nil
    });
    (if l_FFlagLuaAppUseEffectInSignalPreprocessing_0 then v2.useEffect else v2.useLayoutEffect)(function() --[[ Line: 55 ]]
        -- upvalues: v9 (ref), v18 (copy), v22 (copy), v11 (ref), v10 (ref), v23 (copy)
        local v24 = v9(v18);
        local v25 = {};
        if v22.itemCollections then
            for _, v27 in v22.itemCollections do
                v25[v11(v27.topicId, v27.sortIndex)] = {
                    sduiConfig = v10(v27.sduiConfig, v27.topicId, v23), 
                    dataUpdatedTimestamp = v27.dataUpdatedTimestamp
                };
            end;
            v24.updateData({
                templates = v22.templates, 
                itemCollections = v25, 
                dataUpdatedTimestamp = v22.dataUpdatedTimestamp
            });
        end;
        return function() --[[ Line: 73 ]]

        end;
    end, {
        v23, 
        v22.itemCollections, 
        v22.templates, 
        v22.dataUpdatedTimestamp, 
        v18
    });
    return v23;
end;