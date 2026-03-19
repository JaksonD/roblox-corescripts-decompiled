local l_RunService_0 = game:GetService("RunService");
local l_IXPService_0 = game:GetService("IXPService");
local v2 = require(script.Parent.Roact);
local v3 = require(script.Parent.t);
local v4 = require(script.Parent.Cryo);
local v5 = require(script.Symbol);
local v6 = require(script.ExperimentContext);
local v7 = v5.named("IxpServiceProp");
local function v12(v8) --[[ Line: 31 ]] --[[ Name: registerUserLayers ]]
    -- upvalues: v3 (copy), l_IXPService_0 (copy), l_RunService_0 (copy)
    assert(v3.table(v8));
    if l_IXPService_0 ~= nil then
        if l_RunService_0:IsStudio() then
            l_IXPService_0:ClearUserLayers();
        end;
        local v9 = {};
        for _, v11 in pairs(v8) do
            table.insert(v9, v11);
        end;
        l_IXPService_0:RegisterUserLayers(v9);
    end;
end;
local function v14(v13) --[[ Line: 54 ]] --[[ Name: initializeUserLayers ]]
    -- upvalues: l_IXPService_0 (copy)
    if l_IXPService_0 ~= nil then
        l_IXPService_0:InitializeUserLayers(v13);
    end;
end;
local function v15() --[[ Line: 66 ]] --[[ Name: clearUserLayers ]]
    -- upvalues: l_IXPService_0 (copy)
    if l_IXPService_0 ~= nil then
        l_IXPService_0:ClearUserLayers();
    end;
