local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.ServiceContractsProto);
local v3 = require(l_Parent_0.DataHydration);
local _ = require(l_Parent_0.Signals);
local v5 = require(l_Parent_0.Display);
local v6 = require(l_Parent_0.Responsive);
local l_SduiDataBindingResponsiveFieldName_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingFieldNames).SduiDataBindingResponsiveFieldName;
local v8 = require(l_script_FirstAncestor_0.ClientBinding.tryGetPathFromData);
local v9 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingContentType);
local v10 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBinderTransformUtils);
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local l_protobufTimestampToLocalTimeString_0 = v10.protobufTimestampToLocalTimeString;
local function _(v13) --[[ Line: 28 ]] --[[ Name: updateBadgesInfoStore ]]
    -- upvalues: v3 (copy)
    v3.Badges.getBadgeInfoStore(false).updateBadges(v13);
end;
local function _(v15) --[[ Line: 32 ]] --[[ Name: updateCreatorInfoStore ]]
    -- upvalues: v3 (copy)
    v3.Creator.getCreatorInfoStore(false).updateCreatorInfos(v15);
end;
local function _(v17) --[[ Line: 36 ]] --[[ Name: updateGameInfos ]]
    -- upvalues: v3 (copy)
    v3.Game.getGameInfoStore(false).updateGameInfos(v17);
end;
local function v25(v19, v20, _) --[[ Line: 48 ]] --[[ Name: calculateBadgeDerivedField ]]
    -- upvalues: l_protobufTimestampToLocalTimeString_0 (copy)
    if v19 == "created_time_formatted" then
        local v22 = v20 and (v20.created_time or v20.createdTime);
        return v22 and l_protobufTimestampToLocalTimeString_0(v22);
    elseif v19 == "updated_time_formatted" then
        local v23 = v20 and (v20.updated_time or v20.updatedTime);
        return v23 and l_protobufTimestampToLocalTimeString_0(v23);
    elseif v19 == "awarded_time_formatted" then
        local v24 = v20 and (v20.awarded_time or v20.awardedTime);
        return v24 and l_protobufTimestampToLocalTimeString_0(v24);
    else
        return nil;
    end;
end;
local function v30(v26, _, v28, _) --[[ Line: 63 ]] --[[ Name: getDataObjectSignal ]]
    -- upvalues: v3 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy)
    if v26 == "badge" then
        return v3.Badges.getBadgeInfoStore(false).getBadgeInfo((tostring(v28)));
    else
        if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
            if v26 == "creator" then
                return v3.Creator.getCreatorInfoStore(false).getCreatorInfo(v28);
            elseif v26 == "universe" then
                return v3.Game.getGameInfoStore(false).getGameInfo(v28);
            end;
        end;
        return nil;
    end;
end;
local v31 = {
    responsive = true
};
local function v33(v32) --[[ Line: 90 ]] --[[ Name: isClientContentType ]]
    -- upvalues: v31 (copy)
    return v31[v32] or false;
end;
local function v39(v34, v35, v36) --[[ Line: 94 ]] --[[ Name: getFieldValueForClientContentType ]]
    -- upvalues: v9 (copy), l_SduiDataBindingResponsiveFieldName_0 (copy), v5 (copy), v6 (copy)
    if v34 == v9.responsive then
        if #v35 ~= 2 then
            return nil;
        else
            local v37 = v35[2];
            if v37 == l_SduiDataBindingResponsiveFieldName_0.screenWidth then
                return v5.GetDisplayStore(v36).getViewportSize(v36).X;
            elseif v37 == l_SduiDataBindingResponsiveFieldName_0.screenHeight then
                return v5.GetDisplayStore(v36).getViewportSize(v36).Y;
            elseif v37 == l_SduiDataBindingResponsiveFieldName_0.isPortrait then
                local v38 = v5.GetDisplayStore(v36).getViewportSize(v36);
                return v38.X < v38.Y;
            elseif v37 == l_SduiDataBindingResponsiveFieldName_0.isSpatial then
                return v5.GetDisplayStore(v36).getIsSpatial(v36);
            elseif v37 == l_SduiDataBindingResponsiveFieldName_0.lastInput then
                return v6.GetInputModeStore(v36).getLastInputType(v36);
            elseif v37 == l_SduiDataBindingResponsiveFieldName_0.preferredInput then
                return v6.GetInputModeStore(v36).getPreferredInputType(v36);
            end;
        end;
    end;
    return nil;
end;
local function _(v40, v41, v42, v43) --[[ Line: 125 ]] --[[ Name: calculateDerivedFieldValue ]]
    -- upvalues: v25 (copy)
    if v40 == "badge" then
        return (v25(v41, v42, v43));
    else
        return nil;
    end;
end;
local function v57(v45, v46, v47, v48, v49) --[[ Line: 149 ]] --[[ Name: getDataHydrationField ]]
    -- upvalues: v30 (copy), v8 (copy), v25 (copy)
    if #v46 < 2 then
        return nil, nil;
    else
        local v50 = v30(v45, v46, v47, v49);
        if not v50 then
            local v51 = table.concat(v46, ".");
            error((("No available data object for %* %* for id: %*"):format(v45, v51, v47)));
        end;
        local v52 = v50.data(v48);
        local v53 = v50.status(v48);
        if not v52 then
            return nil, v53;
        else
            local v54, v55 = v8(v52, v46, 2);
            if v54 then
                return v55, v53;
            elseif #v46 == 2 then
                local v56 = v46[2];
                return if v45 == "badge" then v25(v56, v52, v48) else nil, v53;
            else
                return nil, v53;
            end;
        end;
    end;
end;
local v58 = {
    badge = v57, 
    creator = v57, 
    universe = v57
};
return {
    updateDataStores = function(v59) --[[ Line: 224 ]] --[[ Name: updateDataStores ]]
        -- upvalues: v3 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy)
        if v59.badge then
            local l_badge_0 = v59.badge;
            v3.Badges.getBadgeInfoStore(false).updateBadges(l_badge_0);
        end;
        if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
            if v59.creator then
                local l_creator_0 = v59.creator;
                v3.Creator.getCreatorInfoStore(false).updateCreatorInfos(l_creator_0);
            end;
            if v59.universe then
                local l_universe_0 = v59.universe;
                v3.Game.getGameInfoStore(false).updateGameInfos(l_universe_0);
            end;
        end;
    end, 
    getDataObjectSignal = v30, 
    getFieldValue = function(v63, v64, v65, v66, v67) --[[ Line: 201 ]] --[[ Name: getFieldValue ]]
        -- upvalues: v58 (copy)
        if #v64 < 2 then
            return nil, nil;
        else
            local v68 = v58[v63];
            if v68 == nil then
                return nil, nil;
            else
                return v68(v63, v64, v65, v66, v67);
            end;
        end;
    end, 
    calculateBadgeDerivedField = v25, 
    isClientContentType = v33, 
    getFieldValueForClientContentType = v39
};