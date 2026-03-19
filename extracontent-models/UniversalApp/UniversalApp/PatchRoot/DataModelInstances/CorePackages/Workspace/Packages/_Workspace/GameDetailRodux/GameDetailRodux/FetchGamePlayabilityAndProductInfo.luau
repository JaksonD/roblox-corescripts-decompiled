local l_Parent_0 = script:FindFirstAncestor("GameDetailRodux").Parent;
local v1 = require(l_Parent_0.Promise);
local l_PlayabilityStatusEnum_0 = require(l_Parent_0.DiscoveryTypes).PlayabilityStatusEnum;
local l_ApiFetchPlayabilityStatus_0 = require(l_Parent_0.PlayabilityRodux).PlayabilityStatus.ApiFetchPlayabilityStatus;
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local l_FetchGamesProductInfo_0 = require(l_Parent_0.GameProductInfoRodux).FetchGamesProductInfo;
return {
    KeyMapper = function(v6) --[[ Line: 9 ]] --[[ Name: keyMapper ]]
        return "luaapp.playability-and-productinfo." .. v6;
    end, 
    Fetch = function(v7, v8) --[[ Line: 17 ]] --[[ Name: Fetch ]]
        -- upvalues: l_PerformFetch_0 (copy), l_ApiFetchPlayabilityStatus_0 (copy), l_PlayabilityStatusEnum_0 (copy), l_FetchGamesProductInfo_0 (copy), v1 (copy)
        assert(type(v8) == "string", "FetchPlayabilityAndProductInfo thunk expects universeId to be a string");
        return l_PerformFetch_0.Single("luaapp.playability-and-productinfo." .. v8, function(v9) --[[ Line: 20 ]]
            -- upvalues: l_ApiFetchPlayabilityStatus_0 (ref), v7 (copy), v8 (copy), l_PlayabilityStatusEnum_0 (ref), l_FetchGamesProductInfo_0 (ref), v1 (ref)
            return v9:dispatch(l_ApiFetchPlayabilityStatus_0.Fetch(v7, {
                v8
            })):andThen(function(v10) --[[ Line: 23 ]]
                -- upvalues: l_ApiFetchPlayabilityStatus_0 (ref), v8 (ref), v9 (copy), l_PlayabilityStatusEnum_0 (ref), l_FetchGamesProductInfo_0 (ref), v7 (ref), v1 (ref)
                local v11, _ = v10[l_ApiFetchPlayabilityStatus_0.KeyMapper(v8)]:unwrap();
                if v11 then
                    local v13 = v9:getState().PlayabilityStatus[v8];
                    if v13.isPlayable == false and (v13.playabilityStatus == l_PlayabilityStatusEnum_0.PurchaseRequired or v13.playabilityStatus == l_PlayabilityStatusEnum_0.FiatPurchaseRequired) then
                        return v9:dispatch(l_FetchGamesProductInfo_0.Fetch(v7, {
                            v8
                        })):andThen(function(v14) --[[ Line: 39 ]]
                            -- upvalues: l_FetchGamesProductInfo_0 (ref), v8 (ref), v1 (ref), v13 (copy)
                            local v15, _ = v14[l_FetchGamesProductInfo_0.KeyMapper(v8)]:unwrap();
                            if v15 then
                                return v1.resolve(v13.playabilityStatus);
                            else
                                return v1.reject();
                            end;
                        end);
                    else
                        return v1.resolve(v13.playabilityStatus);
                    end;
                else
                    return v1.reject();
                end;
            end);
        end);
    end, 
    GetFetchingStatus = function(v17, v18) --[[ Line: 59 ]] --[[ Name: GetFetchingStatus ]]
        -- upvalues: l_PerformFetch_0 (copy)
        return l_PerformFetch_0.GetStatus(v17, "luaapp.playability-and-productinfo." .. v18);
    end
};