end;
local function v54(v16, v17, v18, v19, v20) --[[ Line: 79 ]] --[[ Name: connect ]]
    -- upvalues: v3 (copy), v2 (copy), v7 (copy), v4 (copy), v6 (copy)
    assert(v3.string(v16));
    assert(v3.string(v17));
    assert(v3.string(v18));
    assert(v3.string(v19));
    assert(v3.string(v20));
    return function(v21, v22, v23) --[[ Line: 95 ]]
        -- upvalues: v2 (ref), v7 (ref), v18 (copy), v20 (copy), v19 (copy), v17 (copy), v4 (ref), v16 (copy), v6 (ref)
        if v23 == nil then
            v23 = true;
        end;
        local v24 = debug.traceback();
        assert(type(v21) == "table", "connect expects layerNames to be a list of layers");
        assert(type(v22) == "function", "connect expects mapLayersToProps to be a function");
        return function(v25) --[[ Line: 104 ]]
            -- upvalues: v24 (copy), v2 (ref), v7 (ref), v21 (copy), v18 (ref), v23 (ref), v20 (ref), v19 (ref), v17 (ref), v4 (ref), v22 (copy), v16 (ref), v6 (ref)
            if v25 == nil then
                local v26 = string.format("connect returns a function that must be passed a component.\n Check the connection at:\n %s", v24);
                error(v26, 2);
            end;
            local v27 = ("AppExperiment(%s)"):format((tostring(v25)));
            local v28 = v2.PureComponent:extend(v27);
            v28.init = function(v29) --[[ Line: 117 ]] --[[ Name: init ]]
                -- upvalues: v7 (ref), v21 (ref), v18 (ref), v23 (ref), v20 (ref), v19 (ref), v17 (ref)
                v29.onLoadingStatusChangeConnection = nil;
                v29.state = {
                    layerToVariables = {}, 
                    layerLoadingStatus = Enum.IXPLoadingStatus.None
                };
                v29.updateStateLayerData = function(v30) --[[ Line: 124 ]]
                    -- upvalues: v29 (copy), v7 (ref), v21 (ref), v18 (ref)
                    local v31 = v29.props[v7];
                    if v31 ~= nil then
                        local v32 = {};
                        for _, v34 in ipairs(v21) do
                            v32[v34] = v31[v18](v31, v34);
                        end;
                        v29:setState({
                            layerToVariables = v32, 
                            layerLoadingStatus = v30
                        });
                    end;
                end;
                v29.logAllLayersExposure = function(v35) --[[ Line: 140 ]]
                    -- upvalues: v29 (copy), v7 (ref), v23 (ref), v21 (ref), v20 (ref), v19 (ref)
                    local v36 = v29.props[v7];
                    if v36 ~= nil and v35 == Enum.IXPLoadingStatus.Initialized and v23 then
                        for _, v38 in ipairs(v21) do
                            if v36[v20](v36, v38) == Enum.IXPLoadingStatus.Initialized then
                                v36[v19](v36, v38);
                            end;
                        end;
                    end;
                end;
                local v39 = v29.props[v7];
                if v39 ~= nil then
                    local v40 = v39[v17](v39);
                    v29.updateStateLayerData(v40);
                end;
            end;
            v28.render = function(v41) --[[ Line: 163 ]] --[[ Name: render ]]
                -- upvalues: v4 (ref), v7 (ref), v22 (ref), v2 (ref), v25 (copy)
                local v42 = v4.Dictionary.join(v41.props, {
                    [v7] = v4.None
                });
                local v43 = v22(v41.state.layerToVariables, v42);
                local v44 = v4.Dictionary.join(v42, v43);
                return v2.createElement(v25, v44);
            end;
            v28.didMount = function(v45) --[[ Line: 172 ]] --[[ Name: didMount ]]
                -- upvalues: v7 (ref), v16 (ref), v17 (ref), v18 (ref)
                local v46 = v45.props[v7];
                if v46 ~= nil then
                    v45.onLoadingStatusChangeConnection = v46[v16]:Connect(function(_) --[[ Line: 177 ]]
                        -- upvalues: v46 (copy), v17 (ref), v45 (copy), v18 (ref)
                        local v48 = v46[v17](v46);
                        if v45.state.layerLoadingStatus ~= v48 then
                            v45.updateStateLayerData(v48, v18);
                            v45.logAllLayersExposure(v48);
                        end;
                    end);
                    local v49 = v46[v17](v46);
                    if v45.state.layerLoadingStatus ~= v49 then
                        v45.updateStateLayerData(v49, v18);
                    end;
                    v45.logAllLayersExposure(v49);
                end;
            end;
            v28.willUnmount = function(v50) --[[ Line: 200 ]] --[[ Name: willUnmount ]]
                if v50.onLoadingStatusChangeConnection ~= nil then
                    v50.onLoadingStatusChangeConnection:Disconnect();
                end;
            end;
            return function(v51) --[[ Line: 206 ]]
                -- upvalues: v2 (ref), v6 (ref), v7 (ref), v4 (ref), v28 (copy)
                return v2.createElement(v6.Consumer, {
                    render = function(v52) --[[ Line: 208 ]] --[[ Name: render ]]
                        -- upvalues: v51 (copy), v7 (ref), v4 (ref), v2 (ref), v28 (ref)
                        assert(v51[v7] == nil, "Symbol 'IxpServiceProp' should never exist in the incoming props.");
                        local v53 = v4.Dictionary.join(v51, {
                            [v7] = v52
                        });
                        return v2.createElement(v28, v53);
                    end
                });
            end;
        end;
    end;
end;
local v55 = v54("OnBrowserTrackerLayerLoadingStatusChanged", "GetBrowserTrackerLayerLoadingStatus", "GetBrowserTrackerLayerVariables", "LogBrowserTrackerLayerExposure", "GetBrowserTrackerStatusForLayer");
local v56 = v54("OnUserLayerLoadingStatusChanged", "GetUserLayerLoadingStatus", "GetUserLayerVariables", "LogUserLayerExposure", "GetUserStatusForLayer");
return {
    Provider = v6.Provider, 
    Consumer = v6.Consumer, 
    Context = v6, 
    registerUserLayers = v12, 
    initializeUserLayers = v14, 
    clearUserLayers = v15, 
    useBrowserTrackerExperiment = require(script.useBrowserTrackerExperiment), 
    useUserExperiment = require(script.useUserExperiment), 
    useIXPService = require(script.useIXPService), 
    connectBrowserTrackerLayer = v55, 
    connectUserLayer = v56, 
    MockIXPService = require(script.MockIXPService)
};