local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Signals);
local v4 = require(l_script_FirstAncestor_0.Http.NetworkingShareLinks);
local v5 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
return function() --[[ Line: 23 ]] --[[ Name: createShareLinkStore ]]
    -- upvalues: v3 (copy), v4 (copy), l_HttpService_0 (copy), v5 (copy)
    local v6, v7 = v3.createSignal({});
    local function v9(v8) --[[ Line: 27 ]] --[[ Name: getShareLinkMetadataTable ]]
        -- upvalues: v6 (copy)
        return v6(v8);
    end;
    local v10 = {};
    local function v13(v11) --[[ Line: 32 ]] --[[ Name: getShareLinkMetadataComputed ]]
        -- upvalues: v10 (copy), v3 (ref), v6 (copy)
        if not v10[v11] then
            v10[v11] = v3.createComputed(function(v12) --[[ Line: 34 ]]
                -- upvalues: v6 (ref), v11 (copy)
                return v6(v12)[v11];
            end);
        end;
        return v10[v11];
    end;
    local function v23(v14, v15, v16) --[[ Line: 41 ]] --[[ Name: fetchShareLinkMetadata ]]
        -- upvalues: v4 (ref), l_HttpService_0 (ref), v5 (ref), v7 (copy)
        v14(v4.GetMetadata.API({
            linkId = v15, 
            linkType = v16
        })):andThen(function(v17) --[[ Line: 43 ]]
            -- upvalues: l_HttpService_0 (ref), v5 (ref), v7 (ref), v15 (copy)
            local l_responseBody_0 = v17.responseBody;
            if l_responseBody_0.data then
                local v19 = l_HttpService_0:JSONDecode(l_responseBody_0.data);
                if not v19.universeId then
                    v5:warning("Invalid share link metadata: ", v19);
                end;
                v7(function(v20) --[[ Line: 50 ]]
                    -- upvalues: v15 (ref), v19 (copy)
                    local v21 = table.clone(v20);
                    v21[v15] = v19;
                    return v21;
                end);
            end;
        end):catch(function(v22) --[[ Line: 57 ]]
            -- upvalues: v5 (ref)
            v5:warning("Error fetching share link metadata: ", v22);
        end);
    end;
    return {
        getShareLinkMetadataTable = v9, 
        getShareLinkMetadataComputed = v13, 
        fetchShareLinkMetadata = v23
    };
end;