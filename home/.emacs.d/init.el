(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-ruby starter-kit-bindings)
  "A list of packages to ensure are installed at launch.")

;; starter-kit-js

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))

(load-theme 'deeper-blue t)

(setq-default indent-tabs-mode nil) ; always replace tabs with spaces
(setq-default tab-width 2) ; set tab width to 4 for all buffers

(setq load-path (append (list (expand-file-name "~/.emacs.d/libs/js2-mode")) load-path))
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
