local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayabilityRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.Result);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local v5 = require(l_script_FirstAncestor_0.PlayabilityStatus.GamesMultigetPlayabilityStatus);
local v6 = require(l_script_FirstAncestor_0.PlayabilityStatus.SetPlayabilityStatus);
local v7 = require(l_script_FirstAncestor_0.PlayabilityStatus.PlayabilityStatusModel);
local v8 = require(l_script_FirstAncestor_0.Logger);
local function v10(v9) --[[ Line: 15 ]] --[[ Name: keyMapper ]]
    return "luaapp.gamesapi.playabilitystatus." .. v9;
end;
return {
    KeyMapper = v10, 
    Fetch = function(v11, v12) --[[ Line: 23 ]] --[[ Name: Fetch ]]
        -- upvalues: l_PerformFetch_0 (copy), v10 (copy), v5 (copy), v3 (copy), v7 (copy), v6 (copy), v8 (copy), v2 (copy)
        assert(type(v12) == "table", "ApiFetchPlayabilityStatus thunk expects universeIds to be a table");
        assert(#v12 > 0, "ApiFetchPlayabilityStatus thunk expects universeIds count to be greater than 0");
        assert(#v12 <= 100, "ApiFetchPlayabilityStatus thunk expects universeIds count to not exceed " .. 100);
        return l_PerformFetch_0.Batch(v12, v10, function(v13, v14) --[[ Line: 31 ]]
            -- upvalues: v5 (ref), v11 (copy), v3 (ref), v7 (ref), v6 (ref), v8 (ref), v2 (ref)
            return v5(v11, v14):andThen(function(v15) --[[ Line: 32 ]]
                -- upvalues: v14 (copy), v3 (ref), v7 (ref), v13 (copy), v6 (ref), v8 (ref), v2 (ref)
                local v16 = {};
                for _, v18 in ipairs(v14) do
                    v16["luaapp.gamesapi.playabilitystatus." .. v18] = v3.new(false, nil);
                end;
                local v19 = v15 and v15.responseBody;
                if v19 ~= nil then
                    local v20 = {};
                    for _, v22 in pairs(v19) do
                        v7.fromJsonData(v22):match(function(v23) --[[ Line: 45 ]]
                            -- upvalues: v20 (copy), v16 (copy), v22 (copy), v3 (ref)
                            v20[v23.universeId] = v23;
                            v16["luaapp.gamesapi.playabilitystatus." .. tostring(v22.universeId)] = v3.new(true, nil);
                        end):matchError(function(v24) --[[ Line: 49 ]]
                            warn(v24);
                        end);
                    end;
                    if next(v20) then
                        v13:dispatch(v6(v20));
                    end;
                else
                    v8:warning("Response from GameGetVotes is malformed!");
                end;
                return v2.resolve(v16);
            end, function(_) --[[ Line: 62 ]]
                -- upvalues: v14 (copy), v3 (ref), v2 (ref)
                local v26 = {};
                for _, v28 in ipairs(v14) do
                    v26["luaapp.gamesapi.playabilitystatus." .. v28] = v3.new(false, nil);
                end;
                return v2.resolve(v26);
            end);
        end);
    end, 
    GetFetchingStatus = function(v29, v30) --[[ Line: 72 ]] --[[ Name: GetFetchingStatus ]]
        -- upvalues: l_PerformFetch_0 (copy)
        return l_PerformFetch_0.GetStatus(v29, "luaapp.gamesapi.playabilitystatus." .. v30);
    end
};