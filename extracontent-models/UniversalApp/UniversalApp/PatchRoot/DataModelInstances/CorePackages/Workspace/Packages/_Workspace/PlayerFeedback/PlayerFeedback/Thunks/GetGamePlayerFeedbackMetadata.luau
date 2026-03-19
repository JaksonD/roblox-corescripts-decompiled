local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayerFeedback");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local v4 = require(l_script_FirstAncestor_0.Utils.GameGetPlayerFeedbackMetadata);
local v5 = require(l_script_FirstAncestor_0.Enums.FeedbackChannel);
local l_VoteStatus_0 = require(l_Parent_0.GameVotesRodux).Enums.VoteStatus;
local v7 = require(l_Parent_0.t);
local l_flaggedMutedError_0 = require(l_Parent_0.Loggers).flaggedMutedError;
local _ = require(l_script_FirstAncestor_0.Types);
local function _(v10) --[[ Line: 14 ]] --[[ Name: fetchKeymapper ]]
    return "luaapp.asset-review-api.channels" .. v10;
end;
local v12 = {
    [l_VoteStatus_0.VotedUp] = "Upvote", 
    [l_VoteStatus_0.VotedDown] = "Downvote"
};
local _ = function(v13, v14) --[[ Line: 23 ]] --[[ Name: findCategoryByType ]]
    for _, v16 in ipairs(v13) do
        if v16.type == v14 then
            return v16;
        end;
    end;
    return nil;
end;
local v18 = {};
local v19 = v7.interface({
    capabilities = v7.interface({
        can_submit_review = v7.boolean, 
        can_submit_category_options = v7.boolean, 
        can_submit_comment = v7.boolean
    }), 
    categories = v7.array(v7.interface({
        type = v7.string, 
        label = v7.string, 
        allows_multiple_selections = v7.boolean, 
        options = v7.array(v7.interface({
            id = v7.string, 
            label = v7.string
        }))
    })), 
    comment = v7.interface({
        label = v7.string, 
        placeholder_text = v7.string, 
        minimum_length = v7.number, 
        maximum_length = v7.number
    }), 
    metadata = v7.interface({
        disclaimer_label = v7.string, 
        submit_button_label = v7.string, 
        form_title_label = v7.string
    })
});
v18.Get = function(v20, _, v22, v23) --[[ Line: 62 ]] --[[ Name: Get ]]
    -- upvalues: l_PerformFetch_0 (copy), v4 (copy), v5 (copy), v19 (copy), l_flaggedMutedError_0 (copy), v2 (copy), v12 (copy)
    return l_PerformFetch_0.Single("luaapp.asset-review-api.channels" .. v22, function(_) --[[ Line: 63 ]]
        -- upvalues: v4 (ref), v20 (copy), v5 (ref), v22 (copy), v19 (ref), l_flaggedMutedError_0 (ref), v2 (ref), v12 (ref), v23 (copy)
        return v4(v20, v5.ExperienceDiscoveryPage, v22):andThen(function(v25) --[[ Line: 65 ]]
            -- upvalues: v19 (ref), l_flaggedMutedError_0 (ref), v2 (ref), v12 (ref), v23 (ref), v22 (ref)
            local v26 = false;
            local v27 = v25 and v25.responseBody;
            local v28, v29 = v19(v27);
            if not v28 then
                l_flaggedMutedError_0("PlayerFeedbackMetadata", v29);
                return v2.reject({
                    HttpError = Enum.HttpError.OK
                });
            else
                local v30 = v12[v23];
                local l_categories_0 = v27.categories;
                local v32;
                for _, v34 in ipairs(l_categories_0) do
                    if v34.type == v30 then
                        v32 = v34;
                        v26 = true;
                    end;
                    if v26 then
                        break;
                    end;
                end;
                if not v26 then
                    v32 = nil;
                end;
                v26 = false;
                if v32 == nil then
                    l_flaggedMutedError_0("PlayerFeedbackMetadata", string.format("Invalid category from player feedback metadata response: %s", v30));
                    return v2.reject({
                        HttpError = Enum.HttpError.OK
                    });
                else
                    l_categories_0 = {
                        rootPlaceId = v22, 
                        canSubmitReview = v27.capabilities.can_submit_review, 
                        canSubmitComment = v27.capabilities.can_submit_comment, 
                        categoryType = v30, 
                        category = v32, 
                        comment = v27.comment, 
                        metadata = v27.metadata
                    };
                    return v2.resolve(l_categories_0);
                end;
            end;
        end, function(v35) --[[ Line: 94 ]]
            -- upvalues: v2 (ref)
            return v2.reject(v35);
        end);
    end);
end;
v18.GetFetchingStatus = function(v36, v37) --[[ Line: 100 ]] --[[ Name: GetFetchingStatus ]]
    -- upvalues: l_PerformFetch_0 (copy)
    return l_PerformFetch_0.GetStatus(v36, "luaapp.asset-review-api.channels" .. v37);
end;
return v18;