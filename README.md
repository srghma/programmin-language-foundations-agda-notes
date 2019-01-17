# agda notes

https://github.com/plfa/plfa.github.io

### libs
- primops - https://github.com/agda/agda/blob/master/src/data/lib/prim/
- stdlib - https://github.com/agda/agda-stdlib

### my setup
https://github.com/derekelkins/agda-vim
https://github.com/derekelkins/agda-vim/blob/master/agda-utf8.vim

### how to use agda-mode
- https://www.youtube.com/watch?v=-i-QQ36Nfsk
- https://github.com/scott-fleischman/agda-from-nothing

### useful commands

#### Global (can be used anywhere)
* \l — Load file. I use this constantly.
* C-g	— Move to next goal (**f**orward)
* C-y — Move to previous goal (**b**ackwards)
* \t — Infer (**d**educe) type. Type in any expression and it infers the type.
* \N — Compute **n**ormal form. In other words, reduces the expression as much as possible.

#### In a hole/goal
* \c — Case split. Type in an argument name and it creates lines for each possible case. It works with multiple arguments.
* \m — Show unnormalized goal type and context.
<!-- * C-u C-u C-c C-Comma — Show fully normalized goal type and context. -->
* \g — Give (fill goal). Type checks the expression you typed in the hole, and if successful fills the hole.
* \r — Refine. Partial give: makes new holes for missing arguments.
  * If you've entered an expression in the hole, it will fill in the hole with that expression and make new holes for any missing arguments.
  * If you haven't entered anything in the hole, and if the hole is constrained to one constructor, it fills in the hole with that constructor and makes new holes for each of the constructor's arguments.
* \a — Automatic Proof Search (Auto). Tries to fill the hole with any solution. Note—this may not be a correct solution if the types aren't precise enough to constrain the term to only correct ones. Note also that it often fails to find a solution.
* \e — context

Ctrl-w o - close all windows except selected
