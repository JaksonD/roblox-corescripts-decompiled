local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.ServiceContractsProto);
local v3 = require(l_Parent_0.DataHydration);
local v4 = require(l_Parent_0.Signals);
local v5 = require(l_Parent_0.Display);
local v6 = require(l_Parent_0.Responsive);
local l_SduiDataBindingResponsiveFieldName_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingFieldNames).SduiDataBindingResponsiveFieldName;
local v8 = require(l_script_FirstAncestor_0.ClientBinding.tryGetPathFromData);
local v9 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingContentType);
local v10 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBinderTransformUtils);
local l_FFlagSduiInputDataSignals_0 = require(l_Parent_0.SharedFlags).FFlagSduiInputDataSignals;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local l_protobufTimestampToLocalTimeString_0 = v10.protobufTimestampToLocalTimeString;
local function _(v14) --[[ Line: 29 ]] --[[ Name: updateBadgesInfoStore ]]
    -- upvalues: v3 (copy)
    v3.Badges.getBadgeInfoStore(false).updateBadges(v14);
end;
local function _(v16) --[[ Line: 33 ]] --[[ Name: updateCreatorInfoStore ]]
    -- upvalues: v3 (copy)
    v3.Creator.getCreatorInfoStore(false).updateCreatorInfos(v16);
end;
local function _(v18) --[[ Line: 37 ]] --[[ Name: updateGameInfos ]]
    -- upvalues: v3 (copy)
    v3.Game.getGameInfoStore(false).updateGameInfos(v18);
end;
local function v26(v20, v21, _) --[[ Line: 49 ]] --[[ Name: calculateBadgeDerivedField ]]
    -- upvalues: l_protobufTimestampToLocalTimeString_0 (copy)
    if v20 == "created_time_formatted" then
        local v23 = v21 and (v21.created_time or v21.createdTime);
        return v23 and l_protobufTimestampToLocalTimeString_0(v23);
    elseif v20 == "updated_time_formatted" then
        local v24 = v21 and (v21.updated_time or v21.updatedTime);
        return v24 and l_protobufTimestampToLocalTimeString_0(v24);
    elseif v20 == "awarded_time_formatted" then
        local v25 = v21 and (v21.awarded_time or v21.awardedTime);
        return v25 and l_protobufTimestampToLocalTimeString_0(v25);
    else
        return nil;
    end;
end;
local function v31(v27, _, v29, _) --[[ Line: 64 ]] --[[ Name: getDataObjectSignal ]]
    -- upvalues: v3 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy)
    if v27 == "badge" then
        return v3.Badges.getBadgeInfoStore(false).getBadgeInfo((tostring(v29)));
    else
        if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
            if v27 == "creator" then
                return v3.Creator.getCreatorInfoStore(false).getCreatorInfo(v29);
            elseif v27 == "universe" then
                return v3.Game.getGameInfoStore(false).getGameInfo(v29);
            end;
        end;
        return nil;
    end;
end;
local v32 = {
    responsive = true
};
local function v34(v33) --[[ Line: 91 ]] --[[ Name: isClientContentType ]]
    -- upvalues: v32 (copy)
    return v32[v33] or false;
end;
local function v40(v35, v36, v37) --[[ Line: 95 ]] --[[ Name: getFieldValueForClientContentType ]]
    -- upvalues: v9 (copy), l_SduiDataBindingResponsiveFieldName_0 (copy), v5 (copy), v6 (copy)
    if v35 == v9.responsive then
        if #v36 ~= 2 then
            return nil;
        else
            local v38 = v36[2];
            if v38 == l_SduiDataBindingResponsiveFieldName_0.screenWidth then
                return v5.GetDisplayStore(v37).getViewportSize(v37).X;
            elseif v38 == l_SduiDataBindingResponsiveFieldName_0.screenHeight then
                return v5.GetDisplayStore(v37).getViewportSize(v37).Y;
            elseif v38 == l_SduiDataBindingResponsiveFieldName_0.isPortrait then
                local v39 = v5.GetDisplayStore(v37).getViewportSize(v37);
                return v39.X < v39.Y;
            elseif v38 == l_SduiDataBindingResponsiveFieldName_0.isSpatial then
                return v5.GetDisplayStore(v37).getIsSpatial(v37);
            elseif v38 == l_SduiDataBindingResponsiveFieldName_0.lastInput then
                return v6.GetInputModeStore(v37).getLastInputType(v37);
            elseif v38 == l_SduiDataBindingResponsiveFieldName_0.preferredInput then
                return v6.GetInputModeStore(v37).getPreferredInputType(v37);
            end;
        end;
    end;
    return nil;
