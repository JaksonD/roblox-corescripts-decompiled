local l_script_FirstAncestor_0 = script:FindFirstAncestor("VoiceChat");
local v1 = require(l_script_FirstAncestor_0.AgeVerificationOverlay.PostRecordUserSeenModal);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
return {
    KeyMapper = "luaapp.recorduserseenmodalupsell", 
    Fetch = function(v5) --[[ Line: 13 ]] --[[ Name: Fetch ]]
        -- upvalues: l_PerformFetch_0 (copy), v1 (copy), v3 (copy)
        return l_PerformFetch_0.Single("luaapp.recorduserseenmodalupsell", function(_) --[[ Line: 14 ]]
            -- upvalues: v1 (ref), v5 (copy), v3 (ref)
            return v1(v5):andThen(function(v7) --[[ Line: 15 ]]
                -- upvalues: v3 (ref)
                if v7.responseBody ~= nil and v7.responseCode == 200 then
                    return (v3.resolve());
                else
                    return (v3.reject());
                end;
            end);
        end);
    end, 
    GetFetchingStatus = function(v8) --[[ Line: 22 ]] --[[ Name: GetFetchingStatus ]]
        -- upvalues: l_PerformFetch_0 (copy)
        return l_PerformFetch_0.GetStatus(v8, "luaapp.recorduserseenmodalupsell");
    end
};