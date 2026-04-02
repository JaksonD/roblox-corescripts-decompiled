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
local v18 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableSquadRegroupExperimentationSmallScreenFix_0 = v18.FFlagEnableSquadRegroupExperimentationSmallScreenFix;
local l_FFlagRemoveDependencyArrayAntipattern_0 = v18.FFlagRemoveDependencyArrayAntipattern;
return function(v21) --[[ Line: 49 ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalUserId_0 (copy), l_useSquadState_0 (copy), v3 (copy), l_SquadState_0 (copy), v17 (copy), l_Cryo_0 (copy), v14 (copy), l_FFlagEnableSquadRegroupExperimentationSmallScreenFix_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), v15 (copy), v16 (copy), l_Roact_0 (copy)
    local v22 = l_useTokens_0();
    local v23 = tonumber(l_useLocalUserId_0()) or 0;
    local v24 = l_useSquadState_0();
    local l_Medium_0 = v22.Gap.Medium;
    local l_XLarge_0 = v22.Padding.XLarge;
    local v37, v38, v39 = v3.useMemo(function() --[[ Line: 57 ]]
        -- upvalues: v21 (copy), l_XLarge_0 (copy), v24 (copy), l_SquadState_0 (ref), v17 (ref), l_Cryo_0 (ref), v14 (ref), l_Medium_0 (copy), l_FFlagEnableSquadRegroupExperimentationSmallScreenFix_0 (ref)
        if v21.containerSize.Y == 0 or v21.containerSize.X == 0 then
            return Vector2.new(0, 0), 0, 0;
        else
            local v27 = v21.containerSize.X - l_XLarge_0 * 2;
            local v28 = v27 / v21.containerSize.Y;
            local v30 = (not (not (v24 == l_SquadState_0.Initializing) or v17) or v17 and v24 ~= l_SquadState_0.Active) and 1 or math.max(#l_Cryo_0.List.filter(v21.users, function(v29) --[[ Line: 70 ]]
                -- upvalues: v14 (ref)
                return v29.partyStatus ~= v14.Inactive;
            end), 2);
            local v31 = v30 <= 3 and v28 > 1.75 and v30 * 120 + (v30 - 1) * l_Medium_0 <= v27;
            local v32 = nil;
            local v33 = nil;
            if v31 then
                v32 = 1;
                v33 = v30;
            elseif v30 <= 3 then
                v32 = v30;
                v33 = 1;
            else
                v32 = math.ceil(v30 / 2);
                v33 = 2;
            end;
            local v34 = math.min(v32, (math.clamp(math.floor((v21.containerSize.Y + l_Medium_0) / (120 + l_Medium_0)), 1, 3)));
            local v35 = (v27 + l_Medium_0) / v33 - l_Medium_0;
            local v36 = if l_FFlagEnableSquadRegroupExperimentationSmallScreenFix_0 then math.max(120, v21.containerSize.Y + l_Medium_0) / v34 - l_Medium_0 else (v21.containerSize.Y + l_Medium_0) / v34 - l_Medium_0;
            return Vector2.new(v35, v36), v32, v33;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        l_Medium_0, 
        v21.containerSize, 
        v21.users, 
        l_XLarge_0
    } else l_dependencyArray_0(l_Medium_0, v21.containerSize, v21.users, l_XLarge_0));
    local v41 = v3.useCallback(function(v40) --[[ Line: 111 ]]
        return v40.Squad.UserBlocking.isBlockedByMe;
    end, {});
    local v42 = l_useSelector_0(v41);
    local v55 = v3.useMemo(function() --[[ Line: 118 ]]
        -- upvalues: v37 (copy), v3 (ref), v15 (ref), v42 (copy), v21 (copy), v14 (ref), v23 (copy), v24 (copy), l_SquadState_0 (ref), v16 (ref), v38 (copy), v39 (copy), l_Medium_0 (copy)
        if v37.X == 0 or v37.Y == 0 then
            return {};
        else
            local v43 = {};
            local function v47(v44, v45, v46) --[[ Line: 124 ]]
                -- upvalues: v3 (ref), v15 (ref), v37 (ref), v42 (ref), v21 (ref)
                return v3.createElement(v15, {
                    size = UDim2.fromOffset(v37.X, v37.Y), 
                    isBlocked = v42[tostring(v45.userId)], 
                    isConnecting = v46, 
                    layoutOrder = v44, 
                    onActivated = v21.onUserCardActivated, 
                    user = v45, 
                    isInExperience = v21.isInExperience
                });
            end;
            for v48, v49 in ipairs(v21.users) do
                if v49.partyStatus ~= v14.Inactive then
                    if v49.userId == v23 then
                        table.insert(v43, v47(0, v49, v49.partyStatus == v14.Connecting));
                    else
                        table.insert(v43, v47(v48, v49, v49.partyStatus == v14.Connecting));
                    end;
                end;
            end;
            if #v43 == 1 and v24 ~= l_SquadState_0.Initializing then
                table.insert(v43, (v3.createElement(v16, {
                    size = UDim2.fromOffset(v37.X, v37.Y), 
                    layoutOrder = #v43 + 1, 
                    navigateToHomePage = v21.navigateToHomePage, 
                    navigateToSquadInviteFriends = v21.navigateToSquadInviteFriends
                })));
            end;
            local v50 = {};
            for v51 = 1, v38 do
                local v52 = {};
                for v53 = 1, v39 do
                    local v54 = (v51 - 1) * v39 + v53;
                    if v43[v54] then
                        v52["Card" .. v54] = v43[v54];
                    end;
                end;
                v52.UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, l_Medium_0)
                });
                v50["Row" .. v51] = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v37.Y), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v51
                }, v52);
            end;
            return v50;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v37, 
        l_Medium_0, 
        v42, 
        v23, 
        v39, 
        v38, 
        v21.navigateToHomePage, 
        v21.navigateToSquadInviteFriends, 
        v21.onUserCardActivated, 
        v21.users, 
        v24
    } else l_dependencyArray_0(v37, l_Medium_0, v42, v23, v39, v38, v21.navigateToHomePage, v21.navigateToSquadInviteFriends, v21.onUserCardActivated, v21.users, v24));
    v55.UIListLayout = v3.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, l_Medium_0)
    });
    v55.UIPadding = v3.createElement("UIPadding", {
        PaddingBottom = v21.paddingBottom, 
        PaddingLeft = UDim.new(0, l_XLarge_0), 
        PaddingRight = UDim.new(0, l_XLarge_0)
    });
    return l_Roact_0.createFragment(v55);
end;