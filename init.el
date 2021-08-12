(setq org-babel-noweb-wrap-start "«")
(setq org-babel-noweb-wrap-end "»")
(setq org-confirm-babel-evaluate nil)
(progn (org-babel-goto-named-src-block "startup") (org-babel-execute-src-block) (outline-hide-sublevels 1))

(toggle-debug-on-error)

(toggle-debug-on-quit)