end;
local function _(v41, v42, v43, v44) --[[ Line: 126 ]] --[[ Name: calculateDerivedFieldValue ]]
    -- upvalues: v26 (copy)
    if v41 == "badge" then
        return (v26(v42, v43, v44));
    else
        return nil;
    end;
end;
local function v58(v46, v47, v48, v49, v50) --[[ Line: 150 ]] --[[ Name: getDataHydrationField ]]
    -- upvalues: v31 (copy), v8 (copy), v26 (copy)
    if #v47 < 2 then
        return nil, nil;
    else
        local v51 = v31(v46, v47, v48, v50);
        if not v51 then
            local v52 = table.concat(v47, ".");
            error((("No available data object for %* %* for id: %*"):format(v46, v52, v48)));
        end;
        local v53 = v51.data(v49);
        local v54 = v51.status(v49);
        if not v53 then
            return nil, v54;
        else
            local v55, v56 = v8(v53, v47, 2);
            if v55 then
                return v56, v54;
            elseif #v47 == 2 then
                local v57 = v47[2];
                return if v46 == "badge" then v26(v57, v53, v49) else nil, v54;
            else
                return nil, v54;
            end;
        end;
    end;
end;
local v59 = {
    badge = v58, 
    creator = v58, 
    universe = v58
};
local function v66(v60, v61, v62, v63, v64) --[[ Line: 202 ]] --[[ Name: getFieldValue ]]
    -- upvalues: v59 (copy)
    if #v61 < 2 then
        return nil, nil;
    else
        local v65 = v59[v60];
        if v65 == nil then
            return nil, nil;
        else
            return v65(v60, v61, v62, v63, v64);
        end;
    end;
end;
local function v71(v67) --[[ Line: 225 ]] --[[ Name: updateDataStores ]]
    -- upvalues: v3 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy)
    if v67.badge then
        local l_badge_0 = v67.badge;
        v3.Badges.getBadgeInfoStore(false).updateBadges(l_badge_0);
    end;
    if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
        if v67.creator then
            local l_creator_0 = v67.creator;
            v3.Creator.getCreatorInfoStore(false).updateCreatorInfos(l_creator_0);
        end;
        if v67.universe then
            local l_universe_0 = v67.universe;
            v3.Game.getGameInfoStore(false).updateGameInfos(l_universe_0);
        end;
    end;
end;
local function v85(v72, v73, v74, v75) --[[ Line: 257 ]] --[[ Name: createFieldComputed ]]
    -- upvalues: v31 (copy), v4 (copy), v8 (copy)
    if not v73 or #v73 < 2 then
        error((("Unsupported path for contentType %*"):format(v72)));
    end;
    local v76 = v31(v72, v73, v74);
    if not v76 then
        local v77 = table.concat(v73, ".");
        error((("No available data object for %* %* for id: %*"):format(v72, v77, v74)));
    end;
    return (v4.createComputed(function(v78) --[[ Line: 271 ]]
        -- upvalues: v76 (copy), v8 (ref), v73 (copy), v75 (copy)
        local v79 = v76.data(v78);
        local v80 = nil;
        if v79 then
            local v81, v82 = v8(v79, v73, 2);
            if v81 then
                v80 = v82;
            end;
        end;
        if v79 == nil then
            return nil;
        else
            if v75 then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 288 ]]
                    -- upvalues: v75 (ref), v80 (ref)
                    return v75(v80);
                end);
                if not l_status_0 then
                    return nil;
                else
                    v80 = l_result_0;
                end;
            end;
            return v80;
        end;
    end));
end;
return {
    updateDataStores = v71, 
    createFieldComputed = if l_FFlagSduiInputDataSignals_0 then nil else v85, 
    getDataObjectSignal = v31, 
    getFieldValue = v66, 
    calculateBadgeDerivedField = v26, 
    isClientContentType = v34, 
    getFieldValueForClientContentType = v40
};