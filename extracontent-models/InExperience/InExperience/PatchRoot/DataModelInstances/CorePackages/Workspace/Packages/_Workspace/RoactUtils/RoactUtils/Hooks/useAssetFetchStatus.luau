local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v2 = require(l_Parent_0.React);
return function(v3) --[[ Line: 8 ]] --[[ Name: useAssetFetchStatus ]]
    -- upvalues: v2 (copy), l_ContentProvider_0 (copy)
    local v4, v5 = v2.useState(Enum.AssetFetchStatus.None);
    v2.useEffect(function() --[[ Line: 11 ]]
        -- upvalues: v5 (copy), v3 (copy), l_ContentProvider_0 (ref)
        v5(Enum.AssetFetchStatus.None);
        if not v3 or v3 == "" then
            return;
        else
            local v7 = l_ContentProvider_0:GetAssetFetchStatusChangedSignal(v3):Connect(function(v6) --[[ Line: 18 ]]
                -- upvalues: v5 (ref)
                v5(v6);
            end);
            local l_l_ContentProvider_0_AssetFetchStatus_0 = l_ContentProvider_0:GetAssetFetchStatus(v3);
            v5(l_l_ContentProvider_0_AssetFetchStatus_0);
            return function() --[[ Line: 25 ]]
                -- upvalues: v7 (copy)
                v7:Disconnect();
            end;
        end;
    end, {
        v3
    });
    return v4;
end;