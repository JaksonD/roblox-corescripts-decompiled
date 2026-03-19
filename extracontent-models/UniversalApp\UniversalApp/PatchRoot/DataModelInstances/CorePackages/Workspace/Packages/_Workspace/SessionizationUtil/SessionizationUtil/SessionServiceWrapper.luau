local l_Parent_0 = script:FindFirstAncestor("SessionizationUtil").Parent;
local l_SessionService_0 = game:GetService("SessionService");
return {
    SessionChangedSignal = require(l_Parent_0.AppCommonLib).Signal.new(), 
    GetRootSID = function(_) --[[ Line: 15 ]] --[[ Name: GetRootSID ]]
        -- upvalues: l_SessionService_0 (copy)
        return l_SessionService_0:GetRootSID();
    end, 
    SetSession = function(v3, v4, v5, v6) --[[ Line: 19 ]] --[[ Name: SetSession ]]
        -- upvalues: l_SessionService_0 (copy)
        local l_l_SessionService_0_SessionTag_0 = l_SessionService_0:GetSessionTag(v5);
        l_SessionService_0:SetSession(v4, v5, v6);
        local l_l_SessionService_0_SessionTag_1 = l_SessionService_0:GetSessionTag(v5);
        if l_l_SessionService_0_SessionTag_1 ~= l_l_SessionService_0_SessionTag_0 then
            v3.SessionChangedSignal:fire(v5, l_l_SessionService_0_SessionTag_1);
        end;
    end, 
    ReplaceSession = function(v9, v10, v11) --[[ Line: 31 ]] --[[ Name: ReplaceSession ]]
        -- upvalues: l_SessionService_0 (copy)
        local l_l_SessionService_0_SessionTag_2 = l_SessionService_0:GetSessionTag(v10);
        l_SessionService_0:ReplaceSession(v10, v11);
        local l_l_SessionService_0_SessionTag_3 = l_SessionService_0:GetSessionTag(v10);
        if l_l_SessionService_0_SessionTag_3 ~= l_l_SessionService_0_SessionTag_2 then
            v9.SessionChangedSignal:fire(v10, l_l_SessionService_0_SessionTag_3);
        end;
    end, 
    RemoveSession = function(_, v15) --[[ Line: 43 ]] --[[ Name: RemoveSession ]]
        -- upvalues: l_SessionService_0 (copy)
        l_SessionService_0:RemoveSession(v15);
    end, 
    RemoveSessionsWithMetadataKey = function(_, v17) --[[ Line: 47 ]] --[[ Name: RemoveSessionsWithMetadataKey ]]
        -- upvalues: l_SessionService_0 (copy)
        l_SessionService_0:RemoveSessionsWithMetadataKey(v17);
    end, 
    GetMetadata = function(_, v19, v20) --[[ Line: 51 ]] --[[ Name: GetMetadata ]]
        -- upvalues: l_SessionService_0 (copy)
        return l_SessionService_0:GetMetadata(v19, v20);
    end, 
    SetMetadata = function(_, v22, v23, v24) --[[ Line: 55 ]] --[[ Name: SetMetadata ]]
        -- upvalues: l_SessionService_0 (copy)
        l_SessionService_0:SetMetadata(v22, v23, v24);
    end, 
    RemoveMetadata = function(_, v26, v27) --[[ Line: 59 ]] --[[ Name: RemoveMetadata ]]
        -- upvalues: l_SessionService_0 (copy)
        l_SessionService_0:RemoveMetadata(v26, v27);
    end, 
    SessionExists = function(_, v29) --[[ Line: 63 ]] --[[ Name: SessionExists ]]
        -- upvalues: l_SessionService_0 (copy)
        return l_SessionService_0:SessionExists(v29);
    end, 
    GetSessionTag = function(_, v31) --[[ Line: 67 ]] --[[ Name: GetSessionTag ]]
        -- upvalues: l_SessionService_0 (copy)
        return l_SessionService_0:GetSessionTag(v31);
    end, 
    generateSessionInfoString = function(_, v33, v34, v35, v36) --[[ Line: 71 ]] --[[ Name: generateSessionInfoString ]]
        -- upvalues: l_SessionService_0 (copy)
        return l_SessionService_0:GenerateSessionInfoString(v33, v34, v35, v36);
    end
};