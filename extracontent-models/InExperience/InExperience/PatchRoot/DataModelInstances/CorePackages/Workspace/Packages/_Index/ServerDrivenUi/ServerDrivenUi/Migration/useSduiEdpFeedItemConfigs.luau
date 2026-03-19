local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SduiCoreSystem);
local l_SduiComponent_0 = v3.SduiComponent;
local l_SduiErrors_0 = v3.SduiErrors;
local _ = require(l_Parent_0.Signals);
local v7 = require(l_Parent_0.SignalsReact);
local v8 = require(l_script_FirstAncestor_0.DataStore.getSduiFeedStore);
local _ = require(l_script_FirstAncestor_0.DataStore.SduiFeedStoreTypes);
local l_FFlagSduiGetItemCollectionKeys_0 = require(l_script_FirstAncestor_0.Flags).FFlagSduiGetItemCollectionKeys;
local function _(v11, v12, v13, v14, v15) --[[ Line: 26 ]] --[[ Name: getLayoutOrder ]]
    if v11 and v13[v11] then
        v15({
            layoutOrder = v11, 
            itemKey = v14, 
            existingComponent = v13[v11]
        });
        return v12;
    elseif v11 then
        return v11;
    else
        return v12;
    end;
end;
return function(v17) --[[ Line: 63 ]] --[[ Name: useSduiEdpFeedItemConfigs ]]
    -- upvalues: v2 (copy), v8 (copy), l_FFlagSduiGetItemCollectionKeys_0 (copy), v7 (copy), l_SduiErrors_0 (copy), l_SduiComponent_0 (copy)
    local v25 = v2.useMemo(function() --[[ Line: 64 ]]
        -- upvalues: v17 (copy), v8 (ref), l_FFlagSduiGetItemCollectionKeys_0 (ref)
        return function(v18) --[[ Line: 65 ]]
            -- upvalues: v17 (ref), v8 (ref), l_FFlagSduiGetItemCollectionKeys_0 (ref)
            if not v17.shouldInterleaveSdui then
                return {};
            else
                local v19 = v8(v17.storeKey);
                local v20 = if l_FFlagSduiGetItemCollectionKeys_0 and v19.getItemCollectionKeys then v19.getItemCollectionKeys(v18) else {};
                local v21 = {};
                for _, v23 in v20 do
                    local v24 = v19.getItemCollection(v23);
                    if v24 then
                        v21[v23] = v24(v18);
                    end;
                end;
                return v21;
            end;
        end;
    end, {
        v17.storeKey, 
        v17.shouldInterleaveSdui
    });
    local v26 = v7.useSignalState(v25);
    local v30 = v2.useMemo(function() --[[ Line: 88 ]]
        -- upvalues: v17 (copy)
        local v27 = {};
        if not v17.shouldInterleaveSdui then
            return v27;
        else
            for v28, v29 in v17.portraitLayoutConfig do
                v27[v29] = v28;
            end;
            return v27;
        end;
    end, {
        v17.portraitLayoutConfig, 
        v17.shouldInterleaveSdui
    });
    local v34 = v2.useMemo(function() --[[ Line: 99 ]]
        -- upvalues: v17 (copy)
        local v31 = {};
        if not v17.shouldInterleaveSdui then
            return v31;
        else
            for v32, v33 in v17.landscapeLayoutConfig do
                v31[v33] = v32;
            end;
            return v31;
        end;
    end, {
        v17.landscapeLayoutConfig, 
        v17.shouldInterleaveSdui
    });
    local v44 = v2.useCallback(function(v35, v36, v37) --[[ Line: 111 ]]
        -- upvalues: v17 (copy), v30 (copy), v34 (copy)
        if not v17.shouldInterleaveSdui then
            return {};
        else
            local v38 = v35.sduiConfig and v35.sduiConfig.props and v35.sduiConfig.props.LayoutOrder;
            local v39 = v17.defaultLayoutOrder + v37;
            local l_v30_0 = v30;
            local l_logLayoutConflictFn_0 = v17.logLayoutConflictFn;
            local v42;
            if v38 and l_v30_0[v38] then
                l_logLayoutConflictFn_0({
                    layoutOrder = v38, 
                    itemKey = v36, 
                    existingComponent = l_v30_0[v38]
                });
                v42 = v39;
            else
                v42 = v38 or v39;
            end;
            l_logLayoutConflictFn_0 = v34;
            local l_logLayoutConflictFn_1 = v17.logLayoutConflictFn;
            if v38 and l_logLayoutConflictFn_0[v38] then
                l_logLayoutConflictFn_1({
                    layoutOrder = v38, 
                    itemKey = v36, 
                    existingComponent = l_logLayoutConflictFn_0[v38]
                });
                l_v30_0 = v39;
            else
                l_v30_0 = v38 or v39;
            end;
            return {
                portrait = v42, 
                landscape = l_v30_0
            };
        end;
    end, {
        v34, 
        v30, 
        v17.defaultLayoutOrder, 
        v17.logLayoutConflictFn, 
        v17.shouldInterleaveSdui
    });
    return v2.useMemo(function() --[[ Line: 152 ]]
        -- upvalues: v17 (copy), v26 (copy), v44 (copy), l_SduiErrors_0 (ref), v2 (ref), l_SduiComponent_0 (ref)
        if not v17.shouldInterleaveSdui then
            return {};
        else
            local v45 = {};
            local v46 = 0;
            for v47, v48 in v26 do
                local v49 = v44(v48, v47, v46);
                v46 = v46 + 1;
                local v50 = v48 and v48.sduiConfig or nil;
                local v51 = ("SduiEdpFeedItem-%*-%*"):format(v17.storeKey, v47);
                if v50 == nil then
                    v17.sduiContext.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilComponentConfig, {
                        name = v51, 
                        message = ("Unable to render edp feed item for sdui. Feed store key: %*, Collection key: %*"):format(v17.storeKey, v47)
                    }, v17.sduiContext.appPage);
                else
                    v45[v47] = {
                        portraitLayoutOrder = v49.portrait, 
                        landscapeLayoutOrder = v49.landscape, 
                        renderComponent = function() --[[ Line: 175 ]] --[[ Name: renderComponent ]]
                            -- upvalues: v2 (ref), l_SduiComponent_0 (ref), v51 (copy), v50 (copy), v17 (ref)
                            return v2.createElement(l_SduiComponent_0, {
                                debugName = v51, 
                                componentConfig = v50, 
                                sduiContext = v17.sduiContext
                            });
                        end
                    };
                end;
            end;
            return v45;
        end;
    end, {
        v26, 
        v17.storeKey, 
        v17.sduiContext, 
        v44, 
        v17.shouldInterleaveSdui
    });
end;