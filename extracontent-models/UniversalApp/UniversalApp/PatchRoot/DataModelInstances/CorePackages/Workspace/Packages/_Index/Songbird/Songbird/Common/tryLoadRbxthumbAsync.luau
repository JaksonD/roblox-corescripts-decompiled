local l_ContentProvider_0 = game:GetService("ContentProvider");
return function(v1, v2) --[[ Line: 3 ]] --[[ Name: tryLoadRbxthumbAsync ]]
    -- upvalues: l_ContentProvider_0 (copy)
    local v3 = v2 or 5;
    if l_ContentProvider_0:GetAssetFetchStatus(v1) == Enum.AssetFetchStatus.Success then
        return v1;
    else
        l_ContentProvider_0:PreloadAsync({
            v1
        });
        local v4 = 0;
        while l_ContentProvider_0:GetAssetFetchStatus(v1) ~= Enum.AssetFetchStatus.Success do
            v4 = v4 + task.wait();
            if v3 < v4 then
                error((("timed out after %* seconds when loading %*"):format(v3, v1)));
            end;
        end;
        return v1;
    end;
end;