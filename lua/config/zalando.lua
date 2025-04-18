local M = {}

M.opts = {
    basedir = "~/code",
    org = "zalando-build",
    topic = "linus",
}

local _run_command = function(command, cb_transform)
    local Job = require "plenary.job"

    local jobdef = command

    jobdef.on_exit = function(job)
        local result = job:result()
        local ok, parsed = pcall(vim.json.decode, table.concat(result, ""))
        if not ok then
            vim.notify("Failed to parse gh results", vim.log.levels.ERROR)
            return
        end

        M.items_cache = {}

        for _, item in ipairs(parsed) do
            table.insert(M.items_cache, cb_transform(item))
        end
    end

    Job:new(jobdef):start()
end


local get_repositories = function()
    if M.items_cache then
        return M.items_cache
    end

    local entries = _run_command({
        "gh", "repo", "list", "--no-archived", "--json",
        "name,nameWithOwner,description,repositoryTopics,updatedAt,url",
        M.opts.org, "--topic", M.opts.topic,
    }, function(repository)
        return {
            name = repository.name,
            text = repository.name,
            fullName = repository.fullName,
            url = repository.url,
            preview = {
                ft = "markdown",
                text = string.format([[
## %s

%s

%s
]], repository.nameWithOwner, repository.description, repository.url)
            }
        }
    end)
    M.items_cache = entries
    return entries
end

M.setup = function(user_opts)
    if user_opts ~= nil then
        M.opts = vim.tbl_deep_extend("force", M.opts, user_opts)
    end

    -- refresh the cache
    _ = get_repositories()

    vim.keymap.set("n", "<leader>gh", function()
        Snacks.picker.pick(M.picker())
    end, { desc = "Zalando Github Projects" })
end

M.picker = function()
    local basedir_expanded = vim.fn.expand(M.opts.basedir)
    local zalandoGithubPicker = {
        finder = get_repositories,
        format = "text",
        preview = "preview",

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
            browse = {
                name = "browse",
                action = function(self, item)
                    if not item then return end
                    self:close()
                    Snacks.notify("Opening in the browser")
                    vim.system({ "xdg-open", item.url })
                end,

            }
        },

        win = {
            input = {
                keys = {
                    ["<c-b>"] = {
                        "browse",
                        mode = { "n", "v", "x", "s", "o", "i", "c", "t" },
                    },
                }
            },
        }
    }
    return zalandoGithubPicker
end

return M
