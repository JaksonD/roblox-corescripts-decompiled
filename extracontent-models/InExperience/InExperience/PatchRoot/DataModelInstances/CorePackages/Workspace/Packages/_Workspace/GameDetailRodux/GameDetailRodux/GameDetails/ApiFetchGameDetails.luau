local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameDetailRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.Result);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local v6 = require(script.Parent.GamesMultigetDetails);
local v7 = require(l_script_FirstAncestor_0.GameDetails.AddGameDetails);
local v8 = require(l_script_FirstAncestor_0.GameDetails.SetGameDetailError);
local v9 = require(l_script_FirstAncestor_0.GameDetails.GameDetailModel);
local l_EnumGameDetailErrorTypes_0 = require(l_Parent_0.DiscoveryTypes).EnumGameDetailErrorTypes;
local v11 = require(l_script_FirstAncestor_0.Logger);
local v12 = {};
local function v14(v13) --[[ Line: 20 ]]
    return "luaapp.gamesapi.games." .. v13;
end;
v12.KeyMapper = v14;
v12.GetFetchingStatus = function(v15, v16) --[[ Line: 26 ]] --[[ Name: GetFetchingStatus ]]
    -- upvalues: l_PerformFetch_0 (copy)
    return l_PerformFetch_0.GetStatus(v15, "luaapp.gamesapi.games." .. v16);
end;
v12.Fetch = function(v17, v18) --[[ Line: 30 ]] --[[ Name: Fetch ]]
    -- upvalues: v3 (copy), l_PerformFetch_0 (copy), v14 (copy), v6 (copy), v9 (copy), v4 (copy), v8 (copy), l_EnumGameDetailErrorTypes_0 (copy), v7 (copy), v11 (copy), v2 (copy)
    v3.isType(v18, "table", "ApiFetchGameDetails: universeIds");
    return l_PerformFetch_0.Batch(v18, v14, function(v19, v20) --[[ Line: 33 ]]
        -- upvalues: v6 (ref), v17 (copy), v9 (ref), v4 (ref), v8 (ref), l_EnumGameDetailErrorTypes_0 (ref), v7 (ref), v11 (ref), v2 (ref)
        return v6(v17, v20):andThen(function(v21) --[[ Line: 34 ]]
            -- upvalues: v9 (ref), v4 (ref), v20 (copy), v19 (copy), v8 (ref), l_EnumGameDetailErrorTypes_0 (ref), v7 (ref), v11 (ref), v2 (ref)
            local v22 = {};
            local v23 = v21 and v21.responseBody and v21.responseBody.data;
            if v23 ~= nil then
                local v24 = {};
                for _, v26 in ipairs(v23) do
                    local v27 = v9.fromJsonData(v26);
                    v24[v27.id] = v27;
                    v22["luaapp.gamesapi.games." .. v27.id] = v4.new(true, v27);
                end;
                for _, v29 in pairs(v20) do
                    if not v24[v29] then
                        v19:dispatch(v8(v29, l_EnumGameDetailErrorTypes_0.ExperienceUnavailable));
                    end;
                end;
                if next(v24) then
                    v19:dispatch(v7(v24));
                end;
            else
                v11:warning("Response from GamesMultigetDetails is malformed!");
            end;
            return v2.resolve(v22);
        end, function(_) --[[ Line: 61 ]]
            -- upvalues: v2 (ref)
            return v2.resolve({});
        end);
    end);
end;
return v12;