;;disable splash screen and startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;;(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.libs/")
(add-to-list 'load-path "~/.emacs.libs/emacs-color-theme-solarized")
(add-to-list 'load-path "~/.emacs.libs/js2-mode")

;; use emacsclient
;; http://www.emacswiki.org/cgi-bin/wiki/EmacsClient
(server-start)

(require 'saveplace)
(setq-default save-place t)
(setq server-visit-hook (quote (save-place-find-file-hook)))

;;enable syntax highlight by default
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;;disable line wrapping
(setq-default truncate-lines t)

;;disable autosave and backup
;(setq auto-save-default nil)
(setq make-backup-files nil)

;; Force to use tabs for tabs and to be 4 spaces
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)

;;default attributes for text-mode
(setq text-mode-hook '(lambda()
;;						(auto-fill-mode t) ;;physical line break
						(flyspell-mode t) ;;spellchek on the fly
						)
	  )

;;sets the file name as window title (for graphics emacs)
(set 'frame-title-format '(myltiple-frames "%b" ("" "%b")))

(require 'color-theme)
;;(require 'color-theme-solarized)
;;(color-theme-solarized-dark)
(color-theme-blackboard)
;(color-theme-initialize)
;(color-theme-subtle-hacker)

;(require 'zenburn)
;(color-theme-zenburn)

;;(tool-bar-mode 1)
(menu-bar-mode 1)

(add-to-list 'same-window-buffer-names "*SQL*")

;; fancier fill
;;(setq-default filladapt-mode t)

;; no login for mysql
;;(require 'sql)
;;(defalias 'sql-get-login 'ignore)
(set 'sql-database "bzrails")
(set 'sql-user "root")

;; store mysql history
(defun my-sql-save-history-hook ()
  (let ((lval 'sql-input-ring-file-name)
		(rval 'sql-product))
	(if (symbol-value rval)
		(let ((filename
			   (concat "~/.emacs.d/sql/"
					   (symbol-name (symbol-value rval))
					   "-history.sql")))
		  (set (make-local-variable lval) filename))
	  (error
	   (format "SQL history will not be saved because %s is nil"
			   (symbol-name rval))))))
(add-hook 'sql-interactive-mode-hook 'my-sql-save-history-hook)


;; recent files module -- http://www.joegrossberg.com/archives/000182.html
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;(autoload 'js-mode "js")

;; (defun my-js2-indent-function ()
;;   (interactive)
;;   (save-restriction
;;     (widen)
;;     (let* ((inhibit-point-motion-hooks t)
;;            (parse-status (save-excursion (syntax-ppss (point-at-bol))))
;;            (offset (- (current-column) (current-indentation)))
;;            (indentation (js--proper-indentation parse-status))
;;            node)

;;       (indent-line-to indentation)
;;       (when (> offset 0) (forward-char offset)))))

;; (defun my-js2-mode-hook ()
;;   (require 'js)
;;   (setq js-indent-level 2
;;         indent-tabs-mode nil
;;         c-basic-offset 2
;; 	show-paren-mode t)
;;   (c-toggle-auto-state 0)
;;   (c-toggle-hungry-state 1)
;;   (set (make-local-variable 'indent-line-function) 'my-js2-indent-function)
;;   (if (featurep 'js2-highlight-vars)
;;     (js2-highlight-vars-mode))
;;   (message "My JS2 hook"))

;; (add-hook 'js2-mode-hook 'my-js2-mode-hook)

;;(autoload 'js2-mode "js2" nil t)
;;(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; http://www.emacswiki.org/emacs/YamlMode
(require 'yaml-mode)
(add-hook 'yaml-mode-hook '(lambda () (define-key yaml-mode-map "\C-m" 'newline-and-indent)))


;(require 'actionscript-mode)
;(add-to-list 'auto-mode-alist '("\\.as[123]?$" . actionscript-mode))
;;(load "~/.emacs.libs/fcsh.el")

;(defvar flex-home "/usr/local/share/flex/")

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight regions and add special behaviors to regions.
;; "C-h d transient" for more info
(setq transient-mark-mode t)

;; Display line and column numbers
(setq line-number-modet)

;; Emacs gurus don't need no stinking scroll bars
(toggle-scroll-bar -1)

;; android-mode
;;(require 'android-mode)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(fringe-mode 0 nil (fringe)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "cornsilk" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 102 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))


;;(require 'highlight-current-line)
;;(highlight-current-line-on t)

(require 'midnight)

(add-to-list 'load-path "~/.emacs.libs/icicles")
(require 'icicles)

;;(add-to-list 'load-path 
;;   (concat dotfiles-dir "~/.emacs.libs/yasnippets-rails"))

;;(add-hook 'ruby-mode-hook ; or rails-minor-mode-hook ?
;;         '(lambda ()
;;           (make-variable-buffer-local 'yas/trigger-key)
;;             (setq yas/trigger-key [tab])))

;;(add-to-list 'load-path "~/.emacs.libs/rhtml")
;;(require 'rhtml-mode)
;;(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))

;;(require 'yasnippet)

(yas/initialize)
(setq yas/window-system-popup-function 'yas/x-popup-menu-for-template)
(yas/load-directory "~/.emacs.d/yasnippet/snippets")

(make-variable-buffer-local 'yas/trigger-key)


;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)
     
;; Rinari
(add-to-list 'load-path "~/.emacs.libs/rinari")
(require 'rinari)

(add-to-list 'load-path "~/.emacs.libs/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
     	  (lambda () (rinari-launch)))
(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))


;; grep-find config
(global-set-key (kbd "M-3") 'grep-find) 
(setq grep-find-command 
"find . -path '*/.svn' -prune -o -type f -print0 | xargs -0 grep -in ") 

;; speedbar
(when window-system          ; start speedbar if we're using a window system
    (speedbar t))


;; @see http://stackoverflow.com/questions/3139970/open-a-file-at-line-with-filenameline-syntax
(defun emacs-uri-handler (uri)
  "Handles emacs URIs in the form: emacs:///path/to/file/LINENUM"
  (save-match-data
    (if (string-match "emacs://\\(.*\\)/\\([0-9]+\\)$" uri)
        (let ((filename (match-string 1 uri))
              (linenum (match-string 2 uri)))
          (while (string-match "\\(%20\\)" filename)
            (setq filename (replace-match " " nil t filename 1)))
          (with-current-buffer (find-file filename)
            (goto-line (string-to-number linenum))))
      (beep)
      (message "Unable to parse the URI <%s>"  uri))))





;; ido
(setq ido-use-filename-at-point nil)

;; speedbar
;;(require 'sr-speedbar)

(setq speedbar-frame-parameters
      '((minibuffer)
	(width . 40)
	(border-width . 0)
	(menu-bar-lines . 0)
	(tool-bar-lines . 0)
	(unsplittable . t)
	(left-fringe . 0)))
(setq speedbar-hide-button-brackets-flag t)
(setq speedbar-show-unknown-files t)
(setq speedbar-smart-directory-expand-flag t)
(setq speedbar-use-images nil)
;;(setq sr-speedbar-auto-refresh nil)
;;(setq sr-speedbar-max-width 70)
;;(setq sr-speedbar-right-side nil)
;;(setq sr-speedbar-width-console 40)

(when window-system
  (defadvice sr-speedbar-open (after sr-speedbar-open-resize-frame activate)
    (set-frame-width (selected-frame)
                     (+ (frame-width) sr-speedbar-width)))
  (ad-enable-advice 'sr-speedbar-open 'after 'sr-speedbar-open-resize-frame)

  (defadvice sr-speedbar-close (after sr-speedbar-close-resize-frame activate)
    (sr-speedbar-recalculate-width)
    (set-frame-width (selected-frame)
                     (- (frame-width) sr-speedbar-width)))
  (ad-enable-advice 'sr-speedbar-close 'after 'sr-speedbar-close-resize-frame))

(provide 'buffers)


(setq grep-files-aliases (cons "rails" "*.rb *.erb *.js *.css"))


;; turn off ruby deep indentation
;; see http://stackoverflow.com/questions/7404816/emacs-ruby-mode-indenting-wildly-inside-parentheses
(setq ruby-deep-indent-paren nil)

