(require 'package)
(setq  package-archives '(("melpa" . "https://melpa.org/packages/")
			   ("org" . "https://orgmode.org/elpa/")
			   ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-install 'use-package))

;; Initialize use-package on non Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package command-log-mode)

(use-package swiper)
(global-set-key "\C-s" 'swiper)

(use-package ivy)
(ivy-mode 1)

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history)))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 15))

(use-package elpy)
(elpy-enable) ; Enable elpy for Python stuff

(use-package rainbow-delimiters ; Add colors to  nested parenthesis
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key ; Displays which key bindings are setup
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0))

(use-package helpful
  
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-key] . helpful-key))

(use-package doom-themes
  :init (load-theme 'doom-dracula t))

(use-package general)
(general-define-key
 "C-M-j" 'counsel-switch-buffer)

(use-package org)

(use-package rpm-spec-mode)

(use-package magit)

;; Clean up the UI
(setq inhibit-startup-message t) ; Disable startup  message
(tool-bar-mode -1) ; Disable toolbar
(global-hl-line-mode +1) ; Hightlight current line
(global-display-line-numbers-mode) ; Display line numbers
(set-fringe-mode 10) ; Give some breathing room
(menu-bar-mode +1) ; Display menubar
(setq frame-resize-pixelwise t) ; Make windows size by pixel

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Disable line numbers in some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil)
 '(package-selected-packages
   '(magit rpm-spec-mode general doom-themes helpful which-key rainbow-delimiters elpy doom-modeline ivy-rich counsel swiper command-log-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
