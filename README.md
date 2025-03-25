# 🃏 Jest Runner for Neovim

A simple plugin for Neovim to run Jest tests directly from the editor. 
This plugin allows you to execute Jest tests for specific files, projects, or even individual test cases using the command line.

## Features
- Run all tests in a specific file: `:Jest file`
- Run all tests in the project: `:Jest project`
- Run the test at the current cursor position: `:Jest line`

## Installation

### 💤 Lazy
The easier way to install this plugin is by using the [Lazy Package Manager](https://github.com/folke/lazy.nvim). If you already use it, just add `{ "nicolasgandrade/jest-runner.nvim" }` to your plugins definition. 

In some cases, the `:Jest <arg>` command may not be recognized at first, so if you run into this kind of issue, force it to be loaded by requiring it with `require("jest-runner")` too. For instance:
```lua
return {
  "nicolasgandrade/jest-runner.nvim",
  lazy = false,
  config = function()
    require("jest-runner")
  end,
}
```

### Manual
You can install this plugin manually by cloning the repo into your editor's plugins directory. Then, you'll need to require it with `require("jest-runner")` in your main config file.

Make sure the path of the plugin is recognized by your editor. If not, you can try to configure it with `vim.opt.rtp:prepend("path-to-the-installed-plugin")` and then require it.

## Usage / Contributions
I created this plugin to improve my productivity in my daily workflow, so you may run into issues that I haven't faced yet with the code. You can try this plugin out and check if it works for you, if you face any problems, feel free to open issues or PRs.
