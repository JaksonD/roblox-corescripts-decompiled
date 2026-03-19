local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.Http);
local v4 = require(l_script_FirstAncestor_0.Enums.HeadShape);
local v5 = require(l_script_FirstAncestor_0.Enums.HeadShapePropertiesByAssetId);
local v6 = require(l_script_FirstAncestor_0.Actions.SetAvailableHeadShapes);
local v7 = require(l_script_FirstAncestor_0.Counters);
local v8 = require(l_script_FirstAncestor_0.Requests.requestUserOwnedClassicHeads);
local function v20(v9) --[[ Line: 29 ]] --[[ Name: fetchHelper ]]
    -- upvalues: v8 (copy), v2 (copy)
    local l_networkImpl_0 = v9.networkImpl;
    local l_userId_0 = v9.userId;
    local v12 = {};
    local v13 = "";
    while true do
        if v13 ~= nil then
            local v14, v15 = v8(l_networkImpl_0, l_userId_0, v13):await();
            if not v14 then
                return v2.reject(v15);
            else
                local l_responseBody_0 = v15.responseBody;
                local v17 = l_responseBody_0.data or {};
                for _, v19 in v17 do
                    table.insert(v12, v19);
                end;
                v13 = l_responseBody_0.nextPageCursor;
            end;
        else
            return v2.resolve({
                responseBody = {
                    data = v12
                }
            });
        end;
    end;
end;
return function(v21, v22, v23) --[[ Line: 64 ]]
    -- upvalues: v3 (copy), v7 (copy), v20 (copy), v6 (copy), v4 (copy), v2 (copy), v5 (copy)
    return v3.PerformFetch.Single("HeadRefinement_UserOwnedClassicHead_Request", function(v24) --[[ Line: 69 ]]
        -- upvalues: v23 (copy), v7 (ref), v20 (ref), v21 (copy), v22 (copy), v6 (ref), v4 (ref), v2 (ref), v5 (ref)
        if v23 then
            v23(v7.OwnedClassicHeadsRequest.Start);
        end;
        local v25, v26 = v20({
            networkImpl = v21, 
            userId = v22
        }):await();
        if not v25 then
            if v23 then
                v23(v7.OwnedClassicHeadsRequest.Failure);
            end;
            v24:dispatch(v6({
                v4.Default
            }));
            return v2.reject(v26);
        else
            local v27 = v26.responseBody or {
                data = {}
            };
            local v28 = {
                v4.Default
            };
            for _, v30 in v27.data do
                local v31 = v5[tostring(v30.assetId)];
                if v31 then
                    table.insert(v28, v31.name);
                end;
            end;
            if v23 then
                v23(v7.OwnedClassicHeadsRequest.Success, {
                    headShapeCount = tostring(#v28)
                });
            end;
            v24:dispatch(v6(v28));
            return v2.resolve(v28);
        end;
    end);
end;