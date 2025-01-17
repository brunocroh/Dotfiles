require("parrot").setup {
  -- Providers must be explicitly added to make them available.
  providers = {
    anthropic = {
      api_key = os.getenv "ANTHROPIC_API_KEY",
    },
    gemini = {
      api_key = os.getenv "GEMINI_API_KEY",
    },
    groq = {
      api_key = os.getenv "GROQ_API_KEY",
    },
    mistral = {
      api_key = os.getenv "MISTRAL_API_KEY",
    },
    pplx = {
      api_key = os.getenv "PERPLEXITY_API_KEY",
    },
    ollama = {},
    openai = {
      api_key = os.getenv "OPENAI_API_KEY",
    },
    github = {
      api_key = os.getenv "GITHUB_TOKEN",
    },
    nvidia = {
      api_key = os.getenv "NVIDIA_API_KEY",
    },
    xai = {
      api_key = os.getenv "XAI_API_KEY",
    },
  },
  hooks = {
    Complete = function(prt, params)
      local template = [[
        I have the following code from {{filename}}:

        ```{{filetype}}
        {{selection}}
        ```

        Please finish the code above carefully and logically.
        Respond just with the snippet of code that should be inserted."
        and at the final line past the following code
        ]]
      local model_obj = prt.get_model "command"
      prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
    end,
    CompleteFullContext = function(prt, params)
      local template = [[
        I have the following code from {{filename}}:

        ```{{filetype}}
        {{filecontent}}
        ```

        Please look at the following section specifically:
        ```{{filetype}}
        {{selection}}
        ```

        Please finish the code above carefully and logically.
        Respond just with the snippet of code that should be inserted.
        ]]
      local model_obj = prt.get_model "command"
      prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
    end,
    CompleteMultiContext = function(prt, params)
      local template = [[
        I have the following code from {{filename}} and other realted files:

        ```{{filetype}}
        {{multifilecontent}}
        ```

        Please look at the following section specifically:
        ```{{filetype}}
        {{selection}}
        ```

        Please finish the code above carefully and logically.
        Respond just with the snippet of code that should be inserted.
        ]]
      local model_obj = prt.get_model "command"
      prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
    end,
    Explain = function(prt, params)
      local template = [[
        Your task is to take the code snippet from {{filename}} and explain it with gradually increasing complexity.
        Break down the code's functionality, purpose, and key components.
        The goal is to help the reader understand what the code does and how it works.

        ```{{filetype}}
        {{selection}}
        ```

        Use the markdown format with codeblocks and inline code.
        Explanation of the code above:
        ]]
      local model = prt.get_model "command"
      prt.logger.info("Explaining selection with model: " .. model.name)
      prt.Prompt(params, prt.ui.Target.new, model, nil, template)
    end,
    FixBugs = function(prt, params)
      local template = [[
        You are an expert in {{filetype}}.
        Fix bugs in the below code from {{filename}} carefully and logically:
        Your task is to analyze the provided {{filetype}} code snippet, identify
        any bugs or errors present, and provide a corrected version of the code
        that resolves these issues. Explain the problems you found in the
        original code and how your fixes address them. The corrected code should
        be functional, efficient, and adhere to best practices in
        {{filetype}} programming.

        ```{{filetype}}
        {{selection}}
        ```

        Fixed code:
        ]]
      local model_obj = prt.get_model "command"
      prt.logger.info("Fixing bugs in selection with model: " .. model_obj.name)
      prt.Prompt(params, prt.ui.Target.new, model_obj, nil, template)
    end,
    Optimize = function(prt, params)
      local template = [[
        You are an expert in {{filetype}}.
        Your task is to analyze the provided {{filetype}} code snippet and
        suggest improvements to optimize its performance. Identify areas
        where the code can be made more efficient, faster, or less
        resource-intensive. Provide specific suggestions for optimization,
        along with explanations of how these changes can enhance the code's
        performance. The optimized code should maintain the same functionality
        as the original code while demonstrating improved efficiency.

        ```{{filetype}}
        {{selection}}
        ```

        Optimized code:
        ]]
      local model_obj = prt.get_model "command"
      prt.logger.info("Optimizing selection with model: " .. model_obj.name)
      prt.Prompt(params, prt.ui.Target.new, model_obj, nil, template)
    end,
    UnitTests = function(prt, params)
      local template = [[
        I have the following code from {{filename}}:

        ```{{filetype}}
        {{selection}}
        ```

        Please respond by writing table driven unit tests for the code above.
        ]]
      local model_obj = prt.get_model "command"
      prt.logger.info("Creating unit tests for selection with model: " .. model_obj.name)
      prt.Prompt(params, prt.ui.Target.enew, model_obj, nil, template)
    end,
    Debug = function(prt, params)
      local template = [[
        I want you to act as {{filetype}} expert.
        Review the following code, carefully examine it, and report potential
        bugs and edge cases alongside solutions to resolve them.
        Keep your explanation short and to the point:

        ```{{filetype}}
        {{selection}}
        ```
        ]]
      local model_obj = prt.get_model "command"
      prt.logger.info("Debugging selection with model: " .. model_obj.name)
      prt.Prompt(params, prt.ui.Target.enew, model_obj, nil, template)
    end,
    CommitMsg = function(prt, params)
      local futils = require "parrot.file_utils"
      if futils.find_git_root() == "" then
        prt.logger.warning "Not in a git repository"
        return
      else
        local template = [[
          I want you to act as a commit message generator. I will provide you
          with information about the task and the prefix for the task code, and
          I would like you to generate an appropriate commit message using the
          conventional commit format. Do not write any explanations or other
          words, just reply with the commit message.
          Start with a short headline as summary but then list the individual
          changes in more detail.

          Here are the changes that should be considered by this message:
          ]] .. vim.fn.system "git diff --no-color --no-ext-diff --staged"
        local model_obj = prt.get_model "command"
        prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
      end
    end,
    SpellCheck = function(prt, params)
      local chat_prompt = [[
        Your task is to take the text provided and rewrite it into a clear,
        grammatically correct version while preserving the original meaning
        as closely as possible. Correct any spelling mistakes, punctuation
        errors, verb tense issues, word choice problems, and other
        grammatical mistakes.
        ]]
      prt.ChatNew(params, chat_prompt)
    end,
  },
}

