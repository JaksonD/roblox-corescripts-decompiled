local l_IXPService_0 = game:GetService("IXPService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local l_Symbol_0 = require(l_Parent_0.AppCommonLib).Symbol;
local v4 = require(l_Parent_0.Dash);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.RoactAppExperiment);
local l_useUserExperiment_0 = v6.useUserExperiment;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local v9 = require(l_Parent_0.AppDebug).LogTree.logger("ax.ixp");
local v10 = l_Symbol_0.named("NO_VALUE");
local l_l_IXPService_0_0 = l_IXPService_0;
local l_connectUserLayer_0 = v6.connectUserLayer;
local l_default_0 = l_ExperimentCacheManager_0.default;
local v18 = {
    defineIXPTest = function(v14) --[[ Line: 203 ]] --[[ Name: defineIXPTest ]]
        -- upvalues: v9 (copy), v10 (copy)
        local v15 = {
            name = v14.name, 
            layer = v14.layer, 
            recordExposure = if v14.recordExposure then v14.recordExposure else false, 
            getIsUserInExperiment = v14.getIsUserInExperiment, 
            isEnabled = function() --[[ Line: 213 ]] --[[ Name: isEnabled ]]
                -- upvalues: v14 (copy)
                return v14.getDependentFlagsEnabled() and (v14.getEnabledFlag() or v14.getEnabledForAllFlag());
            end, 
            isEnabledForAll = function() --[[ Line: 218 ]] --[[ Name: isEnabledForAll ]]
                -- upvalues: v14 (copy)
                return v14.getDependentFlagsEnabled() and v14.getEnabledForAllFlag();
            end
        };
        v9:info("[Define IXP Test] {}, layer: {}, isEnabled: {}, isEnabledForAll: {}", v15.name, v15.layer, v15.isEnabled(), v15.isEnabledForAll());
        for v16, v17 in v14.variables do
            v15[v16] = {
                name = v16, 
                ixpTest = v15, 
                mapLayerToValue = v17, 
                lastValue = v10
            };
        end;
        return v15;
    end
};
local function v20(v19) --[[ Line: 245 ]] --[[ Name: readLayerVariablesForTest ]]
    -- upvalues: l_l_IXPService_0_0 (ref), l_default_0 (ref)
    v19.usedExperimentCacheManager = v19.usedExperimentCacheManager or l_l_IXPService_0_0:GetUserStatusForLayer(v19.layer) ~= Enum.IXPLoadingStatus.Initialized;
    return (if v19.usedExperimentCacheManager then l_default_0:getLayerVariables(v19.layer) else l_l_IXPService_0_0:GetUserLayerVariables(v19.layer)) or {};
end;
local function v25(v21, v22) --[[ Line: 256 ]] --[[ Name: mapTestVariable ]]
    -- upvalues: v20 (copy), v9 (copy)
    local l_ixpTest_0 = v21.ixpTest;
    if not v22 then
        v22 = v20(l_ixpTest_0);
    end;
    local v24 = v21.mapLayerToValue(v22, l_ixpTest_0.isEnabledForAll());
    if v24 ~= v21.lastValue then
        v9:info("[Read IXP Variable] {} {} = {}", l_ixpTest_0.name, v21.name, v24);
        v21.lastValue = v24;
    end;
    return v24;
end;
local function _(v26, v27) --[[ Line: 269 ]] --[[ Name: accessLayer ]]
    if v26.usedExperimentCacheManager then
        return nil;
    else
        return v27[v26.layer];
    end;
end;
local function v38(v29, v30, v31) --[[ Line: 277 ]] --[[ Name: doConnectTestVariables ]]
    -- upvalues: l_connectUserLayer_0 (ref), v25 (copy)
    return l_connectUserLayer_0(v30, function(v32) --[[ Line: 282 ]]
        -- upvalues: v29 (copy), v25 (ref)
        local v33 = {};
        for v34, v35 in v29 do
            local l_ixpTest_1 = v35.ixpTest;
            if l_ixpTest_1.isEnabled() then
                local v37 = if l_ixpTest_1.usedExperimentCacheManager then nil else v32[l_ixpTest_1.layer];
                v33[v34] = v25(v35, v37);
            end;
        end;
        return v33;
    end, v31);
end;
v18.connectTestVariables = function(v39) --[[ Line: 309 ]] --[[ Name: connectTestVariables ]]
    -- upvalues: v4 (copy), v38 (copy)
    local v40 = {};
    local v41 = {};
    local v42 = {};
    local v43 = {};
    for v44, v45 in v39 do
        local l_ixpTest_2 = v45.ixpTest;
        if l_ixpTest_2.recordExposure then
            v41[l_ixpTest_2.layer] = true;
            v43[v44] = v45;
        else
            v40[l_ixpTest_2.layer] = true;
            v42[v44] = v45;
        end;
    end;
    local v47 = {};
    local v48 = v4.keys(v40);
    if #v48 > 0 then
        table.sort(v48);
        table.insert(v47, v38(v42, v48, false));
    end;
    local v49 = v4.keys(v41);
    if #v49 > 0 then
        table.sort(v49);
        table.insert(v47, v38(v43, v49, true));
    end;
    return v4.pipe(table.unpack(v47));
