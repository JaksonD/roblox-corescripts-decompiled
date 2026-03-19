local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_Cryo_0 = v1.Cryo;
local l_Foundation_0 = v1.Foundation;
local l_Roact_0 = v1.Roact;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_useSelector_0 = v1.Hooks.useSelector;
local l_SquadState_0 = v1.SquadsCore.Enums.SquadState;
local l_useSquadState_0 = v1.SquadsCore.Hooks.useSquadState;
local l_useTokens_0 = l_Foundation_0.Hooks.useTokens;
local _ = require(l_script_FirstAncestor_0.Common.ModelTypes);
local v14 = require(l_script_FirstAncestor_0.Enums.SquadUserPartyStatus);
local v15 = require(script.Parent.SquadLobbyUserCard);
local v16 = require(script.Parent.SquadLobbyUpsellCard);
local v17 = game:DefineFastFlag("EmptySquadIdReinviteCheckEnabled", false);
local l_FFlagEnableSquadRegroupExperimentationSmallScreenFix_0 = require(l_Parent_0.SharedFlags).FFlagEnableSquadRegroupExperimentationSmallScreenFix;
return function(v19) --[[ Line: 47 ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalUserId_0 (copy), l_useSquadState_0 (copy), v3 (copy), l_SquadState_0 (copy), v17 (copy), l_Cryo_0 (copy), v14 (copy), l_FFlagEnableSquadRegroupExperimentationSmallScreenFix_0 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), v15 (copy), v16 (copy), l_Roact_0 (copy)
    local v20 = l_useTokens_0();
    local v21 = tonumber(l_useLocalUserId_0()) or 0;
    local v22 = l_useSquadState_0();
    local l_Medium_0 = v20.Gap.Medium;
    local l_XLarge_0 = v20.Padding.XLarge;
    local v35, v36, v37 = v3.useMemo(function() --[[ Line: 54 ]]
        -- upvalues: v19 (copy), l_XLarge_0 (copy), v22 (copy), l_SquadState_0 (ref), v17 (ref), l_Cryo_0 (ref), v14 (ref), l_Medium_0 (copy), l_FFlagEnableSquadRegroupExperimentationSmallScreenFix_0 (ref)
        if v19.containerSize.Y == 0 or v19.containerSize.X == 0 then
            return Vector2.new(0, 0), 0, 0;
        else
            local v25 = v19.containerSize.X - l_XLarge_0 * 2;
            local v26 = v25 / v19.containerSize.Y;
            local v28 = (not (not (v22 == l_SquadState_0.Initializing) or v17) or v17 and v22 ~= l_SquadState_0.Active) and 1 or math.max(#l_Cryo_0.List.filter(v19.users, function(v27) --[[ Line: 67 ]]
                -- upvalues: v14 (ref)
                return v27.partyStatus ~= v14.Inactive;
            end), 2);
            local v29 = v28 <= 3 and v26 > 1.75 and v28 * 120 + (v28 - 1) * l_Medium_0 <= v25;
            local v30 = nil;
            local v31 = nil;
            if v29 then
                v30 = 1;
                v31 = v28;
            elseif v28 <= 3 then
                v30 = v28;
                v31 = 1;
            else
                v30 = math.ceil(v28 / 2);
                v31 = 2;
            end;
            local v32 = math.min(v30, (math.clamp(math.floor((v19.containerSize.Y + l_Medium_0) / (120 + l_Medium_0)), 1, 3)));
            local v33 = (v25 + l_Medium_0) / v31 - l_Medium_0;
            local v34 = if l_FFlagEnableSquadRegroupExperimentationSmallScreenFix_0 then math.max(120, v19.containerSize.Y + l_Medium_0) / v32 - l_Medium_0 else (v19.containerSize.Y + l_Medium_0) / v32 - l_Medium_0;
            return Vector2.new(v33, v34), v30, v31;
        end;
    end, l_dependencyArray_0(l_Medium_0, v19.containerSize, v19.users, l_XLarge_0));
    local v39 = v3.useCallback(function(v38) --[[ Line: 104 ]]
        return v38.Squad.UserBlocking.isBlockedByMe;
    end, {});
    local v40 = l_useSelector_0(v39);
    local v53 = v3.useMemo(function() --[[ Line: 111 ]]
        -- upvalues: v35 (copy), v3 (ref), v15 (ref), v40 (copy), v19 (copy), v14 (ref), v21 (copy), v22 (copy), l_SquadState_0 (ref), v16 (ref), v36 (copy), v37 (copy), l_Medium_0 (copy)
        if v35.X == 0 or v35.Y == 0 then
            return {};
        else
            local v41 = {};
            local function v45(v42, v43, v44) --[[ Line: 117 ]]
                -- upvalues: v3 (ref), v15 (ref), v35 (ref), v40 (ref), v19 (ref)
                return v3.createElement(v15, {
                    size = UDim2.fromOffset(v35.X, v35.Y), 
                    isBlocked = v40[tostring(v43.userId)], 
                    isConnecting = v44, 
                    layoutOrder = v42, 
                    onActivated = v19.onUserCardActivated, 
                    user = v43, 
                    isInExperience = v19.isInExperience
                });
            end;
            for v46, v47 in ipairs(v19.users) do
                if v47.partyStatus ~= v14.Inactive then
                    if v47.userId == v21 then
                        table.insert(v41, v45(0, v47, v47.partyStatus == v14.Connecting));
                    else
                        table.insert(v41, v45(v46, v47, v47.partyStatus == v14.Connecting));
                    end;
                end;
            end;
            if #v41 == 1 and v22 ~= l_SquadState_0.Initializing then
                table.insert(v41, (v3.createElement(v16, {
                    size = UDim2.fromOffset(v35.X, v35.Y), 
                    layoutOrder = #v41 + 1, 
                    navigateToHomePage = v19.navigateToHomePage, 
                    navigateToSquadInviteFriends = v19.navigateToSquadInviteFriends
                })));
            end;
            local v48 = {};
            for v49 = 1, v36 do
                local v50 = {};
                for v51 = 1, v37 do
                    local v52 = (v49 - 1) * v37 + v51;
                    if v41[v52] then
                        v50["Card" .. v52] = v41[v52];
                    end;
                end;
                v50.UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, l_Medium_0)
                });
                v48["Row" .. v49] = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v35.Y), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v49
                }, v50);
            end;
            return v48;
        end;
    end, l_dependencyArray_0(v35, l_Medium_0, v40, v21, v37, v36, v19.navigateToHomePage, v19.navigateToSquadInviteFriends, v19.onUserCardActivated, v19.users, v22));
    v53.UIListLayout = v3.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, l_Medium_0)
    });
    v53.UIPadding = v3.createElement("UIPadding", {
        PaddingBottom = v19.paddingBottom, 
        PaddingLeft = UDim.new(0, l_XLarge_0), 
        PaddingRight = UDim.new(0, l_XLarge_0)
    });
    return l_Roact_0.createFragment(v53);
end;