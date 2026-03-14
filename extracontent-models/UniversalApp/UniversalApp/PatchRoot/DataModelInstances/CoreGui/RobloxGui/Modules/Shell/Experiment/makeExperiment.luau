local l_IXPService_0 = game:GetService("IXPService");
return function(v1, v2, v3, v4, v5) --[[ Line: 23 ]] --[[ Name: makeExperiment ]]
    -- upvalues: l_IXPService_0 (copy)
    for _, v7 in {
        v1, 
        v2, 
        v3, 
        v4, 
        v5
    } do
        if not l_IXPService_0[v7] then
            error("makeExperiment factory expects configured members to exist on IXPService. Member " .. v7 .. " not found");
        end;
    end;
    return function(v8, v9, v10, v11) --[[ Line: 44 ]]
        -- upvalues: l_IXPService_0 (ref), v3 (copy), v5 (copy), v4 (copy), v2 (copy), v1 (copy)
        if v11 == nil then
            v11 = true;
        end;
        assert(type(v9) == "table", "makeExperiment expects layerNames to be a list of layers");
        assert(type(v10) == "function", "makeExperiment expects mapLayers to be a function");
        local function v16(v12) --[[ Line: 57 ]] --[[ Name: updateStateLayerData ]]
            -- upvalues: v9 (copy), l_IXPService_0 (ref), v3 (ref), v10 (copy)
            local v13 = {};
            for _, v15 in ipairs(v9) do
                v13[v15] = l_IXPService_0[v3](l_IXPService_0, v15);
            end;
            v10({
                layerToVariables = v13, 
                layerLoadingStatus = v12
            });
        end;
        local function v19() --[[ Line: 69 ]] --[[ Name: logAllLayersExposure ]]
            -- upvalues: v9 (copy), l_IXPService_0 (ref), v5 (ref), v4 (ref)
            for _, v18 in ipairs(v9) do
                if l_IXPService_0[v5](l_IXPService_0, v18) == Enum.IXPLoadingStatus.Initialized then
                    l_IXPService_0[v4](l_IXPService_0, v18);
                end;
            end;
        end;
        v16((l_IXPService_0[v2](l_IXPService_0)));
        local v21 = l_IXPService_0[v1]:Connect(function() --[[ Line: 81 ]]
            -- upvalues: l_IXPService_0 (ref), v2 (ref), v16 (copy), v11 (ref), v19 (copy)
            local v20 = l_IXPService_0[v2](l_IXPService_0);
            v16(v20);
            if v11 and v20 == Enum.IXPLoadingStatus.Initialized then
                v19();
            end;
        end);
        v8.Destroying:Once(function() --[[ Line: 95 ]]
            -- upvalues: v21 (copy)
            v21:Disconnect();
        end);
        return v21;
    end;
end;