end;
v18.useTestVariables = function(...) --[[ Line: 351 ]] --[[ Name: useTestVariables ]]
    -- upvalues: v2 (copy), l_useUserExperiment_0 (copy), v25 (copy)
    local v50 = {
        ...
    };
    local v51 = nil;
    for _, v53 in v50 do
        if v51 then
            v2.assert(v53.ixpTest == v51, "All test variables passed to IXPUtils.useTestVariables must belong to same IXP test.");
        else
            v51 = v53.ixpTest;
        end;
    end;
    return l_useUserExperiment_0({
        v51.layer
    }, function(v54) --[[ Line: 365 ]]
        -- upvalues: v51 (ref), v50 (copy), v25 (ref)
        local l_v51_0 = v51;
        local v56 = if l_v51_0.usedExperimentCacheManager then nil else v54[l_v51_0.layer];
        l_v51_0 = {};
        for v57, v58 in v50 do
            if v51.isEnabled() then
                l_v51_0[v57] = v25(v58, v56);
            end;
        end;
        return table.unpack(l_v51_0);
    end, v51.recordExposure);
end;
local function _(v59, v60) --[[ Line: 379 ]] --[[ Name: readTestVariableImpl ]]
    -- upvalues: v25 (copy)
    local l_ixpTest_3 = v59.ixpTest;
    if not l_ixpTest_3.isEnabled() then
        return nil;
    else
        local v62 = if v60 then v60[l_ixpTest_3.layer] else nil;
        return (v25(v59, v62));
    end;
end;
v18.readTestVariable = function(v64) --[[ Line: 394 ]] --[[ Name: readTestVariable ]]
    -- upvalues: v20 (copy), v9 (copy)
    if not v64.ixpTest.isEnabled() then
        return nil;
    else
        local v65 = nil;
        local l_ixpTest_4 = v64.ixpTest;
        if not v65 then
            v65 = v20(l_ixpTest_4);
        end;
        local v67 = v64.mapLayerToValue(v65, l_ixpTest_4.isEnabledForAll());
        if v67 ~= v64.lastValue then
            v9:info("[Read IXP Variable] {} {} = {}", l_ixpTest_4.name, v64.name, v67);
            v64.lastValue = v67;
        end;
        return v67;
    end;
end;
v18.getFromLayers = function(v68, v69) --[[ Line: 404 ]] --[[ Name: getFromLayers ]]
    -- upvalues: v25 (copy)
    local l_ixpTest_5 = v69.ixpTest;
    if not l_ixpTest_5.isEnabled() then
        return nil;
    else
        local v71 = if v68 then v68[l_ixpTest_5.layer] else nil;
        return (v25(v69, v71));
    end;
end;
v18.logExposure = function(v72) --[[ Line: 408 ]] --[[ Name: logExposure ]]
    -- upvalues: v9 (copy), l_l_IXPService_0_0 (ref)
    v9:debug("LogUserLayerExposure: {}", v72.layer);
    l_l_IXPService_0_0:LogUserLayerExposure(v72.layer);
end;
v18.logLayerExposure = function(v73) --[[ Line: 413 ]] --[[ Name: logLayerExposure ]]
    -- upvalues: v9 (copy), l_l_IXPService_0_0 (ref)
    v9:debug("LogLayerExposure: {}", v73);
    l_l_IXPService_0_0:LogUserLayerExposure(v73);
end;
v18.logExperimentExposure = function(v74) --[[ Line: 422 ]] --[[ Name: logExperimentExposure ]]
    -- upvalues: v9 (copy), v20 (copy), l_l_IXPService_0_0 (ref)
    v9:debug("LogExperimentExposure: {}", v74.layer);
    if v74.isEnabled() and v74.getIsUserInExperiment and v74.getIsUserInExperiment((v20(v74))) then
        l_l_IXPService_0_0:LogUserLayerExposure(v74.layer);
        return true;
    else
        return false;
    end;
end;
v18.useLogExposureOnce = function(v75) --[[ Line: 440 ]] --[[ Name: useLogExposureOnce ]]
    -- upvalues: v5 (copy), v18 (copy)
    local v76 = v5.useRef(false);
    return v5.useCallback(function() --[[ Line: 443 ]]
        -- upvalues: v76 (copy), v18 (ref), v75 (copy)
        if not v76.current then
            v18.logExposure(v75);
            v76.current = true;
        end;
    end, {
        v75.layer
    });
end;
v18.setMocksForTesting = function(v77, v78, v79) --[[ Line: 451 ]] --[[ Name: setMocksForTesting ]]
    -- upvalues: l_l_IXPService_0_0 (ref), l_connectUserLayer_0 (ref), l_default_0 (ref)
    l_l_IXPService_0_0 = v77 or l_l_IXPService_0_0;
    l_connectUserLayer_0 = v78 or l_connectUserLayer_0;
    l_default_0 = v79 or l_default_0;
end;
v18.restoreDefaultsAfterTesting = function() --[[ Line: 457 ]] --[[ Name: restoreDefaultsAfterTesting ]]
    -- upvalues: l_l_IXPService_0_0 (ref), l_IXPService_0 (copy), l_connectUserLayer_0 (ref), v6 (copy), l_default_0 (ref), l_ExperimentCacheManager_0 (copy)
    l_l_IXPService_0_0 = l_IXPService_0;
    l_connectUserLayer_0 = v6.connectUserLayer;
    l_default_0 = l_ExperimentCacheManager_0.default;
end;
return v18;