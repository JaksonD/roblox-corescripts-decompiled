local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayerFeedback");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local v4 = require(l_script_FirstAncestor_0.Utils.PostGamePlayerFeedback);
local v5 = require(l_script_FirstAncestor_0.Enums.FeedbackChannel);
local function _(v6) --[[ Line: 8 ]] --[[ Name: fetchKeymapper ]]
    return "luaapp.asset-review-api.channels.reviews" .. v6;
end;
return {
    Post = function(v8, v9, v10, v11, v12) --[[ Line: 14 ]] --[[ Name: Post ]]
        -- upvalues: l_PerformFetch_0 (copy), v4 (copy), v5 (copy), v2 (copy)
        return l_PerformFetch_0.Single("luaapp.asset-review-api.channels.reviews" .. v9, function(_) --[[ Line: 21 ]]
            -- upvalues: v4 (ref), v8 (copy), v5 (ref), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v2 (ref)
            return v4(v8, v5.ExperienceDiscoveryPage, v9, v10, v11, v12):andThen(function(v14) --[[ Line: 29 ]]
                -- upvalues: v2 (ref)
                return v2.resolve(v14);
            end, function(v15) --[[ Line: 31 ]]
                -- upvalues: v2 (ref)
                return v2.reject(v15);
            end);
        end);
    end, 
    GetPostingStatus = function(v16, v17) --[[ Line: 36 ]] --[[ Name: GetPostingStatus ]]
        -- upvalues: l_PerformFetch_0 (copy)
        return l_PerformFetch_0.GetStatus(v16, "luaapp.asset-review-api.channels.reviews" .. v17);
    end
};