local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Analysis.SceneAnalysis);
local l_getHumanoidDescription_0 = require(l_Parent_0.GetHumanoidDescription).getHumanoidDescription;
local l_HttpService_0 = game:GetService("HttpService");
local v5 = {
    Variant = {
        IGARv1 = "IGARv1", 
        IGARv3 = "IGARv3"
    }
};
transformTargetPlayers = function(v6, v7) --[[ Line: 37 ]] --[[ Name: transformTargetPlayers ]]
    -- upvalues: l_getHumanoidDescription_0 (copy)
    local v8 = {};
    if v7 == 0 then
        v7 = 1;
    end;
    for _, v10 in ipairs(v6) do
        local l_player_0 = v10.player;
        local l_count_0 = v10.count;
        local v13, v14 = l_getHumanoidDescription_0(l_player_0.UserId);
        table.insert(v8, {
            userId = l_player_0.UserId, 
            hitCount = l_count_0, 
            hitPercentage = l_count_0 / v7, 
            humanoidDescription = v13, 
            humanoidDescriptionStatus = v14
        });
    end;
    return v8;
end;
serializeTargetPlayersIntoTagValues = function(v15) --[[ Line: 59 ]] --[[ Name: serializeTargetPlayersIntoTagValues ]]
    -- upvalues: l_HttpService_0 (copy)
    local v16 = {};
    for _, v18 in ipairs(v15) do
        table.insert(v16, {
            data = l_HttpService_0:JSONEncode(v18)
        });
    end;
    return v16;
end;
local function v23(v19) --[[ Line: 69 ]]
    local v20 = {};
    for _, v22 in ipairs(v19) do
        v20[#v20 + 1] = {
            v22.X, 
            v22.Y
        };
    end;
    return v20;
end;
local function _(v24) --[[ Line: 77 ]]
    local l_extractedAssets_0 = v24.extractedAssets;
    local v26 = true;
    if #l_extractedAssets_0.Image <= 0 then
        v26 = true;
        if #l_extractedAssets_0.Mesh <= 0 then
            v26 = true;
            if #l_extractedAssets_0.Model <= 0 then
                v26 = true;
                if #l_extractedAssets_0.Package <= 0 then
                    v26 = #l_extractedAssets_0.Text > 0;
                end;
            end;
        end;
    end;
    return v26;
end;
buildReport = function(v28, v29, v30, v31, v32, v33, v34, v35, v36) --[[ Line: 86 ]] --[[ Name: buildReport ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy), v23 (copy)
    local v37 = {
        tags = {
            ENTRY_POINT = {
                valueList = {
                    {
                        data = "in-experience"
                    }
                }
            }, 
            SUBMITTER_USER_ID = {
                valueList = {
                    {
                        data = tostring(v28)
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v31
                    }
                }
            }, 
            REPORTED_ABUSE_SURFACE = {
                valueList = {
                    {
                        data = v32
                    }
                }
            }, 
            PLACE_ID = {
                valueList = {
                    {
                        data = tostring(game.PlaceId)
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v33
                    }
                }
            }, 
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = v32 == "username" and "user_profile" or v32 == "text" and game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") and "in-experience-text" or "multi"
                    }
                }
            }, 
            VARIANT = {
                valueList = {
                    {
                        data = v5.Variant.IGARv1
                    }
                }
            }, 
            IGAR_REPORT_TARGET_ASSETS = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode(v30.extractedAssets)
                    }
                }
            }, 
            IGAR_EXTRACTION_STATS = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode(v30.stats)
                    }
                }
            }, 
            IGAR_ANNOTATION_COORDINATES = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode((v23(v34)))
                    }
                }
            }
        }
    };
    if game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") and #v30.extractedAssets.Text > 0 then
        v37.tags.IGAR_REPORT_TARGET_IN_EXPERIENCE_TEXT = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode(v30.extractedAssets.Text)
                }
            }
        };
    end;
    if game:GetEngineFeature("DeltaFactoryCloneJobId") then
        v37.tags.IGAR_REPORT_JOBID = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode(game.JobId)
                }
            }
        };
    end;
    if v35 then
        local l_extractedAssets_1 = v35.extractedAssets;
        local v39 = true;
        if #l_extractedAssets_1.Image <= 0 then
            v39 = true;
            if #l_extractedAssets_1.Mesh <= 0 then
                v39 = true;
                if #l_extractedAssets_1.Model <= 0 then
                    v39 = true;
                    if #l_extractedAssets_1.Package <= 0 then
                        v39 = #l_extractedAssets_1.Text > 0;
                    end;
                end;
            end;
        end;
        if v39 then
            v37.tags.IGAR_REPORT_TARGET_GUI_ASSETS = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode(v35.extractedAssets)
                    }
                }
            };
            if game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") then
                v37.tags.IGAR_REPORT_TARGET_GUI_IN_EXPERIENCE_TEXT = {
                    valueList = {
                        {
                            data = l_HttpService_0:JSONEncode(v35.extractedAssets.Text)
                        }
                    }
                };
            end;
            v37.tags.IGAR_GUI_EXTRACTION_STATS = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode(v35.stats)
                    }
                }
            };
        end;
    end;
    if #v30.extractedPlayers > 0 then
        local v40 = transformTargetPlayers(v30.extractedPlayers, v30.stats.raycastCompletedCount);
        local v41 = serializeTargetPlayersIntoTagValues(v40);
        v37.tags.IGAR_REPORT_TARGET_PLAYERS = {
            valueList = v41
        };
        if v32 == "username" then
            v37.tags.REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = tostring(v40[1].userId)
                    }
                }
            };
        end;
    end;
    if v29 then
        v37.tags.SCREENSHOT_ID = {
            valueList = {
                {
                    data = v29
                }
            }
        };
    end;
    if v36 then
        v37.tags.VARIANT.valueList[1].data = v5.Variant.IGARv3 .. "-" .. v36;
    end;
    if v32 == "username" and #v30.extractedPlayers == 0 then
        return nil;
    else
        return l_HttpService_0:JSONEncode(v37);
    end;
end;
return buildReport;