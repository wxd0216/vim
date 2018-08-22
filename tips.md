# vim 使用tip

### 快捷键说明
- F1	打开文档
- F2	去除空行
- F3	打开目录列表
- F4	ctags 和cscope 生成
- F7    开关代码检查
- c-F7  pythnon pe8检查
- F9	taglist
- F12	代码格式化
- C-P	文件模糊查找
- \p	函数模糊查找

### cscope 跳转快捷键 查看  vim/plugin/cscope_maps.vim
vim8 异步索引直接使用一下快捷键
* ``<leader>cg`` - 查看光标下符号的定义
* ``<leader>cs`` - 查看光标下符号的引用
* ``<leader>cc`` - 查看有哪些函数调用了该函数
* ``<leader>cf ``- 查找光标下的文件
* ``<leader>ci``- 查找哪些文件 include 了本文件
查找到索引后跳到弹出的 quikfix 窗口，停留在想查看索引行上，按 ``小P``直接打开预览窗口，``大P``关闭预览，``\d`` 和 ``\u`` 向上向下滚动预览窗口。

### 编写markdown文件
编写markdown文件(`*.md`)的时候，在normal模式下按 `md` 即可在当前目录下生成相应的`html`文件
- 生成之后还是在normal模式按`fi`可以使用firefox打开相应的`html`文件预览
- 如果打开过程中屏幕出现一些混乱信息，可以按`Ctrl + l`来恢复

## 在vim 中直接打开终端
- ConqueTermSplit bash<CR>
- ConqueTermVSplit bash<CR>
