local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local v4 = require(l_Parent_0.SocialToast);
local v5 = require(l_Parent_0.AvatarExperienceNavigation);
local v6 = require(l_Parent_0.RobloxAppHooks);
local v7 = require(l_Parent_0.Localization);
local l_useEffectOnMount_0 = v3.Hooks.useEffectOnMount;
local v9 = require(l_script_FirstAncestor_0.Components.EditProfileTopBar);
local v10 = require(l_script_FirstAncestor_0.Components.PersonaAvatarGrid);
local v11 = require(l_script_FirstAncestor_0.Networking.PersonasNetworking);
local v12 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v13 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v13.EventNames;
local l_useAnalytics_0 = v13.useAnalytics;
local v16 = require(l_Parent_0.Foundation);
local l_View_0 = v16.View;
local l_Button_0 = v16.Button;
local l_ButtonVariant_0 = v16.Enums.ButtonVariant;
local l_FillBehavior_0 = v16.Enums.FillBehavior;
local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_useScreenSize_0 = v6.useScreenSize;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v7.Hooks.useLocalization;
return function(v25) --[[ Line: 45 ]] --[[ Name: PersonaAvatarEntryPoint ]]
    -- upvalues: l_useDispatch_0 (copy), v4 (copy), l_useAnalytics_0 (copy), l_useLocalization_0 (copy), v12 (copy), v2 (copy), l_AvatarEditorService_0 (copy), l_useScreenSize_0 (copy), v11 (copy), l_EventNames_0 (copy), v5 (copy), l_useEffectOnMount_0 (copy), l_View_0 (copy), v9 (copy), v10 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v26 = l_useDispatch_0();
    local v27 = v4.useOpenToast();
    local v28 = l_useAnalytics_0();
    local v29 = l_useLocalization_0({
        personaOutfitError = v12.PersonaOutfitError, 
        personaOutfitTitle = v12.PersonaOutfitTitle, 
        personaSave = v12.PersonaOutfitSave
    });
    local v30 = v25.navigation.getParam("initialOutfit");
    local v31 = v25.navigation.getParam("setOutfit");
    local v32, v33 = v2.useState(v30);
    local function v38() --[[ Line: 61 ]] --[[ Name: getEditableOutfits ]]
        -- upvalues: l_AvatarEditorService_0 (ref)
        local v34 = {};
        local v35 = nil;
        v35 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_AvatarEditorService_0:GetOutfitsAsync() else l_AvatarEditorService_0:GetOutfits();
        while true do
            for _, v37 in v35:GetCurrentPage() do
                if v37.IsEditable then
                    table.insert(v34, {
                        outfitId = v37.Id, 
                        caption = v37.Name
                    });
                end;
            end;
            if not v35.IsFinished then
                v35:AdvanceToNextPageAsync();
            else
                break;
            end;
        end;
        return v34;
    end;
    local v39 = l_useScreenSize_0();
    local v40 = v2.useMemo(function() --[[ Line: 91 ]]
        -- upvalues: v25 (copy), v38 (copy)
        if v25.outfitsOverride then
            return v25.outfitsOverride;
        else
            return (v38());
        end;
    end, {
        v25.outfitsOverride
    });
    local v41 = v2.useCallback(function() --[[ Line: 98 ]]
        -- upvalues: v25 (copy)
        v25.navigation.pop();
    end, {
        v25.navigation
    });
    local v43 = v2.useCallback(function() --[[ Line: 102 ]]
        -- upvalues: v32 (copy), v30 (copy), v41 (copy), v26 (copy), v11 (ref), v31 (copy), v27 (copy), v29 (copy)
        if v32 == v30 then
            v41();
            return;
        else
            v26(v11.SetOutfit.API({
                outfitId = v32
            })):catch(function(v42) --[[ Line: 108 ]]
                -- upvalues: v31 (ref), v32 (ref), v41 (ref), v27 (ref), v29 (ref)
                if v42.HttpError == Enum.HttpError.OK then
                    v31(v32);
                    v41();
                    return;
                else
                    v27({
                        toastTitle = v29.personaOutfitError
                    });
                    return;
                end;
            end);
            return;
        end;
    end);
    local v44 = v2.useCallback(function() --[[ Line: 120 ]]
        -- upvalues: v28 (copy), l_EventNames_0 (ref), v25 (copy), v5 (ref)
        v28.fireAnalyticsEvent(l_EventNames_0.PersonaToAvatarCreator);
        v25.navigation.navigate(v5.Enums.AvatarScreen.AvatarEditor);
    end);
    l_useEffectOnMount_0(function() --[[ Line: 125 ]]
        -- upvalues: v28 (copy), l_EventNames_0 (ref)
        v28.fireAnalyticsEvent(l_EventNames_0.PersonaOutfitSelectLoaded);
    end);
    return v2.createElement(l_View_0, {
        tag = "bg-surface-100 position-top-right anchor-top-right size-full-full col"
    }, {
        SizeLimit = v2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(640, 1e999)
        }), 
        TopPadding = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 20), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }), 
        TopBar = v2.createElement(v9, {
            layoutOrder = 2, 
            onClose = v41, 
            title = v29.personaOutfitTitle
        }), 
        Grid = v2.createElement(v10, {
            layoutOrder = 3, 
            width = math.min(640, v39.x), 
            outfitTiles = v40, 
            selectedOutfit = v32, 
            setSelectedOutfit = v33, 
            onRedirect = v44
        }), 
        BottomBar = v2.createElement(l_View_0, {
            tag = "bg-surface-0 padding-x-large", 
            Size = UDim2.new(1, 0, 0, 70), 
            LayoutOrder = 4
        }, {
            SaveButton = v2.createElement(l_Button_0, {
                text = v29.personaSave, 
                onActivated = v43, 
                variant = l_ButtonVariant_0.Emphasis, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                fillBehavior = l_FillBehavior_0.Fill, 
                isDisabled = v32 == -1
            })
        })
    });
end;