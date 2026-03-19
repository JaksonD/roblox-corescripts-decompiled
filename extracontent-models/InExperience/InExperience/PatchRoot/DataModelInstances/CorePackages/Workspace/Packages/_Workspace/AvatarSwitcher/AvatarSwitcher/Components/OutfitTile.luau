local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarSwitcher");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_SessionService_0 = game:GetService("SessionService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v4.Hooks.useTokens;
local v6 = require(l_Parent_0.Signals);
local v7 = require(l_Parent_0.SignalsReact);
local v8 = require(l_Parent_0.AvatarExperienceAnalytics);
local l_addUnifiedEventLogging_0 = v8.addUnifiedEventLogging;
local l_UnifiedEventLogEnums_0 = v8.UnifiedEventLogEnums;
local l_UnifiedLoggingSurface_0 = require(l_Parent_0.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface;
local v12 = require(l_script_FirstAncestor_0.Stores.getAvatarSwitcherStore);
local _ = require(l_script_FirstAncestor_0.types);
local l_FFlagAvatarSwitcherUseAvatarInventoryEndpoint_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAvatarSwitcherUseAvatarInventoryEndpoint;
return v3.memo(function(v15) --[[ Line: 38 ]] --[[ Name: OutfitTile ]]
    -- upvalues: v7 (copy), v12 (copy), v3 (copy), l_useTokens_0 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_UnifiedLoggingSurface_0 (copy), l_SessionService_0 (copy), v6 (copy), v4 (copy), l_FFlagAvatarSwitcherUseAvatarInventoryEndpoint_0 (copy)
    local v16 = v7.useSignalState(v12);
    local v17 = v3.useRef(nil);
    local v18 = l_useTokens_0();
    local l_id_0 = v15.outfitInfo.id;
    v3.useEffect(function() --[[ Line: 45 ]]
        -- upvalues: l_addUnifiedEventLogging_0 (ref), v17 (copy), l_UnifiedEventLogEnums_0 (ref), l_UnifiedLoggingSurface_0 (ref), v15 (copy), l_id_0 (copy), l_SessionService_0 (ref)
        task.delay(0, function() --[[ Line: 48 ]]
            -- upvalues: l_addUnifiedEventLogging_0 (ref), v17 (ref), l_UnifiedEventLogEnums_0 (ref), l_UnifiedLoggingSurface_0 (ref), v15 (ref), l_id_0 (ref), l_SessionService_0 (ref)
            l_addUnifiedEventLogging_0(v17, {
                action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                surface = l_UnifiedLoggingSurface_0.IN_EXPERIENCE_AVATAR_SWITCHER, 
                gridPositionRow = v15.gridPosition.row, 
                gridPositionColumn = v15.gridPosition.column, 
                itemId = l_id_0, 
                elementName = "OUTFIT_TILE"
            }, {
                sessionTagName = l_SessionService_0:GetSessionTag("level2a")
            });
        end);
    end, {
        v15.gridPosition, 
        l_id_0
    });
    local v22 = v3.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: v6 (ref), l_id_0 (copy), v16 (copy)
        return v6.createComputed(function(v20) --[[ Line: 63 ]]
            -- upvalues: l_id_0 (ref), v16 (ref)
            local v21 = false;
            if l_id_0 ~= nil then
                v21 = v16.getSelectedOutfitId(v20) == l_id_0;
            end;
            return v21;
        end);
    end, {
        v16, 
        l_id_0
    });
    local v23 = v7.useSignalState(v22) and not v15.disabled;
    local v24 = v3.useCallback(function() --[[ Line: 69 ]]
        -- upvalues: v16 (copy), l_id_0 (copy)
        v16.selectOutfit(l_id_0);
    end, {
        v16, 
        l_id_0
    });
    return (v3.createElement(v4.View, {
        tag = "col gap-small auto-y size-full-0", 
        GroupTransparency = v15.disabled and 0.5 or nil, 
        LayoutOrder = v15.LayoutOrder
    }, {
        Thumbnail = l_id_0 and v3.createElement(v4.Image, {
            tag = {
                [l_FFlagAvatarSwitcherUseAvatarInventoryEndpoint_0 and "radius-medium bg-shift-200 padding-small" or "radius-medium bg-shift-200"] = true, 
                ["stroke-standard stroke-system-contrast"] = v23
            }, 
            Size = UDim2.fromScale(1, 1.5), 
            SizeConstraint = Enum.SizeConstraint.RelativeXX, 
            Image = ("rbxthumb://type=Outfit&id=%*&w=150&h=150"):format(l_id_0), 
            ScaleType = Enum.ScaleType.Crop, 
            LayoutOrder = 1, 
            onActivated = if v15.disabled then nil else v24, 
            ref = v17
        }, {
            WarningIcon = l_FFlagAvatarSwitcherUseAvatarInventoryEndpoint_0 and v15.outfitInfo.hasWarning and v3.createElement(v4.Image, {
                tag = "size-500", 
                imageStyle = if not v23 then {
                    Transparency = 0.5
                } else nil, 
                Image = "icons/actions/info"
            })
        }), 
        ThumbnailShimmer = not l_id_0 and v3.createElement(v4.View, {
            Size = UDim2.fromScale(1, 1.5), 
            SizeConstraint = Enum.SizeConstraint.RelativeXX, 
            LayoutOrder = 1
        }, {
            Shimmer = v3.createElement(v4.Skeleton, {
                Size = UDim2.fromScale(1, 1)
            })
        }), 
        NameLabel = v15.outfitInfo.name and v3.createElement(v4.Text, {
            tag = "size-full-0 auto-y text-align-x-left text-title-small content-emphasis text-wrap", 
            Text = v15.outfitInfo.name, 
            LayoutOrder = 2
        }), 
        NameLabelShimmer = not v15.outfitInfo.name and v3.createElement(v4.Skeleton, {
            Size = UDim2.new(1, 0, 0, v18.FontSize.FontSize_300), 
            LayoutOrder = 2
        })
    }));
end);