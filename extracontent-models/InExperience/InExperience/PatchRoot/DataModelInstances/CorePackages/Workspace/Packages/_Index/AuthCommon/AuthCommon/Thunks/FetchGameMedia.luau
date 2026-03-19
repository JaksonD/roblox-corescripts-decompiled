local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_script_FirstAncestor_0.Http.Requests.GetGameMedia);
FetchGameMedia = function(v4, v5) --[[ Line: 8 ]] --[[ Name: FetchGameMedia ]]
    -- upvalues: v3 (copy), v2 (copy)
    assert(typeof(v5) == "string", "universeId must be a string");
    assert(#v5 > 0, "universeId must be a non-empty string");
    return v3(v4, v5):andThen(function(v6) --[[ Line: 12 ]]
        -- upvalues: v2 (ref)
        if v6 and v6.responseBody then
            local l_data_0 = v6.responseBody.data;
            if l_data_0 == nil then
                return v2.reject();
            else
                local v8 = {};
                for _, v10 in ipairs(l_data_0) do
                    table.insert(v8, {
                        id = v10.id, 
                        assetTypeId = v10.assetTypeId, 
                        imageId = v10.imageId
                    });
                end;
                return v2.resolve(v8);
            end;
        else
            return v2.reject();
        end;
    end);
end;
return FetchGameMedia;