vim.keymap.set({ "n", "i" }, "<C-g>c", "<cmd>PrtChatNew<cr>", { desc = "New Chat" })
vim.keymap.set({ "v" }, "<C-g>c", ":<C-u>'<,'>PrtChatNew<cr>", { desc = "Visual Chat New" })
vim.keymap.set({ "n", "i" }, "<C-g>t", "<cmd>PrtChatToggle<cr>", { desc = "Toggle Popup Chat" })
vim.keymap.set({ "n", "i" }, "<C-g>f", "<cmd>PrtChatFinder<cr>", { desc = "Chat Finder" })
vim.keymap.set({ "n", "i" }, "<C-g>r", "<cmd>PrtRewrite<cr>", { desc = "Inline Rewrite" })
vim.keymap.set({ "v" }, "<C-g>r", ":<C-u>'<,'>PrtRewrite<cr>", { desc = "Visual Rewrite" })
vim.keymap.set({ "n" }, "<C-g>j", "<cmd>PrtRetry<cr>", { desc = "Retry rewrite/append/prepend command" })
vim.keymap.set({ "n", "i" }, "<C-g>a", "<cmd>PrtAppend<cr>", { desc = "Append" })
vim.keymap.set({ "v" }, "<C-g>a", ":<C-u>'<,'>PrtAppend<cr>", { desc = "Visual Append" })
vim.keymap.set({ "n", "i" }, "<C-g>o", "<cmd>PrtPrepend<cr>", { desc = "Prepend" })
vim.keymap.set({ "v" }, "<C-g>o", ":<C-u>'<,'>PrtPrepend<cr>", { desc = "Visual Prepend" })
vim.keymap.set({ "v" }, "<C-g>e", ":<C-u>'<,'>PrtEnew<cr>", { desc = "Visual Enew" })
vim.keymap.set({ "n", "i", "v", "x" }, "<C-g>s", "<cmd>PrtStop<cr>", { desc = "Stop" })
vim.keymap.set({ "n", "i", "v", "x" }, "<C-g>i", ":<C-u>'<,'>PrtComplete<cr>", { desc = "Complete visual selection" })
vim.keymap.set({ "n" }, "<C-g>x", "<cmd>PrtContext<cr>", { desc = "Open context file" })
vim.keymap.set({ "n" }, "<C-g>n", "<cmd>PrtModel<cr>", { desc = "Select model" })
vim.keymap.set({ "n" }, "<C-g>p", "<cmd>PrtProvider<cr>", { desc = "Select provider" })
vim.keymap.set({ "n" }, "<C-g>q", "<cmd>PrtAsk<cr>", { desc = "Ask a question" })
