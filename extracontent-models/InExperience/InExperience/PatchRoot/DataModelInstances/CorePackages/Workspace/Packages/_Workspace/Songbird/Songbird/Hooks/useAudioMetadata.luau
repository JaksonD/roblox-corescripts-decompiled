local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(l_script_FirstAncestor_0.Requests.getAudioMetadataAsync);
local l_useAsync_0 = v1.useAsync;
local l_useState_0 = v2.useState;
local l_useEffect_0 = v2.useEffect;
local l_useCallback_0 = v2.useCallback;
return function(v9) --[[ Line: 19 ]] --[[ Name: useAudioMetadata ]]
    -- upvalues: l_useState_0 (copy), l_useAsync_0 (copy), v4 (copy), l_useCallback_0 (copy), l_useEffect_0 (copy)
    local v10, v11 = l_useState_0({});
    local v12 = l_useAsync_0(function() --[[ Line: 25 ]]
        -- upvalues: v9 (copy), v4 (ref)
        if #v9 > 0 then
            return v4(v9);
        else
            return {};
        end;
    end, {
        table.unpack(v9)
    });
    local v13 = l_useCallback_0(function() --[[ Line: 33 ]]
        -- upvalues: v10 (copy)
        return v10;
    end, {
        v10
    });
    local v15 = l_useCallback_0(function(v14) --[[ Line: 37 ]]
        -- upvalues: v10 (copy)
        return v10[tostring(v14)];
    end, {
        v10
    });
    l_useEffect_0(function() --[[ Line: 41 ]]
        -- upvalues: v12 (copy), v11 (copy)
        if v12.status == "ok" and #v12.value > 0 then
            v11(function(v16) --[[ Line: 43 ]]
                -- upvalues: v12 (ref)
                local v17 = table.clone(v16);
                for _, v19 in v12.value do
                    v17[v19.AssetId] = v19;
                end;
                return v17;
            end);
        end;
    end, {
        v12
    });
    return {
        getAll = v13, 
        getByAssetId = v15
    };
end;