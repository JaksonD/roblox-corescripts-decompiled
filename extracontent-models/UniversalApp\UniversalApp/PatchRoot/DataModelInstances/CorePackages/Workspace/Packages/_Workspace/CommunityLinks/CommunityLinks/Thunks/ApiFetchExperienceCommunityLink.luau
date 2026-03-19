local l_Parent_0 = script:FindFirstAncestor("CommunityLinks").Parent;
local v1 = require(l_Parent_0.Promise);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local v3 = require(script.Parent.Parent.Actions.SetExperienceCommunityLink);
local v4 = require(script.Parent.Parent.Requests.GetCommunityLink);
local v5 = require(script.Parent.Parent.Models.CommunityInfo);
local v6 = require(script.Parent.Parent.Enums.CommunityVisibility);
return function(v7, v8) --[[ Line: 12 ]]
    -- upvalues: v4 (copy), v5 (copy), v6 (copy), v3 (copy), l_StatusCodes_0 (copy), v1 (copy)
    return function(v9) --[[ Line: 13 ]]
        -- upvalues: v4 (ref), v7 (copy), v8 (copy), v5 (ref), v6 (ref), v3 (ref), l_StatusCodes_0 (ref), v1 (ref)
        return v4(v7, v8):andThen(function(v10) --[[ Line: 14 ]]
            -- upvalues: v5 (ref), v6 (ref), v9 (copy), v3 (ref), v8 (ref)
            if v10.responseBody ~= nil and v10.responseBody.communityId ~= nil then
                local v11 = v5.fromJsonData(v10.responseBody);
                if v11.visibility == v6.Public then
                    v9:dispatch(v3(v8, v11));
                    return;
                end;
            end;
            v9:dispatch(v3(v8, false));
        end, function(v12) --[[ Line: 25 ]]
            -- upvalues: l_StatusCodes_0 (ref), v9 (copy), v3 (ref), v8 (ref), v1 (ref)
            if v12.StatusCode == l_StatusCodes_0.NOT_FOUND then
                v9:dispatch(v3(v8, false));
            end;
            return v1.resolve();
        end);
    end;
end;