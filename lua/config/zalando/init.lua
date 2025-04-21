local util = require("util")
local DEFAULT_SETTINGS = {
    basedir = "~/code",
    org = "zalando-build",
    topic = "linus",
}

local M = {}

M.opts = {}

M.cache = {}

M.refresh_cache = function()
    local Job = require "plenary.job"

    local jobdef = {
        command = "gh",
        args = { "repo", "list", "--no-archived", "--limit", "1000", "--source", "--json",
            "name,owner,description,repositoryTopics,updatedAt,url,viewerHasStarred,sshUrl,issues,pullRequests,stargazerCount,updatedAt",
            M.opts.org, "--topic", M.opts.topic },

        on_exit = function(job)
            local result = job:result()
            local ok, items = pcall(vim.json.decode, table.concat(result, ""))

            if not ok then
                vim.notify("Failed to parse gh results", vim.log.levels.ERROR)
                return
            end

            for idx, item in ipairs(items) do
                item.text = item.name
                if item.viewerHasStarred then
                    item.score_add = 10000
                end
                M.cache[idx] = item
            end
        end
    }

    Job:new(jobdef):start()
end

M.finder = function()
    -- repeat vim.loop.sleep(1) until #M.cache > 0
    if #M.cache == 0 then
        M.refresh_cache()
        vim.notify("Cache is empty, please wait a moment")
        return {}
    end

    return M.cache
end


M.setup = function(user_opts)
    if user_opts ~= nil then
        M.opts = vim.tbl_deep_extend("force", DEFAULT_SETTINGS, user_opts)
    end

    M.refresh_cache()

    vim.keymap.set("n", "<leader>pg", function()
        Snacks.picker.pick(M.picker())
    end, { desc = "Zalando Github Projects" })
end

M.picker = function()
    local basedir_expanded = vim.fn.expand(M.opts.basedir)

    local zalandoGithubPicker = {

        title = "Zalando Github Projects",
        finder = M.finder,
        prompt = "   ",

        matcher = { sort_empty = true },

        format = function(item, _)
            local text = "   " .. item.text
            if item.viewerHasStarred == true then
                text = "⭐ " .. item.text
            end
            return {
                { text, item.text_hl },
            }
        end,

        preview = function(ctx)
            local item = ctx.item

            local tags = {}
            for _, topic in ipairs(item.repositoryTopics) do
                table.insert(tags, " " .. topic.name)
            end

            local lines = {
                "**" .. item.owner.login .. "/" .. item.name .. "**",
                "",
                item.description,
                "",
                "**Stats:** " ..
                table.concat({ "  " .. util.time_ago(item.updatedAt),
                    "  " .. item.issues.totalCount,
                    "  " .. item.pullRequests.totalCount,
                    "  " .. item.stargazerCount }, " | "),
                "",
                "**Topics:** " .. table.concat(tags, " "),
                "",
                "[link to the repository](" .. item.url .. ")",
                "",
                "Press <C-b> to open in the browser",
            }

            ctx.preview:set_lines(lines)
            ctx.preview:highlight({ ft = "markdown" })
        end,

        confirm = function(picker, item)
            picker:close()
            local path = table.concat({ basedir_expanded, M.opts.org, M.opts.topic, item.name }, "/")
            if vim.fn.isdirectory(path) == 1 then
                Snacks.picker.files({ cwd = path })
            else
                Snacks.input.input({
                    prompt = "The path does not exist, create it?",
                }, function(confirm)
                    if confirm then
                        local parentpath = table.concat({ basedir_expanded, M.opts.org, M.opts.topic }, "/")
                        vim.fn.mkdir(parentpath, "p")
                        vim.system({ "gh", "repo", "clone", item.url }, { cwd = parentpath }):wait()
                        Snacks.picker.files({ cwd = path })
                    else
                        Snacks.notify("Aborting")
                        return
                    end
                end)
            end
        end,

        actions = {
            refresh_cache = {
                name = "refresh_cache",
                action = function()
                    M.refresh_cache()
                end,
            },
            browse = {
                name = "browse",
                action = function(self, item)
                    if not item then return end
                    self:close()
                    Snacks.notify("Opening in the browser")
                    vim.system({ "xdg-open", item.url })
                end,
            },
            star = {
                name = "(un)star repository",
                action = function(self, item)
                    if not item then return end

                    Snacks.notify("(un)starring repository")

                    local action = "PUT"
                    if item.viewerHasStarred then
                        action = "DELETE"
                    end
                    vim.system({ "gh", "api",
                        "--method", action,
                        "-H", "Accept: application/vnd.github+json",
                        "-H", "X-GitHub-Api-Version: 2022-11-28",
                        "/user/starred/" .. item.owner.login .. "/" .. item.name
                    })
                    M.refresh_cache()
                end
            },
        },

        win = {
            preview = {
                wo = {
                    wrap = true,
                    conceallevel = 2,
                    number = false,
                    concealcursor = "nvc",
                },
            },
            input = {
                keys = {
                    ["<c-b>"] = {
                        "browse",
                        mode = { "n", "v", "x", "s", "o", "i", "c", "t" },
                    },
                    ["<c-s>"] = {
                        "star",
                        mode = { "n", "v", "x", "s", "o", "i", "c", "t" },
                    },
                }
            },
        },
    }

    return zalandoGithubPicker
end

return M
