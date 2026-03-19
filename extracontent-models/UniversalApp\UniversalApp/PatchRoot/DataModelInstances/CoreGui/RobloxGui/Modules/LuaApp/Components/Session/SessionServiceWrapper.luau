local l_SessionService_0 = game:GetService("SessionService");
local l_CorePackages_0 = game:GetService("CorePackages");
if game:DefineFastFlag("UseSessionServiceWrapperModule", false) then
    return require(l_CorePackages_0.Workspace.Packages.SessionizationUtil).SessionServiceWrapper;
else
    return {
        SessionChangedSignal = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal.new(), 
        GetRootSID = function(_) --[[ Line: 21 ]] --[[ Name: GetRootSID ]]
            -- upvalues: l_SessionService_0 (copy)
            return l_SessionService_0:GetRootSID();
        end, 
        SetSession = function(v3, v4, v5, v6) --[[ Line: 25 ]] --[[ Name: SetSession ]]
            -- upvalues: l_SessionService_0 (copy)
            local l_l_SessionService_0_SessionTag_0 = l_SessionService_0:GetSessionTag(v5);
            l_SessionService_0:SetSession(v4, v5, v6);
            local l_l_SessionService_0_SessionTag_1 = l_SessionService_0:GetSessionTag(v5);
            if l_l_SessionService_0_SessionTag_1 ~= l_l_SessionService_0_SessionTag_0 then
                v3.SessionChangedSignal:fire(v5, l_l_SessionService_0_SessionTag_1);
            end;
        end, 
        ReplaceSession = function(v9, v10, v11) --[[ Line: 37 ]] --[[ Name: ReplaceSession ]]
            -- upvalues: l_SessionService_0 (copy)
            local l_l_SessionService_0_SessionTag_2 = l_SessionService_0:GetSessionTag(v10);
            l_SessionService_0:ReplaceSession(v10, v11);
            local l_l_SessionService_0_SessionTag_3 = l_SessionService_0:GetSessionTag(v10);
            if l_l_SessionService_0_SessionTag_3 ~= l_l_SessionService_0_SessionTag_2 then
                v9.SessionChangedSignal:fire(v10, l_l_SessionService_0_SessionTag_3);
            end;
        end, 
        RemoveSession = function(_, v15) --[[ Line: 49 ]] --[[ Name: RemoveSession ]]
            -- upvalues: l_SessionService_0 (copy)
            l_SessionService_0:RemoveSession(v15);
        end, 
        RemoveSessionsWithMetadataKey = function(_, v17) --[[ Line: 53 ]] --[[ Name: RemoveSessionsWithMetadataKey ]]
            -- upvalues: l_SessionService_0 (copy)
            l_SessionService_0:RemoveSessionsWithMetadataKey(v17);
        end, 
        GetMetadata = function(_, v19, v20) --[[ Line: 57 ]] --[[ Name: GetMetadata ]]
            -- upvalues: l_SessionService_0 (copy)
            return l_SessionService_0:GetMetadata(v19, v20);
        end, 
        SetMetadata = function(_, v22, v23, v24) --[[ Line: 61 ]] --[[ Name: SetMetadata ]]
            -- upvalues: l_SessionService_0 (copy)
            l_SessionService_0:SetMetadata(v22, v23, v24);
        end, 
        RemoveMetadata = function(_, v26, v27) --[[ Line: 65 ]] --[[ Name: RemoveMetadata ]]
            -- upvalues: l_SessionService_0 (copy)
            l_SessionService_0:RemoveMetadata(v26, v27);
        end, 
        SessionExists = function(_, v29) --[[ Line: 69 ]] --[[ Name: SessionExists ]]
            -- upvalues: l_SessionService_0 (copy)
            return l_SessionService_0:SessionExists(v29);
        end, 
        GetSessionTag = function(_, v31) --[[ Line: 73 ]] --[[ Name: GetSessionTag ]]
            -- upvalues: l_SessionService_0 (copy)
            return l_SessionService_0:GetSessionTag(v31);
        end, 
        generateSessionInfoString = function(_, v33, v34, v35, v36) --[[ Line: 77 ]] --[[ Name: generateSessionInfoString ]]
            -- upvalues: l_SessionService_0 (copy)
            return l_SessionService_0:GenerateSessionInfoString(v33, v34, v35, v36);
        end
    };
end;