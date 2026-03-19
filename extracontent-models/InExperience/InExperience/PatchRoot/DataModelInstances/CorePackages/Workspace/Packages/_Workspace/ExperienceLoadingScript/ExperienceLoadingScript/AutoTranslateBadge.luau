local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExperienceLoadingScript");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_Badge_0 = v3.Badge;
local l_View_0 = v3.View;
local l_BadgeVariant_0 = v3.Enums.BadgeVariant;
local l_IconName_0 = v3.Enums.IconName;
local l_IconSize_0 = v3.Enums.IconSize;
local l_IconPosition_0 = v3.Enums.IconPosition;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v11 = require(l_Parent_0.SignalsReact);
local v12 = require(l_script_FirstAncestor_0.Store.getLoadingScreenStore);
local v13 = require(l_script_FirstAncestor_0.LoadingScreenTelemetry);
return function(v14) --[[ Line: 27 ]] --[[ Name: AutoTranslateBadge ]]
    -- upvalues: l_useLocalization_0 (copy), v2 (copy), v12 (copy), v11 (copy), v13 (copy), l_View_0 (copy), l_Badge_0 (copy), l_BadgeVariant_0 (copy), l_IconName_0 (copy), l_IconSize_0 (copy), l_IconPosition_0 (copy)
    local l_universeId_0 = v14.universeId;
    local v16 = l_useLocalization_0({
        autoTranslate = "CoreScripts.TopBar.LoadingScreen.AutoTranslate"
    });
    local v19 = v2.useCallback(function(v17) --[[ Line: 33 ]]
        -- upvalues: v12 (ref), l_universeId_0 (copy)
        local v18 = v12(v17).getAndFetchPlayerLocalizationChoice((tostring(l_universeId_0))).data(v17);
        if v18 then
            return v18.IsPlayerChoiceEnabled;
        else
            return nil;
        end;
    end, {
        l_universeId_0, 
        v12
    });
    local v20 = v11.useSignalState(v19);
    local v21 = v2.useRef(v20);
    v21.current = v20;
    v2.useEffect(function() --[[ Line: 43 ]]
        -- upvalues: v21 (copy), v13 (ref)
        return function() --[[ Line: 44 ]]
            -- upvalues: v21 (ref), v13 (ref)
            if v21.current == nil then
                v13.countPlayerLocalizationChoiceNotReady();
            end;
        end;
    end, {});
    if not v20 then
        return nil;
    else
        return v2.createElement(l_View_0, {
            tag = "auto-xy padding-y-xlarge", 
            testId = "--auto-translate-badge", 
            GroupTransparency = v14.transparencyBinding, 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = v14.positionBinding:map(function(v22) --[[ Line: 60 ]]
                return UDim2.new(0.5, 0, 0.5, v22.Y / 2);
            end), 
            Size = UDim2.fromScale(0, 0)
        }, {
            Badge = v2.createElement(l_Badge_0, {
                text = v16.autoTranslate, 
                variant = l_BadgeVariant_0.OverMedia, 
                icon = {
                    name = l_IconName_0.LanguageCharacters, 
                    size = l_IconSize_0.XSmall, 
                    position = l_IconPosition_0.Left
                }
            })
        });
    end;
end;