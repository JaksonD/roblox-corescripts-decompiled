local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_Parent_0 = script:FindFirstAncestor("InExperienceDetailsPrompt").Parent;
local v2 = require(l_Parent_0.React);
return function(v3) --[[ Line: 6 ]] --[[ Name: useImageLoadingState ]]
    -- upvalues: v2 (copy), l_ContentProvider_0 (copy)
    local v4, v5 = v2.useState(false);
    v2.useEffect(function() --[[ Line: 9 ]]
        -- upvalues: v3 (copy), v5 (copy), l_ContentProvider_0 (ref)
        if not v3 or v3 == "" then
            v5(false);
            return;
        elseif l_ContentProvider_0:GetAssetFetchStatus(v3) == Enum.AssetFetchStatus.Success then
            v5(true);
            return;
        else
            v5(false);
            local v6 = true;
            task.spawn(function() --[[ Line: 24 ]]
                -- upvalues: l_ContentProvider_0 (ref), v3 (ref), v6 (ref), v5 (ref)
                l_ContentProvider_0:PreloadAsync({
                    v3
                }, function(v7, v8) --[[ Line: 25 ]]
                    -- upvalues: v6 (ref), v3 (ref), v5 (ref)
                    if v6 and v7 == v3 and v8 == Enum.AssetFetchStatus.Success then
                        v5(true);
                    end;
                end);
            end);
            return function() --[[ Line: 34 ]]
                -- upvalues: v6 (ref)
                v6 = false;
            end;
        end;
    end, {
        v3
    });
    return v4;
end;