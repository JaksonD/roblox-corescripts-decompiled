local l_script_FirstAncestor_0 = script:FindFirstAncestor("CoreScriptsRoactCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.DataHydration);
local v4 = require(l_Parent_0.Signals);
local v5 = require(l_Parent_0.SignalsReact);
local v6 = require(l_Parent_0.React);
local l_Traversal_0 = l_script_FirstAncestor_0.Traversal;
local l_default_0 = require(l_Traversal_0.LocalTraversalHistory).default;
local l_FFlagUseHistoryItemsWaitForGameLoad_0 = require(l_Traversal_0.Flags).FFlagUseHistoryItemsWaitForGameLoad;
local l_getGameInfoStore_0 = v3.Game.getGameInfoStore;
local l_getVotesStore_0 = v3.Game.getVotesStore;
local function v18(v12, _) --[[ Line: 27 ]] --[[ Name: getNMostRecentUniqueUniverseIds ]]
    local v14 = {};
    local v15 = {};
    for _, v17 in v12 do
        if not v15[v17] then
            v15[v17] = true;
            table.insert(v14, v17);
        end;
    end;
    return v14;
end;
local function _(v19, v20) --[[ Line: 40 ]] --[[ Name: getHistoryInfo ]]
    return {
        name = v19.name, 
        placeId = tonumber(v19.rootPlaceId), 
        universeId = tonumber(v19.universeId), 
        rating = v20.rating
    };
end;
return function(v22) --[[ Line: 50 ]] --[[ Name: useHistoryItems ]]
    -- upvalues: l_FFlagUseHistoryItemsWaitForGameLoad_0 (copy), v6 (copy), v4 (copy), l_default_0 (copy), v18 (copy), l_getGameInfoStore_0 (copy), l_getVotesStore_0 (copy), v5 (copy), v2 (copy)
    local v23 = v22 or 2;
    if l_FFlagUseHistoryItemsWaitForGameLoad_0 then
        local v34 = v6.useMemo(function() --[[ Line: 53 ]]
            -- upvalues: v4 (ref), l_default_0 (ref), v23 (copy), v18 (ref), l_getGameInfoStore_0 (ref), l_getVotesStore_0 (ref)
            return (v4.createComputed(function(v24) --[[ Line: 54 ]]
                -- upvalues: l_default_0 (ref), v23 (ref), v18 (ref), l_getGameInfoStore_0 (ref), l_getVotesStore_0 (ref)
                local v25 = {};
                local v26 = l_default_0:getUniverseHistorySignal(v23)(v24);
                local v27 = v18(v26, v23);
                local v28 = l_getGameInfoStore_0(v24).getAndFetchGameInfos(v27);
                local v29 = l_getVotesStore_0(v24).getAndFetchVotes(v27);
                for _, v31 in v27 do
                    local v32 = if v28[v31] and v28[v31].data then v28[v31].data(v24) else nil;
                    local v33 = if v29[v31] and v29[v31].data then v29[v31].data(v24) else nil;
                    if v32 and v33 then
                        table.insert(v25, {
                            name = v32.name, 
                            placeId = tonumber(v32.rootPlaceId), 
                            universeId = tonumber(v32.universeId), 
                            rating = v33.rating
                        });
                    end;
                end;
                return v25;
            end));
        end, {
            v23, 
            l_getGameInfoStore_0, 
            l_getVotesStore_0
        });
        return (v5.useSignalState(v34));
    else
        local v35 = l_default_0:getUniverseHistory();
        local v36 = l_default_0:getUniverseHistory(v23);
        local v37 = {};
        local v38 = {};
        for _, v40 in v36 do
            if not v37[v40] then
                v37[v40] = true;
                table.insert(v38, v40);
            end;
        end;
        local v41, v42 = v6.useState({});
        local v43, v44 = v6.useState(false);
        v6.useEffect(function() --[[ Line: 98 ]]
            -- upvalues: v4 (ref), v35 (copy), v43 (copy), l_getGameInfoStore_0 (ref), v38 (copy), l_getVotesStore_0 (ref), v42 (copy), v2 (ref), v36 (copy), v44 (copy)
            local v57 = v4.createEffect(function(v45) --[[ Line: 99 ]]
                -- upvalues: v35 (ref), v43 (ref), l_getGameInfoStore_0 (ref), v38 (ref), l_getVotesStore_0 (ref), v42 (ref), v2 (ref), v36 (ref), v44 (ref)
                if next(v35) == nil or v43 then
                    return;
                else
                    local v46 = l_getGameInfoStore_0(v45).getAndFetchGameInfos(v38);
                    local v47 = l_getVotesStore_0(v45).getAndFetchVotes(v38);
                    local v48 = {};
                    local v49 = {};
                    for _, v51 in v38 do
                        local v52 = v46[v51].data(v45);
                        local v53 = v47[v51].data(v45);
                        table.insert(v48, v46[v51].status(v45));
                        table.insert(v48, v47[v51].status(v45));
                        if v52 and v53 then
                            table.insert(v49, {
                                name = v52.name, 
                                placeId = tonumber(v52.rootPlaceId), 
                                universeId = tonumber(v52.universeId), 
                                rating = v53.rating
                            });
                        end;
                    end;
                    local v54 = true;
                    for _, v56 in v48 do
                        if v56 == "NotReady" then
                            v54 = false;
                        end;
                    end;
                    v42(v49);
                    if v54 and v2.List.equals(v35, v36) then
                        v44(true);
                    end;
                    return;
                end;
            end);
            return function() --[[ Line: 140 ]]
                -- upvalues: v57 (copy)
                v57();
            end;
        end, {
            v22, 
            v43
        });
        return v41;
    end;
end;