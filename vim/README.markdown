My `.vim` directory.

Installation:

    git clone git://github.com/arnar/vim-config.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

That's it. To install other plugins just dump them in `bundle` in their own directory. To link to their source as git submodules, do

    cd ~/.vim
    git submodule add http://github.com/cleverguy/coolplugin.git bundle/coolplugin
    git submodule init   # to save it in .git/config
    git add .
    git commit -m "Installed coolplugin"

To remove a plugin just delete the folder from `bundle`. In case it is a git submodule you have to delete the references to it from `.gitmodules` and `.git/config` and then `git rm --cached bundle/lameplugin`.

Tip: To avoid "dirty" warnings for helptags in git submodules,
add "tags" to bundle/<repo>/.git/info/exclude, like this:

    echo tags >> bundle/foo/.git/info/exclude

**Note:** The file autoload/pathogen.vim is a symbolic link, so it might not work correctly on Windows. In that case copy bundle/pathogen/autoload/pathogen.vim into the autoload folder.

