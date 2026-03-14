local l_Players_0 = game:GetService("Players");
local v1 = true;
local v2 = false;
local v3 = nil;
local v4 = false;
local v5 = false;
local l_BindableEvent_0 = Instance.new("BindableEvent");
return {
    InitAsync = function(_) --[[ Line: 21 ]] --[[ Name: InitAsync ]]
        -- upvalues: v1 (ref), v2 (ref), v4 (ref), v5 (ref), l_BindableEvent_0 (copy), l_Players_0 (copy), v3 (ref)
        if _G.__TESTEZ_RUNNING_TEST__ then
            v1 = false;
            v2 = true;
            return;
        elseif v4 then
            return;
        elseif v5 then
            l_BindableEvent_0.Event:Wait();
            return;
        else
            v5 = true;
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            while not l_LocalPlayer_0 do
                l_Players_0.PlayerAdded:Wait();
                l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            end;
            assert(l_LocalPlayer_0, "");
            pcall(function() --[[ Line: 45 ]]
                -- upvalues: v3 (ref), l_LocalPlayer_0 (ref)
                v3 = game:GetService("PolicyService"):GetPolicyInfoForPlayerAsync(l_LocalPlayer_0);
            end);
            if v3 then
                v1 = v3.IsSubjectToChinaPolicies;
                v2 = v3.IsContentSharingAllowed;
            end;
            v4 = true;
            l_BindableEvent_0:Fire();
            return;
        end;
    end, 
    IsSubjectToChinaPolicies = function(v9) --[[ Line: 57 ]] --[[ Name: IsSubjectToChinaPolicies ]]
        -- upvalues: v1 (ref)
        v9:InitAsync();
        return v1;
    end, 
    IsContentSharingAllowed = function(v10) --[[ Line: 63 ]] --[[ Name: IsContentSharingAllowed ]]
        -- upvalues: v2 (ref)
        v10:InitAsync();
        return v2;
    end
};