return {
    version = 1, 
    attributes = {
        abuseVector = "in-experience", 
        experienceTargetId = "9588998913"
    }, 
    resources = {
        reportSurfaces = {
            type = "listItem", 
            value = {
                {
                    leading = "Microphone", 
                    id = "voiceChat", 
                    label = {
                        ["$translate"] = "Label.SurfaceVoiceChat"
                    }, 
                    meta = {
                        routeVoiceChat = true
                    }
                }, 
                {
                    leading = "SpeechBubbleAlignCenter", 
                    id = "textChat", 
                    label = {
                        ["$translate"] = "Label.SurfaceTextChat"
                    }, 
                    meta = {
                        routeTextChat = true
                    }
                }, 
                {
                    leading = "Person", 
                    id = "avatarOrName", 
                    label = "Someone playing", 
                    description = "Their username, avatar, or behavior", 
                    meta = {
                        routeAvatarOrName = true
                    }
                }, 
                {
                    leading = "Controller", 
                    id = "gameOrExperience", 
                    label = "The game or experience", 
                    description = "Objects, sounds, or the whole experience", 
                    meta = {
                        routeGameOrExperience = true
                    }
                }
            }
        }, 
        temporaryUsers = {
            type = "listItem", 
            value = {
                {
                    id = "user1", 
                    label = "DisplayName1", 
                    description = "@username1"
                }, 
                {
                    id = "user2", 
                    label = "DisplayName2", 
                    description = "@username2"
                }, 
                {
                    id = "user3", 
                    label = "DisplayName3", 
                    description = "@username3"
                }
            }
        }, 
        experienceTargets = {
            type = "listItem", 
            value = {
                {
                    leading = "CubeQuestionMark", 
                    id = "somethingInExperience", 
                    label = "Something in the experience", 
                    meta = {
                        routeHighlightMode = true
                    }
                }, 
                {
                    leading = "Controller", 
                    id = "wholeGameOrExperience", 
                    label = "The whole game or experience"
                }
            }
        }, 
        abuseTypes = {
            type = "listItem", 
            value = {
                {
                    id = "ABUSE_CATEGORY_BULLYING", 
                    label = {
                        ["$translate"] = "Label.AbuseBullying"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseBullying"
                    }, 
                    meta = {
                        showHelpline = true
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_SWEARING", 
                    label = {
                        ["$translate"] = "Label.AbuseSwearing"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseSwearing"
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_SCAMMING", 
                    label = {
                        ["$translate"] = "Label.AbuseScamming"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseScamming"
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_CHEATING", 
                    label = {
                        ["$translate"] = "Label.AbuseCheating"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseCheating"
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_PERSONAL_QUESTION", 
                    label = {
                        ["$translate"] = "Label.AbusePersonalInformation"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbusePersonalInformation"
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_HATE_SPEECH", 
                    label = {
                        ["$translate"] = "Label.AbuseDiscrimination"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseDiscrimination"
                    }, 
                    meta = {
                        showHelpline = true
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_SPAMMING", 
                    label = {
                        ["$translate"] = "Label.AbuseSpam"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseSpam"
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_OFFSITE_LINKS", 
                    label = {
                        ["$translate"] = "Label.AbuseOffPlatformLinks"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseOffPlatformLinks"
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_DATING_OR_SEXUAL_CONTENT", 
                    label = {
                        ["$translate"] = "Label.AbuseRomanceSex"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseRomanceSex"
                    }, 
                    meta = {
                        showHelpline = true
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_VIOLENCE_OR_TERRORISM", 
                    label = {
                        ["$translate"] = "Label.AbuseViolence"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseViolence"
                    }, 
                    meta = {
                        showHelpline = true
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_DANGEROUS_ASK", 
                    label = {
                        ["$translate"] = "Label.AbuseDangerousSuggestions"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseDangerousSuggestions"
                    }, 
                    meta = {
                        showHelpline = true
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_ASKING_OR_GIVING_PII", 
                    label = {
                        ["$translate"] = "Label.AbuseRealLifeEvents"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseRealLifeEvents"
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_SUICIDE_OR_SELF_HARM", 
                    label = {
                        ["$translate"] = "Label.AbuseInappropriateRequest"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseInappropriateRequest"
                    }
                }
            }
        }
    }, 
    display = {
        closeButtonLabel = {
            ["$translate"] = "Action.Close"
        }, 
        titleDisclosure = {
            tooltipTitle = {
                ["$translate"] = "Title.HowReportsWork"
            }, 
            tooltipText = {
                ["$translate"] = "Description.HowReportsWork"
            }, 
            closeButtonLabel = {
                ["$translate"] = "Action.Close"
            }, 
            buttonLabel = {
                ["$switch"] = {
                    {
                        condition = {
                            ["$attribute"] = "isUkRegionUser"
                        }, 
                        value = {
                            ["$translate"] = "Action.Ok"
                        }
                    }
                }
            }, 
            openByDefault = {
                ["$attribute"] = "isUkRegionUser"
            }
        }
    }, 
    nodes = {
        root = {
            type = "list", 
            variant = "chevron", 
            title = "Report issue", 
            items = {
                ["$resource"] = "reportSurfaces"
            }, 
            formKey = "surfaceId", 
            required = true, 
            storeSelectionAsContext = "selectedSurface", 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            errorText = {
                ["$translate"] = "Description.GeneralError"
            }, 
            retryButtonText = {
                ["$translate"] = "Action.Retry"
            }, 
            next = {
                ["$switch"] = {
                    {
                        condition = {
                            ["$context"] = "selectedSurface.meta.routeVoiceChat"
                        }, 
                        value = {
                            ["$switch"] = {
                                {
                                    condition = {
                                        ["$attribute"] = "preselectedAbuserId"
                                    }, 
                                    value = "voiceChatAbuseSelection"
                                }, 
                                {
                                    condition = true, 
                                    value = "voiceChatPlayerSelection"
                                }
                            }
                        }
                    }, 
                    {
                        condition = {
                            ["$context"] = "selectedSurface.meta.routeTextChat"
                        }, 
                        value = "textChatLineSelection"
                    }, 
                    {
                        condition = {
                            ["$context"] = "selectedSurface.meta.routeGameOrExperience"
                        }, 
                        value = "experienceSubSelection"
                    }, 
                    {
                        condition = true, 
                        value = {
                            ["$switch"] = {
                                {
                                    condition = {
                                        ["$attribute"] = "preselectedAbuserId"
                                    }, 
                                    value = "generalUserAbuseSelection"
                                }, 
                                {
                                    condition = true, 
                                    value = "generalUserSelection"
                                }
                            }
                        }
                    }
                }
            }
        }, 
        voiceChatPlayerSelection = {
            type = "list", 
            variant = "chevron", 
            title = "Who do you want to report?", 
            items = {
                ["$load"] = "voiceUsers", 
                stub = {
                    {
                        id = "12345", 
                        label = "StubUser", 
                        description = "@stubuser", 
                        meta = {
                            username = "stubuser", 
                            displayname = "Stub User"
                        }
                    }
                }
            }, 
            formKey = "voiceTargetId", 
            required = true, 
            storeSelectionAsContext = "selectedPlayer", 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            errorText = {
                ["$translate"] = "Description.GeneralError"
            }, 
            retryButtonText = {
                ["$translate"] = "Action.Retry"
            }, 
            next = "voiceChatAbuseSelection"
        }, 
        generalUserSelection = {
            type = "list", 
            variant = "chevron", 
            title = "Who do you want to report?", 
            items = {
                ["$load"] = "users", 
                stub = {
                    {
                        id = "12345", 
                        label = "StubUser", 
                        description = "@stubuser", 
                        meta = {
                            username = "stubuser", 
                            displayname = "Stub User"
                        }
                    }
                }
            }, 
            formKey = "playerTargetId", 
            required = true, 
            storeSelectionAsContext = "selectedPlayer", 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            errorText = {
                ["$translate"] = "Description.GeneralError"
            }, 
            retryButtonText = {
                ["$translate"] = "Action.Retry"
            }, 
            next = "generalUserAbuseSelection"
        }, 
        textChatLineSelection = {
            type = "inExpChatSelection", 
            title = "Select one chat to report", 
            items = {
                ["$load"] = "inExpChatMessages"
            }, 
            formKey = "textChatMessageId", 
            required = true, 
            storeSelectionAsContext = "selectedTextChatMessage", 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            errorText = {
                ["$translate"] = "Description.GeneralError"
            }, 
            retryButtonText = {
                ["$translate"] = "Action.Retry"
            }, 
            emptyText = {
                ["$translate"] = "Label.NoChatMessages"
            }, 
            next = {
                type = "goto", 
                nodeId = "textChatAbuseSelection", 
                replace = true
            }
        }, 
        experienceSubSelection = {
            type = "list", 
            variant = "chevron", 
            title = "What do you want to report?", 
            items = {
                ["$resource"] = "experienceTargets"
            }, 
            formKey = "gameExperienceTargetId", 
            required = true, 
            storeSelectionAsContext = "selectedGameExperienceTarget", 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            errorText = {
                ["$translate"] = "Description.GeneralError"
            }, 
            retryButtonText = {
                ["$translate"] = "Action.Retry"
            }, 
            next = {
                ["$switch"] = {
                    {
                        condition = {
                            ["$context"] = "selectedGameExperienceTarget.meta.routeHighlightMode"
                        }, 
                        value = "sceneSelection"
                    }, 
                    {
                        condition = true, 
                        value = "experienceAbuseSelection"
                    }
                }
            }
        }, 
        sceneSelection = {
            type = "inExpSceneSelection", 
            title = "Highlight the problem", 
            openingStatusText = "Opening scene selection...", 
            failedStatusText = "Unable to open scene selection.", 
            next = {
                type = "close"
            }
        }, 
        voiceChatAbuseSelection = {
            type = "list", 
            variant = "chevron", 
            title = {
                ["$translate"] = "Title.WhatIssue"
            }, 
            items = {
                ["$resource"] = "abuseTypes"
            }, 
            formKey = "abuseTypeId", 
            required = true, 
            storeSelectionAsContext = "selectedAbuseType", 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            errorText = {
                ["$translate"] = "Description.GeneralError"
            }, 
            retryButtonText = {
                ["$translate"] = "Action.Retry"
            }, 
            next = "socialComment"
        }, 
        textChatAbuseSelection = {
            type = "list", 
            variant = "chevron", 
            title = {
                ["$translate"] = "Title.WhatIssue"
            }, 
            items = {
                ["$resource"] = "abuseTypes"
            }, 
            formKey = "abuseTypeId", 
            required = true, 
            storeSelectionAsContext = "selectedAbuseType", 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            errorText = {
                ["$translate"] = "Description.GeneralError"
            }, 
            retryButtonText = {
                ["$translate"] = "Action.Retry"
            }, 
            next = "socialComment"
        }, 
        generalUserAbuseSelection = {
            type = "list", 
            variant = "chevron", 
            title = {
                ["$translate"] = "Title.WhatIssue"
            }, 
            items = {
                ["$resource"] = "abuseTypes"
            }, 
            formKey = "abuseTypeId", 
            required = true, 
            storeSelectionAsContext = "selectedAbuseType", 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            errorText = {
                ["$translate"] = "Description.GeneralError"
            }, 
            retryButtonText = {
                ["$translate"] = "Action.Retry"
            }, 
            next = "socialComment"
        }, 
        experienceAbuseSelection = {
            type = "list", 
            variant = "chevron", 
            title = {
                ["$translate"] = "Title.WhatIssue"
            }, 
            items = {
                ["$resource"] = "abuseTypes"
            }, 
            formKey = "abuseTypeId", 
            required = true, 
            storeSelectionAsContext = "selectedAbuseType", 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            errorText = {
                ["$translate"] = "Description.GeneralError"
            }, 
            retryButtonText = {
                ["$translate"] = "Action.Retry"
            }, 
            next = "gameExperienceComment"
        }, 
        socialComment = {
            type = "comment", 
            title = "Report summary", 
            formKey = "comment", 
            textAreaLabel = "More details (optional)", 
            placeholder = "Tell us what happened", 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            next = "socialSummary"
        }, 
        socialSummary = {
            type = "review", 
            title = "Report summary", 
            preview = {
                ["$switch"] = {
                    {
                        condition = {
                            ["$context"] = "selectedTextChatMessage.label"
                        }, 
                        value = {
                            type = "chat", 
                            text = {
                                ["$context"] = "selectedTextChatMessage.label"
                            }
                        }
                    }, 
                    {
                        condition = {
                            ["$attribute"] = "preselectedAbuserId"
                        }, 
                        value = {
                            type = "user", 
                            id = {
                                ["$attribute"] = "preselectedAbuserId"
                            }, 
                            displayName = {
                                ["$attribute"] = "preselectedAbuserDisplayName"
                            }, 
                            username = {
                                ["$attribute"] = "preselectedAbuserUsername"
                            }
                        }
                    }, 
                    {
                        condition = true, 
                        value = {
                            type = "user", 
                            id = {
                                ["$context"] = "selectedPlayer.id"
                            }, 
                            displayName = {
                                ["$context"] = "selectedPlayer.label"
                            }, 
                            username = {
                                ["$context"] = "selectedPlayer.description"
                            }
                        }
                    }
                }
            }, 
            details = {
                {
                    heading = "What was the issue?", 
                    text = {
                        ["$context"] = "selectedAbuseType.label"
                    }
                }
            }, 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            next = {
                type = "submitForm", 
                onSuccess = "userConfirmation", 
                onFailure = "generalError"
            }
        }, 
        gameExperienceComment = {
            type = "comment", 
            title = "Report summary", 
            formKey = "comment", 
            textAreaLabel = "More details (optional)", 
            placeholder = "Tell us what happened", 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            next = "gameExperienceSummary"
        }, 
        gameExperienceSummary = {
            type = "review", 
            title = "Report summary", 
            preview = {
                type = "experience", 
                id = {
                    ["$attribute"] = "experienceTargetId"
                }
            }, 
            details = {
                {
                    heading = "What was the issue?", 
                    text = {
                        ["$context"] = "selectedAbuseType.label"
                    }
                }
            }, 
            nextButtonText = "Submit", 
            next = {
                type = "submitForm", 
                onSuccess = "experienceConfirmation", 
                onFailure = "generalError"
            }
        }, 
        userConfirmation = {
            type = "inExpConfirmation", 
            title = "Thanks for your report", 
            message = "Our moderation team will use it to make Roblox safer for you and everyone.", 
            blockToggle = {
                label = "Block [username]", 
                description = "You won't see them anymore", 
                errorLabel = {
                    ["$translate"] = "Label.GeneralError"
                }, 
                userId = {
                    ["$switch"] = {
                        {
                            condition = {
                                ["$attribute"] = "preselectedAbuserId"
                            }, 
                            value = {
                                ["$attribute"] = "preselectedAbuserId"
                            }
                        }, 
                        {
                            condition = true, 
                            value = {
                                ["$context"] = "selectedPlayer.id"
                            }
                        }
                    }
                }, 
                blockedSnackbarMessage = {
                    ["$translate"] = "Label.BlockedPerson"
                }, 
                unblockedSnackbarMessage = {
                    ["$translate"] = "Label.UnblockedPerson"
                }
            }, 
            muteToggle = {
                label = "Mute [username]", 
                description = "You won't see chats from them anymore", 
                errorLabel = {
                    ["$translate"] = "Label.GeneralError"
                }, 
                userId = {
                    ["$switch"] = {
                        {
                            condition = {
                                ["$attribute"] = "preselectedAbuserId"
                            }, 
                            value = {
                                ["$attribute"] = "preselectedAbuserId"
                            }
                        }, 
                        {
                            condition = true, 
                            value = {
                                ["$context"] = "selectedPlayer.id"
                            }
                        }
                    }
                }, 
                mutedSnackbarMessage = {
                    ["$translate"] = "Label.MutedPerson"
                }, 
                unmutedSnackbarMessage = {
                    ["$translate"] = "Label.UnmutedPerson"
                }
            }, 
            helpline = {
                ["$switch"] = {
                    {
                        condition = {
                            ["$context"] = "selectedAbuseType.meta.showHelpline"
                        }, 
                        value = {
                            buttonText = {
                                ["$translate"] = "Action.ViewHelplines"
                            }, 
                            heading = "If you or someone you know is struggling, please reach out for help.", 
                            href = "https://roblox.findahelpline.com/"
                        }
                    }
                }
            }, 
            nextButtonText = {
                ["$translate"] = "Action.Close"
            }, 
            next = {
                type = "reset"
            }
        }, 
        experienceConfirmation = {
            type = "inExpConfirmation", 
            title = "Thanks for your report", 
            message = "Our moderation team will use it to make Roblox safer for you and everyone.", 
            helpline = {
                ["$switch"] = {
                    {
                        condition = {
                            ["$context"] = "selectedAbuseType.meta.showHelpline"
                        }, 
                        value = {
                            buttonText = {
                                ["$translate"] = "Action.ViewHelplines"
                            }, 
                            heading = "If you or someone you know is struggling, please reach out for help.", 
                            href = "https://roblox.findahelpline.com/"
                        }
                    }
                }
            }, 
            nextButtonText = {
                ["$translate"] = "Action.Close"
            }, 
            next = {
                type = "reset"
            }
        }, 
        generalError = {
            type = "paragraph", 
            title = {
                ["$translate"] = "Title.SomethingWentWrong"
            }, 
            paragraph = {
                ["$translate"] = "Description.SomethingWentWrong"
            }, 
            nextButtonText = {
                ["$translate"] = "Action.Close"
            }, 
            next = {
                type = "close"
            }
        }
    }, 
    submission = {
        endpoint = {
            ["$switch"] = {
                {
                    condition = {
                        ["$context"] = "selectedSurface.meta.routeVoiceChat"
                    }, 
                    value = "voice"
                }, 
                {
                    condition = {
                        ["$context"] = "selectedSurface.meta.routeTextChat"
                    }, 
                    value = "chat"
                }, 
                {
                    condition = {
                        ["$context"] = "selectedSurface.meta.routeAvatarOrName"
                    }, 
                    value = "avatar"
                }, 
                {
                    condition = {
                        ["$context"] = "selectedSurface.meta.routeGameOrExperience"
                    }, 
                    value = "place"
                }
            }
        }, 
        data = {
            abuseVector = {
                ["$switch"] = {
                    {
                        condition = {
                            ["$context"] = "selectedSurface.meta.routeVoiceChat"
                        }, 
                        value = "voice"
                    }, 
                    {
                        condition = {
                            ["$context"] = "selectedSurface.meta.routeTextChat"
                        }, 
                        value = "chat"
                    }, 
                    {
                        condition = {
                            ["$context"] = "selectedSurface.meta.routeAvatarOrName"
                        }, 
                        value = "avatar"
                    }, 
                    {
                        condition = {
                            ["$context"] = "selectedSurface.meta.routeGameOrExperience"
                        }, 
                        value = "place"
                    }
                }
            }, 
            targetIdStr = {
                ["$switch"] = {
                    {
                        condition = {
                            ["$attribute"] = "preselectedAbuserId"
                        }, 
                        value = {
                            ["$attribute"] = "preselectedAbuserId"
                        }
                    }, 
                    {
                        condition = {
                            ["$context"] = "selectedPlayer.id"
                        }, 
                        value = {
                            ["$context"] = "selectedPlayer.id"
                        }
                    }, 
                    {
                        condition = true, 
                        value = {
                            ["$attribute"] = "experienceTargetId"
                        }
                    }
                }
            }, 
            category = {
                ["$formData"] = "abuseTypeId"
            }, 
            comment = {
                ["$formData"] = "comment"
            }, 
            custom = {
                textChatMessageId = {
                    ["$formData"] = "textChatMessageId"
                }
            }
        }
    }, 
    translations = {
        ["Action.Close"] = "Close", 
        ["Action.Continue"] = "Continue", 
        ["Action.Retry"] = "Retry", 
        ["Label.NoChatMessages"] = "No chat messages", 
        ["Description.GeneralError"] = "Something went wrong. Please try again later.", 
        ["Action.Ok"] = "OK", 
        ["Action.ViewHelplines"] = "View helplines", 
        ["Description.AbuseBullying"] = "Being mean to someone or threatening them", 
        ["Description.AbuseCheating"] = "Using hacks or exploits. Breaking a game's rules to win.", 
        ["Description.AbuseDangerousSuggestions"] = "Sharing viral challenges, instructions, and other information that can hurt people in real life", 
        ["Description.AbuseDiscrimination"] = "Being mean to someone because of their race, age, or other parts of their identity", 
        ["Description.AbuseInappropriateRequest"] = "People asking you to keep secrets, meet in real life, or join harmful groups", 
        ["Description.AbuseOffPlatformLinks"] = "Sharing links to other websites and apps, trading Robux outside Roblox", 
        ["Description.AbusePersonalInformation"] = "Asking for or sending full names, phone numbers, addresses, passwords, and more", 
        ["Description.AbuseRealLifeEvents"] = "Recreating or making fun of tragedies, political demonstrations, or other events that may be upsetting", 
        ["Description.AbuseRomanceSex"] = "Wearing revealing outfits, flirting, or kissing. Sexual words or actions.", 
        ["Description.AbuseScamming"] = "Fake trading, lying to get items, and misleading people", 
        ["Description.AbuseSpam"] = "Sending the same message many times, uploading the same files many times", 
        ["Description.AbuseSwearing"] = "Using swear words, even if they're misspelled or spelled with symbols", 
        ["Description.AbuseViolence"] = "Showing a person, animal, or character that's hurt or suffering in a way that looks real", 
        ["Description.HowReportsWork"] = "We'll review your report and take appropriate action. We won't share your information with anyone you report. Reporting doesn't block the person or thing you reported. If you want to limit your interactions with someone, you can block them.", 
        ["Description.SomethingWentWrong"] = "We weren't able to submit your report. Please try again later.", 
        ["Label.AbuseBullying"] = "Bullying", 
        ["Label.AbuseCheating"] = "Cheating", 
        ["Label.AbuseDangerousSuggestions"] = "Dangerous suggestions", 
        ["Label.AbuseDiscrimination"] = "Discrimination", 
        ["Label.AbuseInappropriateRequest"] = "Asking you to do things that aren't safe", 
        ["Label.AbuseOffPlatformLinks"] = "Outside links and trading", 
        ["Label.AbusePersonalInformation"] = "Sharing personal information", 
        ["Label.AbuseRealLifeEvents"] = "Real-life events", 
        ["Label.AbuseRomanceSex"] = "Romance or sex", 
        ["Label.AbuseScamming"] = "Scams", 
        ["Label.AbuseSpam"] = "Spam", 
        ["Label.AbuseSwearing"] = "Swearing", 
        ["Label.AbuseViolence"] = "Extreme violence", 
        ["Label.BlockedPerson"] = "You blocked this person", 
        ["Label.GeneralError"] = "Something went wrong. Please try again later.", 
        ["Label.MutedPerson"] = "You muted this person", 
        ["Label.SurfaceTextChat"] = "Text chat messages", 
        ["Label.SurfaceVoiceChat"] = "Voice chat messages", 
        ["Label.UnblockedPerson"] = "You unblocked this person", 
        ["Label.UnmutedPerson"] = "You unmuted this person", 
        ["Title.HowReportsWork"] = "How reports work", 
        ["Title.SomethingWentWrong"] = "Something went wrong", 
        ["Title.WhatIssue"] = "What was the issue?"
    }
};