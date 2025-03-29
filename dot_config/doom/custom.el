(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ignored-local-variable-values '((eval progn (pp-buffer) (indent-buffer))))
 '(org-log-into-drawer t)
 '(org-modules '(ol-bibtex org-habit))
;; '(org-todo-keywords
;;   '((sequence "TODO(t)" "DONE(d)" "PROJ(p)" "LOOP(r)" "STRT(s)" "WAIT(w)" "HOLD(h)" "IDEA(i)" "|" "KILL(k)")
;;     (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")
;;     (sequence "|" "OKAY(o)" "YES(y)" "NO(n)")))
 '(package-selected-packages '(treemacs-evil treemacs mu4easy)))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(default ((t (:inherit nil :extend nil :stipple nil :background "#282c34" :foreground "#bbc2cf" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 200 :width normal :foundry "nil" :family "Menlo")))))
;; add org-bullets customization here
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
