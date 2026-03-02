vim.keymap.set("n", "<F5>", function()
    vim.cmd("w")
    vim.cmd("!g++ -std=c++20 -Wall -Wextra -O2 -o /tmp/out % && /tmp/out")
end, { desc = "Compile and run C++" })
