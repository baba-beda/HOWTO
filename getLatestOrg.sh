#! /bin/sh -x -u -e
#
# Get latest version of org-mode in ~/git/orgmode.org/org-mode
#

WHERE="${HOME}/git/orgmode.org/"
mkdir -p ${WHERE}
cd ${WHERE}

# pull for first time if we don't have it

if [ ! -d ${WHERE}/org-mode ]; then
    git clone git://orgmode.org/org-mode.git
else

    # get updates, if any
    
    cd ${WHERE}/org-mode
    git pull
fi

# build the autoloads
cd ${WHERE}/org-mode
make
make autoloads

# Add to .emacs, .emacs.d/init.el, whatever...
#
#(add-to-list 'load-path "~/git/orgmode.org/org-mode/lisp/")
#(add-to-list 'load-path "~/elisp/orgmodeorg/org-mode/contrib/lisp/" t)

   
