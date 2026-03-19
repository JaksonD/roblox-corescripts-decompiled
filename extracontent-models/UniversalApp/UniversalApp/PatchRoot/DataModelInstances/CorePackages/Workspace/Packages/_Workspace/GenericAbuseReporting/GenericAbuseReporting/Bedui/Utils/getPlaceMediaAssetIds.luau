local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.Promise);
local l_Url_0 = require(l_Parent_0.Http).Url;
local v3 = game:DefineFastFlag("RemoveDuplicatesPlaceMediaAssets", false);
return function(v4, v5) --[[ Line: 9 ]]
    -- upvalues: l_Url_0 (copy), v3 (copy), v1 (copy)
    local v6 = string.format("%sv2/games/%s/media", l_Url_0.GAME_URL, v5);
    local v7 = {};
    local v8 = {};
    return v4(v6, "GET"):andThen(function(v9) --[[ Line: 16 ]]
        -- upvalues: v3 (ref), v8 (copy), v7 (copy)
        if v9 and v9.responseBody and v9.responseBody.data then
            for _, v11 in ipairs(v9.responseBody.data) do
                if v11.imageId then
                    if v3 then
                        local v12 = tostring(v11.imageId);
                        if not v8[v12] then
                            v8[v12] = true;
                            table.insert(v7, v12);
                        end;
                    else
                        table.insert(v7, (tostring(v11.imageId)));
                    end;
                end;
            end;
        end;
    end):finally(function() --[[ Line: 33 ]]
        -- upvalues: v1 (ref), v7 (copy)
        return v1.resolve(v7);
    end);
end;