local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Foundation);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactAppExperiment);
local v5 = require(l_Parent_0.Components.FeedOverlay.InspectCTA);
local v6 = require(l_Parent_0.Components.FeedOverlay.ShareCTA);
local l_View_0 = v2.View;
local v8 = require(l_Parent_0.Utils.getAvatarItemIds);
local l_useAppPolicy_0 = require(l_Parent_1.UniversalAppPolicy).useAppPolicy;
local l_useUserExperiment_0 = v4.useUserExperiment;
local v11 = require(l_Parent_0.Flags.FFlagContentFeedInspectEnabledForAll);
local v12 = require(l_Parent_0.Flags.FFlagContentFeedInspectExperimentEnabled);
local v13 = require(l_Parent_0.Flags.FStringContentFeedIXPLayer);
return function(v14) --[[ Line: 28 ]]
    -- upvalues: l_useAppPolicy_0 (copy), v3 (copy), v8 (copy), v11 (copy), v12 (copy), l_useUserExperiment_0 (copy), v13 (copy), l_View_0 (copy), v5 (copy), v6 (copy)
    local v16 = l_useAppPolicy_0(function(v15) --[[ Line: 29 ]]
        return v15.getEligibleForExternalContentSharing();
    end);
    local v17 = v3.useMemo(function() --[[ Line: 33 ]]
        -- upvalues: v8 (ref), v14 (copy)
        return v8(v14.additionalInfo);
    end, {
        v14.additionalInfo
    });
    local v18 = false;
    if v11 then
        v18 = true;
    elseif v12 then
        v18 = l_useUserExperiment_0({
            v13
        }, function(v19) --[[ Line: 41 ]]
            -- upvalues: v13 (ref)
            return (v19[v13] or {}).ContentFeedInspectEnabled;
        end);
    end;
    return v3.createElement(l_View_0, {
        LayoutOrder = v14.layoutOrder, 
        tag = "align-x-center align-y-center col auto-xy bg-action-subtle items-center gap-medium"
    }, {
        InspectCTA = if v18 and v17 then v3.createElement(v5, {
            avatarItemIds = v17, 
            layoutOrder = 1, 
            postId = v14.postId
        }) else nil, 
        ShareCTA = if v16 then v3.createElement(v6, {
            creatorUserId = v14.creatorUserId, 
            layoutOrder = 2, 
            postId = v14.postId
        }) else nil
    });
end;