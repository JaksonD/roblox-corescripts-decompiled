local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.SignalsReact);
local v5 = require(l_Parent_0.RoactUtils);
local v6 = require(l_Parent_0.Cryo);
local l_Game_0 = require(l_Parent_0.DataHydration).Game;
local _ = require(l_Parent_0.SduiCoreSystem);
local v9 = require(l_Parent_0.PlayerFeedback);
local v10 = require(l_Parent_0.CentralOverlay);
local v11 = require(l_Parent_0.RobloxAppEnums);
local v12 = require(l_Parent_0.SharedFlags);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_GamePlayerFeedbackPrompt_0 = v9.GamePlayerFeedbackPrompt;
local l_SetCentralOverlay_0 = v10.Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = v11.CentralOverlayType;
local v18 = require(l_script_FirstAncestor_0.Content.SduiAssociatedItemsRow);
local l_GetFFlagEdpPlayerFeedbackEnabled_0 = v12.GetFFlagEdpPlayerFeedbackEnabled;
local l_FFlagSduiServerCompat_0 = v12.FFlagSduiServerCompat;
return v2.memo(function(v21) --[[ Line: 38 ]] --[[ Name: ExperienceAssociatedItemsRow ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_useTokens_0 (copy), l_useDispatch_0 (copy), l_Game_0 (copy), v4 (copy), v2 (copy), l_GetFFlagEdpPlayerFeedbackEnabled_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), v18 (copy), v6 (copy), l_GamePlayerFeedbackPrompt_0 (copy)
    local v22 = nil;
    v22 = if l_FFlagSduiServerCompat_0 then v21.layoutOrder else v21.LayoutOrder;
    local v23 = l_useTokens_0();
    local v24 = l_useDispatch_0();
    local l_universeId_0 = v21.universeId;
    local v26 = l_Game_0.getGameInfoStore(false);
    local v27 = v4.useSignalState(v26.getAndFetchGameInfo(l_universeId_0).data);
    local v28 = v27 and v27.rootPlaceId;
    local v29 = l_Game_0.getVotesStore(false);
    local v30 = v4.useSignalState(v29.getAndFetchUserVote(l_universeId_0).data);
    local v32 = v2.useCallback(function(v31) --[[ Line: 59 ]]
        -- upvalues: v28 (copy), l_Game_0 (ref)
        if not v28 then
            return nil;
        else
            return l_Game_0.getUserVoteFeedbackMetadataStore(v31).getUserVoteFeedbackMetadata(v28).data(v31);
        end;
    end, {
        v28
    });
    local v33 = v4.useSignalState(v32);
    local v34 = l_GetFFlagEdpPlayerFeedbackEnabled_0() and v33 and v33.canSubmitReview;
    local v35 = v2.useCallback(function() --[[ Line: 76 ]]
        -- upvalues: v28 (copy), l_Game_0 (ref)
        if v28 then
            l_Game_0.getUserVoteFeedbackMetadataStore(false).clearItem(v28);
        end;
    end, {
        v28
    });
    local v42 = v2.useCallback(function() --[[ Line: 84 ]]
        -- upvalues: v33 (copy), v30 (copy), v24 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), l_universeId_0 (copy), v35 (copy)
        if v33 and v33.canSubmitReview and v30 and (v30.userVote == true or v30.userVote == false) then
            local v36 = {
                [true] = "Upvote", 
                [false] = "Downvote"
            };
            local l_categories_0 = v33.categories;
            local v38 = nil;
            for _, v40 in l_categories_0 do
                if v40.type == v36[v30.userVote] then
                    v38 = v40;
                    break;
                end;
            end;
            local v41 = {
                rootPlaceId = v33.rootPlaceId, 
                canSubmitReview = v33.canSubmitReview, 
                canSubmitComment = v33.canSubmitComment, 
                categoryType = v36[v30.userVote], 
                category = v38, 
                comment = v33.comment, 
                metadata = v33.metadata
            };
            v24(l_SetCentralOverlay_0(l_CentralOverlayType_0.GamePlayerFeedbackForm, {
                universeId = l_universeId_0, 
                playerFeedbackMetadata = v41, 
                onSubmitted = v35
            }));
        end;
    end, {
        v33, 
        l_universeId_0, 
        v24, 
        v30, 
        v35
    });
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v22
    }, {
        MinHeightConstraint = v2.createElement("UISizeConstraint", {
            MinSize = Vector2.new(0, v23.Size.Size_700)
        }), 
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v23.Padding.Small)
        }), 
        ChipsRow = v2.createElement(v18, v6.Dictionary.join(v21, {
            universeId = nil, 
            LayoutOrder = not l_FFlagSduiServerCompat_0 and 1 or nil, 
            layoutOrder = l_FFlagSduiServerCompat_0 and 1 or nil
        })), 
        FeedbackPrompt = if v34 and v28 then v2.createElement(l_GamePlayerFeedbackPrompt_0, {
            placeId = v28, 
            onButtonClick = v42, 
            onDimiss = v35, 
            LayoutOrder = 2
        }) else nil
    });
end);