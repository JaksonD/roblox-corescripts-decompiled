local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Cryo_0 = v2.Cryo;
local l_NetworkingSquads_0 = v2.NetworkingSquads;
local function v10(v5) --[[ Line: 9 ]] --[[ Name: encodeInvitees ]]
    -- upvalues: l_Cryo_0 (copy), l_HttpService_0 (copy)
    local v7 = l_Cryo_0.List.map(v5, function(v6) --[[ Line: 10 ]]
        return (tonumber(v6));
    end);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 14 ]]
        -- upvalues: l_HttpService_0 (ref), v7 (copy)
        return l_HttpService_0:JSONEncode(v7);
    end);
    if l_status_0 then
        return l_result_0;
    else
        return "[]";
    end;
end;
return function(v11, v12, v13, v14, v15, v16) --[[ Line: 25 ]]
    -- upvalues: l_NetworkingSquads_0 (copy), v10 (copy), l_HttpService_0 (copy)
    return function(v17) --[[ Line: 33 ]]
        -- upvalues: l_NetworkingSquads_0 (ref), v11 (copy), v12 (copy), v14 (copy), v16 (copy), v10 (ref), v15 (copy), v13 (copy), l_HttpService_0 (ref)
        return v17:dispatch(l_NetworkingSquads_0.SquadInvite.API({
            squadId = v11, 
            parentChannelId = v12, 
            invitedUserIds = v14, 
            isReparented = v16
        })):andThen(function() --[[ Line: 41 ]]
            -- upvalues: v10 (ref), v14 (ref), v15 (ref), v13 (ref)
            local v18 = v10(v14);
            v15({
                isSuccess = true, 
                inviteeUserIds = v18, 
                inviteeCount = #v14, 
                userId = tonumber(v13)
            });
        end):catch(function(v19) --[[ Line: 51 ]]
            -- upvalues: l_HttpService_0 (ref), v10 (ref), v14 (ref), v15 (ref), v13 (ref)
            local l_Body_0 = v19.Body;
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 53 ]]
                -- upvalues: l_HttpService_0 (ref), l_Body_0 (copy)
                return l_HttpService_0:JSONDecode(l_Body_0);
            end);
            local v23 = if l_status_1 then l_result_1.errorType else nil;
            local v24 = v10(v14);
            v15({
                isSuccess = false, 
                errorMessage = v23, 
                errorType = if v19.StatusCode then tostring(v19.StatusCode) else nil, 
                inviteeUserIds = v24, 
                inviteeCount = #v14, 
                userId = tonumber(v13)
            });
        end);
    end;
end;